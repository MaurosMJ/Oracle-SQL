--@Author: MaurosMJ

/*
REGRAS DE DELEÇÃO

NO ACTION (DEFAULT)
ON DELETE CASCADE: 
    Deleta as linhas dependentes na tabela filha quando uma linha
    na tabela pai (mãe) é deletada.
ON DELETE SET NULL
    Converte os valores das linhas dependentes da Foreign Key para
    nulo (NULL).
*/


-- Quando não específicado a regra de deleção, assume o padrão (NO ACTION)
-- Mais comum
CREATE TABLE teams (
    project_id  NUMBER(6) NOT NULL,
    employee_id NUMBER(6) NOT NULL,
    CONSTRAINT teams_project_id_fk FOREIGN KEY ( project_id )
        REFERENCES projects ( project_id ),
    CONSTRAINT teams_employee_id_fk FOREIGN KEY ( employee_id )
        REFERENCES employees ( employee_id )
);

-- Se tentar deletar uma dessas tabelas vai ocorrer erro.
drop table projects;
drop table employees;

-- Específicando Regra de deleção -- ON DELETE CASCADE
CREATE TABLE teams (
    project_id  NUMBER(6) NOT NULL,
    employee_id NUMBER(6) NOT NULL,
    CONSTRAINT teams_project_id_fk FOREIGN KEY ( project_id )
        REFERENCES projects ( project_id ) ON DELETE CASCADE,
    CONSTRAINT teams_employee_id_fk FOREIGN KEY ( employee_id )
        REFERENCES employees ( employee_id ) ON DELETE CASCADE
);

-- Se tentar deletar uma dessas tabelas, vai deletar e todas as linhas de referencia em cascata
-- Sem questionar
drop table projects;
drop table employees;

-- Específicando Regra de deleção -- ON DELETE SET NULL (Pouco utilizado)
CREATE TABLE teams (
    project_id  NUMBER(6) NOT NULL,
    employee_id NUMBER(6) NOT NULL,
    CONSTRAINT teams_project_id_fk FOREIGN KEY ( project_id )
        REFERENCES projects ( project_id ) ON DELETE CASCADE,
    CONSTRAINT teams_employee_id_fk FOREIGN KEY ( employee_id )
        REFERENCES employees ( employee_id ) ON DELETE CASCADE
);

-- Se tentar deletar uma dessas tabelas, vai adicionar NULL em todas as linhas de referencia
drop table projects;
drop table employees;
