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