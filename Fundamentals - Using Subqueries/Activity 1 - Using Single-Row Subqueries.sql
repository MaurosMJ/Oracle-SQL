--@Author: MaurosMJ

/*
Utilizando Sub-consultas SingleROW
Sub-consultas SingleROW NÃO pode retornar mais de uma linha, caso retornar:
ORA-01427: Single-row subquery returns more than one row.
Quando a subconsulta não traz nenhuma linha, então retorna NULL.
*/

SELECT
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    salary > (
        SELECT
            AVG(nvl(salary, 0))
        FROM
            employees
    );

/*
Utilizando Sub-consultas SingleROW com a cláusula HAVING
Sub-consultas SingleROW NÃO pode retornar mais de uma linha, caso retornar:
ORA-01427: Single-row subquery returns more than one row.
Quando a subconsulta não traz nenhuma linha, então retorna NULL.
*/

SELECT
    first_name,
    last_name,
    to_char(salary, 'L99G999G999G999D99') AS SALARY,
    department_id
FROM
    employees
GROUP BY
    department_id,
    first_name,
    last_name,
    salary
HAVING
    MAX(salary) > (
        SELECT
            AVG(salary)
        FROM
            employees
    )
ORDER BY
    4;