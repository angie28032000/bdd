select * from transacciones


select * from transacciones
where tipo like 'D%'

select * from transacciones
where monto between '200' and '2000'

select codigo,monto,tipo,fecha
from transacciones
where fecha is not null

