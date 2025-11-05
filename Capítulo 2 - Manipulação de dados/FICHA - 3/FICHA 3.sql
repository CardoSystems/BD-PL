-- FICHA 3, PERGUNTA 1a)

SELECT
        nome AS produto_nome,
        categoria_id AS produto_cat_id
FROM
WHERE
ORDER BY nome ASC;

-- FICHA 3, PERGUNTA 1b)

-- se não colocarmos o tal "produto." vai dar o erro ORA-00918: column ambiguously defined pois a DB não tem a certeza qual a categoria que queremos, visto que NOME e definnido duas vezes

SELECT 
    produto.nome AS produto_nome,
    produto.categoria_id AS produto_cat_id,
    c.id AS categoria_id,
    c.nome AS categoria_nome
FROM 
    produto
JOIN 
    categoria c ON produto.categoria_id = c.id
WHERE 
    produto.iva = 23
ORDER BY 
    produto.nome ASC;

    -- FICHA 3, PERGUNTA 2 A)B) C)
    
    SELECT l.id,
            l.nome,
            l.concelho_id,
            c.nome AS concelho_nome,
            
    FROM loja 1
        JOIN concelho c ON l.concelho_id = c.id
        JOIN distrito d ON c.distrito_id = d.id
        
WHERE UPPER (l.nome) = 'ONLINE';

-- PERGUNTA 5

-- Considerar apenas as vendas feitas em junho de 2021
-- ac) Mostrar essas vendas

SELECT
    v.id AS venda_id,
    v.data,
    TO_CHAR(V.DATA,'YYYY/month') AS MÊS,
    produto_id
FROM venda v
            LEFT JOIN linha_venda ON v.id = linha_venda.venda_id
            

--FROM linha_venda RIGHT JOIN venda v ON v.id = linha_venda_id


-- PERGUNTA 7

-- QUERY A
SELECT c.nome
FROM concelho

-- QUERY B
SELECT DISTINCT concelho.nome --DISTINCT = Filtra duplicados
FROM concelho;
        JOIN loja ON loja.concelho_id = concelho.id;

-- QUERY A -- query B
SELECT nome
FROM concelho;
MINUS
SELECT DISTINCT concelho.nome --DISTINCT = Filtra duplicados
FROM concelho
            JOIN loja ON 



-- 7 c)

SELECT nome
FROM concelho
MINUS
SELECT '[D]' ||

-- PERGUNTA 9

SELECT '[D]' || nome AS regiões
FROM distrito
UNION
SELECT '[D]' || nome AS regiões
FROM concelho
ORDER BY regiões DESC













SELECT 
    id AS venda_id,
    data,
    TO_CHAR(data, 'yyyy/MONTH') AS MÊS
FROM venda
WHERE TO_CHAR (data, 'yyyy') = '2021'    
        AND TO_CHAR(data, 'mm') = '06';

-- TO_CHAR(data,'yyyy-mm') = '2021-06'


-- PERGUNTA 6

SELECT c.*, p.* -- ASTERISCO seleciona TODAS as COLUNAS
FROM categoria c JOIN produto p ON c.id = p.categoria_id
WHERE UPPER(c.nome) IN ('CEREAIS' , 'FRUTAS E LEGUMES' , 'FRUTOS SECOS');


T.P.C -> 3 e 4
            