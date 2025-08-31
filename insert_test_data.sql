
truncate table users;
truncate table loans;
truncate table Payments;
truncate table loantape;

select * from loans;
select * from payments; 
SELECT * FROM users; 


INSERT INTO users(nombre, apellido)
values('ALONSO ','VELOZA'),
('ART LEGAL MANAGERS',''),
('DOLORES YADIRA  ','MESA'),
('FREDDY ','BRIJALBO'),
('HENRY ','NUTRESA'),
('HERNAN DAVID ','AVILA PERICO'),
('INES JULIANA ','AVILA PERICO'),
('JENNY PAOLA ','GARCIA'),
('JOSE EFRAIN ','BLANCO'),
('JUDITH LORENA ','MARTINEZ'),
('LAURA MARIA  ','OSPINA'),
('MANUEL ','RUBIANO'),
('MARIA ISABEL ','VELOZA'),
('NANCY SOFIA ','MANRIQUE GALVIS'),
('PEDRO ','CORDERO'),
('ROCIO ','VELOZA');

INSERT INTO Revolving (loan_id, user_id,monto, fecha_creacion)
VALUES(14, 6, 1500000,	TO_DATE('28/2/2025', 'DD/MM/YYYY')),
(14, 6,  355000,	TO_DATE('30/4/2025', 'DD/MM/YYYY')),
(14, 6, 1050000,	TO_DATE('30/6/2025', 'DD/MM/YYYY'));


INSERT INTO Loans (user_id,monto, fecha_creacion,  numero_cuotas, tasa_interes_ea)
VALUES (3,	3000000,	TO_DATE('18/10/2024', 'DD/MM/YYYY'),   12, 12*0.03),	
       (9,	5000000,	TO_DATE('18/10/2024', 'DD/MM/YYYY'),   12, 12*0.03),	
       (11, 	2500000,	TO_DATE('19/10/2024', 'DD/MM/YYYY'),   12, 12*0.02),	
       (1,	5800000,	TO_DATE('21/10/2024', 'DD/MM/YYYY'),   12, 12*0.015),	
       (8,	16075383,	TO_DATE('21/10/2024', 'DD/MM/YYYY'),   24, 12*0.02),	
       (14,	2000000,	TO_DATE('30/10/2024', 'DD/MM/YYYY'),   12, 12*0.03),	
       (13,	5000000,	TO_DATE('30/10/2024', 'DD/MM/YYYY'),   24, 12*0.02),	
       (5,	2000000,	TO_DATE('22/10/2024', 'DD/MM/YYYY'),   12, 12*0.03),	
       (16,	5000000,	TO_DATE('23/10/2024', 'DD/MM/YYYY'),   24, 12*0.02),	
       (12,	5000000,	TO_DATE('01/11/2024', 'DD/MM/YYYY'),   4,  12*0.03),	
       (10,	2000000,	TO_DATE('02/12/2024', 'DD/MM/YYYY'),   6,  12*0.03),	
       (14,	4000000,	TO_DATE('09/12/2024', 'DD/MM/YYYY'),   12, 12*0.03),	
       (7,	2500000,	TO_DATE('07/01/2025', 'DD/MM/YYYY'),   2,  12*0.03),	
       (6,	2500000,	TO_DATE('31/01/2025', 'DD/MM/YYYY'),   24, 12*0.03),	
       (7,	3000000,	TO_DATE('07/01/2025', 'DD/MM/YYYY'),   12, 12*0.03),	
       (13,	4000000,	TO_DATE('09/10/2024', 'DD/MM/YYYY'),   12, 12*0.03),	
       (4,	6000000,	TO_DATE('11/04/2025', 'DD/MM/YYYY'),   2,  12*0.03),	
       (15,   2000000,	TO_DATE('19/06/2025', 'DD/MM/YYYY'),   12, 12*0.025),			
       (2,    8250000, 	TO_DATE('25/06/2025', 'DD/MM/YYYY'),   24, 12*0.02);		



