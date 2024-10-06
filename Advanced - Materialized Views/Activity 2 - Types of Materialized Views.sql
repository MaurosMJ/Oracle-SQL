--@Author: MaurosMJ

-- Criando o Materialized View Log para registrar alterações na tabela
-- Oracle utiliza o Refresh Fast somente das mudanças
CREATE MATERIALIZED VIEW LOG ON employees;

-- Criando a Materialized View
CREATE MATERIALIZED VIEW mv_department_salaries
    BUILD IMMEDIATE
    REFRESH
        COMPLETE
ENABLE QUERY REWRITE AS
    SELECT
        e.department_id,
        SUM(e.salary) sum_salary,
        round(AVG(nvl(e.salary, 0)),
              2)      avg_salary
    FROM
        employees e
    GROUP BY
        e.department_id;

--Consultando a Materialized view   
SELECT
    *
FROM
    mv_department_salaries;

-- Exemplo de Materialized view contendo somente JOINs
CREATE MATERIALIZED VIEW mv_employees_jobs_departments
    BUILD IMMEDIATE
    REFRESH
        COMPLETE
ENABLE QUERY REWRITE AS
    SELECT
        e.employee_id,
        e.first_name,
        e.last_name,
        e.salary,
        e.commission_pct,
        e.job_id,
        j.job_title,
        e.department_id,
        d.department_name
    FROM
             employees e
        JOIN jobs        j ON ( e.job_id = j.job_id )
        JOIN departments d ON ( e.department_id = d.department_id );
        
--Consultando a Materialized view
SELECT
    *
FROM
    mv_employees_jobs_departments;

-- Criando uma NESTED MATERIALIZED VIEW (Uma materialized view que faz referencia a outra Materialized view)
CREATE MATERIALIZED VIEW mv_department_cust_hour
    BUILD IMMEDIATE
    REFRESH
        COMPLETE
ENABLE QUERY REWRITE AS
    SELECT
        mv.department_name,
        SUM(mv.salary) sum_salary,
        round(SUM(mv.salary) / 160,
              2)       cust_hour
    FROM
        mv_employees_jobs_departments mv
    GROUP BY
        mv.department_name;
        
-- Consultando a Nested Materialized View
SELECT
    *
FROM
    mv_department_cust_hour;