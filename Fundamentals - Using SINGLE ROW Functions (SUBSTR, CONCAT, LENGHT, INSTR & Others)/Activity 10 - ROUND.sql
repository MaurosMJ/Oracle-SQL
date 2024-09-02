--@Author: MaurosMJ

/*
Utilizando o 'ROUND' (Arredonda com digitos de precisão)
ROUND(Numero real, precisão)
*/
--Retorna: 25,6 | 26
select ROUND(25.57, 1), ROUND(25.57, 0) from dual;