--@Author: MaurosMJ

-- VIEWS
--Criando uma VIEW SIMPLES
CREATE OR REPLACE VIEW v_employee_dept_60 AS
    SELECT
        employee_id,
        first_name,
        last_name,
        department_id,
        salary
    FROM
        employees
    WHERE
        department_id = 60;

--Recuperando dados da VIEW
SELECT
    *
FROM
    v_employee_dept_60;

SELECT
    *
FROM
    departments;
    
-- Criando uma VIEW COMPLEXA
CREATE OR REPLACE VIEW vdepartments_total ( "ID do departmento",
"Nome do departamento",
"Salario Minimo",
"Salario Maximo" ) AS
    SELECT
        d.department_id,
        d.department_name,
        MIN(e.salary),
        MAX(e.salary)
    FROM
             departments d
        JOIN employees e ON ( d.department_id = e.department_id )
    GROUP BY
        d.department_id,
        d.department_name
    ORDER BY
        1;

SELECT
    *
FROM
    vdepartments_total;
    
-- Utilizando a cláusula CHECK OPTION
CREATE OR REPLACE VIEW v_employeedept100 AS
    SELECT
        employee_id,
        first_name,
        last_name,
        department_id,
        salary
    FROM
        employees
    WHERE
        department_id = 100
WITH CHECK OPTION CONSTRAINT vemployeedept100_ck;

SELECT
    *
FROM
    v_employeedept100;

/*
 Criando uma VIEW utilizando a cláusula READ ONLY
 Nao permite operacao DML
*/
CREATE OR REPLACE VIEW v_employeedept20 AS
    SELECT
        employee_id,
        first_name,
        last_name,
        department_id,
        salary
    FROM
        employees
    WHERE
        department_id = 20;

SELECT
    *
FROM
    v_employeedept20;
    
/*
Removendo uma VIEW
    Não ocorre nada com as tabelas referenciadas
*/
DROP VIEW v_employeedept20;