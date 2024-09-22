--@Author: MaurosMJ

-- Criando tabelas para testes
CREATE TABLE job_salaries (
    year    NUMBER(4) NOT NULL,
    month   NUMBER(2) NOT NULL,
    it_prog NUMBER(8, 2) NOT NULL,
    sa_man  NUMBER(8, 2) NOT NULL,
    st_man  NUMBER(8, 2) NOT NULL
);

-- Inserindo linhas na tabela criada
INSERT INTO job_salaries (
    year,
    month,
    it_prog,
    sa_man,
    st_man
) VALUES (
    2015,
    9,
    31300,
    61000,
    36000
);

INSERT INTO job_salaries (
    year,
    month,
    it_prog,
    sa_man,
    st_man
) VALUES (
    2015,
    8,
    35000,
    79500,
    37000
);

COMMIT;

CREATE TABLE job_sal (
    year         NUMBER(4) NOT NULL,
    month        NUMBER(2) NOT NULL,
    job_id       VARCHAR2(10) NOT NULL,
    total_salary NUMBER(8, 2) NOT NULL
);

/*
 Inserindo linhas (INSERT PIVOTING)
 O conceito de insert pivoting envolve a transformação de dados de uma tabela de formato wide 
 (onde as informações estão distribuídas em colunas) para um formato long (onde os dados são representados em linhas), 
 sem precisar usar diretamente uma função PIVOT
 */
INSERT ALL INTO job_sal VALUES (
    year,
    month,
    'IT_PROG',
    it_prog
) INTO job_sal VALUES (
    year,
    month,
    'IT_PROG',
    sa_man
) INTO job_sal VALUES (
    year,
    month,
    'ST_MAN',
    st_man
) SELECT
      *
  FROM
      job_salaries;

COMMIT;