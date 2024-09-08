--@Author: MaurosMJ

/*
 Removendo Indices
 Nada acontece com a tabela
 Causa Lock até finalizar o drop da tabela
*/
DROP INDEX employee_first_last_name_idx;

/*
 Causa Lock apenas nas linhas que estiver sendo processado
 Apenas ORACLE EE
*/
DROP INDEX employees_last_name_idx ONLINE;
