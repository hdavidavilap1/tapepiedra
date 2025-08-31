do $$
declare 

fecha_analysis date;

begin 

--select current_date into fecha_analysis;
	
SELECT to_date('2024-10-20', 'YYYY-MM-DD') INTO  fecha_analysis;

drop table if exists  tablas_unidas, all_loans, old_loans, new_loans, aggregated_payments, payment_calculation, payment_loan_indformation;

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
 
 
insert into LoanTape(loan_id, fecha, saldo_anterior_capital,saldo_anterior_intereses,intereses_periodo,   monto_pago, abono_capital, abono_intereses, saldo_nuevo_capital, saldo_nuevo_intereses )
select loan_id, fecha, saldo_anterior_capital,
       saldo_anterior_intereses,
       intereses_periodo, 
	   monto_pago,
	   abono_capital, 
	   abono_intereses, 
	   case when monto_pago > 0 then saldo_anterior_capital - abono_capital else saldo_anterior_capital end as saldo_nuevo_capital,
	   case when monto_pago > 0 then saldo_anterior_intereses - abono_intereses + intereses_periodo else saldo_anterior_intereses + intereses_periodo  end as saldo_nuevo_intereses
	   
from payment_calculation;


PERFORM * from LoanTape;

end $$;


select count(*) from loanTape;

select * from all_loans;

select * from old_loans;

select * from new_loans;






