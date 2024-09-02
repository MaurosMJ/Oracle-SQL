--@Author: MaurosMJ

/*
SELECT FOR UPDATE
Causa LOCK nas linhas recuperadas
Utilizado quando precisa lever os dados e em seguida fazer uma atualização
*/

SELECT
    *
FROM
    employees
FOR UPDATE;

/*
Para liberar de LOCK utilizar COMMIT OU ROLLBACK
*/

commit;

