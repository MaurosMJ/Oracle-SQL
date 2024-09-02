--@Author: MaurosMJ

/*
Utilizando Instrução DELETE (DML)
DELETA linhas existentes
*/

-- Fazendo um DELETE simples
DELETE FROM countries
WHERE
    country_id = 'NG';

COMMIT;