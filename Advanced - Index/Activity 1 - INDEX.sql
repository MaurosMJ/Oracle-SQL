--@Author: MaurosMJ

-- Indices (Avançado)

-- Exemplo de FULL TABLE SCAN / Certamente haverá será feito FULL TABLE SCAN, pois não há clausula WHERE
select * from employees;

/*
 Nesse exemplo é feito um FULL TABLE SCAN
 CPU COST: 67087
 IO_COST: 3
*/
select * from employees where phone_number = '515.127.4565';

-- Para melhorar esse custo, pode ser criado um INDICE para a coluna
create index employees_phone_number_idx on employees (phone_number);

/*
 Nesse exemplo é feito um RANGE SCAN
 CPU COST: 14793
 IO_COST: 2
*/
select * from employees where phone_number = '515.127.4565';

/*
 Melhorando AINDA MAIS a performance:
 Como phone_number é UNIQUE, então pode ser criado um INDICE (UNIQUE) para a coluna
*/
create unique index employees_phone_number_idx on employees (phone_number);

/*
 CPU COST: 8521
 IO_COST: 1
 Oracle passa a encontrar atraves do ROWID, tentando encontrar o primeiro valor
 OBS.: Em UNIQUE KEY, O Oracle cria o indice automáticamente, na pratica não é tão comum criar um indice UNIQUE.
*/
select * from employees where phone_number = '515.127.4565';