INSERT INTO Payments (usuario_id,loan_id, monto,fecha_pago, estado_pago)
VALUES
(3,	1,	90000.00,	TO_DATE('18/11/2024','DD/MM/YYYY'), 'exitoso'),
(3,	1,	90000.00,	TO_DATE('18/12/2024','DD/MM/YYYY'), 'exitoso'),
(3,	1,	90000.00,	TO_DATE('18/01/2025','DD/MM/YYYY'), 'exitoso'),
(3,	1,	90000.00,	TO_DATE('18/02/2025','DD/MM/YYYY'), 'exitoso'),
(3,	1,	90000.00,	TO_DATE('18/03/2025','DD/MM/YYYY'), 'exitoso'),
(3,	1,	90000.00,	TO_DATE('18/04/2025','DD/MM/YYYY'), 'exitoso'),
(3,	1,	90000.00,	TO_DATE('18/05/2025','DD/MM/YYYY'), 'exitoso'),
(3,	1,	90000.00,	TO_DATE('18/06/2025','DD/MM/YYYY'), 'exitoso'),
(3,	1,	90000.00,	TO_DATE('18/07/2025','DD/MM/YYYY'), 'exitoso'),
(9,	2,	503000.00,	TO_DATE('18/11/2024','DD/MM/YYYY'), 'exitoso'),
(9,	2,	503000.00,	TO_DATE('18/12/2024','DD/MM/YYYY'), 'exitoso'),
(9,	2,	502310.36,	TO_DATE('18/01/2025','DD/MM/YYYY'), 'exitoso'),
(9,	2,	502310.36,	TO_DATE('18/02/2025','DD/MM/YYYY'), 'exitoso'),
(9,	2,	502310.36,	TO_DATE('18/03/2025','DD/MM/YYYY'), 'exitoso'),
(9,	2,	502310.36,	TO_DATE('18/04/2025','DD/MM/YYYY'), 'exitoso'),
(9,	2,	502310.36,	TO_DATE('18/05/2025','DD/MM/YYYY'), 'exitoso'),
(9,	2,	502310.36,	TO_DATE('18/06/2025','DD/MM/YYYY'), 'exitoso'),
(9,	2,	502310.36,	TO_DATE('18/07/2025','DD/MM/YYYY'), 'exitoso'),
(11,	3,	50000.00,	TO_DATE('19/11/2024','DD/MM/YYYY'), 'exitoso'),
(11,	3,	800000.00,	TO_DATE('19/02/2025','DD/MM/YYYY'), 'exitoso'),
(11,	3,	1000000.00,	TO_DATE('19/07/2025','DD/MM/YYYY'), 'exitoso'),
(1,	4,	532000.00,	TO_DATE('21/11/2024','DD/MM/YYYY'), 'exitoso'),
(1,	4,	532000.00,	TO_DATE('21/12/2024','DD/MM/YYYY'), 'exitoso'),
(1,	4,	531743.88,	TO_DATE('21/01/2025','DD/MM/YYYY'), 'exitoso'),
(1,	4,	531743.88,	TO_DATE('21/02/2025','DD/MM/YYYY'), 'exitoso'),
(1,	4,	531743.88,	TO_DATE('21/03/2025','DD/MM/YYYY'), 'exitoso'),
(1,	4,	531743.88,	TO_DATE('21/04/2025','DD/MM/YYYY'), 'exitoso'),
(1,	4,	531743.88,	TO_DATE('21/05/2025','DD/MM/YYYY'), 'exitoso'),
(1,	4,	531743.88,	TO_DATE('21/06/2025','DD/MM/YYYY'), 'exitoso'),
(1,	4,	531743.88,	TO_DATE('21/07/2025','DD/MM/YYYY'), 'exitoso'),
(1,	4,	531743.88,	TO_DATE('21/08/2025','DD/MM/YYYY'), 'exitoso'),
(8,	5,	849923.11,	TO_DATE('21/11/2024','DD/MM/YYYY'), 'exitoso'),
(8,	5,	849923.11,	TO_DATE('21/12/2024','DD/MM/YYYY'), 'exitoso'),
(8,	5,	849923.11,	TO_DATE('21/01/2025','DD/MM/YYYY'), 'exitoso'),
(8,	5,	849923.11,	TO_DATE('21/02/2025','DD/MM/YYYY'), 'exitoso'),
(8,	5,	849923.11,	TO_DATE('21/03/2025','DD/MM/YYYY'), 'exitoso'),
(8,	5,	849923.11,	TO_DATE('21/04/2025','DD/MM/YYYY'), 'exitoso'),
(8,	5,	849923.11,	TO_DATE('21/05/2025','DD/MM/YYYY'), 'exitoso'),
(8,	5,	849923.11,	TO_DATE('21/06/2025','DD/MM/YYYY'), 'exitoso'),
(8,	5,	849923.11,	TO_DATE('21/07/2025','DD/MM/YYYY'), 'exitoso'),
(14,	6,	60000.00,	TO_DATE('30/11/2024','DD/MM/YYYY'), 'exitoso'),
(14,	6,	60000.00,	TO_DATE('30/12/2025','DD/MM/YYYY'), 'exitoso'),
(14,	6,	60000.00,  	TO_DATE('30/01/2025','DD/MM/YYYY'), 'exitoso'),
(14,	6,	60000.00,	TO_DATE('28/02/2025','DD/MM/YYYY'), 'exitoso'),
(14,	6,	60000.00,	TO_DATE('30/03/2025','DD/MM/YYYY'), 'exitoso'),
(14,	6,	60000.00,	TO_DATE('30/04/2025','DD/MM/YYYY'), 'exitoso'),
(14,	6,	60000.00,	TO_DATE('30/05/2025','DD/MM/YYYY'), 'exitoso'),
(14,	6,	60000.00,	TO_DATE('30/06/2025','DD/MM/YYYY'), 'exitoso'),
(14,	6,	60000.00,	TO_DATE('30/07/2025','DD/MM/YYYY'), 'exitoso'),
(13,	7,	264350.00,	TO_DATE('30/11/2024','DD/MM/YYYY'), 'exitoso'),
(13,	7,	264350.00,	TO_DATE('30/12/2024','DD/MM/YYYY'), 'exitoso'),
(13,	7,	264355.45,	TO_DATE('30/01/2025','DD/MM/YYYY'), 'exitoso'),
(13,	7,	264355.45,	TO_DATE('28/02/2025','DD/MM/YYYY'), 'exitoso'),
(13,	7,	264355.45,	TO_DATE('30/03/2025','DD/MM/YYYY'), 'exitoso'),
(13,	7,	264355.45,	TO_DATE('30/04/2025','DD/MM/YYYY'), 'exitoso'),
(13,	7,	264355.45,	TO_DATE('30/05/2025','DD/MM/YYYY'), 'exitoso'),
(13,	7,	264355.45,	TO_DATE('30/06/2025','DD/MM/YYYY'), 'exitoso'),
(13,	7,	264355.45,	TO_DATE('30/07/2025','DD/MM/YYYY'), 'exitoso'),
(13,	7,	264355.45,	TO_DATE('30/08/2025','DD/MM/YYYY'), 'exitoso'),
(5,	8,	60000.00,	TO_DATE('22/11/2024','DD/MM/YYYY'), 'exitoso'),
(5,	8,	60000.00,	TO_DATE('22/12/2024','DD/MM/YYYY'), 'exitoso'),
(5,	8,	60000.00,	TO_DATE('22/01/2025','DD/MM/YYYY'), 'exitoso'),
(5,	8,	60000.00,	TO_DATE('22/02/2025','DD/MM/YYYY'), 'exitoso'),
(5,	8,	60000.00,	TO_DATE('22/03/2025','DD/MM/YYYY'), 'exitoso'),
(5,	8,	60000.00,	TO_DATE('22/04/2025','DD/MM/YYYY'), 'exitoso'),
(5,	8,	60000.00,	TO_DATE('22/05/2025','DD/MM/YYYY'), 'exitoso'),
(5,	8,	60000.00,	TO_DATE('22/06/2025','DD/MM/YYYY'), 'exitoso'),
(16,	9,	264350.00,	TO_DATE('23/11/2024','DD/MM/YYYY'), 'exitoso'),
(16,	9,	264350.00,	TO_DATE('23/12/2024','DD/MM/YYYY'), 'exitoso'),
(16,	9,	264355.45,	TO_DATE('23/01/2025','DD/MM/YYYY'), 'exitoso'),
(16,	9,	264355.45,	TO_DATE('23/02/2025','DD/MM/YYYY'), 'exitoso'),
(16,	9,	264355.45,	TO_DATE('23/03/2025','DD/MM/YYYY'), 'exitoso'),
(16,	9,	264355.45,	TO_DATE('23/04/2025','DD/MM/YYYY'), 'exitoso'),
(16,	9,	264355.45,	TO_DATE('23/05/2025','DD/MM/YYYY'), 'exitoso'),
(16,	9,	264355.45,	TO_DATE('23/06/2025','DD/MM/YYYY'), 'exitoso'),
(16,	9,	264355.45,	TO_DATE('23/07/2025','DD/MM/YYYY'), 'exitoso'),
(16,	9,	264355.45,	TO_DATE('23/08/2025','DD/MM/YYYY'), 'exitoso'),
(12,	10,	150000.00,	TO_DATE('01/10/2024','DD/MM/YYYY'), 'exitoso'),
(12,	10,	150000.00,	TO_DATE('01/11/2024','DD/MM/YYYY'), 'exitoso'),
(12,	10,	150000.00,	TO_DATE('01/12/2024','DD/MM/YYYY'), 'exitoso'),
(12,	10,	5000000.00,	TO_DATE('01/12/2024','DD/MM/YYYY'), 'exitoso'),
(10,	11,	370000.00,	TO_DATE('10/01/2025','DD/MM/YYYY'), 'exitoso'),
(7,	11,	1575000.00,	TO_DATE('02/01/2025','DD/MM/YYYY'), 'exitoso'),
(10,	11,	369194.85,	TO_DATE('02/02/2025','DD/MM/YYYY'), 'exitoso'),
(10,	11,	369194.85,	TO_DATE('02/03/2025','DD/MM/YYYY'), 'exitoso'),
(10,	11,	369194.85,	TO_DATE('02/04/2025','DD/MM/YYYY'), 'exitoso'),
(10,	11,	369194.85,	TO_DATE('02/05/2025','DD/MM/YYYY'), 'exitoso'),
(10,	11,	369194.85,	TO_DATE('02/06/2025','DD/MM/YYYY'), 'exitoso'),
(14,	12,	120000.00,	TO_DATE('09/01/2025','DD/MM/YYYY'), 'exitoso'),
(14,	12,	120000.00,	TO_DATE('09/02/2025','DD/MM/YYYY'), 'exitoso'),
(14,	12,	120000.00,	TO_DATE('09/03/2025','DD/MM/YYYY'), 'exitoso'),
(14,	12,	120000.00,	TO_DATE('09/04/2025','DD/MM/YYYY'), 'exitoso'),
(14,	12,	120000.00,	TO_DATE('09/05/2025','DD/MM/YYYY'), 'exitoso'),
(14,	12,	120000.00,	TO_DATE('09/06/2025','DD/MM/YYYY'), 'exitoso'),
(14,	12,	120000.00,	TO_DATE('09/07/2025','DD/MM/YYYY'), 'exitoso'),
(7,	13,	2575000.00,	TO_DATE('07/02/2025','DD/MM/YYYY'), 'exitoso'),
(6,	14,	251155.14,	TO_DATE('28/02/2025','DD/MM/YYYY'), 'exitoso'),
(6,	14,	251155.14,	TO_DATE('28/03/2025','DD/MM/YYYY'), 'exitoso'),
(6,	14,	251155.14,	TO_DATE('28/04/2025','DD/MM/YYYY'), 'exitoso'),
(6,	14,	251155.14,	TO_DATE('28/05/2025','DD/MM/YYYY'), 'exitoso'),
(6,	14,	251155.14,	TO_DATE('28/06/2025','DD/MM/YYYY'), 'exitoso'),
(6,	14,	251155.14,	TO_DATE('28/07/2025','DD/MM/YYYY'), 'exitoso'),
(6,	14,	251155.14,	TO_DATE('28/08/2025','DD/MM/YYYY'), 'exitoso'),
(13,	16,	120000.00,	TO_DATE('09/03/2025','DD/MM/YYYY'), 'exitoso'),
(13,	16,	120000.00,	TO_DATE('09/04/2025','DD/MM/YYYY'), 'exitoso'),
(13,	16,	120000.00,	TO_DATE('09/05/2025','DD/MM/YYYY'), 'exitoso'),
(13,	16,	120000.00,	TO_DATE('09/06/2025','DD/MM/YYYY'), 'exitoso'),
(13,	16,	120000.00,	TO_DATE('09/07/2025','DD/MM/YYYY'), 'exitoso'),
(13,	16,	120000.00,	TO_DATE('09/08/2025','DD/MM/YYYY'), 'exitoso'),
(4,	17,	150000.00,	TO_DATE('11/05/2025','DD/MM/YYYY'), 'exitoso'),
(4,	17,	6150000.00,	TO_DATE('11/06/2025','DD/MM/YYYY'), 'exitoso'),
(15,	18,	50000.00,	TO_DATE('19/07/2025','DD/MM/YYYY'), 'exitoso'),
(15,	18,	50000.00,	TO_DATE('19/08/2025','DD/MM/YYYY'), 'exitoso'),
(2,	19,	437000.00,	TO_DATE('25/07/2025','DD/MM/YYYY'), 'exitoso');


