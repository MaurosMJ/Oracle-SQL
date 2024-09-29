--@Author: MaurosMJ

/*
    Eliminando linhas com a clausula WHERE
    Mesmo usando WHERE Não elimina os registros filhos (Nivel menor)
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
WHERE
    employee_id <> 205
START WITH
    manager_id IS NULL
CONNECT BY
    PRIOR employee_id = manager_id;

/*
    Eliminando registros uma condição e seus registros filhos
    A condição deve ser adicionada na cláusula CONNECT BY
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
    PRIOR employee_id = manager_id and employee_id <> 205;