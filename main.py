import pyodbc
import pandas as pd

# Conexão com o banco de dados
conn = pyodbc.connect(
    'DRIVER={SQL Server};'
    'SERVER=(local)\\SQLEXPRESS;'
    'DATABASE=EstoqueInteligente;'
    'Trusted_Connection=yes;'
)

# Consulta SQL para pegar as vendas e produtos
query = """
SELECT
    p.nome,
    p.estoque_atual,
    v.data_venda,
    SUM(v.quantidade) AS total_vendido
FROM
    Vendas v
JOIN
    Produtos p ON v.produto_id = p.id
GROUP BY
    p.nome, p.estoque_atual, v.data_venda
ORDER BY
    p.nome, v.data_venda;
"""

df = pd.read_sql(query, conn)

df['data_venda'] = pd.to_datetime(df['data_venda'])

print(df.head())

df['media_movel'] = df.groupby('nome')['total_vendido'].transform(
    lambda x: x.rolling(window=3, min_periods=1).mean()
)

print(df[['nome', 'estoque_atual', 'data_venda',
      'total_vendido', 'media_movel']].head())

df['previsao_reposicao'] = df['estoque_atual'] - df['media_movel']

print(df[['nome', 'estoque_atual', 'previsao_reposicao']].tail())

df.to_excel("relatorio_estoque.xlsx", index=False, engine="openpyxl")
print("Arquivo Excel salvo com sucesso!")
