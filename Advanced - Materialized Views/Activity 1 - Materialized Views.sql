--@Author: MaurosMJ

-- Conectado como SYS

GRANT
    CREATE MATERIALIZED VIEW
TO hr;

CREATE MATERIALIZED VIEW mv_department_max_salaries
    BUILD IMMEDIATE
    REFRESH
            COMPLETE
            ON DEMAND
ENABLE QUERY REWRITE AS
    SELECT
        department_id,
        MAX(salary)
    FROM
        employees
    GROUP BY
        department_id
    ORDER BY
        department_id,
        MAX(salary);
        
-- Consultando a materialized view
SELECT
    *
FROM
    mv_department_max_salaries;