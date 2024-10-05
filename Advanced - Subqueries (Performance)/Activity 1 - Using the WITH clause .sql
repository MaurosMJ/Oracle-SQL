--@Author: MaurosMJ

/*
 Utilizando a Cláusula WITH
 O Resultado da subconsulta ficará em uma tablespace temporária (ganho de performance)
*/
WITH max_salaries AS (
    SELECT
        department_id,
        MAX(salary) maximum_salary,
        round(AVG(salary),
              2)    average_salary
    FROM
        employees e
    GROUP BY
        department_id
)
SELECT
    e.employee_id,
    e.salary,
    e.department_id,
    max_salaries.maximum_salary,
    max_salaries.average_salary
FROM
         employees e
    JOIN max_salaries ON ( e.department_id = max_salaries.department_id );