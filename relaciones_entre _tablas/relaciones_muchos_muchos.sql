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

CREATE TABLE reservas (
    inicio_fecha DATE NOT NULL,
    fin_fecha DATE NOT NULL,
    hb_habitaciones INT NOT NULL,
    hb_huesped INT NOT NULL,
	
    CONSTRAINT habitaciones_huespedes_pk PRIMARY KEY (inicio_fecha, hb_habitaciones, hb_huesped),
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


-------------- INSERTS -----------------


insert into usuarios values (1,'Marilyn','Sagñay','05/11/2023'),
							(2,'Romel','Chamba','06/11/2023'),
							(3,'Mario','Guzñay','05/11/2023'),
							(4,'Johann','Domo','07/11/2023'),
							(5,'Monserrate','Vera','05/11/2023'),
							(6,'Lucio','Vargas','05/11/2023'),
							(7,'Martín','Arizaga','05/11/2023'),
							(8,'Fricson','Erazo','05/11/2023'),
							(9,'Jairo','Obando','05/11/2023'),
							(10,'Berni','Tomalá','05/11/2023');
							
							
insert into grupo values (1,'Maternal 1','Grupo de maternal matutino','08/03/2020'),
						 (2,'Maternal 2','Grupo de maternal vepertino','08/03/2020'),
						 (3,'Maternal 3','Grupo de maternal nocturno','08/03/2020'),
						 (4,'Incial 1 ','Grupo de inicial matutino','15/03/2021'),
						 (5,'Incial 2','Grupo de  inicial vespertino','15/03/2021'),
						 (6,'Incial 3','Grupo de  inicial  nocturno','15/03/2021'),
						 (7,'Incial intensivo','Grupo de inicial días sabados','15/03/2021'),
						 (8,'Maternal intensivo 1','Grupo de maternal matutino días sabados','15/03/2022'),
						 (9,'Maternal intensivo 2','Grupo de maternal vespertino días sabados','15/03/2022'),
						 (10,'Maternal intensivo 3','Grupo de maternal nocturno días sabados','15/03/2022');


insert into usuario_grupo values (1,8),
								 (2,3),
								 (3,8),
								 (4,9),
								 (5,1),
								 (6,2),
								 (7,8),
								 (8,8),
								 (9,10),
								 (10,1);
								 
							 
								 
------2------------
--RELACION MUCHOS A MUCHOS HABITACIONES Y HUESPEDES

 insert into habitaciones values (1,40.0,4,4),
 								 (2,20.0,4,2),
								 (3,40.0,4,4),
								 (4,40.0,3,4),
								 (5,20.0,3,2),
								 (6,20.0,3,2),
								 (7,20.0,2,2),
								 (8,20.0,2,2),
								 (9,20.0,2,2),
								 (10,15.0,1,1),
								 (11,15.0,1,1),
								 (12,15.0,1,1);
								 

insert into huespedes values    (1,'Ricardo','Montero',0980658774,'Ricmontero@gmail.com'),
								(2,'Sofía','Martinez',09887563205,'Sofimar@gmail.com'),
								(3,'Yamilteh','Guami',0998763298,'YAMGUAM@gmail.com'),
								(4,'Esther','Contreras',0995783602,'Esthcontro@gmail.com'),
								(5,'Wiliam','Mantilla',09858796320,'wmANTILLA@gmail.com'),
								(6,'Carmen','Noguera',0995876321,'Cnoguera@gmail.com'),
								(7,'Anika','Jimenez',0978965432,'AniJimenez@gmail.com'),
								(8,'Belen','Orejuela',0996365748,'BOrejuela@gmail.com'),
								(9,'Diana','Monroy',0987963214,'DianaMroy@gmail.com'),
								(10,'Bryan','Moncada',0986325741,'BrMoncada@gmail.com');
												
								
insert into reservas values ('11/05/2023','12/05/2023',2,10),
						    ('11/05/2023','12/05/2023',2,9),
							('22/06/2023','23/06/2023',1,1),
							('22/06/2023','23/06/2023',1,2),
							('22/06/2023','23/06/2023',1,3),
							('22/06/2023','23/06/2023',1,4),
							('01/01/2023','02/01/2023',12,5),
							('11/08/2023','12/08/2023',11,6),
							('11/05/2023','12/05/2023',10,7),
							('11/05/2023','12/05/2023',9,8);
							


-------------3
--RELACION MUCHOS A MUCHOS MUNICIPIO Y PROYECTOS


insert into cuidad values   (1,'Quito'),
							(2,'Ambato'),
							(3,'Guayaquil'),
							(4,'Machala'),
							(5,'Manta'),
							(6,'Loja'),
							(7,'Otavalo'),
							(8,'Cuenca'),
							(9,'Latacunga'),
							(10,'Tena');


insert into municipio values (1,'GAD MUNICIPAL QUITO',1),
							 (2,'GAD MUNICIPAL DE CUENCA',8),
							 (3,'GAD MUNICIPALIDAD DE AMBATO',2),
							 (4,'MUNICIPALIDAD DE MACAHALA ',4),
							 (5,'MUNIUCIPIO DE GUAYAQUIL',3),
							 (6,'MUNICIPIO DE OTAVALO',7),
							 (7,'MUNICIPIO DE LOJA',6),
							 (8,'MUNICIPIO DE MANTA',5),
							 (9,'MUNICIPIO DE LATACUNGA',9),
							 (10,'MUNICIPIO DE TENA',10);


insert into proyecto values (1,'Proyectos de Gestión Ambiental',9543.327,'10/02/2022','10/02/2023'),
							(2,'Proyectos en Fomento y Desarrollo Productivo',26553.264,'25/06/2022','10/08/2022'),
							(3,'Proyectos en Cambio Climático',1292.194,'01/02/2021','10/12/2023');
							



insert into proyecto_municipio values (1,5),
									  (3,5),
									  (1,2),
									  (2,1),
									  (1,4),
									  (2,9),
									  (1,10),
									  (3,6),
									  (1,3),
									  (2,7)




-------------- consulta 1 ------------
select * from usuarios
select * from grupo 
select * from usuario_grupo 

SELECT us.nombre, gr.nombre
FROM usuarios us, grupo gr, usuario_grupo ug
WHERE us.id_usuario = ug.us_id
  AND gr.id_grupo = ug.gr_id;


SELECT nombre
FROM usuarios
WHERE id_usuario IN (  SELECT us_id  FROM usuario_grupo WHERE gr_id = 1);


SELECT gr.nombre,
 COUNT(ug.us_id) AS cantidad_usuarios
FROM grupo gr
LEFT JOIN usuario_grupo ug ON gr.id_grupo = ug.gr_id
GROUP BY gr.nombre;

----------consulta 2 ------------------------
select * from usuarios
select * from grupo 
select * from usuario_grupo 

SELECT us.nombre, gr.nombre
FROM usuarios us, grupo gr, usuario_grupo ug
WHERE us.id_usuario = ug.us_id
 AND gr.id_grupo = ug.gr_id AND gr.nombre LIKE '%intensivo%' ;


SELECT nombre
FROM usuarios
WHERE id_usuario IN (  SELECT us_id  FROM usuario_grupo WHERE gr_id = 2);


SELECT gr.nombre, MAX(ug.us_id) AS maximo_usuario
FROM grupo gr
LEFT JOIN usuario_grupo ug 
 ON gr.id_grupo = ug.gr_id
GROUP BY gr.nombre;

----------- consulta 3 ---------------
SELECT us.nombre, gr.nombre
FROM usuarios us, grupo gr, usuario_grupo ug
WHERE us.id_usuario = ug.us_id
 AND gr.id_grupo = ug.gr_id AND gr.fecha_creacion BETWEEN '2020-03-08' AND '2022-03-08'


SELECT nombre
FROM usuarios
WHERE id_usuario IN (  SELECT us_id  FROM usuario_grupo WHERE gr_id = 3);



SELECT gr.descripcion,
COUNT(ug.us_id) AS cantidad_usuarios
FROM grupo gr
LEFT JOIN usuario_grupo ug 
ON gr.id_grupo = ug.gr_id
WHERE gr.descripcion LIKE '%matutino%'
GROUP BY gr.descripcion;

--------------------HABITACIONES HUESPEDES ---------------
Select * from habitaciones
Select * from reservas
Select * from huespedes

SELECT h.habitacion_numero,
hu.nombres,
hu.apellido
FROM habitaciones h
JOIN reservas r
ON h.habitacion_numero = r.hb_habitaciones
JOIN huespedes hu
ON hu.id_huespedes = r.hb_huesped;


SELECT nombres,
apellido
FROM huespedes
WHERE id_huespedes IN (
SELECT id_huespedes
FROM reservas r
WHERE r.hb_habitaciones = 2
 );


SELECT h.habitacion_numero,
COUNT(r.hb_huesped) AS cantidad_huespedes
FROM habitaciones h
JOIN reservas r
ON h.habitacion_numero = r.hb_habitaciones
GROUP BY h.habitacion_numero;

------------ consulta 2 ---------------

SELECT h.habitacion_numero,
h.piso,
hu.nombres,
hu.apellido
FROM habitaciones h
JOIN reservas r
ON h.habitacion_numero = r.hb_habitaciones
JOIN huespedes hu
ON hu.id_huespedes = r.hb_huesped
WHERE h.piso = 4;


SELECT nombres,
apellido
FROM huespedes
WHERE id_huespedes IN (
SELECT hb_huesped
FROM reservas
WHERE hb_habitaciones = 3
);


SELECT h.habitacion_numero,
AVG(r.hb_huesped) AS promedio_de_huespedes
FROM habitaciones h
JOIN reservas r
ON h.habitacion_numero = r.hb_habitaciones
GROUP BY h.habitacion_numero;





------------------conuslta 3 --------------------

SELECT h.habitacion_numero,
hu.nombres,
hu.apellido
FROM habitaciones h
JOIN reservas r
ON h.habitacion_numero = r.hb_habitaciones
JOIN huespedes hu
ON hu.id_huespedes = r.hb_huesped;

SELECT nombres, apellido
FROM huespedes
WHERE id_huespedes IN (
SELECT hb_huesped
FROM reservas
WHERE hb_habitaciones = 4
);
	  

SELECT h.habitacion_numero,
SUM(h.precio_por_noche) AS total_recaudado
FROM habitaciones h
JOIN reservas r
ON h.habitacion_numero = r.hb_habitaciones
GROUP BY h.habitacion_numero;

------------------ MUNICIPIO Y PROYECTOS ----------

Select * from municipio
Select * from proyecto
Select * from proyecto_municipio

SELECT m.nombre AS municipio,
p.proyecto AS proyecto
FROM municipio m
JOIN proyecto_municipio pm
ON m.id_municipio = pm.municipio_id
JOIN proyecto p
ON p.id_proyecto = pm.proyecto_id;



SELECT p.proyecto
FROM proyecto p
WHERE id_proyecto IN (
SELECT proyecto_id
FROM proyecto_municipio
WHERE municipio_id = 1
);

	
SELECT m.nombre AS municipio,
COUNT(pm.proyecto_id) AS cantidad_proyectos
FROM municipio m
JOIN proyecto_municipio pm
ON m.id_municipio = pm.municipio_id
GROUP BY m.nombre;


-----------------consulta 2 -----------

SELECT 
m.nombre AS municipio,
p.proyecto AS proyecto
FROM municipio m
JOIN proyecto_municipio pm
ON m.id_municipio = pm.municipio_id
JOIN proyecto p
ON p.id_proyecto = pm.proyecto_id
WHERE m.nombre LIKE '%GAD%';


SELECT 
m.nombre AS municipio,
MIN(pm.proyecto_id) AS minimo_proyecto
FROM municipio m
JOIN proyecto_municipio pm
ON m.id_municipio = pm.municipio_id
GROUP BY m.nombre;


SELECT 
m.nombre AS municipio,
COUNT(pm.proyecto_id) AS cantidad_proyectos
FROM municipio m
JOIN proyecto_municipio pm
ON m.id_municipio = pm.municipio_id
GROUP BY m.nombre;


------------conuslta 3----
select * from cuidad

SELECT 
m.nombre AS municipio,
c.nombre AS ciudad
FROM municipio m
JOIN ciudad c
ON m.ciudad_id = c.id_ciudad;

SELECT 
p.proyecto
FROM proyecto p
WHERE p.id_proyecto IN (
SELECT proyecto_id
FROM proyecto_municipio
WHERE municipio_id = 3
);

SELECT 
m.nombre AS municipio,
MAX(pm.proyecto_id) AS maximo_proyecto
FROM municipio m
JOIN proyecto_municipio pm
ON m.id_municipio = pm.municipio_id
GROUP BY m.nombre;