--Author: MaurosMJ

/*
 Retorna:
 Timezone do banco de dados
 Horario do Servidor Oracle em sysdate e systimestamp (precisão de 9 dígitos após virgula)
 Data da sessão do usuário do banco de dados (CURRENT_DATE)
 Timestamp com timezone da sessão do usuário do banco de dados
 LocalTimeStamp retorna o Timestamp local (do cliente) que está conectado no Oracle
*/
SELECT
    dbtimezone,
    sessiontimezone,
    to_char(sysdate, 'dd-mm-rrrr hh24:mi:ss') as oracle_server,
    systimestamp,
    current_date,
    current_timestamp,
    localtimestamp
FROM
    dual;

/*
 Alterando o timezone para todo o banco de dados
 Apenas o DBA
*/
ALTER DATABASE SET TIME_ZONE = '-03:00';
