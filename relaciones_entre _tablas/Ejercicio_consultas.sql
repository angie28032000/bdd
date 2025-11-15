-- 1 USUARIOS Y CUENTAS 

SELECT cu.numero_cuenta, us.nombre, cu.saldo, cu.fecha_creacion
FROM usuario us
JOIN (
        SELECT *
        FROM cuentas
        WHERE saldo BETWEEN 100 AND 1000
          AND fecha_creacion BETWEEN '2022-09-21' AND '2023-09-21'
     ) cu
    ON cu.cedula_propietario = us.cedula;

-----CLIENTES Y COMPRAS ----------

SELECT cl.nombre,cl.apellido,cl.cedula  FROM clientes cl 
WHERE cl.cedula like '%7%' and cl.nombre = 'Monica';

-----ESTUDIANTES Y PROFESORES-----------

SELECT pr.codigo,pr.nombre ,es.nombre,es.apellido FROM profesores pr , estudiantes es
WHERE es.apellido like '%n%' and pr.nombre = 'Francisco';

-----PERSONA Y PRESTAMO ----


SELECT pe.cantidad_ahorrada, pr.monto, pr.garante
FROM persona pe
JOIN prestamo pr
     ON pr.cedula = pe.cedula
WHERE pr.monto BETWEEN 100 AND 1000
  AND pe.cedula = (
        SELECT p.cedula
        FROM persona p
        WHERE p.nombre = 'Sean'
    );
-----PRODUCTOS Y VENTA ----- 

SELECT pr.nombre, pr.stock, ve.cantidad
FROM productos pr
JOIN ventas ve
    ON pr.codigo = ve.codigo_producto
WHERE (pr.nombre LIKE '%m%' OR pr.descripcion IS NULL)
  AND pr.codigo IN (
        SELECT ve.codigo_producto
        FROM ventas ve
        WHERE ve.cantidad = 5
      );

  ------- TRANSACCIONES Y BANCOS -----

  SELECT t.*
FROM transacciones t
WHERE t.tipo = 'c'
  AND t.numero_cuenta BETWEEN '22001' AND '22004'
  AND t.codigo IN (
        SELECT tb.codigo_transaccion
        FROM transacciones tb
        WHERE tb.codigo = 1
      );

----------------VIDEO JUEGOS Y PLATAFORMAS -------
SELECT v.nombre,
       v.descripcion,
       v.valoracion,
       p.nombre_plataforma
FROM videojuegos v
JOIN plataformas p
       ON p.codigo_videojuego = v.codigo
WHERE (
        p.nombre_plataforma LIKE '%Guerra%' 
        AND v.valoracion > 7
      )
   OR (
        v.nombre LIKE 'C%' 
        AND v.valoracion > 8
        AND v.descripcion LIKE 'D%'
      )
   AND v.codigo IN (
        SELECT p2.codigo_videojuego
        FROM plataformas p2
        WHERE p2.codigo_videojuego = (
                SELECT v2.codigo
                FROM videojuegos v2
                WHERE v2.nombre = 'God of war'
        )
   );

   
----------------REGISTRO DE ENTRADA Y EMPLEADO --------------------
SELECT re.cedula,
       re.fecha,
       e.nombre
FROM registros_entrada re
JOIN empleado e
     ON re.codigo_empleado = e.codigo_empleado
WHERE 
      -- Condición 1: fecha entre agosto
      (re.fecha BETWEEN '2023-08-01' AND '2023-08-31')

   OR -- Condición 2: cédula contiene "17%" y hora entre 08:00 y 12:00
      (re.cedula LIKE '17%' 
       AND re.hora BETWEEN '08:00' AND '12:00')

   OR -- Condición 3: fecha octubre, cédula 08% y hora entre 09:00 y 13:00
      (re.fecha BETWEEN '2023-10-06' AND '2023-10-20'
       AND re.cedula LIKE '08%'
       AND re.hora BETWEEN '09:00' AND '13:00')

   AND re.codigo_empleado IN (
         SELECT e2.codigo_empleado
         FROM empleado e2
         WHERE e2.codigo_empleado = (
                SELECT re2.codigo_empleado
                FROM registros_entrada re2
                WHERE re2.cedula = '2201'
         )
   );
