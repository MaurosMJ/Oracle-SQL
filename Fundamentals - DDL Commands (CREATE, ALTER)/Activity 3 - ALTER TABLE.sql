--@Author: MaurosMJ

-- Adicionando colunas em uma tabela
ALTER TABLE project ADD (
    department_id NUMBER(3) NOT NULL
);

-- Removendo uma coluna de uma tabela
ALTER TABLE project DROP COLUMN department_id;

-- Modificando uma coluna existente
ALTER TABLE project MODIFY (
    department_id VARCHAR2(2)
);

-- Renomeando uma coluna de uma tabela
ALTER TABLE project RENAME COLUMN project_name TO prj_name;

/*
Transformando tabela em READ ONLY
Instruções INSERT, DELETE e UPDATE não serão mais permitidos
Instruções DDL não serão mais permitidos
*/

ALTER TABLE project read only;

/*
Transformando tabela em READ WRITE
Instruções INSERT, DELETE e UPDATE serão permitidas
Instruções DDL também serão permitidas
*/

ALTER TABLE project read write;