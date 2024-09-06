--@Author: MaurosMJ

--Sinonimos

-- Criando sinonimos privados
CREATE SYNONYM departamentos FOR departments;

-- Utilizando sinonimos
SELECT
    *
FROM
    departamentos;

/*
 Removendo sinonimos
 Não interfere no objeto
*/

DROP SYNONYM departamentos;

/*
 Criando sinonimos públicos (Todos Schemas)
 Ao criar um sinônimo público no Oracle, ele fica disponível para todos os schemas do banco de dados.
*/

-- Conectando se como SYS (DBA)

CREATE PUBLIC SYNONYM departamentos FOR departments;

-- Utilizando sinonimos publicos
SELECT
    *
FROM
    departamentos;

-- Eliminando sinonimos publicos
DROP PUBLIC SYNONYM departamentos;