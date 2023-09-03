insert into Clientes (email, tipo)
	values ("clientepf1@meuemail.com.br", 'PF'),
		   ('clientepf2@meuemail.com.br', 'PF'),
           ('clientepj1@meuemail.com.br', 'PJ'),
           ('clientepf3@meuemail.com.br', 'PF'),
           ('clientepj2@meuemail.com.br', 'PJ');
           
insert into pessoa_fisica(pessoa_fisica_cliente_id, CPF, nome, sobrenome)
	values (1, 11122233344, 'Alex', 'Machado'),
		   (2, 12345678910, 'Maria', 'Santana'),
           (4, 78954768720, 'José', 'Magalhães');
           
insert into pessoa_juridica (pessoa_juridica_cliente_id, CNPJ, razao_social, nome_fantasia)
	Values (3, 45632785000165, 'clientepj1', 'clientepj1'),
		   (5, 45315987000134, 'clientepj2', 'clientepj2');
           
insert into endereco_clientes (endereco_cliente_cliente_id, logradouro, numero, bairro, cep, cidade, estado)
	values (1, 'Rua A1', 01, 'conjuntoresidencial1', 11222333, 'Cidade A', 'EZ'),
		   (2, 'Rua B2', 10, 'loteamentoresidencial2', 55051000, 'Cidade B', 'EA'),
           (3, 'Rua C3', 11, 'conjuntoresidencial5', 33555888, 'Cidade A', 'EZ'),
		   (4, 'Rua D1', 12, 'conjuntoresidencial5', 66485000, 'Cidade C', 'EB'),
		   (5, 'Rua C4', 12, 'conjuntoresidencial5', 66485000, 'Cidade C', 'EB');
           
insert into telefone_clientes (telefone_cliente_cliente_id, ddd, telefone)
	Values (1, 25, 931658434),
		   (2, 30, 931518225),
           (3, 25, 931831513),
           (4, 15, 916513155),
           (5, 15, 906131312);
           
insert into produtos(produto_nome, dimensões, peso, descrição, avaliação)
	values('produto1', '50x60x10', null, 'descrição produto 1', 4.6),
		  ('produto2', '10x56x12', 10, 'descrição do produto2', 4.7),
          ('produto3', '15x30x20', 10, 'descrição do produto3', 4.7),
          ('produto4', null, 10, 'descrição do produto4', 4.4),
          ('produto5', null, 33, 'descrição do produto5', 4.1),
          ('produto6', '11x26x23', 10, 'descrição do produto6', 4.9);
          
insert into fornecedores (CNPJ, razao_social, nome_fantasia, logradouro, numero, bairro, cep, cidade, estado)
	values(76657156000168, 'Fornecedor 1 ltda', 'Fornecedor 1', 'Rua 18', 01, 'Bairro industrial', 35489546, 'Cidade H', 'E6'),
		  (86757156000167, 'Fornecedor 2 ltda', 'Fornecedor 2', 'Rua A', 10, 'Bairro M', 89789546, 'Cidade H', 'EA'),
          (86654756000166, 'Fornecedor 3 ltda', 'Fornecedor 3', 'Rua Delta', 05, 'Bairro L', 25468746, 'Cidade W', 'ES'),
          (83657156000165, 'Fornecedor 4 ltda', 'Fornecedor 4', 'Rua Pi', 02, 'Bairro 22', 55435494, 'Cidade Alfa', 'EB'),
          (82657156000764, 'Fornecedor 5 ltda', 'Fornecedor 5', 'Rua Lambda', 08, 'Bairro 69', 94659896, 'Cidade 8', 'EJ');
          
insert into fornecedores_produtos (produto_fornecedor_id, fornecedor_produto_id, quantidade)
	values (1, 2, 500),
		   (2 , 1 , 1000),
           (3, 3, 50),
           (4, 4, 20),
           (5, 5, 60),
           (5, 6, 45);
           
insert into vendedores (CNPJ, razao_social, nome_fantasia, logradouro, numero, bairro, cep, cidade, estado)
	values(65485324000168, 'Vendedor 1 ltda', 'Vendedor 1', 'Rua 28', 13, 'Bairro 100', 35435546, 'Cidade 45', 'E6'),
		  (59835185000167, 'Vendedor 2 ltda', 'Vendedor 2', 'Rua C', 10, 'Bairro 55', 89787846, 'Cidade H', 'EA'),
          (18686568000166, 'Vendedor 3 ltda', 'Vendedor 3', 'Rua Omega', 45, 'Bairro 96', 25368146, 'Cidade B12', 'ES'),
          (94616351000165, 'Vendedor 4 ltda', 'Vendedor 4', 'Rua teta', 94, 'Bairro P', 55435698, 'Cidade 51', 'EB'),
          (61861513000764, 'Vendedor 5 ltda', 'Vendedor 5', 'Rua 4', 08, 'Bairro 31', 94659896, 'Cidade J6', 'EJ');

insert into vendedores_produtos (produto_vendedor_id, vendedor_produto_id, quantidade)
	values (5, 2, 50),
		   (5 , 1 , 300),
           (4, 3, 50),
           (3, 4, 20),
           (2, 5, 450),
           (1, 6, 45);
           
insert into estoques(localizacao) values ('São Paulo'),
										 ('Rio de Janeiro'),
                                         ('Recife'),
                                         ('Goiania'),
                                         ('Porto Alegre'),
                                         ('Fortaleza');
                                         
 Insert into estoques_produtos (produto_estoque_id, estoque_produto_id, quantidade, und_med, Status_estoque)
	values (1, 2, 5000, 'UN', 'Disponível'),
		   (1, 3, 20000, 'UN', 'Disponível'),
           (1, 1, 0, 'MT', 'Esgotado'),
           (2, 3, 2500, 'UN', 'Disponível'),
           (2, 5, 10500, 'KG', 'Disponível'),
           (3, 4, 525, 'UN', 'Disponível'),
           (4, 6, 1250, 'MT', 'Disponível'),
           (5, 1, 650, 'MT', 'Disponível'),
           (6, 4, 900, 'UN', 'Disponível'),
           (6, 5, 0, 'KG', 'Esgotado'); 
           
 insert into pedidos (pedido_cliente_id, status_pedido, descricao, valor_frete)
	values(1, 'Enviado', 'Compra via aplicação web', 35.5),
		  (2, default, 'Compra via loja parceira', 0.0),
          (3, 'Entregue', 'Compra via aplicação web', 30),
          (4, 'Confirmado', 'Compra via aprlicação web', 25),
          (5, 'Em processamento', 'Compra via loja parceira', 0.0);
          
 insert into pedidos_produtos (produto_pedido_id, pedido_produto_id, quantidade, status_pp, valor)
	 values(1, 2, 1, 'Pedido Liberado', 250),
		   (2, 1, 5, 'Aguardando Pagamento', 30),
           (3, 6, 3, 'Pedido Liberado', 50),
           (4, 3, 10, 'Pagamento Confirmado', 40),
           (5, 5, 5, 'Aguardando Pagamento', 100);
           
insert into pagamentos(pagamento_pedido_id, forma_pagamento, pagamento_avista, data_pagamento)
	values(1, 'pix', true, '2023-8-30'),
		  (2, null, false, null),
          (3, 'cartão', false, '2023-8-30'),
          (4, 'boleto', true, '2023-8-30'),
          (5, null, false, null);