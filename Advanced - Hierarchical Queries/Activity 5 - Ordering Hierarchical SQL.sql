--@Author: MaurosMJ

/*
    Utilizando ORDER SIBLINGS BY:
    Agora para cada nível será ordernado a coluna informada nessa cláusula
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
    PRIOR employee_id = manager_id
ORDER SIBLINGS BY
    last_name;