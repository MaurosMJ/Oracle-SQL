--@Author: MaurosMJ

/*
Cria uma tabela MxN.
Ou seja, apenas faz a junção de dados entre Matriz a esquerda e a direita.
Gera um produto cartesiano.
Não utiliza palavra reservada ON.
Não é muito comum o uso.
*/

SELECT
    first_name,
    last_name,
    department_name
FROM
         employees e
    CROSS JOIN departments d;