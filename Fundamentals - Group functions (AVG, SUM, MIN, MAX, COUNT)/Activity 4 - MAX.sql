--@Author: MaurosMJ

/*
Função de grupo MAX
Retorna o maior valor da coluna
Trabalha com string de caracteres, valores numericos ou datas.
*/
select to_char(max(salary), 'L99G999G999D99') as "Menor Salario" from employees;
