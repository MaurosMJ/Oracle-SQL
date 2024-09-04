--@Author: MaurosMJ

/*
Constraints:
-NOT NULL: 
    Não permite valores nulos em uma coluna.
-UNIQUE:
    Garante que as colunas da constraint sejam UNICAS
    Permite valores NULOS
    Oracle automáticamente cria um INDICE para as colunas que compõe a UK.
-PRIMARY KEY: 
    Garante que todas as colunas que compõe a PK são not null.
    PK é única.
    Oracle automáticamente cria um INDICE para as colunas que compõe a PK.
-FOREIGN KEY:
    Estabelece relação da tabela com outra tabela
    Garante integridade Referencial (deve existir na outra tabela um ID)
    NÃO é criado um indice automáticamente
    Pode referenciar a PK ou UK
-CHECK
*/

--Constraint UNIQUE (UK):
--<nome_coluna> <tipo_dado> Constraint <nome_tabela>_<nome_coluna>_uk UNIQUE
CREATE TABLE projects (
    project_id    NUMBER(6) NOT NULL
        CONSTRAINT projects_project_id_pk PRIMARY KEY,
    project_code  VARCHAR2(10) NOT NULL
        CONSTRAINT projects_project_code_uk UNIQUE,
    project_name  VARCHAR2(100) NOT NULL,
    department_id NUMBER(6) NOT NULL,
    creation_date DATE DEFAULT sysdate NOT NULL,
    start_date    DATE,
    end_date      DATE,
    status        VARCHAR2(20) NOT NULL,
    priority      VARCHAR2(10) NOT NULL,
    budget        NUMBER(11, 8) NOT NULL,
    description   VARCHAR2(400) NOT NULL
);