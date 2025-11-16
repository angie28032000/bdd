
-----------Ejecicio 1 -------------
SELECT AVG(saldo) AS saldo_promedio FROM cuentas , usuario
WHERE cedula = '0100000001';

------------Ejercicio 2-----------

SELECT  tipo_cuenta , COUNT (numero_cuenta) AS total_cuentas   FROM cuentas,usuario
GROUP BY tipo_cuenta ;
 
--------------Ejercicio 3 --------

SELECT cl.cedula , SUM (monto) AS monto_total_compras FROM compras co,clientes cl
GROUP BY cl.cedula;

-------------EJERCICIO 4 -------------
SELECT fecha_compra, COUNT(id_compra) AS total_compras
FROM compras co
WHERE co.fecha_compra = '2023-01-05'
GROUP BY fecha_compra;

---------EJERCICIO 5 ------------

SELECT codigo_profesor, COUNT (cedula) as total_estudiantes FROM estudiantes
GROUP BY codigo_profesor

----------EJERCICIO 6 ------------

SELECT  ROUND( AVG( EXTRACT(YEAR FROM CURRENT_DATE) -  EXTRACT(YEAR FROM fecha_nacimiento) ) ) AS edad_promedio
FROM estudiantes;

----------- EJERCICIO 7 ----------

SELECT cedula, SUM (monto) AS monto_prestamo FROM prestamo pr
GROUP BY cedula ;


-----------Ejercicio 7---------------

SELECT COUNT(cedula) AS total_personas from persona
WHERE numero_hijos >1;

----------ejercicio 8--------------


SELECT MAX(precio) FROM productos

-------------EJERCICIO 9---------

SELECT SUM(cantidad) AS cantidad_total_vendida FROM ventas


---------------EJERCICIO 10 -----------


SELECT  COUNT(codigo) FROM transacciones
WHERE tipo = 'C';

-------------Ejercicio 11 ------------

SELECT ROUND(AVG( EXTRACT(YEAR FROM CURRENT_DATE)  -  EXTRACT(YEAR FROM fecha_nacimiento) ) ) AS edad_promedio
FROM estudiantes;

----------------EJERCICO 12 -------------

SELECT * FROM videojuegos
SELECT * FROM plataformas

SELECT codigo_videojuego , COUNT (id_plataforma) AS total_plataformas FROM  plataformas , videojuegos
GROUP BY codigo_videojuego















