CREATE TABLE cliente (
    id NUMBER(9) GENERATED AS IDENTITY (START WITH 1 INCREMENT BY 1), -- (START WITH 1 INCREMENT BY 1) apenas pertence ao GENERATED AS IDENTITY --número máximo NUMBER(9)
    
    nif VARCHAR2(9), --variable char, 2 porque tem mais funcionalidades, segunda versão
    
    nome VARCHAR2(50) NOT NULL, -- [min=1; max=50]
    
    data_nascimento DATE,
    
    data_adesao DATE DEFAULT(SYSDATE) NOT NULL, -- se não for colocada a data, o sistema vai colocar por omissão a data do sistema atual
    
    genero VARCHAR2(1) DEFAULT('F'), -- por omissão coloca F, se nao quisermos nao colocamos o default
    
    concelho_id NUMBER(4) NOT NULL, 
    
    -- REGRAS
    
    CONSTRAINT pk_cliente PRIMARY KEY(id),    --CONSTRAINT é uma regra que vamos colocar na criação desta tabela
    
    CONSTRAINT uq_cliente_nif UNIQUE(nif), --constrangimentos, são regras que a tabela tem de obedecer
    
    --CONSTRAINT ck_cliente_nif CHECK(nif LIKE '2%') --[inicia em 2 ou 5] porém era possível colocar nao só numéros mas também caracteres o que seria uma falha
    
    CONSTRAINT ck_cliente_nif CHECK(REGEXP_LIKE(nif, '^(2|5)\d{8}')), -- ^ no inicio da string tem de estar algo dentro do conjunto tem de comeaçar em (2|5) onde a seguir só quero digitos com \d, (porque se só coloca-se d iria imprimir na segunda célula um d) com um máximo de oito caracteres {8}
    
    CONSTRAINT ck_cliente_nome CHECK(REGEXP_LIKE(nome, '^[A-Z]')), -- TPC como é que podemos colocar o "Á"lvaro como a primeiro caracter
    
    --CONSTRAINT ck_cliente_datanascim CHECK (data_nascim <= SYSDATE) --armadilha, não se utiliza SYSDATE
    
    CONSTRAINT ck_cliente_genero CHECK(genero IN ('F', 'M', 'O')),
    
    --CONSTRAINT ck_cliente_genero CHECK(REGEXP_LIKE(genero, '^(F,M,O)')),
    
    CONSTRAINT fk_cliente_concelhoid FOREIGN KEY(concelho_id)
    
               REFERENCES concelho(id)
               
               
);
COMMIT;

INSERT INTO cliente (nome, nif, data_nascimento, concelho_id, genero) 
VALUES('Maria Gargalhada', '220101001', TO_DATE('1980-10-12', 'yyyy-mm-dd'),
        (SELECT id FROM concelho WHERE UPPER(nome) LIKE 'COIMBRA'), 'F'); -- TO_CHAR (string, para uma data) | só nao aplicamos plicas em funções

INSERT INTO cliente (nome,data_adesao,concelho_id)
VALUES('Anónimo', TO_DATE('1900-01-01', 'yyyy-mm-dd'), (SELECT id FROM concelho WHERE UPPER(nome) LIKE 'PORTO'));

INSERT INTO cliente (nome,data_adesao,concelho_id)
VALUES('teste', TO_DATE('2005-03-04', 'yyyy-mm-dd'), (SELECT nome FROM concelho WHERE UPPER(nome) LIKE 'PORTO'));

--porque motivo no SELECT não aparece o nome do concelho