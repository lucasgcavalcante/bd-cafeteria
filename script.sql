-- Tabela de produtos (cafés, lanches, etc.)
CREATE TABLE produtos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    preco DECIMAL(10, 2),
    estoque INT
);

-- Tabela de pedidos
CREATE TABLE pedidos (
    id SERIAL PRIMARY KEY,
    cliente_nome VARCHAR(100),
    data_pedido DATE
);

-- Tabela intermediária: itens do pedido
CREATE TABLE itens_pedido (
    pedido_id INT,
    produto_id INT,
    quantidade INT,
    FOREIGN KEY (pedido_id) REFERENCES pedidos(id),
    FOREIGN KEY (produto_id) REFERENCES produtos(id),
    PRIMARY KEY (pedido_id, produto_id)
);

-- Inserindo produtos
INSERT INTO produtos (nome, preco, estoque) VALUES 
('Café Expresso', 5.50, 50),
('Cappuccino', 7.00, 30),
('Pão de Queijo', 4.00, 40);

-- Inserindo pedidos
INSERT INTO pedidos (cliente_nome, data_pedido) VALUES
('Lucas Menezes', '2025-04-10'),
('Clara Martins', '2025-04-11'),
('Rafael Souza', '2025-04-12');

-- Inserindo itens dos pedidos
INSERT INTO itens_pedido (pedido_id, produto_id, quantidade) VALUES
(1, 1, 2),
(1, 3, 1),
(2, 2, 1),
(3, 1, 1),
(3, 2, 2);