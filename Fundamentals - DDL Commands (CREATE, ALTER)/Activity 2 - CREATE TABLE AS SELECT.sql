--@Author: MaurosMJ

/*
Criando uma tabela a partir das informações de outra
*/

CREATE TABLE employees1_bkp
    AS
        SELECT
            *
        FROM
            employees;

-- Na consulta abaixo trará todas as colunas e registros da tabela como base
SELECT
    *
FROM
    employees1_bkp;