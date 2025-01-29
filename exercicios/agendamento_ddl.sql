-- Tabela Pessoa
CREATE TABLE Pessoa (
    cpf CHAR(11) PRIMARY KEY, 
    email VARCHAR(50) NOT NULL, 
    nome VARCHAR(150) NOT NULL,
    data_nasc DATE NOT NULL,
    endereco VARCHAR(300) NOT NULL, 
    telefone VARCHAR(15), 
    CONSTRAINT unique_email_nome UNIQUE (email, nome)
);

-- Tabela Paciente
CREATE TABLE Paciente (
    cpf_pessoa CHAR(11) PRIMARY KEY, 
    senha VARCHAR(10) NOT NULL, 
    plano_saude BOOLEAN NOT NULL, 
    CONSTRAINT fk_paciente_pessoa FOREIGN KEY (cpf_pessoa) REFERENCES Pessoa (cpf)
);

-- Tabela Medico
CREATE TABLE Medico (
    cpf_pessoa CHAR(11) PRIMARY KEY, 
    crm CHAR(10) NOT NULL UNIQUE, 
    CONSTRAINT fk_medico_pessoa FOREIGN KEY (cpf_pessoa) REFERENCES Pessoa (cpf) 
);

-- Tabela Especialidade
CREATE TABLE Especialidade (
    id SERIAL PRIMARY KEY, 
    descricao VARCHAR(100) NOT NULL 
);

-- Tabela Medico_Especialidade
CREATE TABLE Medico_Especialidade (
    cpf_medico CHAR(11) NOT NULL, 
    id_especialidade INT NOT NULL,
    PRIMARY KEY (cpf_medico, id_especialidade), 
    CONSTRAINT fk_medico FOREIGN KEY (cpf_medico) REFERENCES Medico (cpf_pessoa),
    CONSTRAINT fk_especialidade FOREIGN KEY (id_especialidade) REFERENCES Especialidade (id) 
);

-- Tabela Agendamento
CREATE TABLE Agendamento (
    cpf_paciente CHAR(11) NOT NULL, 
    cpf_medico CHAR(11) NOT NULL, 
    dh_consulta TIMESTAMP NOT NULL, 
    dh_agendamento TIMESTAMP NOT NULL, 
    valor_consulta DECIMAL(10, 2) NOT NULL, 
    PRIMARY KEY (cpf_paciente, cpf_medico, dh_consulta),
    CONSTRAINT fk_agendamento_paciente FOREIGN KEY (cpf_paciente) REFERENCES Paciente (cpf_pessoa),
    CONSTRAINT fk_agendamento_medico FOREIGN KEY (cpf_medico) REFERENCES Medico (cpf_pessoa) 
);

-- Wesley Costa, Marya Eduarda