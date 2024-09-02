--@Author: MaurosMJ

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
