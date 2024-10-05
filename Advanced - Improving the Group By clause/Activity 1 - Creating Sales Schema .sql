--@Author: MaurosMJ

-- Preparando o Ambiente
-- Utilizando usuário SYS

-- Criando um usuário
CREATE USER sales IDENTIFIED BY sales
    DEFAULT TABLESPACE users
    QUOTA UNLIMITED ON users
    TEMPORARY TABLESPACE temp;
    
-- Adicionando privilégios
GRANT connect, resource TO sales;

-- Conectando como usuario sales 

CREATE TABLE sales
(
	continent   varchar(20),
	country     varchar(20),
	city        varchar(20),
	units_sold  integer
);

INSERT INTO sales VALUES ('North America', 'Canada', 'Toronto', 10000);
INSERT INTO sales VALUES ('North America', 'Canada', 'Montreal', 5000);
INSERT INTO sales VALUES ('North America', 'Canada', 'Vancouver', 15000);
INSERT INTO sales VALUES ('Asia', 'China', 'Hong Kong', 7000);
INSERT INTO sales VALUES ('Asia', 'China', 'Shanghai', 3000);
INSERT INTO sales VALUES ('Asia', 'Japan', 'Tokyo', 5000);
INSERT INTO sales VALUES ('Europe', 'UK', 'London', 6000);
INSERT INTO sales VALUES ('Europe', 'UK', 'Manchester', 12000);
INSERT INTO sales VALUES ('Europe', 'France', 'Paris', 5000);

COMMIT;

-- Consultar a Tabela sales

SELECT *
FROM sales;
