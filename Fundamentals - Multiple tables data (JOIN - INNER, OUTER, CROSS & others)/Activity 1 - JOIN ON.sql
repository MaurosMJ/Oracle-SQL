--@Author: MaurosMJ

/*
- Utilizando JOIN com cláusula ON
- Utilizando nome da tabela (para evitar ambiguidade)
- Meio mais utilizado no desenvolvimento
*/
SELECT
    employees.employee_id,
    employees.first_name,
    employees.last_name,
    departments.department_name
FROM
         employees
    JOIN departments  ON ( employees.department_id = departments.department_id );

/*
- Utilizando JOIN com cláusula ON
- Utilizando ALIAS de tabelas (para evitar ambiguidade)
- Meio mais utilizado no desenvolvimento
*/
SELECT
    emp.employee_id,
    emp.first_name,
    emp.last_name,
    dep.department_name
FROM
         employees emp
    JOIN departments dep ON ( emp.department_id = dep.department_id );

/*
Utilizando vários JOINS em uma instrução
*/
SELECT
    emp.employee_id,
    emp.first_name,
    emp.last_name,
    dep.department_name,
    loc.street_address,
    con.country_name,
    reg.region_name
FROM
         employees emp
    JOIN departments dep ON ( emp.department_id = dep.department_id )
    JOIN locations loc on ( loc.location_id = dep.location_id)
    JOIN countries con on ( con.country_id = loc.country_id)
    JOIN regions reg on (reg.region_id = con.region_id);

/*
Utilizando JOIN com condições (WHERE)
*/
SELECT
    emp.employee_id,
    emp.first_name,
    emp.last_name,
    dep.department_name,
    emp.salary
FROM
         employees emp
    JOIN departments dep ON ( emp.department_id = dep.department_id )
    where salary between 10000 and 30000;
