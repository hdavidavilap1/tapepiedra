DO $$
declare
   min_date date;
   max_date date;
   fecha_analysis date;
begin 
	
select min(fecha_creacion) into min_date from loans;
select current_date into  max_date;

FOR fecha_analysis IN SELECT generate_series(min_date, max_date, '1 day'::interval) LOOP



drop table if exists  all_loans, old_loans, new_loans, aggregated_payments, payment_calculation, payment_calculation_1, aggregated_revolving, revolving_calculation;

delete from loantape where fecha = fecha_analysis;


create table new_loans as 
SELECT loan_id,
       fecha_analysis as fecha,
       monto as saldo_anterior_capital,
       0 as saldo_anterior_intereses, -- note maybe require to genetate interest for one day
       0 as monto_pago, 
       0 as abono_capital, 
       0 as abono_intereses, 
       0 as saldo_nuevo_capital,
       0 as saldo_nuevo_intereses
      from Loans where fecha_creacion = fecha_analysis - INTERVAL '1 DAY';
     
create table old_loans as 
SELECT loan_id,
       fecha_analysis as fecha,
       saldo_nuevo_capital as saldo_anterior_capital,
       saldo_nuevo_intereses as saldo_anterior_intereses,
       0 as monto_pago, 
       0 as abono_capital, 
       0 as abono_intereses, 
       0 as saldo_nuevo_capital,
       0 as saldo_nuevo_intereses
       from LoanTape where fecha = fecha_analysis - INTERVAL '1 DAY' and saldo_nuevo_capital + saldo_nuevo_intereses > 0;
    

create table all_loans as 
select * from new_loans union select * from old_loans; 

PERFORM * from ALL_LOANS;

create table aggregated_payments as 
select date(fecha_pago) as fecha_pago, loan_id, sum(monto) as monto_pago from payments where date(fecha_pago) = date(fecha_analysis) AND estado_pago = 'exitoso'
group by date(fecha_pago), loan_id;


create table aggregated_revolving as 
select fecha_creacion, loan_id, sum(monto) as monto_a_sumar from revolving where fecha_creacion = date(fecha_analysis)
group by fecha_creacion, loan_id;


create table payment_calculation as 
select l.loan_id,
	   l.fecha,
	   l.saldo_anterior_capital,
	   l.saldo_anterior_intereses,
	   saldo_anterior_capital *(ol.tasa_interes_ea/365) as intereses_periodo,
	   coalesce(p.monto_pago,0) as monto_pago,
	   case when p.monto_pago > 0 then greatest(p.monto_pago - saldo_anterior_intereses -  saldo_anterior_capital *(ol.tasa_interes_ea/365),0) else 0 end  as abono_capital, 
	   case when p.monto_pago > 0 then least(p.monto_pago ,saldo_anterior_intereses + saldo_anterior_capital *(ol.tasa_interes_ea/365)) else 0 end  as abono_intereses,
	   0 as saldo_nuevo_capital,
       0 as saldo_nuevo_intereses
  from all_loans as l 
  left join aggregated_payments as p 	
  on l.loan_id = p.loan_id and date(l.fecha) = date(p.fecha_pago)
  left join Loans as ol 
  on ol.loan_id = l.loan_id;
 
 

 create table payment_calculation_1 as 
 select loan_id, fecha, saldo_anterior_capital,
       saldo_anterior_intereses,
       intereses_periodo, 
	   monto_pago,
	   abono_capital, 
	   abono_intereses, 
	   case when monto_pago > 0 then saldo_anterior_capital - abono_capital else saldo_anterior_capital end as saldo_nuevo_capital,
	   case when monto_pago > 0 then saldo_anterior_intereses - abono_intereses + intereses_periodo else saldo_anterior_intereses + intereses_periodo  end as saldo_nuevo_intereses
from payment_calculation;

create table revolving_calculation as 
select p.loan_id,
	   p.fecha,
	   p.saldo_anterior_capital,
       p.saldo_anterior_intereses,
       p.intereses_periodo, 
	   p.monto_pago,
	   p.abono_capital, 
	   p.abono_intereses,
	   coalesce(r.monto_a_sumar,0) as monto_rotativo, 
	   p.saldo_nuevo_capital + coalesce(r.monto_a_sumar,0) as saldo_nuevo_capital,
	   p.saldo_nuevo_intereses
	   from payment_calculation_1 as p left join aggregated_revolving as r 
on p.loan_id = r.loan_id and p.fecha = r.fecha_creacion;
 
 
insert into LoanTape(loan_id, fecha, saldo_anterior_capital,saldo_anterior_intereses,intereses_periodo,   monto_pago, abono_capital, abono_intereses, monto_rotativo, saldo_nuevo_capital, saldo_nuevo_intereses )
select * from revolving_calculation; 

END LOOP;
end; $$

