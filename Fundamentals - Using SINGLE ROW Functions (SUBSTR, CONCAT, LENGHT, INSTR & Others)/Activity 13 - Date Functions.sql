--@Author: MaurosMJ

/*
Exibindo a data atual
Formato depende do NLS_DATE_FORMAT
*/
--Retorna: Data atual no servidor.
select sysdate from dual;

/*
Calculos com datas
data+1 = Retorna data atual mais um dia.
data-1 = Retorna data atual menos um dia.
data+1/24 = Retorna data atual mais uma hora.
data-1/24 = Retorna data atual menos uma hora.
*/
SELECT sysdate + 1 "Amanhã", sysdate "Hoje", sysdate - 1 "Ontem"  FROM dual;

/*
Funções com datas
Months_between = Quantidade de meses entre duas datas
Add_months = Adicionar meses a uma data
Next_day = Proximo dia relativo a data (1 = domingo, 2 = segunda, 3 = terça, 4 = quarta, 5 = quinta, 6 = sexta, 7 = sabado)
Last_day = Ultimo dia do mês.
Round = Arredonda a data
Trunc = Trunca a data
*/
SELECT round(months_between(sysdate, hire_date)) as "Meses entre as datas", add_months(sysdate, 4) "Data atual + 4 meses" from employees;
SELECT next_day(sysdate, 7) "Data do Proximo Sabado" from dual;
SELECT last_day(add_months((sysdate),0)) "Ultimo dia do mes atual", last_day(add_months((sysdate),1)) "Ultimo dia do mes que vem" from dual;

/*
TRUNC(SYSDATE, 'MONTH') = Zerar o dia
TRUNC(SYSDATE, 'YEAR') = Zerar o dia e mês
TRUNC(SYSDATE) = Zerar o horário (hora/min/seg), Utilizado para comparações, quando desconsiderar o horário.
*/
select round(sysdate) as "Data com hora/min/seg zerado", trunc(sysdate, 'month') as "Zerar o dia" , trunc(sysdate, 'year') as "Zerar o dia e mes" from dual;