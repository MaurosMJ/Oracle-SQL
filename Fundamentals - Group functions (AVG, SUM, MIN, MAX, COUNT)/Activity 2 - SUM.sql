--@Author: MaurosMJ

/*
Função de grupo SUM
Retorna somatório de valor da coluna
*/
select to_char(sum(salary), 'L99G999G999D99') as "Somatório de Salario" from employees;
