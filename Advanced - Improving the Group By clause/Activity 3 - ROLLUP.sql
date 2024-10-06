--@Author: MaurosMJ

/*
 Utilizando o ROLLUP
 Realiza o agrupamento e executa as mesmações funções para subgrupos compostas n, n-1, n-2 ... até 0
 Utilizado na construção subtotais
*/

SELECT
    continent,
    country,
    city,
    SUM(units_sold) as TOTAL
FROM
    sales
GROUP BY
    ROLLUP(continent,
           country,
           city);
           

/*
 A função Grouping_id retorna 0 quando a coluna dentro da função não for nula, caso contrário retorna 1
*/
SELECT
    continent, grouping_id (continent),
    country, grouping_id (country),
    city, grouping_id (city),
    SUM(units_sold) as TOTAL
FROM
    sales
GROUP BY
    ROLLUP(continent,
           country,
           city);