--@Author: MaurosMJ

/*
Utilizando o 'TRUNC' (Apenas trata casas decimais SEM arredondar)
TRUNC(Numero real, precisão)
*/
--Retorna: 25,5 | 25
select TRUNC(25.57, 1), TRUNC(25.57, 0) from dual;

/*
TRUNC(SYSDATE, 'MONTH') = Zerar o dia
TRUNC(SYSDATE, 'YEAR') = Zerar o dia e mês
TRUNC(SYSDATE) = Zerar o horário (hora/min/seg), Utilizado para comparações, quando desconsiderar o horário.
*/
select round(sysdate) as "Data com hora/min/seg zerado", trunc(sysdate, 'month') as "Zerar o dia" , trunc(sysdate, 'year') as "Zerar o dia e mes" from dual;