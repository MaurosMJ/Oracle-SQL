--@Author: MaurosMJ

--Indices

-- Dropando um indice
drop index emp_name_ix;
drop index emp_last_name_ix;

/*
 Na fase de PARSE é criado um plano de execução do comando
 Como não existe indices o ORACLE vai fazer um FULL SCAN na tabela (Pessíma performance)
 CPU COST: 62647, IO_COST: 3
*/
select * from employees where last_name = 'Himurooo';

-- Criando um indice da coluna last_name na tabela employees
create index emp_last_name_ix on employees (last_name);

/*
 Como existe indices o ORACLE vai fazer um RANGE SCAN na tabela (Melhora de performance)
 Para cada entrada do indice o Oracle vai acessar a tabela pelo ROWID (Endereço Lógico) -- BY INDEX ROWID BATCHED
 CPU COST: 14793, IO_COST: 2
*/
select * from employees where last_name = 'Himuro';

-- Criando um indice composto
create index emp_last_first_name_ix on employees (last_name, first_name);

/*
 Oracle utilizou o indice emp_last_first_name_ix com RANGE SCAN
 Quem decide isso é o Oracle na fase de PARSE (OPTIMIZER)
 CPU COST: 14793, IO_COST: 2
*/
select * from employees where first_name = 'Guy' and last_name = 'Himuro';

/*
 Conforme deletar e inserir linha o indice pode ficar desorganizado, onerando performance
 Solução REBUILD
*/
alter index emp_last_first_name_ix rebuild;

/*
 Consultando Indices de uma tabela no banco de dados
 Pode ser consultado da VIEW user_indexes;
*/
SELECT ix.index_name,
       ic.column_position,
       ic.column_name,
       ix.index_type,
       ix.uniqueness,
       ix.status
FROM    user_indexes ix
  JOIN user_ind_columns ic ON (ix.index_name = ic.index_name) AND 
                              (ix.table_name = ic.table_name)
WHERE ix.table_name = 'EMPLOYEES'
ORDER BY ix.index_name, ic.column_position;