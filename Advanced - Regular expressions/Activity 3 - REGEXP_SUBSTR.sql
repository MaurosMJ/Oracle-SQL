--@Author: MaurosMJ

--Retorna o primeiro nome apenas (Uma letra maiuscula seguida de vários caracteres)
--Não informado os argumentos, portanto utiliza DEFAULT
SELECT
    name,
    regexp_substr(name, '^[A-Z][[:alpha:]]+') AS first_name
FROM
    employees_copy;
    
--Mesma instrução anterior
--Aqui informa os valores, portanto não DEFAULT
SELECT
    name,
    regexp_substr(name, '^[A-Z][[:alpha:]]+', 1, 1, 'c') AS first_name
FROM
    employees_copy;