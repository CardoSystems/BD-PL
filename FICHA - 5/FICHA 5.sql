--EX 1 -- F5
SELECT id AS venda_id, 
            TO_CHAR(data, 'yyyy-mm-dd (day)') AS data
            --data
FROM venda
WHERE data != (SELECT MIN(data)
                FROM venda);


--EX 2 -- versao 1
SELECT id AS venda_id, 
            TO_CHAR(data, 'yyyy-mm-dd (day)') AS data
            --data
FROM venda
WHERE data != (SELECT MIN(data)
                FROM venda)
        AND
        data != (SELECT MAX(data)
                FROM venda);
                
-- EX 2 -- version 2
SELECT 
    id AS venda_id,  -- Rename id to venda_id for clarity
    TO_CHAR(data, 'yyyy-mm-dd (FMDay)') AS data  -- Format date with full day name
FROM 
    venda
WHERE 
    data != (SELECT MIN(data) FROM venda)  -- Exclude the row with the earliest date
UNION ALL  -- Use UNION ALL to keep both min and max dates even if they are the same
SELECT 
    id AS venda_id,  -- Select the same fields for consistency
    TO_CHAR(data, 'yyyy-mm-dd (FMDay)') AS data  -- Format the max date with day
FROM 
    venda
WHERE 
    data = (SELECT MAX(data) FROM venda);  -- Include the row with the latest date
    
    
-- EX 3
        SELECT venda.id AS id,  -- Corrected column reference
           venda.data AS venda_data,
           linha_venda.data AS linha_data,
           desconto_unit_euros,
           venda.loja_id
      FROM linha_venda
           JOIN venda 
             ON linha_venda.venda_id = venda.id  -- Corrected join condition
     WHERE desconto_unit_euros = (SELECT MAX(desconto_unit_euros)
                                     FROM linha_venda);  -- Filters rows with the max discount
-- versao c/ subconsultas
SELECT id
FROM loja
WHERE id NOT IN (SELECT loja_id
                    FROM VENDA);


-- EX 6 e 5 Os produtos mais caros e os mais baratos
SELECT id AS produto_id, nome as produto_nome
FROM produto
WHERE preco_unit_atual IN (SELECT MIN(preco_unit_atual)
                        FROM produto
                        UNION
                        SELECT MAX(preco_unit_atual)
                        FROM produto);
                        GROUP BY c.nome
                        ORDER BY 1 DESC
                        
/* EXTRA EXPRIMENTAL
DELETE 
FROM produto
WHERE produto.nome = 'LIXO'
*/