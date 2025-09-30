create view saldo_contas as 
select 
	cl.id_cliente as ID_Cliente,
    cl.nome as Nome_Cliente,
    co.saldo as Saldo
from 
	clientes cl
join 
	contas co on cl.id_cliente = co.id_cliente;
    
select * from saldo_contas;

select * from saldo_contas order by Saldo asc limit 1;