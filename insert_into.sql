INSERT INTO Produtos (nome, categoria, estoque_atual, estoque_minimo) VALUES
('Teclado', 'Periféricos', 50, 20),
('Mouse', 'Periféricos', 30, 15),
('Monitor', 'Vídeo', 20, 10),
('Notebook', 'Computador', 10, 5),
('Headset', 'Áudio', 15, 8);

-- Simule vendas (últimos 30 dias)
DECLARE @i INT = 1;
WHILE @i <= 30
BEGIN
    INSERT INTO Vendas (produto_id, data_venda, quantidade)
    VALUES 
    (1, DATEADD(DAY, -@i, GETDATE()), FLOOR(RAND()*5 + 1)),
    (2, DATEADD(DAY, -@i, GETDATE()), FLOOR(RAND()*4 + 1)),
    (3, DATEADD(DAY, -@i, GETDATE()), FLOOR(RAND()*3 + 1)),
    (4, DATEADD(DAY, -@i, GETDATE()), FLOOR(RAND()*2 + 1)),
    (5, DATEADD(DAY, -@i, GETDATE()), FLOOR(RAND()*4 + 1));
    SET @i = @i + 1;
END;