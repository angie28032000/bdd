
create table estudiantes (
cedula char (10) not null,
nombre varchar (50) not null,
apellido varchar (50) not null,
email varchar (50) not null,
fecha_nacimiento date,
constraint estudiantes_pk primary key (cedula)

)


