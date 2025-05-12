# 🧠 Sistema Inteligente de Otimização de Estoque

Projeto simples e funcional em Python que realiza previsões de reposição de estoque com base no histórico de vendas, integrando com SQL Server e exportando relatórios para uso em Power BI.

---

## 🚀 Funcionalidades

- Conexão com banco de dados SQL Server via `pyodbc`
- Cálculo de **média móvel** para prever a demanda
- Geração de coluna com **previsão de reposição**
- Exportação dos resultados para **Excel (.xlsx)** e **CSV**
- Pronto para integração com **Power BI**

---

## ⚙️ Tecnologias Utilizadas

- Python 3.13  
- pandas  
- pyodbc  
- openpyxl  
- SQL Server  
- Power BI (visualização)

---

## 📦 Como usar

1. **Clone o repositório**
   ```bash
   git clone https://github.com/seu-usuario/smart_stock.git
   cd smart_stock
   
2. **Instale as dependências**
   ```bash
   pip install pandas pyodbc openpyxl

3. **Configure a string de conexão no main.py**
   ```bash
   conn = pyodbc.connect(
    'DRIVER={SQL Server};SERVER=localhost\\SQLEXPRESS;DATABASE=EstoqueInteligente;Trusted_Connection=yes;')

4. **Execute o script**
   ```bash
   python main.py

5. **Veja o relatório gerado**
- relatorio_estoque.xlsx 
- relatorio_estoque.csv
