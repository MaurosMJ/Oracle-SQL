--@Author: MaurosMJ

-- Consultando timezones da visão de performance dinâmica 'v$timezone_names'
SELECT
    *
FROM
    v$timezone_names
WHERE
    tzname LIKE '%Sao_Paulo%';

SELECT
    *
FROM
    v$timezone_names
WHERE
    tzname LIKE '%Brazil%';

SELECT
    *
FROM
    v$timezone_names
WHERE
    tzname LIKE '%New_York%'