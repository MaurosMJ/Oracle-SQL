--@Author: MaurosMJ

/*
Utilizando consultas Multiple-Column
Para cada coluna dentro da cláusula WHERE será comparado com as colunas de SELECT
A subconsulta abaixo tras o maior salário para cada JOB_ID
*/

SELECT
    first_name, last_name, job_id, salary
FROM
    employees e1
WHERE
    ( e1.job_id, e1.salary ) IN (
        SELECT
            e2.job_id, MAX(salary)
        FROM
            employees e2
        GROUP BY
            e2.job_id
    );