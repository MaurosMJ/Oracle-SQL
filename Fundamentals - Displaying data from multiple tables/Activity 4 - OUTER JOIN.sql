--@Author: MaurosMJ

/*
LEFT OUTER JOIN
Nesse exemplo o DEPARTMENT_ID de Departments também trará valores NULL
Nesse exemplo trará os empregados (employees) que podem não ter correspondente na tabela direta (departments).
Em um JOIN normal isso não traria valores NULL
OUTER é opcional
*/

SELECT
    e.first_name,
    e.last_name,
    e.salary,
    e.department_id AS "Department_id_emp",
    d.department_id AS "Department_id_dep",
    d.department_name
FROM
    employees   e
    LEFT OUTER JOIN departments d ON ( e.department_id = d.department_id );
    

/*
LEFT OUTER JOIN
Nesse exemplo o DEPARTMENT_ID de Employees também trará valores NULL
Nesse exemplo trará os empregados (employees) que podem não ter correspondente na tabela esquerda (empregados).
Em um JOIN normal isso não traria valores NULL
*/

SELECT
    e.first_name,
    e.last_name,
    e.salary,
    e.department_id AS "Department_id_emp",
    d.department_id AS "Department_id_dep",
    d.department_name
FROM
    employees   e
    RIGHT OUTER JOIN departments d ON ( d.department_id = e.department_id );
    

/*
FULL OUTER JOIN
Trará registros não correpondentes de department_id do lado esquerdo e também direito
Em um JOIN normal isso não traria valores NULL
*/

SELECT
    e.first_name,
    e.last_name,
    e.salary,
    e.department_id AS "Department_id_emp",
    d.department_id AS "Department_id_dep",
    d.department_name
FROM
    employees   e
    FULL OUTER JOIN departments d ON ( d.department_id = e.department_id );