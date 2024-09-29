--@Author: MaurosMJ

-- Utilizando REGEXP_LIKE
-- Abaixo será feito um Filtro para 'v' ou 'ph' em case sensitivo (default) 
SELECT
    *
FROM
    employees
WHERE
    REGEXP_LIKE ( first_name,
                  '^Ste(v|ph)en$' );
                  
--Outra forma passando como argumento 'c', que é case sensitivo
SELECT
    *
FROM
    employees
WHERE
    REGEXP_LIKE ( first_name,
                  '^Ste(v|ph)en$',
                  'c' );

-- Com case sensitivo, ou seja, informando o argumento 'i'
SELECT
    *
FROM
    employees
WHERE
    REGEXP_LIKE ( first_name,
                  '^Ste(v|ph)en$',
                  'i' );
                  
-- Utilizando REGEXP_LIKE em constraint CK
-- A condição é imposta é seguir o padrão ###.###.#####, sendo '#' um número de 0 á 9 separado entre '.'
ALTER TABLE employees_copy
    ADD CONSTRAINT phone_number_ck CHECK ( REGEXP_LIKE ( phone_number,
                                                         '^[0-9]{3}\.[0-9]{3}\.[0-9]{4}$' ) );