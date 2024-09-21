--@Author: MaurosMJ

DROP TABLE projects;

-- Criando uma tabela com coluna DEFAULT (Sysdate)
CREATE TABLE projects (
    project_id    NUMBER(6) NOT NULL,
    project_code  VARCHAR2(10) NOT NULL,
    project_name  VARCHAR2(100) NOT NULL,
    creation_date DATE DEFAULT sysdate NOT NULL,
    start_date    DATE,
    end_date      DATE,
    status        VARCHAR2(20) NOT NULL,
    priority      VARCHAR2(10) NOT NULL,
    budget        NUMBER(11, 2),
    description   VARCHAR2(400) NOT NULL
);

-- Inserindo Linha com um valor DEFAULT
INSERT INTO projects VALUES (
    1,
    'PROJERP001',
    'Oracle ERP', DEFAULT,
    NULL,
    NULL,
    'PLANNING',
    'HIGH',
    1000000,
    'Implatanção do Oracle ERP'
);