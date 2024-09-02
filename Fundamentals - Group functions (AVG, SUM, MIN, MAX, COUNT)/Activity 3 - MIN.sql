--@Author: MaurosMJ

/*
Função de grupo MIN
Retorna o menor valor da coluna
Trabalha com string de caracteres, valores numericos ou datas.
*/
select to_char(min(salary), 'L99G999G999D99') as "Menor Salario" from employees;
