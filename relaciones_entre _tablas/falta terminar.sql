create table procutos(
codigo int not null,
nombre  varchar (50) not null,
stok int not null,
constraint productos_pk primary key (codigo)
)

create table proveedores (
codigo int not null,
nombre  varchar (50) not null,
telefono char (10)  not null,
constraint proveedores_pk primary key (codigo)

)

create table productos_por_proveedor(
pp_codigo_producto int not null,
pp_codigo_proveedor int not null,
pp_precio ;
)

insert into productos (codigo,nombre,stok)
values (100,'Doritos',100);
insert into productos (codigo,nombre,stok)
values (200,'Kchitos',200);
insert into productos (codigo,nombre,stok)
values (300,'Papas',300);
insert into productos (codigo,nombre,stok)
values (400,'Takis',0);



insert into proveedores (codigo,nombre,telefono)
values (1,'Snacks SA','0939079750');
insert into proveedores (codigo,nombre,telefono)
values (2,'Distrisnacks SA','0957645372');

select * from productos_por_proveedor

insert into productos_por_proveedor (pp_codigo_producto,pp_codigo_proveedor,pp_precio)
values (300,1,0.48);

insert into productos_por_proveedor (pp_codigo_producto,pp_codigo_proveedor,pp_precio)
values (300,2,0.49);


insert into productos_por_proveedor (pp_codigo_producto,pp_codigo_proveedor,pp_precio)
values (100,1,0.5);


insert into productos_por_proveedor (pp_codigo_producto,pp_codigo_proveedor,pp_precio)
values (200,1,0.51);


insert into productos_por_proveedor (pp_codigo_producto,pp_codigo_proveedor,pp_precio)
values (400,2,0.50);


select prod.codigo,prod.nombre,prov.nombre from productos prod,proveedores prov,productos_por_proveedor pp
where pp.pp_codigo_producto = prod.codigo  
and pp.pp_codigo_proveedor = prov.codigo
and prod.codigo = '300';



------------------------------------------------------------------
------------------EJERCICIO 26 ------------------------

create table usuarios (
id_usuario int not null,
nombre varchar(25) not null,
apellido varchar(25) not null,
fecha_nacimiento DATE ,
constraint usuarios_pk primary key (id_usuario)
)

create table grupo (
id_grupo int not null,
nombre varchar (25) not null,
descripcion varchar (75) ,
fecha_creacion DATE ,
constraint grupo_pk primary key (id_grupo)
)

create table usuario_grupo (
us_id int not null,
gr_id int not null,
FOREIGN KEY (us_id) REFERENCES usuarios (id_usuario),
FOREIGN KEY (gr_id) REFERENCES grupo(id_grupo)
)


create table habitaciones (
habitacion_numero int not null,
precio_por_noche money not null,
piso int not null,
max_personas int ,
constraint habitaciones_pk primary key (habitacion_numero)

)

create table huespedes (
id_huespedes int not null,
nombres varchar (45) not null,
apellido varchar (45) not null,
telefono char (10),
correo varchar(45),
direccion varchar (45),
cuidad varchar (45),
pais varchar (45),
constraint huespedes_pk primary key (id_huespedes)

)

CREATE TABLE habitaciones_huespedes (
    inicio_fecha DATE NOT NULL,
    fin_fecha DATE NOT NULL,
    hb_habitaciones INT NOT NULL,
    hb_huesped INT NOT NULL,
	
    FOREIGN KEY (hb_habitaciones) REFERENCES habitaciones (habitacion_numero ),
    FOREIGN KEY (hb_huesped) REFERENCES huespedes(id_huespedes)
)

create table cuidad(
id_cuidad int not null,
nombre varchar(45) not null,
constraint cuidad_pk primary key (id_cuidad)
)

create table municipio(
id_municipio int not null,
nombre varchar (45),
cuidad_id int,

constraint municipio_pk primary key (id_municipio),
foreign key (cuidad_id) references cuidad (id_cuidad)

)

create table proyecto (
id_proyecto int not null,
proyecto varchar (50) not null,
monto money not null,
fecha_inicio date,
fecha_entrega date,
constraint proyecto_pk primary key (id_proyecto)
)

create table proyecto_municipio (
municipio_id int  not null ,
proyecto_id int not null,

foreign key (municipio_id) references municipio (id_municipio),
foreign key (proyecto_id ) references proyecto (id_proyecto)
)








)











