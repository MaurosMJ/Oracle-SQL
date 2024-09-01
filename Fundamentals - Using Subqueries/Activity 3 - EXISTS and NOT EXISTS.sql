--@Author: MaurosMJ

/*
EXISTS é usado para verificar a existência de registros em uma subconsulta.
Retorna TRUE se a subconsulta retornar pelo menos um registro.
EXISTS apesar de ser semelhante ao operador IN, é muito mais performático.
Deve ser usado em grandes conjunto de dados
*/

SELECT
    *
FROM
    departments d
WHERE
    EXISTS (
        SELECT
            e.department_id
        FROM
            employees e
        WHERE
            e.department_id = d.department_id
        GROUP BY
            department_id
    );


/*
NOT EXISTS é usado para verificar se não registros em uma subconsulta.
Retorna TRUE se a subconsulta não retornar pelo menos um registro.
EXISTS apesar de ser semelhante ao operador IN, é muito mais performático.
Deve ser usado em grandes conjunto de dados
*/


SELECT
    *
FROM
    departments d
WHERE
    NOT EXISTS (
        SELECT
            department_id
        FROM
            employees e
        WHERE
            e.department_id = d.department_id
        GROUP BY
            department_id
    );