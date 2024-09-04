--@Author: MaurosMJ

-- Gerenciando Constraints

-- Desabilitando uma Constraint
ALTER TABLE projects DISABLE CONSTRAINT projects_project_id_pk;

-- Desabilitando uma Constraint em cascata
ALTER TABLE projects DISABLE CONSTRAINT projects_department_id_fk CASCADE;

-- Habilitando uma Constraint
ALTER TABLE projects ENABLE CONSTRAINT projects_project_id_pk;

-- Habilitando uma Constraint em cascata
ALTER TABLE projects ENABLE CONSTRAINT projects_department_id_fk;