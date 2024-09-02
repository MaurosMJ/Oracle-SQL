--@Author: MaurosMJ

--Utilizando o 'UPPER' (Transformar String em maiuscula)
select employee_id, last_name, department_id from employees where upper(last_name) = 'KING';