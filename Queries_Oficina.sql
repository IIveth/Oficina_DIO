USE OFICINA;

-- Recuperar todos os clientes e seus veículos
SELECT c.Nome AS Cliente, v.Placa, v.Marca, v.Modelo
FROM Cliente c
JOIN Veiculo v ON c.Id_Cliente = v.Cliente_Id_Cliente;

-- Listar todas as ordens de serviço com status 'Em andamento'
SELECT os.Numero_OS, os.Data_Emissao, os.Data_Conclusao, os.Status, c.Nome AS Cliente
FROM Ordem_de_Servico os
JOIN Veiculo v ON os.Veiculo_Id_Veiculo = v.Id_Veiculo
JOIN Cliente c ON v.Cliente_Id_Cliente = c.Id_Cliente
WHERE os.Status = 'Em andamento';

-- Listar todas as ordens de serviço com status 'Concluido'
SELECT os.Numero_OS, os.Data_Emissao, os.Data_Conclusao, os.Status, c.Nome AS Cliente
FROM Ordem_de_Servico os
JOIN Veiculo v ON os.Veiculo_Id_Veiculo = v.Id_Veiculo
JOIN Cliente c ON v.Cliente_Id_Cliente = c.Id_Cliente
WHERE os.Status = 'Concluido';

-- Recuperar o valor total gasto por cada cliente
SELECT c.Nome, SUM(os.Valor_Total) AS Total_Gasto
FROM Cliente c
JOIN Veiculo v ON c.Id_Cliente = v.Cliente_Id_Cliente
JOIN Ordem_de_Servico os ON v.Id_Veiculo = os.Veiculo_Id_Veiculo
GROUP BY c.Nome;

-- Recuperar o número de ordens de serviço por status
SELECT Status, COUNT(*) AS Total_Ordens
FROM Ordem_de_Servico
GROUP BY Status;

-- Listar todas as peças usadas em ordens de serviço concluídas
SELECT p.Nome, osp.Quantidade, osp.Valor_Total_Peca
FROM Peca p
JOIN OS_Peca osp ON p.Id_Peca = osp.Peca_Id_Peca
JOIN Ordem_de_Servico os ON osp.Ordem_de_servico_Id_OS = os.Id_OS
WHERE os.Status = 'Concluído';

-- Listar mecânicos e suas especialidades
SELECT m.Nome, m.Especialidade, e.Nome AS Equipa
FROM Mecanico m
JOIN Equipa e ON m.Equipa_Id_Equipa = e.Id_Equipa;

-- Recuperar o valor total de peças em estoque
SELECT SUM(Valor * Quantidade_Estoque) AS Valor_Total_Estoque
FROM Peca;

-- Listar os serviços mais caros
SELECT Descricao, Preco
FROM Servico
ORDER BY Preco DESC
LIMIT 5;

-- Mecânicos que realizaram mais de 2 serviços
SELECT m.Nome, COUNT(os.Id_OS) AS Total_Servicos
FROM Mecanico m
JOIN Equipa e ON m.Equipa_Id_Equipa = e.Id_Equipa
JOIN Ordem_de_Servico os ON e.Id_Equipa = os.Equipa_Id_Equipa
GROUP BY m.Nome
HAVING Total_Servicos > 1;

-- Listar todos os serviços ordenados pelo preço em ordem decrescente
SELECT Descricao, Preco
FROM Servico
ORDER BY Preco DESC;

-- Listar todas as ordens de serviço ordenadas pela data de emissão
SELECT Numero_OS, Data_Emissao, Status
FROM Ordem_de_Servico
ORDER BY Data_Emissao;

-- Mecânicos que realizaram mais de 1 serviço, ordenados pelo número de serviços realizados em ordem decrescente
SELECT m.Nome, COUNT(os.Id_OS) AS Total_Servicos
FROM Mecanico m
JOIN Equipa e ON m.Equipa_Id_Equipa = e.Id_Equipa
JOIN Ordem_de_Servico os ON e.Id_Equipa = os.Equipa_Id_Equipa
GROUP BY m.Nome
HAVING Total_Servicos > 1
ORDER BY Total_Servicos DESC;