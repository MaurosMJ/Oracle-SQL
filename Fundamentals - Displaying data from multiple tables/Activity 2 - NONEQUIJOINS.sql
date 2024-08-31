--@Author: MaurosMJ

/*
Utilizando o NONEQUIJOINS
É um JOIN quando a condição de ligação não é uma condição de igualdade.
*/

CREATE TABLE job_grades (
    grade_level VARCHAR2(2) NOT NULL,
    lowest_sal  NUMBER(11, 2),
    highest_sal NUMBER(11, 2),
    CONSTRAINT job_grades_pk PRIMARY KEY ( grade_level )
);

insert into job_grades values ('A',1000,2999);
insert into job_grades values ('B',3000,5999);
insert into job_grades values ('C',6000,9999);
insert into job_grades values ('D',10000,14999);
insert into job_grades values ('E',15000,24999);
insert into job_grades values ('F',25000,40000);
commit;

SELECT
    emp.first_name,
    emp.last_name,
    emp.salary,
    job.grade_level,
    job.lowest_sal,
    job.highest_sal
FROM
         employees emp
    JOIN job_grades job ON emp.salary BETWEEN job.lowest_sal AND job.highest_sal;