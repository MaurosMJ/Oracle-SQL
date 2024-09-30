--@Author: MaurosMJ

-- Comparação Case Sensitivo (default), a partir da posição 1 (default), para todas combinações encontradas
SELECT
    phone_number,
    regexp_replace(phone_number, '\.', '-') AS phone
FROM
    employees;

-- Mesma Comparação anterior, mas informando o valor Default
SELECT
    phone_number,
    regexp_replace(phone_number, '\.', '-', 1, 0,
                   'c') AS phone
FROM
    employees;

-- Comparação NÃO Case Sensitivo, a partir da posição 1, para todas combinações encontradas
SELECT
    phone_number,
    regexp_replace(phone_number, '\.', '-', 1, 0,
                   'c') AS phone
FROM
    employees;