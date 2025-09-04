create database biblioteca;
use biblioteca;
-- tabela editora
create table editora(
    id SMALLINT UNSIGNED not null primary KEY,
    nome varchar(100) unique key not null,
    cidade varchar(50));

desc editora;

-- tabela de autores
create table autor(
    id MEDIUMINT unsigned not null PRIMARY KEY,
    nome VARCHAR(100) not null,
    data_nascimento DATE
);
desc autor;

-- tabela de categoria

create table categoria(
    id TINYINT unsigned not null primary key,
    descricao varchar(50) not NULL UNIQUE KEY
);

desc categoria;


-- tabela de livros

create table livro(
    id INT UNSIGNED not null primary key,
    titulo VARCHAR(150) not null,
    ano_publicacao YEAR not null,
    id_editora SMALLINT UNSIGNED not null,
    FOREIGN KEY(id_editora) REFERENCES editora(id)

);
desc livro;


-- Tabela livro_autor

create table livro_autor(
    id_livro int UNSIGNED not NULL ,
    id_autor MEDIUMINT UNSIGNED not null ,
    PRIMARY KEY (id_livro, id_autor),
    FOREIGN KEY(id_livro) REFERENCES livro(id),
    FOREIGN KEY(id_autor) REFERENCES autor(id)
);
desc livro_autor;


-- tabela livro_categoria

create table livro_categoria(
    id_livro int UNSIGNED not null,
    id_categoria TINYINT UNSIGNED not null,
    PRIMARY KEY(id_livro, id_categoria),
    FOREIGN KEY(id_livro) REFERENCES livro(id),
    FOREIGN KEY(id_categoria) REFERENCES categoria(id)
);

desc livro_categoria;

-- tabela usuario

CREATE table usuario(
    id MEDIUMINT UNSIGNED not null PRIMARY KEY,
    nome VARCHAR(100) not null,
    email VARCHAR(100) not null UNIQUE KEY,
    data_cadastro date not null
);
desc usuario;


-- tabela de emprestimo
create table emprestimo(
    id int UNSIGNED not null PRIMARY KEY,
    id_usuario MEDIUMINT UNSIGNED not null,
    data_emprestimo date not null,
    data_devolucao_prevista date not null,
    data_devolucao_real date not NULL,
    FOREIGN KEY(id_usuario) REFERENCES usuario(id)

);
desc emprestimo;

-- tabela item_emprestimo

create table item_emprestimo(
    id_emprestimo int UNSIGNED not null,
    id_livro int UNSIGNED not null,
    data_devolucao date not null,
    PRIMARY KEY (id_emprestimo, id_livro),
    FOREIGN KEY(id_emprestimo) REFERENCES emprestimo(id),
    FOREIGN KEY(id_livro) REFERENCES livro(id)
);
desc item_emprestimo;