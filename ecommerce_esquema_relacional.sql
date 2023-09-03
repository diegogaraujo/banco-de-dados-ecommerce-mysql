-- Criação da base de dados do Ecommerce
-- drop database Ecommerce;
create database Ecommerce;
use Ecommerce;

-- criar tabela clientes
create table clientes(
	cliente_id int auto_increment primary key not null,
    email varchar(45) not null,
    tipo enum('PF', 'PJ')
);

-- criar tabela pedidos
create table pedidos(
	pedido_id int auto_increment not null,
    pedido_cliente_id int,
    primary key (pedido_id, pedido_cliente_id),
    constraint fk_pedido_cliente_id foreign key (pedido_cliente_id) references clientes(cliente_id)
    on update cascade on delete cascade,
	status_pedido ENUM('cancelado', 'confirmado', 'Em processamento', 'Enviado', 'Entregue') default 'Em processamento',
    descricao varchar(200),
	valor_frete float default 15
);

-- criar tabela entregas
create table entregas(
	entrega_id int auto_increment not null,
    entrega_pedido_id int,
    primary key (entrega_id, entrega_pedido_id),
    constraint fk_entrega_pedido_id foreign key (entrega_pedido_id) references pedidos(pedido_id)
    on update cascade on delete cascade,
    status_entrega enum('Enviado', 'Em transito', 'Entregue'),
    data_entrega date,
    cod_rastreio varchar(45)
);

-- criar tabela pagamentos
create table pagamentos(
	pagamento_id int auto_increment not null,
    pagamento_pedido_id int,
    primary key (pagamento_id, pagamento_pedido_id),
    constraint fk_pagamento_pedido_id foreign key (pagamento_pedido_id) references pedidos(pedido_id)
    on update cascade on delete cascade,
	forma_pagamento enum('boleto', 'cartão', 'pix'),
    pagamento_avista boolean default false,
    data_pagamento date
);

-- criar tabela pessoa fisica
create table pessoa_fisica(
	pessoa_fisica_id int auto_increment not null,
    pessoa_fisica_cliente_id int,
    primary key (pessoa_fisica_id, pessoa_fisica_cliente_id),
    constraint fk_pessoa_fisica_cliente_id foreign key (pessoa_fisica_cliente_id) references clientes(cliente_id) 
		on update cascade on delete cascade,
	CPF char(11) not null,
    constraint unique_pessoa_fisica_CPF unique pessoa_fisica(CPF),
    nome varchar(20) not null,
    sobrenome varchar(45) not null
);

-- criar tabela pessoa juridica
create table pessoa_juridica(
	pessoa_juridica_id int auto_increment not null,
    pessoa_juridica_cliente_id int,
    primary key (pessoa_juridica_id, pessoa_juridica_cliente_id),
    constraint fk_pessoa_juridica_cliente_id foreign key (pessoa_juridica_cliente_id) references clientes(cliente_id) 
		on update cascade on delete cascade,
	cnpj char(14) not null,
    constraint unique_pessoa_juridica_CNPJ unique pessoa_juridica(CNPJ),
    razao_social varchar(45) not null,
    nome_fantasia varchar(45) not null
);

-- criar tabela endereço clientes
create table endereco_clientes(
	endereco_cliente_id int auto_increment not null,
    endereco_cliente_cliente_id int,
    primary key (endereco_cliente_id, endereco_cliente_cliente_id),
    constraint fk_endereco_cliente_cliente_id foreign key (endereco_cliente_cliente_id) references clientes(cliente_id) 
		on update cascade on delete cascade,
	logradouro varchar(45),
    numero int,
    bairro varchar(45),
    cep char(8),
    cidade varchar(20),
    estado char(2)  -- siglas
); 

-- criar tabela telefone clientes

create table telefone_clientes(
	telefone_cliente_id int auto_increment not null,
    telefone_cliente_cliente_id int,
    primary key (telefone_cliente_id, telefone_cliente_cliente_id),
    constraint fk_telefone_cliente_cliente_id foreign key (telefone_cliente_cliente_id) references clientes(cliente_id) 
		on update cascade on delete cascade,
	ddd char(2) not null,
    telefone char(9) not null
);

-- criar tabela produto
create table produtos(
	produto_id int auto_increment primary key not null,
	produto_nome varchar(60) not null,
	dimensões varchar(45),
	peso float,
	descrição varchar(200),
    avaliação float
);

-- criar a tabela estoque
create table estoques(
	estoque_id int auto_increment primary key not null,
    localizacao varchar(45)
);

-- criar tabela vendedor
create table vendedores(
	vendedor_id int auto_increment primary key not null,
    CNPJ char(14) not null,
    constraint unique_vendedor_cnpj unique vendedores(CNPJ),
    razao_social varchar(45) not null,
    nome_fantasia varchar(45) not null,
    logradouro varchar(45),
	numero int,
    bairro varchar(45),
    cep char(8),
    cidade varchar(20),
    estado char(2)
    
);

-- criar tabela fornecedores
create table fornecedores(
fornecedor_id int auto_increment primary key not null,
    CNPJ char(14) not null,
    constraint unique_fornecedor_cnpj unique fornecedores(CNPJ),
    razao_social varchar(45) not null,
    nome_fantasia varchar(45) not null,
    logradouro varchar(45),
	numero int,
    bairro varchar(45),
    cep char(8),
    cidade varchar(20),
    estado char(2)
);

-- criar tabelas de relacionamentos n:m

create table pedidos_produtos(
	produto_pedido_id int,
    pedido_produto_id int,
    primary key (produto_pedido_id, pedido_produto_id),
    constraint fk_produto_pedido_id foreign key (produto_pedido_id) references pedidos(pedido_id)
    on update cascade on delete cascade,
    constraint fk_pedido_produto_id foreign key (pedido_produto_id) references produtos(produto_id)
    on update cascade on delete cascade,
    quantidade int not null,
    status_pp enum('Aguardando Pagamento', 'Pagamento Confirmado', 'Pedido Liberado'),
    valor float not null
);

create table fornecedores_produtos(
	produto_fornecedor_id int,
    fornecedor_produto_id int,
    primary key (produto_fornecedor_id, fornecedor_produto_id),
    constraint fk_produto_fornecedor_id foreign key (produto_fornecedor_id) references fornecedores(fornecedor_id)
    on update cascade on delete cascade,
    constraint fk_fornecedor_produto_id foreign key (fornecedor_produto_id) references produtos(produto_id)
    on update cascade on delete cascade,
	quantidade int not null
);

create table vendedores_produtos(
	produto_vendedor_id int,
	vendedor_produto_id int,
	primary key (produto_vendedor_id, vendedor_produto_id),
	constraint fk_produto_vendedor_id foreign key (produto_vendedor_id) references vendedores(vendedor_id)
    on update cascade on delete cascade,
    constraint fk_vendedor_produto_id foreign key (vendedor_produto_id) references produtos(produto_id)
    on update cascade on delete cascade,
    quantidade int not null
);

create table estoques_produtos(
	produto_estoque_id int,
	estoque_produto_id int,
	primary key (produto_estoque_id, estoque_produto_id),
	constraint fk_produto_estoque_id foreign key (produto_estoque_id) references estoques(estoque_id)
    on update cascade on delete cascade,
    constraint fk_estoque_produto_id foreign key (estoque_produto_id) references produtos(produto_id)
    on update cascade on delete cascade,
    quantidade int not null,
    und_med enum('MT', 'UN', 'KG', 'CM', 'ML', 'DZ', 'FD'),
    status_estoque enum('Dísponivel', 'Esgotado')
);
