--@Author: MaurosMJ

CREATE TABLE employees_copy
    AS
        SELECT
            employee_id,
            first_name
            || ' '
            || last_name name,
            email,
            phone_number,
            hire_date,
            job_id,
            salary,
            commission_pct,
            manager_id,
            department_id
        FROM
            employees;
/*
 Retorna a localização (numero/posição) da primeira ocorrência verdadeira
 Procura pela primeira letra maiuscula com qualquer caractere alfanumericos seguido
 Usa argumentos Default
*/
SELECT
    name,
    regexp_instr(name, '^[A-Z][[:alpha:]]+')
FROM
    employees_copy;
    
/*
 Mesma instrução anterior, mas informando os argumentos (Não Default)
*/
SELECT
    name,
    regexp_instr(name, '^[A-Z][[:alpha:]]+',1,1,0,'c') as Position
FROM
    employees_copy;
