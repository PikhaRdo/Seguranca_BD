-- cria db
create DATABASE fatec;
-- seleciona ela para uso
use fatec;


-- cria a tabela produtos 
create table produtos(
    codigo smallint UNSIGNED not NULL, 
    nome varchar(100) not NULL, 
    preco decimal(5,2) UNSIGNED not NULL,
    quantidade TINYINT not NULL,
    validade DATE,
    primary key (codigo), 
    unique KEY(nome)
    );
-- comando para descrever a tabela
desc produtos;