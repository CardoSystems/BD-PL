CREATE TABLE cliente(
    id          NUMBER(9) GENERATED AS IDENTITY (START WITH 1 INCREMENT BY 1), -- num MAXIMO NUMBER (9) PARA O MINIMO E DIFERENTE IDENTITY -> identificador
    nif VARCHAR2(9),
    nome VARCHAR2(50) NOT NULL,
    data_nascimento DATE,
    data_adesao DATE DEFAULT SYSDATE NOT NULL ,
    genero VARCHAR2(1) DEFAULT('F'),
    concelho_id, NUMBER(4) NOT NULL,
    
    CONSTRAINT pk_cliente PRIMARY KEY (id), -- nome da regra tem de ser unica PRIMARY KEY --> ja garante preenchimento a valores nulos
    
    CONSTRAINT uq_cliente_nif UNIQUE (nif),  -- Ensures each NIF (tax ID) is unique across all client records
    
    CONSTRAINT ck_cliente_nif CHECK (REGEXP_LIKE(nif,'^(2|5)\d[8]')), -- Validates NIF format, ensuring it starts with 2 or 5 and contains exactly 8 digits
    
    CONSTRAINT ck_cliente_nome CHECK (REGEXP_LIKE(nome, '^[A-Z]')), -- Validates that the client name begins with a capital letter
    
    -- CONSTRAINT ck_cliente_datanascim CHECK (data_COMPRA<=SYSDATE)
    
    CONSTRAINT ck_cliente_genero CHECK (genero IN ('F', 'M', 'O'),
    
    CONSTRAINT fk_cliente_concelhoid FOREIGN KEY (concelho_id),
    
    -- NAO se pode usar SYSDATE com CONSTRAINT
    
                                    REFERENCES concelho(id)
    };
    
    
    INSERT INTO cliente (nome, nif,data_nascimento,concelho_id,genero)
    VALUES ('Maria Gargalhada','22010100',TO_DATE('1980-12-10', 'yyyy-dd-mm'), (SELECT id FROM concelho WHERE UPPER(nome) LIKE 'COIMBRA'), 'F';--TO_DATE a data deve ser sempre com numeros para não existir redundancia--> Converte Strings para datas

    INSERT INTO cliente (nome,data_adesao,conselho)
    
    
    
