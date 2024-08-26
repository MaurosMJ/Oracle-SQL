--@Author: MaurosMJ

/*
Utilizando formatação de datas com 'TO_CHAR'
dd = Dia do mês
mm = Mês com dois digitos
yyyy = Ano com quarto digitos
mon = Mês abreviado
month = Nome do Mês
prefixo fm = remove espaçamento
hh = horas
mi = minutos
ss = segundos
*/
select to_char(sysdate, 'dd-mm-yyyy hh24-mi-ss') "Data e hora" from dual;
select to_char(sysdate, 'dd-mon-yyyy') "Data com mês abreviado" from dual;
select to_char(sysdate, 'dd/fmmonth/yyyy') "Data com o nome do mês" from dual;

/*
Utilizando formatação de numeros com 'TO_CHAR' para financeiro
L = Moeda local
G = Separador de milhares
D = Separador decimal
*/
select to_char(salary, 'L99G999G999D99') as "Salário do funcionario" from employees;

/*
Convertendo string para numerico
*/
select to_number('2000,54') as "String para numero" from dual;

/*
Convertendo valor numerico para string
*/
select to_char(2000.54) as "Numeros para string" from dual;

/*
Convertendo valor numerico para string
*/
select to_char(2000.54) as "Numeros para string" from dual;

/*
Convertendo string de caracteres para data
*/
select to_date('26/08/2024','dd/mm/yyyy') as "String para data" from dual;

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

/*
Utilizando o NULLIF
Quando duas expressões são iguais, retorna = NULL.
Quando duas expressões são iguais, retorna = A primeira expressão.
NULLIF(expr1, expr2)
expr1: A primeira expressão a ser avaliada.
expr2: A segunda expressão a ser comparada com expr1.
*/
--Retorna NULL | 1000
select nullif(1000, 1000), nullif(1000, 2000) from dual;


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

/*
Utilizando o DECODE
DECODE(expr, search1, result1 [, search2, result2, ...] [, default])
Avalia uma expressão, para cada busca retorna um resultado definido pelo programador
*/
select first_name, salary as "Salário normal", decode (job_id, 'IT_PROG',salary * 1.25,'AD_PRES',salary * 1.10, salary) as "Novo salário" from employees;
