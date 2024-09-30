--@Author: MaurosMJ

-- Retorna a quantidade de ocorrencias de vogais
SELECT
    name,
    regexp_count(name, 'a|e|i|o|u') as combinacoes
FROM
    employees_copy;