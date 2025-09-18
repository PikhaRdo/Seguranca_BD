create DATABASE petshop;
USE petshop;

--tabela animais
create table animais(
    codigo int UNSIGNED not NULL AUTO_INCREMENT primary KEY,
    nome VARCHAR(100) not null);
desc animais;

--tabela veterinarios
create table veterinarios(
    codigo int UNSIGNED not NULL AUTO_INCREMENT primary KEY,
    cpf varchar(14),
    nome VARCHAR(100) not null);
desc veterinarios;

--tabela consultas;
create table consultas(
    codigo int UNSIGNED not NULL AUTO_INCREMENT primary KEY,
    horario DATETIME not null,
    codigo_animal int UNSIGNED not null,
    codigo_veterinario int UNSIGNED not null,
    Foreign Key (codigo_animal) REFERENCES animais(codigo),
    Foreign Key (codigo_veterinario) REFERENCES veterinarios(codigo));

desc consultas;

--criação dos usuarios;

create USER ana@localhost IDENTIFIED  by '12345678';
create user bruno@localhost IDENTIFIED by '12345678';
create user paulo@localhost IDENTIFIED by '12345678';

--atribuições de permissões;
/* grant all PRIVILEGES on petshop to paulo@localhost with grant option;

--permissões bruno
grant insert,update,select on petshop.animais to bruno@localhost;
grant insert,update,select on petshop.veterinarios to bruno@localhost;
grant insert,select on petshop.consultas to bruno@localhost;

--permissões Ana
grant insert,update,select on petshop.animais to ana@localhost;
grant insert,update,select on petshop.veterinarios to ana@localhost;
grant insert,select on petshop.consultas to ana@localhost; */


