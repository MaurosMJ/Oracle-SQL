--@Author: MaurosMJ

/*
Utilizando Sub-consulta correlacionada
Para cada linha da consulta externa é feito um comparação com a interna
É menos performático pois para cada linha é feito a sub-consulta
Uma sub-consulta não correlacionada faz apenas uma vez a sub-consulta.
*/

SELECT
    first_name,
    last_name,
    salary
FROM
    employees a
WHERE
    salary > (
        SELECT
            AVG(nvl(salary, 0))
        FROM
            employees b
        WHERE
            a.department_id = b.department_id
    );