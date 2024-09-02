--@Author: MaurosMJ

/*
Utilizando o UNION
o UNION faz a junção de duas consulta e elimina as linhas duplicadas
Lista de colunas ou expressões em cada SELECT devem ser iguais
Retorno: 18 linhas
*/

SELECT
    employee_id,
    job_id,
    hire_date,
    salary
FROM
    employees
WHERE
    department_id IN ( 60, 90, 100 )
UNION
SELECT
    employee_id,
    job_id,
    hire_date,
    salary
FROM
    employees
WHERE
    job_id = 'IT_PROG'
ORDER BY
    employee_id;

/*
Utilizando o UNION ALL
o UNION faz a junção de duas consulta e preserva as linhas duplicadas
Lista de colunas ou expressões em cada SELECT devem ser iguais
É Mais rápido
Retorno: 27 linhas
*/

SELECT
    employee_id,
    job_id,
    hire_date,
    salary
FROM
    employees
WHERE
    department_id IN ( 60, 90, 100 )
UNION ALL
SELECT
    employee_id,
    job_id,
    hire_date,
    salary
FROM
    employees
WHERE
    job_id = 'IT_PROG'
ORDER BY
    employee_id;

/*
Utilizando o INTERSECT
INTERSECT retorna apenas as linhas comuns entre os SELECT, apenas valores comuns
Retorno: 9 linhas
*/

SELECT
    employee_id,
    job_id,
    hire_date,
    salary
FROM
    employees
WHERE
    department_id IN ( 60, 90, 100 )
INTERSECT
SELECT
    employee_id,
    job_id,
    hire_date,
    salary
FROM
    employees
WHERE
    job_id = 'IT_PROG'
ORDER BY
    employee_id;
    
/*
Utilizando o MINUS
MINUS retorna linhas que estão apenas no primeiro SELECT e não estão no segundo SELECT
Retorno: 9 linhas
*/

SELECT
    employee_id,
    job_id,
    hire_date,
    salary
FROM
    employees
WHERE
    department_id IN ( 60, 90, 100 )
MINUS
SELECT
    employee_id,
    job_id,
    hire_date,
    salary
FROM
    employees
WHERE
    job_id = 'IT_PROG'
ORDER BY
    employee_id;
    