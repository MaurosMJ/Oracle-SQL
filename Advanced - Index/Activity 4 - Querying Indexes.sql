--@Author: MaurosMJ

-- Consultando Indices

SELECT
    ix.table_name,
    ix.table_owner,
    ix.index_name,
    ic.column_name,
    ic.column_position,
    ix.index_type,
    ix.uniqueness,
    ix.status,
    ix.tablespace_name
FROM
         user_indexes ix
    JOIN user_ind_columns ic ON ( ix.index_name = ic.index_name )
                                AND ( ix.table_name = ic.table_name )
WHERE
    ix.table_name = 'EMPLOYEES'
ORDER BY
    1,
    3;