--@Author: MaurosMJ

/*
Comandos DDL - Tabelas
*/

CREATE TABLE project (
    project_id    NUMBER(6) NOT NULL,
    project_code  VARCHAR2(10) NOT NULL,
    project_name  VARCHAR2(100) NOT NULL,
    creation_date DATE DEFAULT sysdate NOT NULL,
    start_date    DATE,
    end_date      DATE,
    status        VARCHAR2(20) NOT NULL,
    priority      VARCHAR(10) NOT NULL,
    budget        NUMBER(11, 2) NOT NULL,
    description   VARCHAR2(400) NOT NULL
);

--tabela criada
desc project;

--tabela com associações
CREATE TABLE teams (
    project_id  NUMBER(6),
    employee_id NUMBER(6)
);

--Fazendo um select com o ROWID
--É o acesso mais rápido possível no ORACLE
select * from employees where rowid = 'AAAR1xAAHAAAAGlAAA';