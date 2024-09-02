--@Author: MaurosMJ

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
