--@Author: MaurosMJ

/*
Utilizando o 'SUBSTR' (Obtem um texto dado uma posição inicial e final)
SUBSTR(string, start_position, lenght)
*/
--Retorno 'OLA'
select substr('Ola tudo bem?', 1,3) from dual;
--Retorno 'tudo'
select substr('Ola tudo bem?', 5,4) from dual;