### Produção total de uma cultura por estado em uma safra ###
SELECT Estado.nome, SUM(Produção.producao) AS producao_total
FROM Produção
JOIN Estado ON Produção.id_estado = Estado.id_estado
JOIN Cultura ON Produção.id_cultura = Cultura.id_cultura
WHERE Cultura.nome = 'Soja' AND Produção.ano = 2023
GROUP BY Estado.nome;


### Evolução da área plantada de uma cultura ao longo dos anos ###
SELECT Ano, SUM(Área_plantada) AS total_area
FROM Produção
JOIN Cultura ON Produção.id_cultura = Cultura.id_cultura
WHERE Cultura.nome = 'Milho'
GROUP BY Ano
ORDER BY Ano;

### Ranking dos estados com maior produtividade em uma cultura ###
SELECT Estado.nome, SUM(Produção.producao) / SUM(Produção.area_plantada) AS produtividade
FROM Produção
JOIN Estado ON Produção.id_estado = Estado.id_estado
JOIN Cultura ON Produção.id_cultura = Cultura.id_cultura
WHERE Cultura.nome = 'Soja'
GROUP BY Estado.nome
ORDER BY produtividade DESC;
