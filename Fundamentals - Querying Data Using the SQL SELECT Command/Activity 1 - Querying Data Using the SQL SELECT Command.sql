--@Author: MaurosMJ

--Exibindo estrutura de uma tabela [DESCribe]
describe employees;
desc employees;

--Select básico de todas colunas da tabela
select * from employees;
select * from departments;
select * from jobs;

--Select básico de algumas colunas da tabela
select department_id, location_id from departments;

--Select utilizando operadores aritméticos (+, -, *, /)
--Multiplicação
select employee_id, first_name, last_name, salary, salary*1.15 SalarioAumento from employees;
--Divisão
select employee_id, first_name, last_name, salary, salary/2 SalarioMetade from employees;
--Soma
select employee_id, first_name, last_name, salary, salary+200 SalarioAcrecentado from employees;
--Subtração
select employee_id, first_name, last_name, salary, salary-200 SalarioAcrecentado from employees;

--Regras de precedência de operadores
select employee_id, first_name, last_name, salary, (25*salary)/100 UMQUARTOSALARIO from employees;

--Null (Ausência de valor)
select first_name, last_name, job_id, salary, commission_pct from employees;

--Alias
select first_name as PrimeiroNome, last_name SegundoNome, salary Salario from employees;

--Alias com Letras minusculas/maiusculas/Espaçamento
select first_name as "Primeiro Nome", last_name "Segundo nome", salary "Salário ($)" from employees;

/*
Operador de concatenção (||)
Para nome de alias utilizar aspas duplas ("")
Para String de caracteres utilizar aspas simples ('')
*/

--Alias, String de caracteres e concatenação
select first_name || ' ' || last_name || ', Salario: ' || salary "Funcionário" from employees;

--Operador alternativo para aspas (permite utilizar aspas simples e aspas duplas em string)
select department_name || q'[ Department's "Manager ID": ]' || manager_id "Departamento e Gerente" from departments;

--Eliminando linhas duplicadas em uma consulta
select distinct department_id from employees;
--Eliminando linhas duplicadas da combinação de duas colunas
select distinct first_name, last_name from employees;