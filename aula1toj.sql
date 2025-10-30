-- Active: 1759415276047@@127.0.0.1@3306@mysql
-- criação do bd loja e tabelas cliente e pedidos com check
create database if NOT EXISTS loja;
use loja;

create table clientes (
    id int AUTO_INCREMENT not null primary key,
    nome varchar(100) not null,
    email varchar(150) unique not null,
    idade int check (idade >= 18),
    data_cadastro TIMESTAMP default CURRENT_TIMESTAMP
);


create table pedidos (
    id int AUTO_INCREMENT PRIMARY key,
    cliente_id int not null,
    valor decimal (10,2) check (valor > 0),
    status ENUM ('pendente', 'pago', 'cancelado') default 'pendente',
    data_pedido timestamp default CURRENT_TIMESTAMP,
    foreign KEY (cliente_id) REFERENCES clientes(id)
);

-- Testando commit 
use loja;
-- start TRANSACTION;
-- insert into clientes (nome,email,idade)
values ('carlos', 'carlos@gmail.com', 18);

-- insert into pedidos (cliente_id, valor, status)
values (LAST_INSERT_ID(), 500.00, 'pendente');


select * from clientes;
select * from pedidos;

-- commit; 




-- Testando rollback 
start transaction;
use loja;
select * from clientes;
select * from pedidos;
insert into clientes (nome,idade,email)
values ('arthur', 18, 'arthur@gmail.com' );

insert into pedidos(cliente_id,valor,status)
values(LAST_INSERT_ID(), 10, 'pendente');

rollback;
