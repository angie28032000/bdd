select * from estudiantes 
where nombre like 'M%' or apellido like '%Z'

select * from estudiantes
where cedula like '%32%' and cedula like '18%'

select cedula,nombre,apellido  from estudiantes
where cedula like '%06' or cedula like '17%'