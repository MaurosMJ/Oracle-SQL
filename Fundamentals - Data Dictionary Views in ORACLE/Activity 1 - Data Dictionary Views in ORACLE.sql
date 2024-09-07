--@Author: MaurosMJ

-- Visões do dicionário de dados ORACLE

-- Dicionário que contem todas as visões do ORACLE
SELECT *
FROM dictionary
ORDER BY table_name;

-- Consultando apenas uma VIEW
SELECT *
FROM dictionary
WHERE table_name = 'USER_TABLES'
ORDER BY table_name;

-- Consultando apenas uma VIEW com o sinonimo publico DICT
SELECT *
FROM   dict
WHERE  table_name LIKE '%TABLES%'
ORDER BY table_name;

-- Consultando a VIEW que traz informações dos objetos do banco de dados
SELECT *
FROM   user_objects;

-- Consultando a VIEW que traz informações de todas as tabelas do banco de dados
SELECT *
FROM   user_tables;

-- Consultando a VIEW que traz todas as informações de todas as SEQUENCES do banco de dados
SELECT *
FROM   user_sequences;

-- Consultando a VIEW que traz todas as informações de todas as VIEWS do banco de dados
SELECT *
FROM   user_views;

-- Conectar como usuário sys (DBA Only)

-- Consultando a VIEW que traz todas as informações de todos usuários do banco de dados
SELECT *
FROM   dba_users;

-- Consultando a VIEW que traz todas as informações de todas tablespaces do banco de dados
SELECT *
FROM   dba_tablespaces;

-- Consultando a VIEW que traz todas as informações de todos os DBFs
SELECT * 
FROM   dba_data_files;

-- Consultando a VIEW que traz todas as informações sobre arquivos temporários
SELECT * 
FROM   dba_temp_files;