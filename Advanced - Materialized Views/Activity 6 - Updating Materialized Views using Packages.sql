--@Author: MaurosMJ

-- Removendo Materialized View Log

-- Criando Materialized View Log
drop MATERIALIZED VIEW LOG ON employees;
create MATERIALIZED VIEW LOG ON employees;

-- Criando uma Force Refresh Materialized View
CREATE MATERIALIZED VIEW mv_it_programmers
BUILD IMMEDIATE 
REFRESH FORCE 
ENABLE QUERY REWRITE 
AS
  SELECT *
  FROM employees
  WHERE job_id = 'IT_PROG'
  ORDER BY department_id; 

-- Atualizando Visões Materializadas Manualmente Utilizando a Package DBMS_MVIEW.REFRESH
-- Consultando a Materialized View
SELECT *
FROM   mv_it_programmers;

-- Consultando a Tabela employees
SELECT *
FROM employees;

-- Executando DML sobre a Tabela base da Materialized View 

INSERT INTO employees
VALUES (222, 'Richard', 'Wright', 'RWRIGHT', '44444444', sysdate, 'IT_PROG',25000,null,103,60);
COMMIT;  

-- Consultando a Tabela employees
SELECT *
FROM employees
WHERE employee_id = 222;

-- Consultando a Materialized View  que estara desatualizada
SELECT *
FROM   mv_it_programmers;

-- Atualizando Visões utilizando a package DBMS_MVIEW
EXECUTE DBMS_MVIEW.REFRESH('mv_it_programmers', 'F')

-- Consultando a Materialized View
SELECT *
FROM   mv_it_programmers;

-- Atualizando Visões Materializadas utilizando a package DBMS_SNAPSHOT
-- Executando DML sobre a Tabela base da Materialized View 
INSERT INTO employees
VALUES (505, 'Billie', 'Holiday', 'BHOLIDAY', '55555555', sysdate, 'IT_PROG', 30000, null, 103, 60);

COMMIT;  

-- Consultando a Tabela employees
SELECT *
FROM employees
WHERE employee_id IN (504,505);

-- Consultando a Materialized View que estara desatualizada
SELECT *
FROM   mv_it_programmers;

-- Executando a procedure DBMS_SNAPSHOT.REFRESH
EXECUTE DBMS_SNAPSHOT.REFRESH('mv_it_programmers', 'C')

-- Consultando a Materialized View
SELECT *
FROM   mv_it_programmers;

-- Atualizando Visões Materializadas Manualmente Utilizando a procedure DBMS_MVIEW.REFRESH_ALL_MVIEWS
-- Consultando a Tabela employees
SELECT *
FROM employees;

-- Consultando a Materialized View
SELECT *
FROM   mv_it_programmers;

-- Executando DML sobre a Tabela base da Materialized View 
INSERT INTO employees
VALUES (506, 'Eddie', 'Vedder', 'EVEDDER', '77777777', sysdate, 'IT_PROG',35000,null,103,60);
COMMIT; 

-- Consultando a Tabela employees
SELECT *
FROM employees
WHERE employee_id IN (222, 505,506);

-- Consultando a Materialized View
SELECT *
FROM   mv_it_programmers;

--- Executando a procedure DBMS_MVIEW.REFRESH_ALL_MVIEWS
-- Atualiza todas as MV do banco de dados
DECLARE
  vfailures  NUMBER;
BEGIN        
  DBMS_MVIEW.REFRESH_ALL_MVIEWS(vfailures, 'C','', TRUE, FALSE, FALSE);
END;

-- Consultando a Materialized View
SELECT *
FROM   mv_it_programmers;