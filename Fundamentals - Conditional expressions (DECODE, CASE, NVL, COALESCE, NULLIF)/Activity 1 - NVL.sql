--@Author: MaurosMJ

/*
Utilizando o NVL (Null Value Logic)
Quando encontrado um valor nulo, substitui para outro valor
*/
select first_name "Primeiro nome", nvl(commission_pct,0) "Comissão", 12*nvl(commission_pct, 0) "Comissão anual" from employees;

/*
Utilizando o NVL2
Quando encontrado um valor null atribui-se um valor, quando diferente de nulo atribui-se outro valor.
NVL2(expr1, expr2, expr3)
expr1: A expressão que será avaliada para verificar se é NULL ou não.
expr2: O valor a ser retornado se expr1 não for NULL.
expr3: O valor a ser retornado se expr1 for NULL.
*/
select first_name, commission_pct, nvl2(commission_pct, 'Sim', 'Não') as "Comissão cadastrada" from employees;
