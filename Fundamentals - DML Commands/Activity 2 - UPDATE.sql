--@Author: MaurosMJ

/*
Utilizando Instrução UPDATE (DML)
Atualizar linhas existentes
*/

-- Fazendo um UPDATE simples
UPDATE employees
SET
    salary = salary * 1.2
WHERE
    employee_id = 100;
    
-- Fazendo um UPDATE com sub-consultas
UPDATE employees
SET
    job_id = (
        SELECT
            job_id
        FROM
            employees
        WHERE
            employee_id = 141
    ),
    salary = (
        SELECT
            salary
        FROM
            employees
        WHERE
            employee_id = 141
    )
WHERE
    employee_id = 140;

COMMIT;