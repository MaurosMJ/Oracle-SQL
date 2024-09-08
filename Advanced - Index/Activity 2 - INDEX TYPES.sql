--@Author: MaurosMJ

-- Indices (Avançado)

-- Criando um Indice do tipo BTREE (Simples)

create index employee_job_id_idx on employees (job_id);

/*
 Será feito um RANGE SCAN
 Como é um tipo de INDICE não único, o ORACLE vai procurar por uma faixa de valores
 OBS.: Cuida com funções ao criar indices.
*/
select * from employees where job_id = 'IT_PROG';

/*
 Sem indices ocorreu um FULL TABLE SCAN
 CPU_COST: 62647
 COST: 3
*/
select * from employees where last_name = 'Himuro';

-- Criando um indice B-TREE Simples
create index employees_last_name_idx on employees (last_name);

/*
 Com indice ocorreu um RANGE SCAN
 CPU_COST: 14793
 COST: 2
*/
select * from employees where last_name = 'Himuro';

-- Criando um indice composto B-TREE

create index employee_first_last_name_idx on employees (last_name, first_name);

/*
 Com indice ocorreu um RANGE SCAN
 CPU_COST: 14793
 COST: 2
*/
select * from employees where last_name = 'Himuro' and first_name = 'Guy';

-- Criando um indice do tipo BITMAP
create bitmap index employees_job_id_idx on employees (job_id);

/*
 Com o indice aconteceu o SINGLE VALUE para ROWID
 CPU_COST: 25239
 COST: 3
*/
select * from employees where job_id = 'IT_PROG';
