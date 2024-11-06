-- Consultas Avançadas
--1. Consultar todos os Clientes
sql
SELECT * FROM client;
--2. Consultar os Produtos Disponíveis em um Local de Armazenamento Específico
sql
SELECT Pname, quantity 
FROM productStorage
JOIN product ON product.idProduct = productStorage.idProduct
WHERE storageLocation = 'São Paulo';
--3. Consultar as Ordens Confirmadas
sql
SELECT * FROM orders
WHERE orderStatus = 'Confirmado';
--4. Consultar Fornecedores e Seus Contatos
sql
SELECT SocialName, CNPJ, contact 
FROM supplier;
--5. Consultar Vendas por Categoria de Produto
sql
SELECT category, COUNT(*) AS total_vendas
FROM productOrder
JOIN product ON productOrder.idPOproduct = product.idProduct
GROUP BY category;
--6. Consultar Estoque Total de Cada Produto
SELECT Pname, SUM(quantity) AS total_em_estoque
FROM productStorage
JOIN product ON productStorage.idProduct = product.idProduct
GROUP BY Pname;
--7. Consultar Status de Pagamento dos Clientes
sql
SELECT client.Fname, client.Lname, payments.typePayment, payments.limitAvailable
FROM payments
JOIN client ON payments.idClient = client.idClient;
--8.Recupera todas as colunas e linhas da tabela client.
SELECT * FROM client;
--9 Filtra as ordens que têm o status 'Confirmado'.
SELECT * FROM orders
WHERE orderStatus = 'Confirmado';

--Criação de Expressões para Gerar Atributos Derivados
sql
SELECT idProduct, Pname, quantity * 2 AS double_quantity
FROM productStorage;
 
--Ordenação dos Dados com ORDER BY
sql
SELECT * FROM supplier
ORDER BY SocialName ASC;
-- Ordena os fornecedores em ordem alfabética pelo nome social (SocialName).

sql
SELECT category, COUNT(*) AS total_vendas
FROM productOrder
JOIN product ON productOrder.idPOproduct = product.idProduct
GROUP BY category
HAVING COUNT(*) > 2;
--Filtra categorias de produtos que têm mais de duas vendas.

--Junções entre Tabelas
sql
SELECT client.Fname, client.Lname, orders.orderDescription
FROM orders
JOIN client ON orders.idOrderClient = client.idClient;

--Consulta com Condição de Filtro e Ordenação:

SELECT clientPF.Fname, clientPF.Lname, orders.orderDescription, orders.trackingCode, orders.deliveryStatus
FROM orders
JOIN clientPF ON orders.idOrderClient = clientPF.idClient;
SELECT * FROM orders
WHERE orderStatus = 'Confirmado'
ORDER BY trackingCode ASC;

--Consulta com Agrupamento e Condição de Filtro:
SELECT clientPF.Fname, clientPF.Lname, COUNT(orders.idOrder) AS total_orders
FROM orders
JOIN clientPF ON orders.idOrderClient = clientPF.idClient
GROUP BY clientPF.idClient
HAVING COUNT(orders.idOrder) > 1;