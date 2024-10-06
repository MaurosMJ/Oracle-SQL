--@Author: MaurosMJ

-- Criando Materialized View Log
CREATE MATERIALIZED VIEW LOG ON employees;

-- Criando uma Fast Refreshed Materialized View 
CREATE MATERIALIZED VIEW mv_sales_manager
    BUILD IMMEDIATE
    REFRESH
            FAST
            ON COMMIT
AS
    SELECT
        *
    FROM
        employees
    WHERE
        job_id = 'SA_MAN'; 

--Consultando a Fast Refreshed Materialized View
SELECT
    *
FROM
    mv_sales_manager;

/*
 Execundo um comando DML sobre a Tabela base de uma Fast Refreshed Materialized View 
 Como a Materialized View está definido para 'Refresh fast on commit' então a tabela da view será atualizado apenas registros alterados
*/
INSERT INTO employees VALUES (
    500,
    'Alex',
    'Brown',
    'ABROWN',
    '11111111',
    sysdate,
    'SA_MAN',
    10000,
    NULL,
    102,
    60
);

COMMIT;

DELETE FROM employees
WHERE
    employee_id = 500;
COMMIT;

-- Criando Materialized View Log
CREATE MATERIALIZED VIEW LOG ON departments;

/*
 Forçando um erro na criação da MV (É uma MV complexa pois tem uma subconsulta)
 ORA-12054: não é possível definir o atributo de atualização ON COMMIT para a view materializada
 VM complexa (com subconsulta) não é possivel definir a atualização para ON COMMIT apenas por ON DEMAND
*/

CREATE MATERIALIZED VIEW mv_department_max_salaries
BUILD IMMEDIATE
REFRESH FAST ON COMMIT
ENABLE QUERY REWRITE
AS SELECT d.department_name, e.* 
   FROM employees e JOIN departments d ON (e.department_id = d.department_id)
   WHERE (e.department_id, salary) IN 
                                   (SELECT department_id, MAX(salary) salary
                                    FROM employees
                                    GROUP BY department_id)
   ORDER BY e.department_id, salary;

/*
 Corringindo o problema:
 REFRESH FAST Não é possível em consultas complexas (com subconsultas) apenas REFRESH COMPLETE
*/

CREATE MATERIALIZED VIEW mv_department_max_salaries
BUILD IMMEDIATE
REFRESH COMPLETE
ENABLE QUERY REWRITE
AS SELECT d.department_name, e.* 
   FROM employees e JOIN departments d ON (e.department_id = d.department_id)
   WHERE (e.department_id, salary) IN 
                                   (SELECT department_id, MAX(salary) salary
                                    FROM employees
                                    GROUP BY department_id)
   ORDER BY e.department_id, salary;

-- Consultando a tabela da Materialized view
select * from mv_department_max_salaries;