--@Author: MaurosMJ

--Função EXTRACT

-- Extraindo Ano, mes e dia
SELECT
    EXTRACT(YEAR FROM sysdate)  AS ano,
    EXTRACT(MONTH FROM sysdate) AS mês,
    EXTRACT(DAY FROM sysdate)   AS dia
FROM
    dual;
    
-- Extraindo ano, mes, dia, hora, minutos, segundo, timezone hora, timezone minuto, timezone segundo, timezone região, timezone abreviação
SELECT
    EXTRACT(YEAR FROM current_timestamp)            ano,
    EXTRACT(MONTH FROM current_timestamp)           mês,
    EXTRACT(DAY FROM current_timestamp)             dia,
    EXTRACT(HOUR FROM current_timestamp)            hora,
    EXTRACT(MINUTE FROM current_timestamp)          minuto,
    EXTRACT(SECOND FROM current_timestamp)          segundo,
    EXTRACT(TIMEZONE_HOUR FROM current_timestamp)   timezone_hour,
    EXTRACT(TIMEZONE_MINUTE FROM current_timestamp) timezone_minute,
    EXTRACT(TIMEZONE_REGION FROM current_timestamp) timezone_region,
    EXTRACT(TIMEZONE_ABBR FROM current_timestamp)   timezone_abbr
FROM
    dual;

-- Extraindo ano, mes de intervalo year to month
SELECT
    EXTRACT(YEAR FROM INTERVAL '5-2' YEAR TO MONTH)  AS ano,
    EXTRACT(MONTH FROM INTERVAL '5-2' YEAR TO MONTH) AS mes
FROM
    dual;

-- Extraindo dia, hora, minuto, segundo de interval day para segundos
SELECT
    EXTRACT(DAY FROM INTERVAL '5 04:30:20.11' DAY TO SECOND)    AS dia,
    EXTRACT(HOUR FROM INTERVAL '5 04:30:20.11' DAY TO SECOND)   AS hora,
    EXTRACT(MINUTE FROM INTERVAL '5 04:30:20.11' DAY TO SECOND) AS minuto,
    EXTRACT(SECOND FROM INTERVAL '5 04:30:20.11' DAY TO SECOND) AS segundo
FROM
    dual;