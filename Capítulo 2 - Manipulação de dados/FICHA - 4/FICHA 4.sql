-- Ficha 4 

--Ex 1 a
SELECT COUNT(*) AS total_categorias
FROM categoria; 

--Ex 1 b
SELECT COUNT(*) AS total_categorias_com_pai
FROM categoria
WHERE categoria_pai_id IS NOT NULL;

-- Ex 1 c
SELECT COUNT(*) AS total_categorias_com_pai
FROM categoria;
-- Ex 1 c (Diferente)
SELECT COUNT(categoria_pai_id) AS total_categorias_com_pai,
        COUNT (*) AS total_categoria
FROM categoria;


-- Ex 1 d (Este 1º exemplo está mal, pois no exercicio não se pode usar filtragem)
SELECT COUNT(*) AS total_categorias_com_pai
FROM categoria
WHERE categoria_pai_id IS NULL;

-- Não entendi!! --> Pergunt.
SELECT COUNT(*) - COUNT(categoria_pai_id) AS total_categorias_sem_pai
FROM categoria

-- Ex 2
SELECT COUNT(*) AS total_iva_23
        TRUNC(AVG(preco_unit_atual
FROM produto
WHERE iva = 23;


-- Ex 3
--3. Quando foi feita a primeira venda de todas
SELECT TO_CHAR (MIN(data), 'dd/MON/yyyy') AS data_da_primeira

SELECT MIN (data) AS data_da_primeira_venda
FROM venda;

-- PERGUNTA 4-- contar qunatos prdutos ha nas categorias FRUTAS E LEGUMES E ARAMAZENAMENTO
SELECT COUNT (*) AS  TOTAL_PRODUTOS, CATEGORIA.NOME
FROM produto
        JOIN categoria ON produto.categoria_id = categoria.id
WHERE categoria.nome IN ('ARMAZENAMENTO','FRUTAS E LEGUMES')
GROUP BY categoria.nome;


-- EX4

    SELECT categoria.nome AS categoria_nome, COUNT(*) AS total_produtos
    FROM produto
            JOIN categroia ON produto.categoria
            
            
            
            
            
-- pergunta 5

-- a) contar quantas vendas ocorreram por mes
SELECT TO_CHAR (data ,'mm-yyyy') AS mês, COUNT (*) AS total_vendas
FROM  venda
GROUP BY TO_CHAR(data , 'mm-yyyy')
ORDER BY mês ASC;

-- falta o b) e o c)

-- EX7

--Para as categorias: a) Apresentar apenas as que tem 2 ou mias produtos

SELECT COUNT(*), categoria.nome
FROM categoria JOIN produto ON produto.categoria_id = categoria_id = categoria.id
GROUP BY categoria.nome
HAVING COUNT (*) >=2;

        
        