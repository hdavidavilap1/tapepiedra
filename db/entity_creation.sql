
drop table if exists  users, payments, loans, loantape, revolving;  

drop type if exists ENUM_ESTADO_PAGO;



CREATE TYPE ENUM_ESTADO_PAGO AS ENUM ('exitoso','fallido');


CREATE TABLE Users (

    user_id serial PRIMARY KEY,
    nombre varchar(100),
    apellido varchar(100)


);


CREATE TABLE Loans (

    loan_id serial PRIMARY KEY,
    user_id int, 
    fecha_creacion date NOT NULL DEFAULT CURRENT_DATE, 
    monto float, 
    numero_cuotas int, 
    tasa_interes_ea float
);



CREATE TABLE Revolving (

    loan_id int,
    user_id int, 
    fecha_creacion date NOT NULL DEFAULT CURRENT_DATE, 
    monto float
);



CREATE TABLE Payments (
    payment_id serial PRIMARY KEY,
    usuario_id int,
    loan_id int,
    fecha_pago DATE,
    monto float, 
    estado_pago ENUM_ESTADO_PAGO

);



CREATE TABLE LoanTape (
    loan_id int, 
    fecha date, 
    saldo_anterior_capital float,
    saldo_anterior_intereses float,
    intereses_periodo float,
    monto_pago float,
    abono_capital float,
    abono_intereses float,
    monto_rotativo float,
    saldo_nuevo_capital float,
    saldo_nuevo_intereses float,
    
   
  
    PRIMARY KEY (loan_id, fecha)

);





