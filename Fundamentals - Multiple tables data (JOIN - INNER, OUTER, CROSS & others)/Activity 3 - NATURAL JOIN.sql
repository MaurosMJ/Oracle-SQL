--@Author: MaurosMJ

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
