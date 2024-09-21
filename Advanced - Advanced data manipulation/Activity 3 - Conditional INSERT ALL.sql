--@Author: MaurosMJ


-- Criando tabelas para testes
CREATE TABLE it_programmers
    AS
        SELECT
            employee_id,
            first_name,
            last_name,
            hire_date
        FROM
            employees
        WHERE
                job_id = 'IT_PROG'
            AND hire_date <= sysdate - 365;

CREATE TABLE living_in_us
    AS
        SELECT
            employee_id,
            first_name,
            last_name,
            hire_date
        FROM
            employees
        WHERE
            ( hire_date <= sysdate - 365 )
            AND department_id IN (
                SELECT
                    department_id
                FROM
                    departments
                WHERE
                    location_id IN (
                        SELECT
                            location_id
                        FROM
                            locations
                        WHERE
                            country_id = 'US'
                    )
            );
            
-- Inserindo novos empregados
INSERT INTO employees VALUES (
    employee_seq.NEXTVAL,
    'Carl',
    'Palmer',
    'CPALMER',
    '515.123.8182',
    sysdate,
    'IT_PROG',
    15000,
    NULL,
    103,
    60
);

INSERT INTO employees VALUES (
    employee_seq.NEXTVAL,
    'Keith',
    'Richards',
    'KRICHARDS',
    '515.123.8182',
    sysdate,
    'IT_PROG',
    20000,
    NULL,
    103,
    60
);

COMMIT;

/*
 Fazendo um INSERT ALL com condição em multiplas tabelas
 Para cada linha retornada pelo SELECT ele avalia todas as cláusulas WHEN
*/
INSERT
    ALL WHEN hire_date > sysdate - 365 THEN
        INTO employees_history
        VALUES (
            employee_id,
            first_name,
            last_name,
            hire_date
        )
        INTO salary_history
    VALUES (
        employee_id,
        EXTRACT(YEAR FROM hire_date),
        EXTRACT(MONTH FROM hire_date),
        salary,
        commission_pct
    )
        WHEN ( hire_date > sysdate - 365 )
             AND ( job_id = 'IT_PROG' ) THEN
            INTO it_programmers
            VALUES (
                employee_id,
                first_name,
                last_name,
                hire_date
            )
        WHEN ( hire_date > sysdate - 365 )
             AND department_id IN (
            SELECT
                department_id
            FROM
                departments
            WHERE
                location_id IN (
                    SELECT
                        location_id
                    FROM
                        locations
                    WHERE
                        country_id = 'US'
                )
        ) THEN
            INTO living_in_us
            VALUES (
                employee_id,
                first_name,
                last_name,
                hire_date
            )
SELECT
    *
FROM
    employees
WHERE
    hire_date > sysdate - 365;