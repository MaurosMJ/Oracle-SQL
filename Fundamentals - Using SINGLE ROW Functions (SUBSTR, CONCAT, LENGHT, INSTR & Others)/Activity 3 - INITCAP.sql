--@Author: MaurosMJ

--Utilizando o 'INITCAP' (Para cada palavra, transformar primeira letra em maiusculo)
select employee_id, initcap(last_name), department_id from employees where initcap(last_name) = 'King';