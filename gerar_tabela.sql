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
