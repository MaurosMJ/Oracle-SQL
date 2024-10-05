--@Author: MaurosMJ

--Criando uma tabela temporaria
CREATE TABLE departments_average_temp (
    department_id          NUMBER(4),
    salary_average         NUMBER(8, 2),
    commission_pct_average NUMBER(2, 2)
);

--Populando com alguns dados
INSERT INTO departments_average_temp
    SELECT
        department_id,
        0,
        0
    FROM
        employees
    GROUP BY
        department_id;

COMMIT;

/*
    Abaixo será atualizado a coluna a coluna salary_average e commission_pct_average com o resultado
    da subconsulta
    Para cada linha será feito uma comparação do id de departamento, isso implica em perda de performance
*/

UPDATE departments_average_temp d
SET
    ( d.salary_average,
      d.commission_pct_average ) = (
        SELECT
            round(AVG(e.salary),
                  2),
            AVG(e.commission_pct)
        FROM
            employees e
        WHERE
            d.department_id = e.department_id
        GROUP BY
            e.department_id
    );

COMMIT;