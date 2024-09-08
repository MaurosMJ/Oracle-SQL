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

-- Consultando a VIEW que traz informações de todas as colunas do banco de dados
SELECT *
FROM   USER_TAB_COLUMNS
ORDER BY column_id;

-- Consultando a VIEW que traz informações de todas as CONSTRAINTS do banco de dados
SELECT *
FROM   USER_CONSTRAINTS;

-- Consultando a VIEW que traz informações de todas as colunas de uma CONSTRAINT
SELECT *
FROM   USER_CONS_COLUMNS
ORDER BY position;

-- Consultando a VIEW que traz informações de todas os INDICES do banco de dados
SELECT *
FROM   USER_INDEXES;

-- Consultando a VIEW que traz informações de todas as colunas que compõe os INDICES do banco de dados
SELECT *
FROM   USER_IND_COLUMNS;


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

-- Consultando a VIEW que traz informações de todas as colunas do banco de dados
SELECT *
FROM   USER_TAB_COLUMNS
ORDER BY column_id;

-- Consultando a VIEW que traz informações de todas as CONSTRAINTS do banco de dados
SELECT *
FROM   USER_CONSTRAINTS;

-- Consultando a VIEW que traz informações de todas as colunas de uma CONSTRAINT
SELECT *
FROM   USER_CONS_COLUMNS
ORDER BY position;

-- Consultando a VIEW que traz informações de todas os INDICES do banco de dados
SELECT *
FROM   USER_INDEXES;

-- Consultando a VIEW que traz informações de todas as colunas que compõe os INDICES do banco de dados
SELECT *
FROM   USER_IND_COLUMNS;


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


-- Informações dinâmicas e performance em tempo real (Prefixo v$)
SELECT *
FROM   v$tablespace;

SELECT * 
FROM   v$datafile;

SELECT file#, name, bytes/1024/1024 MB, blocks, status
FROM   v$datafile;

SELECT * 
FROM v$tempfile;

SELECT file#, name, bytes/1024/1024 MB, blocks, status 
FROM   v$tempfile;

SELECT * 
FROM   v$controlfile;

SELECT * 
FROM   v$parameter;