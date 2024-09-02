--@Author: MaurosMJ

--Utilizando a cláusula WHERE
select first_name, last_name, job_id, department_id
from employees
where department_id = 60;

--Utilizando Strings de caractere na cláusula WHERE
select first_name, last_name, job_id, department_id
from employees
where last_name = 'King';

--Utilizando datas na cláusula WHERE
select first_name, last_name, job_id, department_id, hire_date
from employees
where hire_date = '30/01/04';

--Utilizando operadores de comparação (=,>,>=,<,<=,<>,Between...and...,IN (set), LIKE, IS NULL)

--Operador maior ou igual (>=)
select first_name, last_name, job_id, department_id, salary
from employees
where salary >= 10000;

--Operador entre valores (BETWEEN)
select first_name, last_name, job_id, department_id, salary
from employees
where salary >= 10000;

--Operador entre (IN)
select first_name, last_name, job_id, department_id, salary
from employees
where job_id in ('IT_PROG', 'SA_REP', 'FI_ACCOUNT');

--Utilizando operador LIKE com operador curinga (%)
select first_name, last_name, job_id, department_id, salary
from employees
where first_name like '%Sa%';

--Utilizando operador LIKE com caractere mágico (_)
select first_name, last_name, job_id, department_id, salary
from employees
where first_name like '_a%';

--Comparando um valor com NULL
select first_name, last_name, manager_id
from employees
where manager_id is null;

--Operadores Lógicos (AND, OR, NOT)

--Operador AND:
select first_name, last_name, salary, job_id
from employees
where job_id = 'IT_PROG' and salary >= 5000;

--Operador OR:
select first_name, last_name, salary, job_id
from employees
where job_id = 'IT_PROG' or salary >= 5000;

--Operador NOT:
select first_name, last_name, salary, job_id
from employees
where job_id not in ('IT_PROG');

--Utilizando Regra de precedência
select first_name, last_name, salary, job_id
from employees
where salary >= 10000 and (job_id = 'IT_PROG' or job_id = 'FI_ACCOUNT');

-- Cláusula ORDER BY (ASC é DEFAULT)
-- Ordem Ascendente
select first_name, last_name, salary, job_id, hire_date
from employees
order by hire_date asc;

-- Ordem Descendente
select first_name, last_name, salary, job_id, hire_date
from employees
order by hire_date desc;

-- Na cláusula ORDER BY pode ser utilizado um ALIAS
select first_name, last_name, salary, job_id, hire_date as data_admissao
from employees
order by data_admissao desc;

select first_name, last_name, salary, job_id, hire_date as "Data Admissão"
from employees
order by "Data Admissão" desc;

-- Ordenando por posição numérica da Coluna (neste caso 'department_id')
select first_name, last_name, job_id, department_id, hire_date
from employees
order by 4 desc;

-- Ordenando multiplas colunas (prioridade da esquerda para direita):
select first_name, last_name, job_id, department_id, hire_date
from employees
order by department_id asc, salary desc;

-- Utilizando váriavel de substituição tipo numérico
select first_name, last_name, job_id, department_id, hire_date
from employees
where employee_id = &employee_id;

-- Utilizando váriavel de substituição tipo Character e Date
select first_name, last_name, job_id, department_id, hire_date
from employees
where job_id = '&job_id';

-- Utilizando váriavel de substituição (reutilização de valor) apenas solicitará o valor uma vez
select employee_id, first_name, last_name, job_id, department_id, hire_date
from employees
where employee_id = &&employee_id;

-- Utilizando variável de sessão DEFINE
define employee_id = 101;

select employee_id, first_name, last_name, job_id, department_id, hire_date
from employees
where employee_id = &employee_id;

-- Removendo a váriavel de sessão
undefine employee_id;