--Inserção de Tuplas
INSERT INTO Client (Fname, Minit, Lname, CPF, Address) VALUES
('Maria', 'M', 'Silva', '12346789', 'rua silva de prata 29, Carangola - Cidade das flores'),
('Matheus', 'O', 'Pimentel', '987654321', 'rua alemeda 289, Centro - Cidade das flores'),
('Ricardo', 'F', 'Silva', '45678913', 'avenida alemeda vinha 1009, Centro - Cidade das flores'),
('Julia', 'S', 'França', '789123456', 'rua lareijras 861, Centro - Cidade das flores'),
('Roberta', 'G', 'Assis', '98745631', 'avenidade koller 19, Centro - Cidade das flores'),
('Isabela', 'M', 'Cruz', '654789123', 'rua alemeda das flores 28, Centro - Cidade das flores');

INSERT INTO product (Pname, classification_kids, category, avaliação, size) VALUES
('Fone de ouvido', false, 'Eletrônico', 4, NULL),
('Barbie Elsa', true, 'Brinquedos', 3, NULL),
('Body Carters', true, 'Vestimenta', 5, NULL),
('Microfone Vedo - Youtuber', false, 'Eletrônico', 4, NULL),
('Sofá retrátil', false, 'Móveis', 3, '3x57x80');


INSERT INTO orders (idOrderClient, orderStatus, orderDescription, sendValue) VALUES
(1, DEFAULT, 'compra via aplicativo', DEFAULT),
(2, DEFAULT, 'compra via aplicativo', 50),
(3, 'Confirmado', DEFAULT, DEFAULT),
(4, DEFAULT, 'compra via web site', 150);





INSERT INTO productOrder (idPOproduct, idPOorder, pqquantity, poStatus) VALUES
(1, 1, 2, DEFAULT),
(2, 1, 1, DEFAULT),
(3, 2, 1, DEFAULT);

INSERT INTO productStorage (storageLocation, quantity) VALUES
('Rio de Janeiro', DEFAULT),
('Rio de Janeiro', 500),
('São Paulo', 10),
('São Paulo', 100),
('São Paulo', 10),
('Brasília', 60);


INSERT INTO storageLocation (idLproduct, idLstorage, location) VALUES
(1, 2, 'R1'),
(2, 6, 'G0');

INSERT INTO supplier (SocialName, CNPJ, contact) VALUES
('Almeida e filhos', '123456789123456', '21985474'),
('Eletrônicos Silva', '854519649143457', '21985484'),
('Eletrônicos Valma', '934567893934695', '21975474');


INSERT INTO seller (SocialName, AbstName, CNPJ, CPF, location, contact) VALUES
('Tech eletronics', DEFAULT, '123456789456321', DEFAULT, 'Rio de Janeiro', '219946287'),
('Botique Durgas', DEFAULT, DEFAULT, '123456783', 'Rio de Janeiro', '219567895'),
('Kids World', DEFAULT, '456789123654485', DEFAULT, 'São Paulo', '1198657484');


INSERT INTO productSeller (idPSeller, idPProduct, prodQuantity) VALUES 
(1, 6, 80),
(2, 7, 10);

