--@Author: MaurosMJ

-- Reconstruindo e reorganizando INDICES

-- Reconstruindo um INDICE
ALTER INDEX employee_first_last_name_idx REBUILD;

-- Reconstruindo um INDICE com a opção ONLINE (Minimiza Locks)
ALTER INDEX employee_first_last_name_idx REBUILD ONLINE;
