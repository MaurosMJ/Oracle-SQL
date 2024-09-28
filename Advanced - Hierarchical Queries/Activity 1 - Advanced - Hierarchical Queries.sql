--@Author: MaurosMJ
/*
 Start with: Começa a leitura pelos empregados sem gerente
 Connect by Prior: (Pai para o filho) Top Down (Se PRIOR seguido de PK)
 Connect by Prior: (Filho para Pai) bottom UP (Se PRIOR seguido de FK)
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