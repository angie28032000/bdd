select * from  registros_entrada
CREATE TABLE registros_entrada (
    codigo_registro INT NOT NULL,
    cedula_empleado VARCHAR(10) NOT NULL,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    CONSTRAINT codigo_registro_pk PRIMARY KEY (codigo_registro)
);

insert into registros_entrada (codigo_registro,cedula_empleado,fecha,hora)
values ('432','1234567345','02/04/2025','23:04:04')

insert into registros_entrada (codigo_registro,cedula_empleado,fecha,hora)
values ('456','1234567745','02/07/2025','12:04:04')

insert into registros_entrada (codigo_registro,cedula_empleado,fecha,hora)
values ('642','1235567345','05/08/2025','11:04:04')

insert into registros_entrada (codigo_registro,cedula_empleado,fecha,hora)
values ('482','1234587345','08/04/2025','10:04:04')

