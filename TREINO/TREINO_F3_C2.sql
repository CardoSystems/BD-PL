SELECT p.nome , NVL(TO_CHAR(l.desconto_unit_euros) , 'NAO PRESTA')
FROM produto p
    JOIN linha_venda l ON p.id = l.produto_id
WHERE LOWER(p.nome) LIKE '%philips%';

--3

SELECT '[' || l.cod || ']' || l.nome AS loja_cod_nome , LOWER(c.nome) AS NOME_D , UPPER(d.nome) AS NOME_2, TRUNC((SYSDATE - l.data_abertura) / 365)  
FROM distrito d
    JOIN concelho c ON d.id = c.distrito_id
    JOIN loja l ON c.id = l.concelho_id
WHERE d.id = 10;