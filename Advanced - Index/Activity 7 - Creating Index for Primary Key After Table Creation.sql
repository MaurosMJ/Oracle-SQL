--@Author: MaurosMJ

-- Criando uma tabela e depois uma Constraint (PK) + Indice
CREATE TABLE projects (
    project_id    NUMBER(6) NOT NULL,
    project_code  VARCHAR2(10) NOT NULL,
    project_name  VARCHAR2(100) NOT NULL,
    creation_date DATE DEFAULT sysdate NOT NULL,
    start_date    DATE,
    end_date      DATE,
    status        VARCHAR2(20) NOT NULL,
    priority      VARCHAR2(10) NOT NULL,
    budget        NUMBER(11, 2) NOT NULL,
    description   VARCHAR2(400) NOT NULL
);
 
/*
Adicionando uma CONSTRAINT
Ao Criar uma CONSTRAINT do TIPO PK ou UK o ORACLE AUTOMATICAMENTE CRIA o INDICE
*/
ALTER TABLE projects ADD CONSTRAINT projects_project_id_pk PRIMARY KEY ( project_id );

/*
 Ao eliminar a constraint o indice também é eliminado
*/
ALTER TABLE projects DROP CONSTRAINT projects_project_id_pk;

/*
 Criando uma Constraint com propriedades especificas
*/
CREATE INDEX project_id_idx ON
    projects (
        project_id
    )
        TABLESPACE users;


ALTER TABLE projects
    ADD CONSTRAINT projects_project_id_pk PRIMARY KEY ( project_id )
        USING INDEX project_id_idx;