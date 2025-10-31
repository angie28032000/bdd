select * from transacciones
update transacciones set tipo = 'T'
where monto between '100' and '500' and fecha between '2025-09-01' and '2025-09-30' and hora between '14:00:00' and '20:00:00'
