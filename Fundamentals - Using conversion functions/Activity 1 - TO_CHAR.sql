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
Convertendo valor numerico para string
*/
select to_char(2000.54) as "Numeros para string" from dual;

/*
Convertendo valor numerico para string
*/
select to_char(2000.54) as "Numeros para string" from dual;

