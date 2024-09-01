--@Author: MaurosMJ

/*
Sub-consultas MultipleRow podem retornar mais de uma linha
Para isso utilizamos operadores específicos como IN
Retorna valores que estejam na lista, para cada comparação é equivalente a L1 OU L2 OU L3, OU N...
*/

SELECT
    *
FROM
    employees
WHERE
    salary IN (
        SELECT
            max(salary)
        FROM
            employees
        GROUP BY
            department_id
    );

/*
Sub-consultas MultipleRow podem retornar mais de uma linha
Para isso utilizamos operadores específicos como NOT IN
Retorna valores que NÃO estejam na lista, para cada comparação é diferente de L1 OU L2 OU L3, OU N...
Se houver valores NULL, então pode não haver nenhum retorno.
*/

SELECT
    *
FROM
    employees
WHERE
    employee_id NOT IN (
        SELECT
            manager_id
        FROM
            employees
        GROUP BY
            manager_id
    );


/*
Sub-consultas MultipleRow podem retornar mais de uma linha
Para isso utilizamos operadores específicos como ANY
Para qualquer valor (operador comparação <,>, >=, <=) que o resultado a direita
No exemplo abaixo retornaria o maior salario a direita
*/

SELECT
    *
FROM
    employees
WHERE
    salary < any (
        SELECT
            max(salary)
        FROM
            employees
        GROUP BY
            department_id
    );


/*
Sub-consultas MultipleRow podem retornar mais de uma linha
Para isso utilizamos operadores específicos como ALL
Para qualquer valor (operador comparação <,>, >=, <=) que o resultado a direita
No exemplo abaixo retornaria o menor salario a direita
*/

SELECT
    *
FROM
    employees
WHERE
    salary < ALL (
        SELECT
            max(salary)
        FROM
            employees
        GROUP BY
            department_id
    );
