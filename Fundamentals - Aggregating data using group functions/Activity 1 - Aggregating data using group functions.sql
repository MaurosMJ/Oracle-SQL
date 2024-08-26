--@Author: MaurosMJ

/*
Função de grupo AVG
Retorna média de valor de um grupo
Ignora valores nulos
*/
select to_char(avg(salary), 'L99G999G999D99') as "Media de Salario sem valores nulos" from employees;
select avg(nvl(commission_pct,0)) as "Media valores com nulo", avg(commission_pct) as "Media valores sem nulos" from employees;
/*
Função de grupo SUM
Retorna somatório de valor da coluna
*/
select to_char(sum(salary), 'L99G999G999D99') as "Somatório de Salario" from employees;

/*
Função de grupo MIN
Retorna o menor valor da coluna
Trabalha com string de caracteres, valores numericos ou datas.
*/
select to_char(min(salary), 'L99G999G999D99') as "Menor Salario" from employees;

/*
Função de grupo MAX
Retorna o maior valor da coluna
Trabalha com string de caracteres, valores numericos ou datas.
*/
select to_char(max(salary), 'L99G999G999D99') as "Menor Salario" from employees;

/*
Função de grupo COUNT
Quando COUNT(*) - Retorna o numero de linhas
Quando COUNT(NVL(expressão)) - Também retorna o numero de linhas
Quando COUNT(expressão) - Retorna o numero de linhas diferente de nulo
Quando COUNT(DISTINCT) - Apenas conta valores distintos
*/
select count(*) as "Quantidade de linhas", count(nvl(commission_pct,0)) as "Quantidade de linhas 2", count(commission_pct) as "Funcionarios com comissão",
count(distinct commission_pct) as "Valor de comissão distintos" from employees;