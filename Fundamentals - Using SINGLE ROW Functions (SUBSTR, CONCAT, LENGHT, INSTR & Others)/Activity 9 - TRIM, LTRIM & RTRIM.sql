--@Author: MaurosMJ

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