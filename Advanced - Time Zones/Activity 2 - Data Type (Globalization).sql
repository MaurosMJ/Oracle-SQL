--Author: MaurosMJ

--Globalização e tipos de dados


--Tipo de dado DATE
SELECT
    sysdate
FROM
    dual;

SELECT
    to_char(sysdate, 'dd/MM/yyyy')
FROM
    dual;


--Tipo de dado TIMESTAMP
SELECT
    systimestamp
FROM
    dual;

/*
 Intervalo de ano para mês.
 Retorna o intervalo de 55 anos e 11 meses.
*/
SELECT
    INTERVAL '55-11' YEAR TO MONTH
FROM
    dual;

/*
 Erro de precisão para o ano
 (ORA-01873: a precisão precedente do intervalo é pequena demais)
*/
SELECT
    INTERVAL '555-11' YEAR TO MONTH
FROM
    dual;

-- Corrigindo:
SELECT
    INTERVAL '555-11' YEAR ( 4 ) TO MONTH
FROM
    dual;

-- Ao informar a quantidade de meses, Retorna a quantidade de anos e meses
SELECT
    INTERVAL '350' MONTH
FROM
    dual;

-- Retorna a quantidade de anos
SELECT
    INTERVAL '10' YEAR
FROM
    dual;

-- Retorna o intervalo em dias, horas, minutos e segundos.
SELECT
    INTERVAL '33 20:20:20' DAY TO SECOND
FROM
    dual;

-- Retorna o intervalo em horas
SELECT
    INTERVAL '500' HOUR
FROM
    dual;
