--@Author: MaurosMJ

/*
Funções de agrupamento pode ser combinado com a cláusula GROUP BY
*/
select nvl(to_char(department_id),'Sem id') as "ID do departamento", job_id as "Id do trabalho", to_char(avg(nvl(salary,0)), 'L99G999G999D99') as "Salário" from employees group by department_id, job_id order by "Salário" desc;
select department_id, job_id, sum(salary) from employees group by department_id, job_id;

/*
Cláusula WHERE que referencia um grupo gera erro em tela
O Exemplo abaixo gera o erro: ORA-00934: a função de grupo não é permitida aqui
*/
select department_id, max(salary) as "Salario Maximo"
from employees
where max(salary) > 10000
group by department_id;

/*
Corringindo: Referenciar uma função de grupo na cláusula HAVING
*/
select department_id, max(salary) as "Salario Maximo"
from employees
where department_id is not null
group by department_id
HAVING max(salary) > 10000
order by max(salary);

/*
Aninhando funções de grupo
Funções de grupo pode ser aninhado apenas uma vez
*/
select max(avg(salary)) as "Média Maxima por ID" from employees group by department_id;
