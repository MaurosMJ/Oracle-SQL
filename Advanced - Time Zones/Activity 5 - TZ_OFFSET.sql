--@Author: MaurosMJ

-- Obtendo UTC do banco de dados
SELECT
    dbtimezone
FROM
    dual;

-- Obtem o deslocamento do horário em relação ao UTC 00:00
SELECT
    tz_offset(dbtimezone)
FROM
    dual;

-- Obtem o deslocamento do horário em relação ao UTC 00:00
SELECT
    tz_offset(sessiontimezone)
FROM
    dual;
    
--Obtendo das timezones do banco de dados
SELECT
    *
FROM
    v$timezone_names
WHERE
    tzname LIKE '%New_York%';

-- Obtem o deslocamento do horário em relação ao UTC 00:00
SELECT
    tz_offset('America/New_York')
FROM
    dual;