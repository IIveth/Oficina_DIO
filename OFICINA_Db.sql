CREATE database OFICINA;
USE OFICINA;

-- Tabela Cliente
CREATE TABLE Cliente (
    Id_Cliente INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(50) NOT NULL,
    BI VARCHAR(15) UNIQUE,
    Endereco VARCHAR(45),
    Telefone VARCHAR(25),
    Email VARCHAR(45) UNIQUE
);

-- Tabela Veiculo
CREATE TABLE Veiculo (
    Id_Veiculo INT PRIMARY KEY AUTO_INCREMENT,
    Placa VARCHAR(50) NOT NULL UNIQUE,
    Marca VARCHAR(45) NOT NULL,
    Modelo VARCHAR(45) NOT NULL,
    Ano VARCHAR(45),
    Cliente_Id_Cliente INT,
    FOREIGN KEY (Cliente_Id_Cliente) REFERENCES Cliente(Id_Cliente)
);

-- Tabela Servico
CREATE TABLE Servico (
    Id_Servico INT PRIMARY KEY AUTO_INCREMENT,
    Descricao VARCHAR(45) NOT NULL,
    Preco DECIMAL(10,2) NOT NULL CHECK (Preco >= 0),
    Veiculo_Id_Veiculo INT,
    FOREIGN KEY (Veiculo_Id_Veiculo) REFERENCES Veiculo(Id_Veiculo)
);

-- Tabela Equipa
CREATE TABLE Equipa (
    Id_Equipa INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(55) NOT NULL
);

-- Tabela Mecanico
CREATE TABLE Mecanico (
    Id_Mecanico INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,
    Endereco VARCHAR(45),
    Especialidade VARCHAR(35),
    Equipa_Id_Equipa INT,
    BI VARCHAR(25) UNIQUE,
    FOREIGN KEY (Equipa_Id_Equipa) REFERENCES Equipa(Id_Equipa)
);

-- Tabela Ordem_de_Servico
CREATE TABLE Ordem_de_Servico (
    Id_OS INT PRIMARY KEY AUTO_INCREMENT,
    Numero_OS VARCHAR(45) UNIQUE NOT NULL,
    Data_Emissao DATE NOT NULL DEFAULT (CURDATE()),
    Data_Conclusao DATE,
    Status VARCHAR(20) NOT NULL DEFAULT 'Em andamento',
    Valor_Total DECIMAL(10,2) CHECK (Valor_Total >= 0),
    Equipa_Id_Equipa INT,
    Veiculo_Id_Veiculo INT,
    FOREIGN KEY (Equipa_Id_Equipa) REFERENCES Equipa(Id_Equipa),
    FOREIGN KEY (Veiculo_Id_Veiculo) REFERENCES Veiculo(Id_Veiculo)
);

-- Tabela Peca
CREATE TABLE Peca (
    Id_Peca INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(50) NOT NULL,
    Valor DECIMAL(10,2) CHECK (Valor >= 0),
    Quantidade_Estoque INT CHECK (Quantidade_Estoque >= 0)
);

-- Tabela OS_Servico
CREATE TABLE OS_Servico (
    Ordem_de_servico_Id_OS INT,
    Servico_Id_Servico INT,
    Quantidade INT CHECK (Quantidade > 0),
    Observacao VARCHAR(18),
    PRIMARY KEY (Ordem_de_servico_Id_OS, Servico_Id_Servico),
    FOREIGN KEY (Ordem_de_servico_Id_OS) REFERENCES Ordem_de_Servico(Id_OS),
    FOREIGN KEY (Servico_Id_Servico) REFERENCES Servico(Id_Servico)
);

-- Tabela OS_Peca
CREATE TABLE OS_Peca (
    Peca_Id_Peca INT,
    Ordem_de_servico_Id_OS INT,
    Quantidade INT CHECK (Quantidade > 0),
    Valor_Total_Peca DECIMAL(10,2) CHECK (Valor_Total_Peca >= 0),
    PRIMARY KEY (Peca_Id_Peca, Ordem_de_servico_Id_OS),
    FOREIGN KEY (Peca_Id_Peca) REFERENCES Peca(Id_Peca),
    FOREIGN KEY (Ordem_de_servico_Id_OS) REFERENCES Ordem_de_Servico(Id_OS)
);

