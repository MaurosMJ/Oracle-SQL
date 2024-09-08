--@Author: MaurosMJ

-- Criando índices baseados em funções

-- Criando um indice para uma coluna:
CREATE INDEX first_name_idx ON
    employees (
        first_name
    );

/*
 Mesmo havendo a um indice para essa coluna o Oracle fará um FULL TABLE SCAN
 Pois a consulta esta utilizando uma função, e não foi definido assim no indice.
 OPTIONS: FULL
 COST 3
 CPU_COST: 71627
*/
SELECT
    *
FROM
    employees
WHERE
    upper(first_name) = 'JOHN';

/*
 Corrigindo:
 Recriar um indice com função
*/

DROP INDEX first_name_idx;

CREATE INDEX first_name_idx ON
    employees ( upper(first_name) );

/*
 Agora sim o Oracle utilizará o indice na coluna
 OPTIONS: RANGE SCAN
 COST 2
 CPU_COST: 14793
*/
SELECT
    *
FROM
    employees
WHERE
    upper(first_name) = 'JOHN';