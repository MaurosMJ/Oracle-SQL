--@Author: MaurosMJ

-- Para o utilizar o FORCE MV é necessário o MV LOG
CREATE MATERIALIZED VIEW LOG ON employees;

-- Criando uma Force Refresh Materialized View

CREATE MATERIALIZED VIEW mv_it_programmers
BUILD IMMEDIATE 
REFRESH FORCE 
ON COMMIT
ENABLE QUERY REWRITE 
AS
  SELECT *
  FROM   employees
  WHERE  job_id = 'IT_PROG'
  ORDER BY department_id; 
  
-- Consultando uma Force Refreshed Materialized View 
SELECT *
FROM   mv_it_programmers;

-- Executando DML sobre a Tabela base de uma Force Refreshed Materialized View 
INSERT INTO employees VALUES (
    503,
    'Greg',
    'Lake',
    'glake',
    '33333333',
    sysdate,
    'IT_PROG',
    20000,
    NULL,
    103,
    60
);

COMMIT;

-- Consultando novamente uma Force Refreshed Materialized View após o DML
SELECT *
FROM   mv_it_programmers;

DELETE FROM employees
WHERE  employee_id=503;

commit;

-- Consultando novamente a Force Refreshed Materialized View após o DML
SELECT *
FROM   mv_it_programmers;