use fatec;
drop table categorias;
-- Cria a tabela categoria

create table categorias(
    codigo TINYINT UNSIGNED not null primary KEY,
    nome_cat varchar(100) not null UNIQUE KEY );

desc categorias;
drop table produto;

-- tabela produtos

create table produto(
    codigo SMALLINT UNSIGNED not null primary key,
    nome varchar(100) not null unique key,
    preco decimal (6,2) unsigned not null,
    quantidade TINYINT unsigned not null,
    data_de_validade DATE,
    categoria_codigo TINYINT UNSIGNED NOT NULL,
    FOREIGN KEY (categoria_codigo) REFERENCES categorias(codigo)
);

desc produto