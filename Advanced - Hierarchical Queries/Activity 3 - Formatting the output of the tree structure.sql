--@Author: MaurosMJ

/*
    Uma estratégia para formatar a saida é usar o LPDA para alinhar a direta
    Indenta com 4 espaçoes em branco
    Cria uma arvore na saida
*/
SELECT
    level,
    lpad(last_name,
         length(last_name) +(level * 4) - 4,
         ' ')
FROM
    employees
START WITH
    manager_id IS NULL
CONNECT BY
    PRIOR employee_id = manager_id;

-- Outro meio de formatar a saída é adicionar o nível na frente
SELECT
    level,
    lpad(level || '.' || last_name,
         length(level || '.' || last_name) +(level * 4) - 4,
         ' ')
FROM
    employees
START WITH
    manager_id IS NULL
CONNECT BY
    PRIOR employee_id = manager_id;
