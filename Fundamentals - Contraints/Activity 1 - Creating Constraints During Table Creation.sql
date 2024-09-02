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


--Constraint NOT NULL:
CREATE TABLE projects (
    project_id    NUMBER(6) NOT NULL,
    project_code  VARCHAR2(10) NOT NULL,
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

--Constraint PRIMARY KEY (PK):
--<nome_coluna> <tipo_dado> Constraint <nome_tabela>_<nome_coluna>_pk PRIMARY KEY
CREATE TABLE projects (
    project_id    NUMBER(6) NOT NULL
        CONSTRAINT projects_project_id_pk PRIMARY KEY,
    project_code  VARCHAR2(10) NOT NULL,
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

--Constraint PRIMARY KEY (PK) a nível de tabela
--Constraint <nome_tabela>_<nome_coluna>_pk PRIMARY KEY <nome_coluna>
CREATE TABLE projects (
    project_id    NUMBER(6) NOT NULL,
    project_code  VARCHAR2(10) NOT NULL,
    project_name  VARCHAR2(100) NOT NULL,
    department_id NUMBER(6) NOT NULL,
    creation_date DATE DEFAULT sysdate NOT NULL,
    start_date    DATE,
    end_date      DATE,
    status        VARCHAR2(20) NOT NULL,
    priority      VARCHAR2(10) NOT NULL,
    budget        NUMBER(11, 8) NOT NULL,
    description   VARCHAR2(400) NOT NULL,
    CONSTRAINT projects_project_id_pk PRIMARY KEY ( project_id )
);

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

--Constraint FOREIGN KEY (FK):
--<nome_coluna> <tipo_dado> Constraint <nome_tabela>_<nome_coluna>_fk references <tabela> (<coluna_id>)
CREATE TABLE projects (
    project_id    NUMBER(6) NOT NULL
        CONSTRAINT projects_project_id_pk PRIMARY KEY,
    project_code  VARCHAR2(10) NOT NULL
        CONSTRAINT projects_project_code_uk UNIQUE,
    project_name  VARCHAR2(100) NOT NULL,
    department_id NUMBER(6) NOT NULL
    constraint projects_department_id_fk references departments (department_id),
    creation_date DATE DEFAULT sysdate NOT NULL,
    start_date    DATE,
    end_date      DATE,
    status        VARCHAR2(20) NOT NULL,
    priority      VARCHAR2(10) NOT NULL,
    budget        NUMBER(11, 8) NOT NULL,
    description   VARCHAR2(400) NOT NULL
);

--Constraint FOREIGN KEY (FK) a nível de tabela:
--Constraint <nome_tabela>_<nome_coluna>_fk FOREIGN KEY (<coluna_tabela_atual>) references <tabela_destino> (<coluna_tabela_destino>)
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
    description   VARCHAR2(400) NOT NULL,
    CONSTRAINT projects_department_id_fk FOREIGN KEY ( department_id )
        REFERENCES departments ( department_id )
);

drop table projects;