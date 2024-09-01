--@Author: MaurosMJ

/*
Utilizando a instrução INSERT
*/

INSERT INTO departments (
    department_id,
    department_name,
    manager_id,
    location_id
) VALUES (
    departments_seq.NEXTVAL,
    'Project Management',
    103,
    1400
);

-- Insert com valores nulos e explícito
INSERT INTO departments (
    department_id,
    department_name,
    manager_id,
    location_id
) VALUES (
    departments_seq.NEXTVAL,
    'Data Science',
    NULL,
    NULL
);


-- Insert com valores nulos e implicito
INSERT INTO departments (
    department_id,
    department_name
) VALUES (
    departments_seq.NEXTVAL,
    'Business Inteligence'
);


-- Insert utilizando funções (SYSDATE)
INSERT INTO employees (
    employee_id,
    first_name,
    last_name,
    email,
    phone_number,
    hire_date,
    job_id,
    salary,
    commission_pct,
    manager_id,
    department_id
) VALUES (
    employees_seq.NEXTVAL,
    'Rock',
    'Balboa',
    'DROCK',
    '525.342.237',
    sysdate,
    'IT_PROG',
    40000,
    NULL,
    103,
    60
);

DROP TABLE sales_reps;

CREATE TABLE sales_reps (
    rep_id         NUMBER(6),
    first_name     VARCHAR2(20),
    last_name      VARCHAR2(20),
    salary         NUMBER(8, 2),
    commission_pct NUMBER(2, 2)
);

-- Inserindo linhas através de uma SUB-CONSULTA
INSERT INTO sales_reps (
    rep_id,
    first_name,
    last_name,
    salary,
    commission_pct
)
    SELECT
        employee_id,
        first_name,
        last_name,
        salary,
        commission_pct
    FROM
        employees;

COMMIT;