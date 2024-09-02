--@Author: MaurosMJ

/*
Função de grupo COUNT
Quando COUNT(*) - Retorna o numero de linhas
Quando COUNT(NVL(expressão)) - Também retorna o numero de linhas
Quando COUNT(expressão) - Retorna o numero de linhas diferente de nulo
Quando COUNT(DISTINCT) - Apenas conta valores distintos
*/
select count(*) as "Quantidade de linhas", count(nvl(commission_pct,0)) as "Quantidade de linhas 2", count(commission_pct) as "Funcionarios com comissão",
count(distinct commission_pct) as "Valor de comissão distintos" from employees;