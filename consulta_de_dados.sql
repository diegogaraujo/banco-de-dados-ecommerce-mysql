show databases;
use ecommerce;

show tables;
select * from clientes inner join pessoa_fisica on clientes.cliente_id = pessoa_fisica_cliente_id;

select produto_pedido_id from pedidos_produtos where status_pp = 'Pedido liberado';	

desc fornecedores;

select * from produtos  order by  avaliação desc;