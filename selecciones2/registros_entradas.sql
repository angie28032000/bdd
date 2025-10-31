select * from registros_entrada
where fecha between '01/09/2025' and '30/09/2025' or cedula_empleado like '17%'

select * from registros_entrada
where fecha between '01/08/2025' and '30/08/2025' or cedula_empleado like '17%'
and hora between '08:00:00' and '12:00:00'


select * from registros_entrada
where (fecha between '01/08/2025' and '30/08/2025' or cedula_empleado like '17%'
and hora between '08:00:00' and '12:00:00')

or (fecha between '01/09/2025' and '30/09/2025' 
and cedula_empleado like '08%' and hora between '09:00:00' and '13:00:00')



