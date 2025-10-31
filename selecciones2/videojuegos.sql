select * from videojuegos

select nombre, valoracion from videojuegos
where nombre like '%C%' or valoracion ='7'

select * from videojuegos
where codigo between '3' and '7' or valoracion = '7'

select * from videojuegos
where (descripcion = 'juego de accion' and valoracion>7 and nombre like 'C%' )
or (valoracion >8 and nombre like 'D%')
