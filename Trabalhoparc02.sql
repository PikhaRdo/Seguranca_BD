
-- Criação da tabela clientes

use fatec;

create table clientes(
    id TINYINT UNSIGNED not null primary key ,
    nome varchar (100) not null,
    email VARCHAR(200) not null,
    data_nascimento DATE not null,
    UNIQUE KEY (email)
);

desc clientes;


-- Criação da tabela Funcionários

use fatec;
DROP Table funcionarios

create Table funcionarios(
    matricula MEDIUMINT UNSIGNED not null PRIMARY KEY,
    nome varchar(100) not null,
    cpf CHAR(14) not null,
    salario DECIMAL(6,2) UNSIGNED not null , -- suponha-se que o salario é até 9999,99
    UNIQUE KEY(cpf)

);
desc funcionarios


-- Criação da tabelas de livros

use fatec;

CREATE Table livros(
    isbn VARCHAR(500) not null primary key,
    titulo varchar(100) not null,
    autor VARCHAR(100) not null,
    ano_publicacao YEAR not null);

desc livros;


-- Criação da tabela veículos

use fatec;

create table veiculos(
    placa char(7) not null PRIMARY KEY,
    modelo varchar(200) not null,
    cor varchar(50) not null,
    renavam char(11) unique key not null);

desc veiculos

-- Criação da tabela cursos

use fatec;

create table cursos(
    codigo TINYINT UNSIGNED not null PRIMARY KEY,
    nome_curso varchar(100) UNIQUE not null,
    carga_horaria TINYINT UNSIGNED not null);

desc cursos