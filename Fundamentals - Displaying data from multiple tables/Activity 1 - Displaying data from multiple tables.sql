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

/*
Self JOIN com cláusula ON
Utilizado para quando a condição de ligação está na mesma tabela apenas
*/
SELECT
    emp.first_name AS "Nome empregado",
    emp.last_name  AS "Sobrenome empregado",
    man.first_name AS "Nome Gerente",
    man.last_name  AS "Sobrenome Gerente"
FROM
         employees emp
    JOIN employees man ON ( emp.employee_id = man.manager_id );

/*
- Natural JOIN se baseia nas colunas com o mesmo nome em duas tabelas
- As colunas devem ter o mesmo nome e dados iguais
- Employees.department_id = Departments.department_id
- Countries.country_name = Locations.country_name
*/
SELECT
    emp.employee_id,
    emp.first_name,
    emp.last_name,
    dep.department_name,
    loc.street_address,
    con.country_name
FROM
         employees emp
    NATURAL JOIN departments dep, Locations loc, countries con;

/*
- Utilizando a cláusula USING
- USING é muito semelhante ao 'ON'
- Na sintaxe do USING deve passar a coluna que é igual para ambas tabelas.
- OBS.: A coluna usada na cláusula USING não pode ser prefixada no select<expres>
*/
SELECT
    emp.employee_id,
    emp.first_name,
    emp.last_name,
    dep.department_name
FROM
         employees emp
    JOIN departments dep using (department_id);

