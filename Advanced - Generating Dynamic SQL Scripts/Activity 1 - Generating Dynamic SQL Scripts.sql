--@Author: MaurosMJ

-- Utilizando usuário SYS

-- Criando um usuário
CREATE USER curso IDENTIFIED BY curso
    DEFAULT TABLESPACE users
    QUOTA UNLIMITED ON users
    TEMPORARY TABLESPACE temp;
    
-- Adicionando privilégios
GRANT connect, resource TO curso;

-- Conectado com o usuário CURSO

-- Criando tabelas para testes
CREATE TABLE alunos (
    aluno_id NUMBER(11),
    nome     VARCHAR2(200)
);

CREATE TABLE cursos (
    curso_id NUMBER(11),
    nome     VARCHAR2(200),
    preco    NUMBER(11, 2)
);

-- Consultando objetos do usuário
SELECT
    *
FROM
    user_objects;
    
-- Criando um script que remove (drop) todas as tabelas do usuário que está conectado (curso)

set heading off
spool C:\Oracle_files\sql_especialista\drop_tables.sql
select 'drop table ' || table_name || ' cascade constraints;'
from user_tables;
spool off

-- Executando o script
@C:\Oracle_files\sql_especialista\drop_tables.sql

