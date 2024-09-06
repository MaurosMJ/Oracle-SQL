--@Author: MaurosMJ

/*
 Conectado como aluno
 ORA-00942: a tabela ou view não existe
 00942. 00000 -  "table or view does not exist"
 Ou a tabela não existe ou não tem privilégio para acessar a tabela
*/

SELECT
    *
FROM
    hr.employees;

-- Conectado como HR
GRANT SELECT ON hr.employees TO aluno;

/*
Se todas as sub-rotinas chamadas pela procedure pertencem ao mesmo schema da procedure principal, 
o usuário que executa a procedure principal não precisa de permissões adicionais para executar as sub-rotinas. 
O Oracle gerencia a execução de sub-rotinas nesse caso de forma automática.

Se a procedure principal chama sub-rotinas (functions ou procedures) que estão em outros schemas, 
você precisará garantir que o usuário tenha as permissões adequadas para essas sub-rotinas. 
Isso significa que o proprietário do schema onde estão as sub-rotinas deve conceder GRANT EXECUTE 
para essas rotinas ao schema que contém a procedure principal.

*/

-- Conectado como ALUNO

select * from hr.employees;