# Projeto de Modelagem de Banco de Dados - Produção Agrícola no Brasil

## Descrição do Projeto

Este projeto visa criar um modelo de banco de dados que armazene e analise informações sobre a produção agrícola no Brasil, utilizando dados de órgãos como CONAB, IBGE, MAPA, Embrapa, INPE e CNABRASIL. O modelo foi desenvolvido em grupo e inclui as fases de modelagem conceitual, normalização e implementação SQL.

## Etapas do Projeto

### 1. Pesquisa e Escolha dos Dados
A pesquisa foi realizada utilizando dados sobre a produção agrícola no Brasil, disponíveis nos sites de **CONAB**, **IBGE**, **MAPA**, **Embrapa**, **INPE**, e **CNABRASIL**. A escolha final recaiu sobre a **série histórica de produção de grãos por estado** para analisar a evolução da produção de diferentes culturas ao longo dos anos.

### 2. Modelagem Conceitual
A modelagem foi realizada utilizando o **Modelo Entidade-Relacionamento (MER)**. As principais entidades identificadas foram:
- **Cultura** (ex: Soja, Milho)
- **Estado** (ex: São Paulo, Minas Gerais)
- **Safra** (ano de produção)
- **Produtor** (opcional, se aplicável)

Os relacionamentos entre as entidades foram definidos da seguinte forma:
- **Estado - Produção**: Um estado tem várias produções de diferentes culturas.
- **Cultura - Produção**: Cada produção é associada a uma cultura específica.
- **Safra - Produção**: Cada safra tem registros de produção de uma ou mais culturas.

### 3. Normalização
O modelo foi normalizado nas 3 primeiras formas normais (1FN, 2FN, 3FN), garantindo que:
- Todos os atributos sejam atômicos (1FN).
- Não haja dependências parciais (2FN).
- Não existam dependências transitivas (3FN).

### 4. Modelo Lógico Relacional
O modelo lógico relacional foi criado com base no modelo conceitual, convertendo as entidades em tabelas e definindo as chaves primárias e estrangeiras.

### 5. Código SQL
O código SQL foi gerado para criar as tabelas e os relacionamentos no banco de dados. Um exemplo de criação da tabela `Produção` é mostrado abaixo:

```sql
CREATE TABLE Cultura (
    id_cultura INT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    tipo VARCHAR(100)
);

CREATE TABLE Estado (
    id_estado INT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    codigo_ibge INT NOT NULL
);

CREATE TABLE Produção (
    id_producao INT PRIMARY KEY,
    id_cultura INT,
    id_estado INT,
    ano INT,
    area_plantada DECIMAL(10, 2),
    producao DECIMAL(10, 2),
    FOREIGN KEY (id_cultura) REFERENCES Cultura(id_cultura),
    FOREIGN KEY (id_estado) REFERENCES Estado(id_estado)
);
