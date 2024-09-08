--@Author: MaurosMJ

-- Criando um indice do tipo B-TREE para a coluna JOB_ID
CREATE INDEX job_id_idx ON
    employees (
        job_id
    );

/*
 Analisando o custo de execução
 COST: 2
 CPU_COST: 19743
 IO_COST: 2
*/
SELECT
    *
FROM
    employees
WHERE
    job_id = 'IT_PROG';

/*
 Criando um indice do tipo BITMAP para a coluna JOB_ID
 ORA-01408: esta lista de colunas já está indexada
*/

CREATE BITMAP INDEX job_id2_idx ON
    employees (
        job_id
    );
    
/*
 Resolvendo:
 Agora o ORACLE não utilizará esse indice
 OBS.: Util para identificar qual indice é mais performático sem dropar-lo
*/

ALTER INDEX job_id_idx INVISIBLE;

-- Criando novamente o Indice
CREATE BITMAP INDEX job_id2_idx ON
    employees (
        job_id
    );

/*
 Analisando o custo de execução
 COST: 3
 CPU_COST: 25239
 IO_COST: 3
*/
SELECT
    *
FROM
    employees
WHERE
    job_id = 'IT_PROG';