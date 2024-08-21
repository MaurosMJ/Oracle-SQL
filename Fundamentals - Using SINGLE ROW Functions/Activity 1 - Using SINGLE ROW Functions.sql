--@Author: MaurosMJ

--Utilizando o 'UPPER' (Transformar String em maiuscula)
select employee_id, last_name, department_id from employees where upper(last_name) = 'KING';

--Utilizando o 'LOWER' (Transformar String em minusculo)
select employee_id, last_name, department_id from employees where lower(last_name) = 'king';

--Utilizando o 'INITCAP' (Para cada palavra, transformar primeira letra em maiusculo)
select employee_id, initcap(last_name), department_id from employees where initcap(last_name) = 'King';

/*
Utilizando o 'SUBSTR' (Obtem um texto dado uma posição inicial e final)
SUBSTR(string, start_position, lenght)
*/
--Retorno 'OLA'
select substr('Ola tudo bem?', 1,3) from dual;
--Retorno 'tudo'
select substr('Ola tudo bem?', 5,4) from dual;

/*
Utilizando o 'CONCAT' (Concatena duas strings)
CONCAT(string, string)
*/
--Retorno 'Ola tudo bem? Tudo certo!'
select concat('Ola tudo bem? ', 'Tudo certo!') from dual;

/*
Utilizando o 'LENGTH' (Retorna tamanho da String)
LENGTH(string)
*/
--Retorna 13
select length('Ola tudo bem?') from dual;

/*
Utilizando o 'INSTR' (Retorna posição de uma string/texto)
INSTR(string)
*/
--Retorna 10
select INSTR('Ola tudo bem?', 'bem') from dual;

/*
Utilizando o 'LPAD' (Adiciona caracteres a esquerda para que ajinta o comprimento)
LPAD(string, length, pad_string)
*/
--Retorna: *****************Ola tudo bem?
select LPAD('Ola tudo bem?', 30, '*') from dual;

/*
Utilizando o 'RPAD' (Adiciona caracteres a direita para que ajinta o comprimento)
RPAD(string, length, pad_string)
*/
--Retorna: Ola tudo bem?*****************
select RPAD('Ola tudo bem?', 30, '*') from dual;

/*
Utilizando o 'REPLACE' (Subsitui algum texto por outro)
REPLACE(string, string)
*/
--Retorna: Bom dia tudo bem?
select REPLACE('Ola tudo bem?', 'Ola', 'Bom dia') from dual;

/*
Utilizando o 'TRIM' (Remove algum caractere mais a esquerda e mais a direita)
Utilizando o 'LTRIM' (Remove algum caractere mais a esquerda)
Utilizando o 'RTRIM' (Remove algum caractere mais a direita)
TRIM(char, STRING)
*/
--Retorna: Ola tudo bem?
select TRIM(';' FROM ';;;Ola tudo bem?;') from dual;
--Retorna: nome@gmail.com;
select LTRIM(';;;nome@gmail.com;',';') from dual;
--Retorna: ;;;nome@gmail.com
select RTRIM(';;;nome@gmail.com;;;;;;',';') from dual;

/*
Utilizando o 'ROUND' (Arredonda com digitos de precisão)
ROUND(Numero real, precisão)
*/
--Retorna: 25,6 | 26
select ROUND(25.57, 1), ROUND(25.57, 0) from dual;

/*
Utilizando o 'TRUNC' (Apenas trata casas decimais SEM arredondar)
TRUNC(Numero real, precisão)
*/
--Retorna: 25,5 | 25
select TRUNC(25.57, 1), TRUNC(25.57, 0) from dual;

/*
Utilizando o 'MOD' (Resto da divisão)
MOD(Dividendo, Divisor)
*/
--Retorna: 100
select MOD(1300, 600) from dual;

/*
Utilizando o 'ABS' (Valor absoluto)
ABS(Numero Real)
*/
--Retorna: 1300,567
select ABS(-1300.567) from dual;

/*
Utilizando o 'SQRT' (Raiz quadrada)
SQRT(NUMERO)
*/
--Retorna: 3
select SQRT(9) from dual;

