--@Author: MaurosMJ

/*
A Palavra INNER é opcional em JOIN ou NATURAL JOIN
*/

SELECT
    emp.employee_id,
    job.job_title,
    dep.department_name,
    loc.city,
    nvl(loc.state_province, 'Sem cadastro'),
    loc.country_id
FROM
         employees emp
    NATURAL INNER JOIN jobs        job,
    departments dep,
    locations   loc
ORDER BY
    emp.employee_id;

SELECT
    emp.employee_id,
    job.job_title,
    dep.department_name,
    loc.city,
    nvl(loc.state_province, 'Sem cadastro'),
    loc.country_id
FROM
         employees emp
    INNER JOIN jobs        job ON ( emp.job_id = job.job_id )
    INNER JOIN departments dep ON ( emp.department_id = dep.department_id )
    INNER JOIN locations   loc ON ( dep.location_id = loc.location_id )
ORDER BY
    emp.employee_id;