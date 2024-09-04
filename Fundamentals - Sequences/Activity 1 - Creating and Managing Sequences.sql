--@Author: MaurosMJ

--SEQUENCES

--Atualmente o maior valor é 217
SELECT
    MAX(employee_id)
FROM
    employees;

CREATE SEQUENCE employee_seq START WITH 217 INCREMENT BY 1 NOMAXVALUE NOCACHE NOCYCLE;

--Consultando Sequences do usuário
SELECT
    *
FROM
    user_sequences;

--Utilizando a instrução abaixo retorna a proxima sequencia
--OBS.: Muita atenção pois incrementa um novo valor, então pode deixar um "burraco" na tabela
SELECT
    employee_seq.NEXTVAL
FROM
    dual;

--Utilizando a instrução abaixo retorna a sequencia atual
--OBS.: Necessario ter feito o NEXTVAL antes na sessão.
SELECT
    employee_seq.CURRVAL
FROM
    dual;

--Removendo a sequence
DROP SEQUENCE employee_seq;

/*
Utilizando a SEQUENCE
Obs.: Cuidado com ROLLBACK pois não volta a sequence
Obs.: Se acontecer falha na transação DML a sequence ainda sim pode ser incrementada
*/
INSERT INTO employees VALUES (
    employee_seq.NEXTVAL,
    'Paul',
    'Simon',
    'PSIMO',
    '525.342.237',
    TO_DATE('04/09/2024', 'dd-mm-rrrr'),
    'IT_PROG',
    15000,
    NULL,
    103,
    60
);

COMMIT;

/*
 Alterando uma sequence e adicionado CACHE
 No exemplo abaixo existe um ganho de performance
 Oracle armazena em cache 20 numeros
*/
ALTER SEQUENCE employee_seq MAXVALUE 999999 CACHE 20;

