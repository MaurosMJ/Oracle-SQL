--@Author: MaurosMJ

/*
INNER JOIN de várias tableas utilizando Sintaxe Oracle
Condição de ligação na cláusula WHERE
NÃO utiliza palavra reservada ON
*/

SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    d.department_name,
    l.city,
    c.country_name
FROM
    employees   e,
    departments d,
    locations   l,
    jobs        j,
    countries   c
WHERE
    ( e.department_id = d.department_id )
    AND ( l.location_id = d.location_id )
    AND ( e.job_id = j.job_id )
    AND ( c.country_id = l.country_id )
ORDER BY
    1;
    
/*
INNER JOIN de várias tableas utilizando Sintaxe Oracle
+ Condições adicionais
*/

SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    to_char(e.salary, 'L99G999G999G999D99') AS salary,
    d.department_name,
    l.city,
    c.country_name
FROM
    employees   e,
    departments d,
    locations   l,
    jobs        j,
    countries   c
WHERE
    ( e.department_id = d.department_id )
    AND ( l.location_id = d.location_id )
    AND ( e.job_id = j.job_id )
    AND ( c.country_id = l.country_id )
    AND ( e.salary >= 10000 )
ORDER BY
    1;
    
    
/*
NONEQUIJOIN utilizando Sintaxe Oracle
*/
SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    e.job_id,
    to_char(e.salary, 'L99G999G999G999D99') AS salary,
    j.grade_level,
    j.lowest_sal,
    j.highest_sal
FROM
    employees  e,
    job_grades j
WHERE
    nvl(e.salary, 0) BETWEEN j.lowest_sal AND j.highest_sal
ORDER BY
    1;
    
/*
OUTER JOIN utilizando Sintaxe Oracle
Equivalente ao RIGHT JOIN
(+) fica na tabela que pode não ter valor
*/

SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    e.department_id                         AS "ID na tabela employees",
    d.department_id                         AS "ID na tabela departamento",
    to_char(e.salary, 'L99G999G999G999D99') AS salary
FROM
    employees   e,
    departments d
WHERE
    e.department_id = d.department_id (+)
ORDER BY
    1;
    
    
/*
OUTER JOIN utilizando Sintaxe Oracle
Equivalente ao LEFT JOIN
(+) fica na tabela que pode não ter valor
*/

SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    e.department_id                         AS "ID na tabela employees",
    d.department_id                         AS "ID na tabela departamento",
    to_char(e.salary, 'L99G999G999G999D99') AS salary
FROM
    employees   e,
    departments d
WHERE
    e.department_id (+) = d.department_id
ORDER BY
    1;
    
/*
Self JOIN com Sintaxe Oracle
*/

SELECT
    e.employee_id AS "ID do funcionario",
    e.first_name  AS "Nome do funcionario",
    e.last_name   AS "Sobrenome do funcionario",
    m.employee_id AS "ID gerente",
    m.first_name  AS "Primeiro nome do funcionario"
FROM
    employees e,
    employees m
WHERE
    e.manager_id = m.employee_id
ORDER BY
    1;
    
/*
Self JOIN e OUTER JOIN com Sintaxe Oracle
*/

SELECT
    e.employee_id AS "ID do funcionario",
    e.first_name  AS "Nome do funcionario",
    e.last_name   AS "Sobrenome do funcionario",
    m.employee_id AS "ID gerente",
    m.first_name  AS "Primeiro nome do funcionario"
FROM
    employees e,
    employees m
WHERE
    e.manager_id = m.employee_id (+)
ORDER BY
    1;
    
/*
Produto cartesiano utilizando sintaxe Oracle
*/

SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    j.job_id,
    j.job_title
FROM
    employees e,
    jobs      j
WHERE
    e.job_id = j.job_id;