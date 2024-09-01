--@Author: MaurosMJ

/*
Utilizando Sub-consultas na cláusula FROM
Faz um JOIN com uma tabela temporária através ALIAS dentro da cláusula FROM
*/

SELECT
    e1.employee_id,
    e1.first_name,
    e1.last_name,
    e1.job_id,
    e1.salary,
    round(max_salary_job.max_salary, 2)             AS max_salary,
    e1.salary - round(max_salary_job.max_salary, 2) diferenca
FROM
    employees e1
    LEFT JOIN (
        SELECT
            e2.job_id,
            MAX(e2.salary) AS max_salary  --Encotra maior salario, por JOB_ID
        FROM
            employees e2
        GROUP BY
            e2.job_id
    )         max_salary_job ON e1.job_id = max_salary_job.job_id; -- Cria uma tabela temporaria em memoria e faz um JOIN