--@Author: MaurosMJ

--Utilizando o 'LOWER' (Transformar String em minusculo)
select employee_id, last_name, department_id from employees where lower(last_name) = 'king';