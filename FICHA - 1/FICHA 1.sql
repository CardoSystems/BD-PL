SELECT nome, marca   --selecionamos a coluna NOME
FROM produto -- Selecinamos a coluna PRODUTO
ORDER BY NOME ASC;   -- ordenamos alfabeticamente a coluna NOMES de forma descendente

UPDATE produto
SET marca = 'KINGSTON' --atualiza a coluna MARCA para todos terem a marca KINGSTON
WHERE marca = 'QINGSTON'; -- Especifica que apenas queremos alterar as linhas ond etem QINGSTON = KINGSTON

COMMIT;

ROLLBACK; -- Desfaz qualquer UPDATE que nao tenhamos feito ainda commit, ( volta a KINGSTON ) (Executamos o comando SELECT depois do ROLLBACK

-- CREATE = INSERT   ||| READ = SELECT ||| UPDATE