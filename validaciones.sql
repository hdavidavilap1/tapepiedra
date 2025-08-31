select * from loantape l inner join 
(select loan_id, max(fecha) as fecha from loantape where monto_pago >0 and month(fecha) = 7 and year(fecha) = 2025--saldo_nuevo_capital > 0
group by loan_id) as b 
on l.loan_id = b.loan_id and l.fecha=b.fecha;

select * from payments where loan_id = 4;

select * from loantape where monto_pago >0 and extract(month from fecha) = 7 and extract(year from fecha) = 2025;
