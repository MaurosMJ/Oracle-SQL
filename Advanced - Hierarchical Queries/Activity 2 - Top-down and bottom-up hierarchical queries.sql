--@Author: MaurosMJ

/*
    Na consulta abaixo se inicia pelo ID = 103.
    Tipo UP to DOWN 
*/

SELECT
    level,
    employee_id,
    first_name,
    last_name,
    job_id,
    manager_id
FROM
    employees
START WITH
    employee_id = 103
CONNECT BY
    PRIOR employee_id = manager_id;

/*
    Na consulta abaixo se inicia pelo ID = 103.
    Bottom to UP
*/

SELECT
    level,
    employee_id,
    first_name,
    last_name,
    job_id,
    manager_id
FROM
    employees
START WITH
    employee_id = 103
CONNECT BY
    PRIOR manager_id = employee_id;
    
/*
      Consulta Hierárquica sobre a Tabela employees UP to DOWN a partir do manager_id IS NULL
*/

SELECT
    level,
    employee_id,
    first_name,
    last_name,
    job_id,
    manager_id
FROM
    employees
START WITH
    manager_id IS NULL
CONNECT BY
    PRIOR employee_id = manager_id;
    
/*
    Consulta Hierárquica sobre a Tabela employees BOTTOM to UP a partir do manager_id IS NULL
*/
SELECT
    level,
    employee_id,
    first_name,
    last_name,
    job_id,
    manager_id
FROM
    employees
START WITH
    manager_id IS NULL
CONNECT BY
    employee_id = PRIOR manager_id;