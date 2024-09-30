--@Author: MaurosMJ

--Criando uma tabela temporária que preserva linhas após commit
CREATE GLOBAL TEMPORARY TABLE hr.tmp_employees (
    employee_id    NUMBER(6),
    first_name     VARCHAR2(20),
    last_name      VARCHAR2(25),
    email          VARCHAR2(25),
    phone_number   VARCHAR2(20),
    hire_date      DATE,
    job_id         VARCHAR2(10),
    salary         NUMBER(8, 2),
    commission_pct NUMBER(2, 2),
    manager_id     NUMBER(6),
    department_id  NUMBER(4)
) ON COMMIT PRESERVE ROWS;

-- Fazendo a consulta abaixo não haverá retorno
SELECT
    *
FROM
    hr.tmp_employees;

-- Adicionando linhas a tabela
INSERT INTO tmp_employees
    SELECT
        *
    FROM
        employees;
        
/*
    Mesmo commitando, em outras sessões não estará disponível as linhas
    Apenas disponivel os registros para sessão atual
*/
COMMIT;

/*
    Se encerrar essa sessão todos os dados dessa tabela serão eliminados.
*/
