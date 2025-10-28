create table transacciones (
codigo int not null,
numero_cuenta char (5) not null,
monto money not null,
tipo char (1) not null,
fecha date not null,
hora time not null,
constraint transacciones_pk primary key (codigo)
)



