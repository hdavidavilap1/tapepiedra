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

select * from payments where loan_id = 3;

select * from loans;