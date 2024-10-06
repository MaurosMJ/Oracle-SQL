--@Author: MaurosMJ

SELECT
    *
FROM
    sales
ORDER BY
    continent,
    country,
    city;
 
-- Subtotal por continente  
SELECT
    s.continent,
    SUM(s.units_sold)
FROM
    sales s
GROUP BY
    continent;

-- Subtotal por pais
SELECT
    s.country,
    SUM(s.units_sold) AS total
FROM
    sales s
GROUP BY
    country;

-- Subtotal por cidade
SELECT
    s.city,
    SUM(s.units_sold) AS total
FROM
    sales s
GROUP BY
    city;

-- Fazendo todos agrupamentos em um unico SELECT (GROUPING SETS)
SELECT
    continent,
    country,
    city,
    SUM(units_sold)
FROM
    sales
GROUP BY
    GROUPING SETS ( continent,
                    country,
                    city );
                    
-- Fazendo todos agrupamentos em um unico SELECT (GROUPING SETS) com TOTAL GERAL
SELECT
    continent,
    country,
    city,
    SUM(units_sold)
FROM
    sales
GROUP BY
    GROUPING SETS ( continent,
                    country,
                    city, ( ) );