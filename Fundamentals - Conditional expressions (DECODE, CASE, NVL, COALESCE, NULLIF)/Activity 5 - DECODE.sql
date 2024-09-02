--Author: MaurosMJ

/*
Utilizando o DECODE
DECODE(expr, search1, result1 [, search2, result2, ...] [, default])
Avalia uma expressão, para cada busca retorna um resultado definido pelo programador
*/
select first_name, salary as "Salário normal", decode (job_id, 'IT_PROG',salary * 1.25,'AD_PRES',salary * 1.10, salary) as "Novo salário" from employees;