-- EXERCICIO 1 - C2-F1-TR

SELECT LOWER(nome) AS nome
FROM concelho
WHERE distrito_id = 10;
---------------------------

-- EXERCICIO 2 - C2-F1-TR

SELECT venda_id AS "id_da_venda", preco_unit_venda AS preco_unit_venda
FROM linha_venda
WHERE produto_id = 1060

---------------------------
-- EXERCICIO 3 - C2-F1-TR

SELECT nome, marca, preco_unit_atual
FROM produto
WHERE categoria_id IN (3, 7) AND preco_unit_atual > 1.5
ORDER BY preco_unit_atual ASC;

---------------------------
-- EXERCICIO 4 - C2-F1-TR A)
INSERT INTO linha_vendas(identificador, data, produto, preco_unit_venda AS "preço unitário da venda", unidades,

---------------------------

