-- Apaga o banco de dados
drop database if exists fatec;

-- Cria um banco de dados
create database fatec;
show DATABASES;

-- Seleciona a base de dados
use fatec;

-- Cria uma tabela
create table categorias (
    codigo tinyint unsigned not null,
    nome varchar (100) not null,
    primary key (codigo),
    unique key (nome)
);
show tables;
-- Remove um usuário
drop user if exists sergio@localhost;
drop user if exists patricia@'%';

-- Criação de usuarios
create user sergio@localhost
identified by 'Senha@123';

create user patricia@'%'
identified by 'Fatec#456';

-- criação dos grupos
drop role if EXISTS administrador;

drop role if EXISTS usuario;

create role administrador;
create role usuario;
-- visualizar os grupos
select user,host from mysql.user;

-- visualizar as permissões de grupo
show grants for administrador;
show grants for usuario;

-- permissoes para as roles
grant ALL
on *.*
to administrador;

grant insert,select, update 
on fatec.* 
to usuario;

-- Adicionar usuario em uma role
grant administrador , usuario
to sergio@localhost;

grant usuario
to patricia@'%';

-- exibir avisos
show WARNINGS;

-- Visualizar grupos
show grants for sergio@localhost;
show grants for patricia@'%';

-- visualizar o grupo do usuario autenticado
-- select current_role();


-- selecionar uma role
-- set role administrador;