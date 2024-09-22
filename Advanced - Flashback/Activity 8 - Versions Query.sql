--@Author: MaurosMJ

--Aplicar como SYS grants necessarios:
GRANT EXECUTE ON dbms_flashback TO hr;

--Alterando a nível de instância o parametro UNDO_RETENTION (SYS) = 48 horas
ALTER SYSTEM SET undo_retention = 1728000;

--Criando um tabela de testes

CREATE TABLE employees_copy
    AS
        SELECT
            *
        FROM
            employees;

--Consultando o SCN
--6150821
SELECT
    dbms_flashback.get_system_change_number
FROM
    dual;

--Consultando uma informação
--10549.58 (Salary)
SELECT
    employee_id,
    first_name,
    last_name,
    job_id,
    salary
FROM
    employees_copy
WHERE
    employee_id = 180;
    
--Alterando uma informação (Simulando erro)
UPDATE employees_copy
SET
    salary = salary * 2
WHERE
    employee_id = 180;

--Confirmando alteração
COMMIT;

--Consultando o SCN Agora
--6150962
SELECT
    dbms_flashback.get_system_change_number
FROM
    dual;

--Consultando uma informação
--21099,16 (Salary)
SELECT
    employee_id,
    first_name,
    last_name,
    job_id,
    salary
FROM
    employees_copy
WHERE
    employee_id = 180;

--Consultando uma informação com SCN (No passado)
--10549,58 (Salary)
SELECT
    employee_id,
    first_name,
    last_name,
    job_id,
    salary
FROM
    employees_copy AS OF SCN 6150821
WHERE
    employee_id = 180;

/*
Quando se utiliza VERSIONS é possível utilizar as PSEUDO COLUNAS ABAIXO:

VERSIONS_STARTSCN: Exibe o número de SCN (System Change Number) no qual a versão da linha foi criada.
VERSIONS_ENDSCN: Exibe o número de SCN no qual a versão da linha foi encerrada. Se a versão ainda estiver ativa, o valor será NULL.
VERSIONS_STARTTIME: Exibe o carimbo de data e hora (timestamp) no qual a versão da linha foi criada.
VERSIONS_ENDTIME: Exibe o carimbo de data e hora (timestamp) no qual a versão da linha foi encerrada. Se a versão ainda estiver ativa, o valor será NULL.
VERSIONS_XID: Exibe o identificador da transação (Transaction ID) que criou ou modificou a versão da linha.
VERSIONS_OPERATION: Exibe a operação que gerou a versão da linha. Os valores podem ser:
I para INSERT
D para DELETE
U para UPDATE

No exemplo a seguir é obtido as alterações entre dois tempos definidos na cláusula BETWEEN

*/

SELECT versions_startscn, 
       versions_starttime, 
       versions_endscn, 
       versions_endtime,
       versions_xid, 
       versions_operation,
       employee_id, 
       first_name, 
       last_name, 
       salary
FROM   employees_copy 
       VERSIONS BETWEEN SCN 5086585 AND 5086689
WHERE  employee_id = 180;

SELECT versions_startscn, 
       versions_starttime, 
       versions_endscn, 
       versions_endtime,
       versions_xid, 
       versions_operation,
       employee_id, 
       first_name, 
       last_name, 
       salary
FROM   employees_copy 
       VERSIONS BETWEEN timestamp  TO_TIMESTAMP('22/09/2024 18:45:00', 'DD/MM/YYYY HH24:MI:SS') AND 
                                   TO_TIMESTAMP('22/09/2024 19:48:00', 'DD/MM/YYYY HH24:MI:SS');