--@Author: MaurosMJ

/*
Função de grupo AVG
Retorna média de valor de um grupo
Ignora valores nulos
*/
select to_char(avg(salary), 'L99G999G999D99') as "Media de Salario sem valores nulos" from employees;
select avg(nvl(commission_pct,0)) as "Media valores com nulo", avg(commission_pct) as "Media valores sem nulos" from employees;
