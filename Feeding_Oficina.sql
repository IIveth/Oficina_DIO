USE OFICINA;

-- Persistêcia dos dados
INSERT INTO Cliente (Nome, BI, Endereco, Telefone, Email) 
     VALUES
		('Carlos Mendes', '111222LA333', 'Rua E, 789', '5555-5555', 'carlos.mendes@example.com'),
		('Ana Souza', '444555KN666', 'Av. F, 101', '6666-6666', 'ana.souza@example.com'),
		('Pedro Alves', '777888LA999', 'Rua G, 202', '7777-7777', 'pedro.alves@example.com'),
		('Sofia Costa', '000111BL222', 'Av. H, 303', '8888-8888', 'sofia.costa@example.com');
  
INSERT INTO Veiculo (Placa, Marca, Modelo, Ano, Cliente_Id_Cliente) 
	VALUES
		('DEF5678', 'Ford', 'Focus', '2019', 3),
		('GHI9012', 'Chevrolet', 'Cruze', '2021', 4),
		('JKL3456', 'Volkswagen', 'Golf', '2017', 1),
		('MNO7890', 'BMW', 'X5', '2022', 2);
  SELECT * FROM Veiculo;      
INSERT INTO Servico (Descricao, Preco, Veiculo_Id_Veiculo)
	VALUES
		('Alinhamento e balanceamento', 150.00, 7),
		('Troca de pastilhas de freio', 200.00, 8),
		('Substituição de bateria', 250.00, 5),
		('Reparo no sistema de ar condicionado', 300.00, 6);
        
INSERT INTO Equipa (Nome) 
	VALUES
		('Equipa C'),
		('Equipa D');
        
INSERT INTO Mecanico (Nome, Endereco, Especialidade, Equipa_Id_Equipa, BI) 
	VALUES
		('Luís Fernandes', 'Rua I, 404', 'Suspensão', 1, '333444LA555'),
		('Rita Marques', 'Av. J, 505', 'Ar condicionado', 2, '666777KN888');
        
INSERT INTO Ordem_de_Servico (Numero_OS, Data_Emissao, Data_Conclusao, Status, Valor_Total, Equipa_Id_Equipa, Veiculo_Id_Veiculo) 
	VALUES
		('OS003', '2023-10-03', '2023-10-07', 'Concluído', 350.00, 2, 7),
		('OS004', '2023-10-04', NULL, 'Em andamento', 450.00, 1, 8),
		('OS005', '2023-10-05', '2023-10-09', 'Concluído', 500.00, 1, 5),
		('OS006', '2023-10-06', NULL, 'Em andamento', 400.00, 2, 6);
        
INSERT INTO Peca (Nome, Valor, Quantidade_Estoque) 
	VALUES
		('Bateria', 120.00, 20),
		('Compressor de ar condicionado', 300.00, 10),
		('Amortecedor', 80.00, 40),
		('Disco de freio', 60.00, 25);
        
INSERT INTO OS_Servico (Ordem_de_servico_Id_OS, Servico_Id_Servico, Quantidade, Observacao)
	VALUES
		(7, 1, 1, ' realizado'),
		(8, 2, 1, ' em andamento'),
		(5, 3, 1, ' realizada'),
		(6, 4, 1, ' em andamento');
  
INSERT INTO OS_Peca (Peca_Id_Peca, Ordem_de_servico_Id_OS, Quantidade, Valor_Total_Peca) 
	VALUES
		(1, 7, 1, 120.00),
		(2, 8, 2, 120.00),
		(3, 5, 1, 300.00),
		(4, 6, 1, 80.00);
        