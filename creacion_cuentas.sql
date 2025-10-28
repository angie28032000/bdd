
create table cuentas (
numero_cuenta char (5) not null,
cedula_propietario char (5) not null,
fecha_creacion date not null,
saldo money not null,

constraint cuentas_pk primary key (numero_cuenta)
)



