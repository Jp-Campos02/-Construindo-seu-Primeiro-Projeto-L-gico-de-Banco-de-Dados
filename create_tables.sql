-- Criando as tabelas--
CREATE TABLE client (
    idClient SERIAL PRIMARY KEY,
    Fname VARCHAR(10),
    Minit CHAR(3),
    Lname VARCHAR(20),
    CPF CHAR(11) NOT NULL,
    Address VARCHAR(300),
    CONSTRAINT unique_cpf_client UNIQUE (CPF)
);
ALTER TABLE product
    ALTER COLUMN pname TYPE VARCHAR(30);

-- Primeiro criamos o tipo ENUM para a categoria
CREATE TYPE category_enum AS ENUM ('Eletrônico', 'Vestimenta', 'Brinquedos', 'Alimentos', 'Móveis') ;

-- Agora criamos a tabela produto
CREATE TABLE product (
    idProduct SERIAL PRIMARY KEY,
    Pname VARCHAR(10) NOT NULL,
    classification_kids BOOLEAN DEFAULT FALSE,
    category category_enum NOT NULL,
    avaliação FLOAT DEFAULT 0,
    size VARCHAR(10),
    CPF CHAR(11),
    FOREIGN KEY (CPF) REFERENCES client(CPF)
);
-- Primeiro criamos o tipo ENUM para o status do pedido
CREATE TYPE order_status_enum AS ENUM ('Cancelado', 'Confirmado', 'Em processamento');

-- Agora criamos a tabela Pedido
CREATE TABLE orders (
    idOrder SERIAL PRIMARY KEY,
    idOrderClient INT,
    orderStatus order_status_enum NOT NULL,
    orderDescription VARCHAR(255),
    sendValue FLOAT DEFAULT 10,
    CONSTRAINT fk_orders_client FOREIGN KEY (idOrderClient) REFERENCES client(idClient)
);
-- Tabela Pagamentos
-- para ser continuado no desafio: termine de implementar a tabela e crie a conexão com as tabelas necessárias
-- além disso, reflita essa modificação no diagrama de esquema relacional
--Pagamento
CREATE TYPE payment_enum AS ENUM ('Boleto', 'Cartão', 'Dois cartões');

CREATE TABLE payments (
    idClient INT,
    idPayment SERIAL,
    typePayment payment_enum,
    limitAvailable FLOAT,
    PRIMARY KEY (idClient, idPayment),
    FOREIGN KEY (idClient) REFERENCES client(idClient)
);

-- Criar tabela estoque
CREATE TABLE productStorage (
    idProdStorage SERIAL PRIMARY KEY,
    storageLocation VARCHAR(255),
    quantity INT DEFAULT 0
);

-- Criar tabela fornecedor 
CREATE TABLE supplier (
    idSupplier SERIAL PRIMARY KEY,
    SocialName VARCHAR(255) NOT NULL,
    CNPJ CHAR(15) NOT NULL,
    contact CHAR(11) NOT NULL,
    CONSTRAINT unique_supplier UNIQUE (CNPJ)
);



-- Criar tabela Vendedor
CREATE TABLE seller (
    idseller SERIAL PRIMARY KEY,
    SocialName VARCHAR(255) NOT NULL,
    AbstName VARCHAR(255),
    CNPJ CHAR(15),
    CPF CHAR(9),
    location VARCHAR(255),
    contact CHAR(11) NOT NULL,
    CONSTRAINT unique_cnpj_seller UNIQUE (CNPJ),
    CONSTRAINT unique_cpf_seller UNIQUE (CPF)
);

-- Criar tabeala relação produto/vendedor
CREATE TABLE productSeller (
    idPseller INT,
    idProduct INT,
    prodQuantity INT DEFAULT 1,
    PRIMARY KEY (idPseller, idProduct),
    CONSTRAINT fk_product_seller FOREIGN KEY (idPseller) REFERENCES seller(idSeller),
    CONSTRAINT fk_product_product FOREIGN KEY (idProduct) REFERENCES product(idProduct)
);


-- Criar tabeala relação produto/pedido
-- Primeiro criamos o tipo ENUM para o status do pedido
CREATE TYPE po_status_enum AS ENUM ('Disponível', 'Sem estoque');

-- Agora criamos a tabela productOrder
CREATE TABLE productOrder (
    idPOproduct INT,
    idPOorder INT,
    pqQuantity INT DEFAULT 1,
    poStatus po_status_enum DEFAULT 'Disponível',
    PRIMARY KEY (idPOproduct, idPOorder),
    CONSTRAINT fk_product_seller FOREIGN KEY (idPOproduct) REFERENCES product(idProduct),
    CONSTRAINT fk_product_product FOREIGN KEY (idPOorder) REFERENCES orders(idOrder)
);

-- Criar tabeala relação estoque/localização
CREATE TABLE storageLocation (
    idLproduct INT,
    idLstorage INT,
    location VARCHAR(255) NOT NULL,
    PRIMARY KEY (idLproduct, idLstorage),
    CONSTRAINT fk_product_seller FOREIGN KEY (idLproduct) REFERENCES product(idProduct),
    CONSTRAINT fk_product_storage FOREIGN KEY (idLstorage) REFERENCES productStorage(idProdStorage)
);
-- Refinamento

CREATE TABLE clientPF (
    idClient SERIAL PRIMARY KEY,
    Fname VARCHAR(50) NOT NULL,
    Lname VARCHAR(50) NOT NULL,
    CPF CHAR(11) UNIQUE NOT NULL,
    Address VARCHAR(300)
);
CREATE TABLE clientPJ (
    idClient SERIAL PRIMARY KEY,
    SocialName VARCHAR(100) NOT NULL,
    CNPJ CHAR(14) UNIQUE NOT NULL,
    Address VARCHAR(300)
);
CREATE TABLE payments (
    idPayment SERIAL PRIMARY KEY,
    idClient INT NOT NULL,
    typePayment payment_enum NOT NULL,
    limitAvailable FLOAT,
    FOREIGN KEY (idClient) REFERENCES clientPF(idClient) ON DELETE CASCADE
);
DROP TYPE IF EXISTS payment_enum;

CREATE TYPE payment_enum AS ENUM ('Boleto', 'Cartão', 'Dois cartões');


CREATE TABLE orders (
    idOrder SERIAL PRIMARY KEY,
    idOrderClient INT NOT NULL,
    orderStatus order_status_enum DEFAULT 'Pending',
    orderDescription TEXT,
    sendValue FLOAT,
    paymentCash BOOLEAN,
    deliveryStatus delivery_status_enum DEFAULT 'Pending',
    trackingCode VARCHAR(50),
    FOREIGN KEY (idOrderClient) REFERENCES clientPF(idClient) ON DELETE CASCADE
);
