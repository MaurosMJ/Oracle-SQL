--@Author: MaurosMJ

/*
 Retorna timestamp do cliente, converte o localtimestamp para Sao Paulo, converte o localtimestamp para Dubai,
 converte o localtimestamp para Chicago
*/

SELECT
    localtimestamp,
    from_tz(localtimestamp, 'America/Sao_Paulo'),
    from_tz(localtimestamp, 'Asia/Dubai'),
    from_tz(localtimestamp, 'America/Chicago')
FROM
    dual;

-- Converte para outro UTC passando um TIMESTAMP
SELECT
    from_tz(TIMESTAMP '2021-08-08 11:00:00', '-03:00'),
    from_tz(TIMESTAMP '2021-08-08 11:00:00', '-05:00'),
    from_tz(TIMESTAMP '2021-08-08 11:00:00', '-07:00')
FROM
    dual;

SELECT
    from_tz(localtimestamp, '-03:00'),
    from_tz(localtimestamp, '-05:00'),
    from_tz(localtimestamp, '-07:00')
FROM
    dual;
    
-- Convertendo String para TIMESTAMP
SELECT
    TO_TIMESTAMP('2006-01-18 08:15:32.1234', 'YYYY-MM-DD HH24:MI:SS.FF') AS novo_timestamp
FROM
    dual;
    
-- Convertendo String para TIMESTAMP WITH TIME ZONE
SELECT
    TO_TIMESTAMP_TZ('2006-01-18 08:15:32.1234 America/Sao_Paulo', 'YYYY-MM-DD HH24:MI:SS.FF TZR') AS novo_timestamp_with_timezone
FROM
    dual;