select * from loans;


select * from payments;



      
select * from loans as l
left join users as u 
on u.user_id = l.user_id;
      
select * from  loantape;

delete  from loantape where fecha = current_date;




/*
1	ALONSO 	VELOZA
2	ART LEGAL MANAGERS	
3	DOLORES YADIRA  	MESA
4	FREDDY 	BRIJALBO
5	HENRY 	NUTRESA
6	HERNAN DAVID 	AVILA PERICO
7	INES JULIANA 	AVILA PERICO
8	JENNY PAOLA 	GARCIA
9	JOSE EFRAIN 	BLANCO
10	JUDITH LORENA 	MARTINEZ
11	LAURA MARIA  	OSPINA
12	MANUEL 	RUBIANO
13	MARIA ISABEL 	VELOZA
14	NANCY SOFIA 	MANRIQUE GALVIS
15	PEDRO 	CORDERO
16	ROCIO 	VELOZA
 */

/*
 * 
1	3	2024-10-18	3000000.0	12	0.36
2	9	2024-10-18	5000000.0	12	0.36
3	11	2024-10-19	2500000.0	12	0.36
4	1	2024-10-21	5800000.0	12	0.18
5	8	2024-10-21	16075383	24	0.24
6	14	2024-10-30	2000000.0	12	0.36
7	13	2024-10-30	5000000.0	24	0.24
8	5	2024-10-22	2000000.0	12	0.36
9	16	2024-10-23	5000000.0	24	0.24
10	12	2024-11-01	5000000.0	4	0.36
11	10	2024-12-02	2000000.0	6	0.36
12	14	2024-12-09	4000000.0	12	0.36
13	7	2025-01-07	2500000.0	2	0.36
14	6	2025-01-31	2500000.0	24	0.36
15	7	2025-01-07	3000000.0	12	0.36
16	13	2024-10-30	4000000.0	12	0.36
17	4	2025-04-11	6000000.0	2	0.36
18	15	2025-06-19	2000000.0	12	0.3
19	2	2025-06-25	8250000.0	24	0.24
 */


