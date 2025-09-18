create DATABASE if NOT EXISTS petshop;
USE petshop;

-- tabela animais
create table if NOT EXISTS animais(
    codigo int UNSIGNED not NULL AUTO_INCREMENT primary KEY,
    nome VARCHAR(100) not null);
desc animais;

-- tabela veterinarios
create table if NOT EXISTS veterinarios(
    codigo int UNSIGNED not NULL AUTO_INCREMENT primary KEY,
    cpf varchar(14),
    nome VARCHAR(100) not null);
desc veterinarios;

-- tabela consultas;
create table if NOT EXISTS consultas(
    codigo int UNSIGNED not NULL AUTO_INCREMENT primary KEY,
    horario DATETIME not null,
    codigo_animal int UNSIGNED not null,
    codigo_veterinario int UNSIGNED not null,
    Foreign Key (codigo_animal) REFERENCES animais(codigo),
    Foreign Key (codigo_veterinario) REFERENCES veterinarios(codigo));

desc consultas;

-- criação dos usuarios
create USER if NOT EXISTS ana@localhost IDENTIFIED  by '12345678';
create user if NOT EXISTS bruno@localhost IDENTIFIED by '12345678';
create user if NOT EXISTS paulo@localhost IDENTIFIED by '12345678';

-- criação das roles
create role if NOT EXISTS role_admin_petshop;
create role if NOT EXISTS role_funcionario_petshop;
create role if NOT EXISTS role_consultas_petshop;

-- Criação das roles e permissionamento
-- Role admin
grant all
on petshop.*
to role_admin_petshop;

-- Role funcionario
grant insert,update,select on petshop.animais to role_funcionario_petshop;
grant insert,update,select on petshop.veterinarios to role_funcionario_petshop;

-- role consultas
grant insert,select on petshop.consultas to role_consultas_petshop;

-- atribuição das roles
grant role_admin_petshop
to paulo@localhost;
/* revoke role_funcionario_petshop from paulo@localhost; */
grant role_funcionario_petshop
to bruno@localhost;
grant role_consultas_petshop
to bruno@localhost;

grant role_funcionario_petshop
to ana@localhost;
grant role_consultas_petshop
to ana@localhost;
