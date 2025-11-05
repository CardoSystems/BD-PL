-- FICHA 2 

-- ex1 -- Criar query para projetar o nome e preço unitário atual dos produtos que custam mais de 9.99 euros (osmais baratos primeiro).

SELECT nome AS nome_produto,                                                    
        preco_unit_atual AS preco_unitario_produto --criamos uma alias para usarmos das duas smaneira
FROM PRODUTO -- tabela PRODUTO
WHERE preco_unit_atual > 9.99 --deita fora tudo o que nao sejam produtos que nao sejam
ORDER BY preco_unit_atual ASC;
--ORDER BY 2 ASC -- ORDENA APENAS A 2 COLUNA DA TABELA


-- ex2 -- Criar query para projetar o nome e identificador dos produtos que não têm marca.
SELECT id, nome
FROM produto
WHERE marca IS NULL; --a marca esta vazia logo fazemos assim

-- ex3 -- Criar query para projetar o nome dos produtos que têm marca, ordenados por ordem alfabética de marca.

SELECT nome || ' [' || marca || ']' AS produtos_com_marca -- 
FROM produto   
WHERE marca IS NOT NULL
ORDER BY marca ASC;


-- ex4 --
-- Criar query para apresentar a categria
-- as suas subcategorias (primeiro, a 

SELECT nome
FROM categoria
where id = 1 OR categoria_pai_id =1; -- Não pode ser AND porque não satisfaz a condição

--   ex5   -- calcular iva de produtos especificoa

SELECT nome,
            preco_unit_atual AS preco_sem_iva,
            preco_unit_atual+(1+iva/100) AS preco_com_iva
    FROM produto
WHERE categoria_id IN (6,20)

--  ex7   --

SELECT cod AS loja,
        TO_CHAR (data_abertura, 'yyyy') ano_abertura
FROM loja
ORDER BY data_abertura ASC;


---   ex8   ---

-- ver ROUND -- 
SELECT 
    UPPER(NOME) AS NOME, 
    TRUNC(PRECO_UNIT_ATUAL, 1) AS PRECO_UNIT_ATUAL
FROM produto
WHERE  categoria_id IN (7, 18);



---   ex9 ---
-- a)
SELECT id AS id_produto,
        LOWER(nome) AS nome,
        NVL (TO_CHAR(categoria_pai_id),  'n/a') AS cat_pai -- 9b
FROM    categoria;



-- b)
SELECT id AS id_produto,
        LOWER(nome) AS nome,
        NVL (TO_CHAR(categoria_pai_id),  'n/a') AS cat_pai -- 9b
FROM    categoria;

--- ex12   ---
--   a)
SELECT nome, trunc(sysdate - DATA_ABERTURA) AS dias_que_passaram --  Parecido com o round, mas apenas retira a parte frácionária || SYSDATE  Data do sistema da BD
FROM loja;

    LOWER (nome) LIKE 'contente%',;
    -- UPPER (nome) LIKE 'CONTENTE%';

-- b)

SELECT nome AS nome_loja,
        TRUNC(MONTHS_BETWEEN(SYSDATE, data_abertura) /12) AS meses_que_ja_passaram 
    FROM loja
    WHERE
        LOWER (nome) LIKE 'contente%';

    -- UPPER

--
-- MOstrar há quantos MESES abriram