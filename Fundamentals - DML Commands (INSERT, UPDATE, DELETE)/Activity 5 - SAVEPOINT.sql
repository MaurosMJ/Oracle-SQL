--@Author: MaurosMJ

/*
Utilizando o SAVEPOINT
*/

--Nao existe funcionario 228
select * from employees where employee_id = 228; 

savepoint A;

--Adicionado funcionario 229
INSERT INTO employees 
           (employee_id, first_name, last_name, email, 
            phone_number, hire_date, job_id, salary,
            commission_pct, manager_id, department_id)
       VALUES (employees_seq.nextval, 'Rock', 'Balboa', 'DBROCKB', 
               '525.342.237', SYSDATE, 'IT_PROG', 7000,
               NULL, 103, 60);


--Existe o funcionario
select * from employees where employee_id = 229;

-- Voltando para o savepoint A
rollback to savepoint A;

-- Não existe mais
select * from employees where employee_id = 229;

-- Eliminando dados
delete from employees where employee_id in (229,227,223);

commit;