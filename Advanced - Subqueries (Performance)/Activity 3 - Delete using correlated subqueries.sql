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


--Obtendo os departamentos com localização US
SELECT
    d.department_id,
    d.department_name
FROM
         departments d
    JOIN locations l ON ( d.location_id = l.location_id )
WHERE
    country_id = 'US';

/*
 Agora fazendo DELETE utilizando subconsultas correlacionadas
 Sera deletado todos os departamentos localizados nos US
*/
DELETE FROM departments_average_temp d
WHERE
    d.department_id IN (
        SELECT
            d.department_id
        FROM
                 departments d
            JOIN locations l ON ( d.location_id = l.location_id )
        WHERE
            country_id = 'US'
    );

COMMIT;