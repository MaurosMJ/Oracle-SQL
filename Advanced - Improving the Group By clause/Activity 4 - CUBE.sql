--@Author: MaurosMJ

/*
 Usando o CUBE
 Faz todas as combinações possíveis de acordo com as colunas de 'GROUP BY' 
*/

SELECT
    continent,
    country,
    city,
    SUM(units_sold) as total
FROM
    sales
GROUP BY
    CUBE(continent,
         country,
         city);