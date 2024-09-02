--@Author: MaurosMJ

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