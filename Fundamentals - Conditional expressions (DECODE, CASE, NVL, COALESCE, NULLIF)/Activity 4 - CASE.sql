--@Author: MaurosMJ

/*
Utilizando a estrutura de condição CASE na consulta

> Estrutura simples <
CASE expression
    WHEN value1 THEN result1
    WHEN value2 THEN result2
    ...
    ELSE default_result
END

> Estrutura de busca <
CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    ...
    ELSE default_result
END

*/
select first_name, salary as "Salário normal", case job_id when 'IT_PROG' then salary * 1.25 when 'AD_PRES' then salary * 1.10 else salary end "Novo salário" from employees;