--@Author: MaurosMJ

-- Criando tabelas para testes
CREATE TABLE low_salaries
    AS
        SELECT
            employee_id,
            department_id,
            salary
        FROM
            employees
        WHERE
            1 = 2;

CREATE TABLE high_salaries
    AS
        SELECT
            employee_id,
            department_id,
            salary
        FROM
            employees
        WHERE
            1 = 2;

CREATE TABLE avg_salaries
    AS
        SELECT
            employee_id,
            department_id,
            salary
        FROM
            employees
        WHERE
            1 = 2;

-- Zerar informações das tabelas
TRUNCATE TABLE low_salaries;
TRUNCATE TABLE avg_salaries;
TRUNCATE TABLE high_salaries;

-- Utilizando o INSERT FIRST
-- Encontra a primeira condição que será satisfeita
INSERT
    FIRST WHEN nvl(salary, 0) < 5000 THEN
        INTO low_salaries
        VALUES (
            employee_id,
            department_id,
            nvl(salary, 0)
        )
        WHEN salary BETWEEN 5000 AND 10000 THEN
            INTO avg_salaries
            VALUES (
                employee_id,
                department_id,
                salary
            )
    ELSE
        INTO high_salaries
    VALUES (
        employee_id,
        department_id,
        salary
    )
SELECT
    *
FROM
    employees;

COMMIT;
