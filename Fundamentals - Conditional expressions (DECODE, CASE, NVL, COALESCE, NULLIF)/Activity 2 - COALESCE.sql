--@Author: MaurosMJ

/*
Utilizando o COALESCE
Para cada expressão, quando encontrado uma expressão diferente de null, retorna o valor.
COALESCE(expr1, expr2, ..., exprN)
expr1, expr2, ..., exprN: Uma lista de expressões que serão avaliadas na ordem em que são fornecidas.
A função avalia as expressões da esquerda para a direita e retorna o primeiro valor que não é NULL.
Se todas as expressões forem NULL, COALESCE retorna NULL.
*/
--Retorna: expressão 1
select coalesce(null, null, 'expressão 1') "Expressão não nula" from dual;
--Retorna: expressão 2
select coalesce(null, 'expressão 2', 'expressão 1') "Expressão não nula" from dual;
--Retorna: expressão 3
select coalesce('expressão 3', 'expressão 2', 'expressão 1') "Expressão não nula" from dual;
--Retorno: Caso exista commission_pct ou manager_id
select first_name, employee_id, coalesce(to_char(commission_pct),to_char(manager_id), 'Não foi encontrado comissão ou um gerente para este funcionario.') as "Valor encontrado"from employees;