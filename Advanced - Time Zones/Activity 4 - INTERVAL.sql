--Author: MaurosMJ

-- Soma de datas
SELECT
    sysdate,
    sysdate + 30 AS "Data + 30 dias"
FROM
    dual;

-- Soma de horas (utilizando numero / 24)
SELECT
    to_char(sysdate, 'dd/mm/rrrr hh24:mi:ss'),
    to_char(sysdate + 2 / 24, 'dd/mm/rrrr hh24:mi:ss')
FROM
    dual;

-- Soma de minutos (utilizando numero / 24/60)
SELECT
    to_char(sysdate, 'dd/mm/rrrr hh24:mi:ss'),
    to_char(sysdate + 2 / 24 / 60, 'dd/mm/rrrr hh24:mi:ss')
FROM
    dual;

-- Soma de segundos (utilizando numero / 24/60/60)
SELECT
    to_char(sysdate, 'dd/mm/rrrr hh24:mi:ss'),
    to_char(sysdate + 2 / 24 / 60 / 60, 'dd/mm/rrrr hh24:mi:ss')
FROM
    dual;
    
-- Usando o 'TO_DSINTERVAL' para adicionar 6 dias e 2 horas
SELECT
    sysdate,
    sysdate + TO_DSINTERVAL('6 02:00:00') as "+6 dias e 2 horas"
FROM
    dual;