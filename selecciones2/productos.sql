select* from productos
where stock = '10' and precio <'10'

select nombre,  descripcion ,stock  from productos
where nombre like '%m%' and descripcion like '% %'

select * from productos
where descripcion is null  or stock = '0'

