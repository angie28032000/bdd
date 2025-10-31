select * from cuentas

select numero_cuenta,saldo from cuentas
where saldo > '100' and saldo < '1000'

select cuentas,fecha_creacion from cuentas
where fecha_creacion between '30/10/2024' and '30/10/2025'

select * from cuentas
where saldo = '0' or cedula_propietario like '%2'