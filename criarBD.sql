--Cria BD
create DATABASE fatec;
--Seleciona a Database
use fatec;

--Criando tabelas

create table produtos(
    codigo smallint UNSIGNED not NULL PRIMARY KEY, 
    nome varchar(100) not NULL, 
    preco decimal(5,2) UNSIGNED not NULL,
    quantidade TINYINT not NULL,
    validade DATE,
    primary key (codigo), 
    unique KEY(nome)
    );
--exibe estrutura
desc produtos;