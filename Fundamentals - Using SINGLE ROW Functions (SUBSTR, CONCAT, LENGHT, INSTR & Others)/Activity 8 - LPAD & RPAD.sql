--@Author: MaurosMJ

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