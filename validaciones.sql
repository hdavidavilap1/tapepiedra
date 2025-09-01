select * from loantape l inner join 
(select loan_id, max(fecha) as fecha from loantape where monto_pago >0 and month(fecha) = 7 and year(fecha) = 2025--saldo_nuevo_capital > 0
group by loan_id) as b 
on l.loan_id = b.loan_id and l.fecha=b.fecha;

select * from loantape where loan_id = 3 and monto_pago >0;

select * from loantape where monto_pago >0 and extract(month from fecha) = 7 and extract(year from fecha) = 2025;


select count(*) from loantape;


select * from loantape ;

select * from users;

select * from loans as l
left join users as u 
on u.user_id = l.user_id;

select * from loantape where extract(month from fecha) = 7 and extract(year from fecha) = 2025 and extract(day from fecha) = 31;

select * from payments where loan_id = 18;

select * from loantape where loan_id = 18 and monto_pago >0;


select * from loans;

SELECT extract(days FROM date_trunc('month', to_date('2023-02-26','yyyy-mm-dd')) + interval '1 month - 1 day');

select extract(month from fecha), sum(intereses_periodo) from loantape where loan_id = 18
group by extract(month from fecha);

DO $$
declare
   min_date date;
   max_date date;
   fecha_analysis date;
   num_days int := 30;
   num_days_1 int;
begin 
	
select min(fecha_creacion) into min_date from loans;
select current_date into  max_date;

FOR fecha_analysis IN SELECT generate_series(min_date, max_date, '1 day'::interval) LOOP

SELECT extract(days FROM date_trunc('month', fecha_analysis) + interval '1 month - 1 day') into num_days_1;

RAISE NOTICE 'num_days is %',num_days_1;
RAISE NOTICE 'fecha_analsysi is %',fecha_analysis;


END LOOP;
PERFORM extract(days FROM date_trunc('month', (fecha_analysis) + interval '1 month - 1 day'));

end; $$

SELECT extract(days FROM date_trunc('month', to_date('2023-02-26','yyyy-mm-dd')) + interval '1 month - 1 day');


