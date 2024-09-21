--@Author: MaurosMJ

DELETE FROM employees
WHERE
    employee_id >= 207;

COMMIT;

-- Criando uma tabela para testes
CREATE TABLE salary_history
    AS
        SELECT
            employee_id,
            EXTRACT(YEAR FROM hire_date)  year,
            EXTRACT(MONTH FROM hire_date) month,
            salary,
            commission_pct
        FROM
            employees
        WHERE
            hire_date <= sysdate - 365;

CREATE TABLE employees_history
    AS
        SELECT
            employee_id,
            first_name,
            last_name,
            hire_date
        FROM
            employees
        WHERE
            hire_date <= sysdate - 365;

/*
 Inserindo em multiplas tabelas informações obtidas de um único SELECT
 Nesse caso a vantagem é que a leitura da tabela é feita apenas uma vez para realizar o INSERT em várias tabelas
 Menos -50% de IO
*/
INSERT ALL INTO employees_history VALUES (
    employee_id,
    first_name,
    last_name,
    hire_date
) INTO salary_history VALUES (
    employee_id,
    EXTRACT(YEAR FROM hire_date),
    EXTRACT(MONTH FROM hire_date),
    salary,
    commission_pct
) SELECT
        *
    FROM
        employees
  WHERE
      hire_date > sysdate - ( 365 );