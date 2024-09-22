--@Author: MaurosMJ

-- Criando uma tabela de teste
CREATE TABLE employees_copy
    AS
        SELECT
            *
        FROM
            employees
        WHERE
            1 = 2;
            
/*
    Fazendo um MERGE
    Essa instrução vai atualizar informações da tabela destino (employees_copy)
    Caso exista o ID atualiza a linha na tabela destino
    Caso não exista o ID, insere a linha na tabela destino
*/

MERGE INTO employees_copy c
USING employees e ON ( c.employee_id = e.employee_id )
WHEN MATCHED THEN UPDATE
SET c.first_name = e.first_name,
    c.last_name = e.last_name,
    c.email = e.email,
    c.phone_number = e.phone_number,
    c.hire_date = e.hire_date,
    c.job_id = e.job_id,
    c.salary = e.salary,
    c.commission_pct = e.commission_pct,
    c.manager_id = e.manager_id,
    c.department_id = e.department_id DELETE
WHERE
                   department_id IS NULL
WHEN NOT MATCHED THEN
INSERT
VALUES
    ( e.employee_id,
      e.first_name,
      e.last_name,
      e.email,
      e.phone_number,
      e.hire_date,
      e.job_id,
      e.salary,
      e.commission_pct,
      e.manager_id,
      e.department_id );

COMMIT;


-- Atualizando abaixo informações de um usuário

UPDATE employees
SET
    salary = 90000
WHERE
    employee_id = 109;

-- Ao rodar o MERGE novamente, a alteração anterior será feita na tabela destino
MERGE INTO employees_copy c
USING employees e ON ( c.employee_id = e.employee_id )
WHEN MATCHED THEN UPDATE
SET c.first_name = e.first_name,
    c.last_name = e.last_name,
    c.email = e.email,
    c.phone_number = e.phone_number,
    c.hire_date = e.hire_date,
    c.job_id = e.job_id,
    c.salary = e.salary,
    c.commission_pct = e.commission_pct,
    c.manager_id = e.manager_id,
    c.department_id = e.department_id DELETE
WHERE
                   department_id IS NULL
WHEN NOT MATCHED THEN
INSERT
VALUES
    ( e.employee_id,
      e.first_name,
      e.last_name,
      e.email,
      e.phone_number,
      e.hire_date,
      e.job_id,
      e.salary,
      e.commission_pct,
      e.manager_id,
      e.department_id );

COMMIT;