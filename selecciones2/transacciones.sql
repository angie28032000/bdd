
select * from transacciones


select * from transacciones 
where tipo = 'C' and numero_cuenta between '222001' and '22004'


select * from transacciones 
where tipo = 'D' and fecha = '25/05/2025' and numero_cuenta between '22007' and '22010'

select * from transacciones 
where codigo between '1' and '5' and numero_cuenta between '22002' or '22004' 
and between '26/05/2025' and '29/05/2025'