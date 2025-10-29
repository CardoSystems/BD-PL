---------------------------
-- EXERCICIO 2 - C2-F2-TR

SELECT UPPER(nome) AS "produtos_entre_15_e_20_euros"
FROM produto
WHERE preco_unit_atual >= 15 and preco_unit_atual <= 20

---------------------------
-- EXERCICIO 3 - C2-F2-TR

SELECT id, TO_CHAR(data,'MON-yyyy, dd') AS data
FROM linha_venda
WHERE desconto_unit_euros IS NULL;

---------------------------
-- EXERCICIO 4 - C2-F2-TR

SELECT id,
       UPPER(nome) AS nome_maiusculo,
       iva,
       DECODE(iva,
              6, 'reduzida',
              12, 'intermedia',
              23, 'normal') AS taxa_iva
FROM produto
WHERE preco_unit_atual > 15
ORDER BY nome_maiusculo, iva ASC;

-- EXERCICIO 5 - C2-F2-TR

SELECT produto_id, desconto_unit_euros AS desconto_julho
FROM linha_venda
WHERE TO_CHAR(data, 'MON') LIKE ('%JUL%') AND desconto_unit_euros IS NOT NULL

