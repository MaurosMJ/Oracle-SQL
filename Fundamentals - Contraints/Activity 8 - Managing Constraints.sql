--@Author: MaurosMJ

-- Gerenciando Constraints

-- Removendo uma Constraint de uma tabela
ALTER TABLE projects DROP CONSTRAINT projects_department_id_fk;

/*
 Removendo uma Constraint de uma tabela
 Quando existe FK que referenciam essa PK
 Remove as FK em cascata
*/
ALTER TABLE projects DROP CONSTRAINT projects_project_id_pk CASCADE;

-- Adicionando constraints a uma tabela
ALTER TABLE projects ADD CONSTRAINT projects_project_id_pk PRIMARY KEY ( project_id );

ALTER TABLE projects
    ADD CONSTRAINT projects_department_id_fk FOREIGN KEY ( department_id )
        REFERENCES departments ( department_id );
        
-- Desabilitando uma Constraint
ALTER TABLE projects DISABLE CONSTRAINT projects_project_id_pk;

-- Desabilitando uma Constraint em cascata
ALTER TABLE projects DISABLE CONSTRAINT projects_department_id_fk CASCADE;

-- Habilitando uma Constraint
ALTER TABLE projects ENABLE CONSTRAINT projects_project_id_pk;

-- Habilitando uma Constraint em cascata
ALTER TABLE projects ENABLE CONSTRAINT projects_department_id_fk;