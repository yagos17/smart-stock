CREATE TABLE Produtos (
    id INT PRIMARY KEY IDENTITY,
    nome VARCHAR(100),
    categoria VARCHAR(50),
    estoque_atual INT,
    estoque_minimo INT
);

CREATE TABLE Vendas (
    id INT PRIMARY KEY IDENTITY,
    produto_id INT,
    data_venda DATE,
    quantidade INT,
    FOREIGN KEY (produto_id) REFERENCES Produtos(id)
);

CREATE TABLE Reposicoes (
    id INT PRIMARY KEY IDENTITY,
    produto_id INT,
    data_reposicao DATE,
    quantidade INT,
    FOREIGN KEY (produto_id) REFERENCES Produtos(id)
);