--------------------------- ENTIDADES ---------------------------

-- Entidade Pessoa
CREATE TABLE Pessoa (
    cpf CHAR(11) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150),
    data_nascimento DATE NOT NULL,
    cep NUMERIC(8),
    bairro VARCHAR(100),
    municipio VARCHAR(100),
    estado CHAR(2),
    CONSTRAINT pk_pessoa PRIMARY KEY (cpf),
    CONSTRAINT ck_cpf CHECK (cpf ~ '^[0-9]{11}$')
);

-- Telefone de Pessoas (atributo multivalorado)
CREATE TABLE Telefone_P (
    cpf CHAR(11) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    CONSTRAINT pk_telefone_pessoa PRIMARY KEY (cpf, telefone),
    CONSTRAINT fk_telefone_pessoa
        FOREIGN KEY (cpf)
        REFERENCES Pessoa(cpf)
        ON DELETE CASCADE
);

-- Entidade Professor
CREATE TABLE Professor (
    cpf CHAR(11) NOT NULL,
    departamento VARCHAR(100) NOT NULL,
    data_ingresso DATE NOT NULL,
    CONSTRAINT pk_professor PRIMARY KEY (cpf),
    CONSTRAINT fk_professor_pessoa
        FOREIGN KEY (cpf)
        REFERENCES Pessoa(cpf)
        ON DELETE CASCADE
);

-- Entidade Aluno
CREATE TABLE Aluno (
    cpf CHAR(11) NOT NULL,
    matricula INT NOT NULL,
    coeficiente NUMERIC(4,2),
    periodo_atual INT,
    formacao VARCHAR(100),
    CONSTRAINT uk_aluno UNIQUE (matricula),
    CONSTRAINT pk_aluno PRIMARY KEY (cpf),
    CONSTRAINT fk_aluno_pessoa
        FOREIGN KEY (cpf)
        REFERENCES Pessoa(cpf)
        ON DELETE CASCADE
);

-- Relação Orienta, entre Aluno e Professor
CREATE TABLE Orienta (
    cpf_prof CHAR(11) NOT NULL,
    matricula_aluno INT NOT NULL,
    CONSTRAINT pk_orienta PRIMARY KEY (cpf_prof, matricula_aluno),
    CONSTRAINT fk_orienta_professor
        FOREIGN KEY (cpf_prof)
        REFERENCES Professor (cpf)
        ON DELETE RESTRICT,
    CONSTRAINT fk_orienta_aluno
        FOREIGN KEY (matricula_aluno)
        REFERENCES Aluno (matricula)
        ON DELETE RESTRICT
);

-- Entidade Bolsa
CREATE TABLE Bolsa (
    ID_Bolsa SERIAL NOT NULL,
    Nome VARCHAR(50) NOT NULL,
    Valor DECIMAL(10, 2) NULL,
    matricula_aluno INT NOT NULL,
    CONSTRAINT pk_bolsa PRIMARY KEY (ID_Bolsa),
    CONSTRAINT uk_bolsa UNIQUE (matricula_aluno),
    CONSTRAINT fk_bolsa_aluno
        FOREIGN KEY (matricula_aluno)
        REFERENCES Aluno(matricula)
        ON DELETE RESTRICT
);

-- Entidade Pesquisador
CREATE TABLE Pesquisador (
    cpf CHAR(11) PRIMARY KEY,
    tipo CHAR(1) NOT NULL,
    nivel_acesso VARCHAR(50),
    carga_horaria SMALLINT,
    FOREIGN KEY (cpf) REFERENCES Pessoa(cpf),
    CONSTRAINT ck_tipo_pesq CHECK (tipo = 'P' OR tipo = 'A')
);

-- Tabela criada para "tabelar" IDs de linha de pesquisa e seus respectivos nomes
CREATE TABLE IDs_Pesquisas (
    ID_Pesquisas SERIAL NOT NULL,
    nome_linha VARCHAR(150) NOT NULL UNIQUE,
    CONSTRAINT pk_ids_pesquisas PRIMARY KEY (ID_Pesquisas)
);

-- Atributo Multivalorado de Pesquisador
CREATE TABLE Linha_Pesquisa (
    cpf CHAR(11) NOT NULL,
    id_pesquisa INT NOT NULL,
    CONSTRAINT pk_lp PRIMARY KEY (cpf, id_pesquisa),
    CONSTRAINT fk_lp_pesquisador
        FOREIGN KEY (cpf)
        REFERENCES Pesquisador(cpf)
        ON DELETE CASCADE,
    CONSTRAINT fk_lp_id_pesquisa
        FOREIGN KEY (id_pesquisa)
        REFERENCES IDs_Pesquisas(ID_Pesquisas)
        ON DELETE CASCADE
);

-- Entidade Patente
CREATE TABLE Patente (
    ID_Patente NUMERIC(5) NOT NULL,
    Titulo CHAR(20) NOT NULL,
    Registro VARCHAR(256) NOT NULL,
    cpf CHAR(11) NOT NULL,
    CONSTRAINT fk_patente_pesquisador
        FOREIGN KEY (cpf)
        REFERENCES Pesquisador(cpf)
        ON DELETE RESTRICT,
    CONSTRAINT pk_patente PRIMARY KEY (ID_Patente),
    CONSTRAINT uk_title UNIQUE (Titulo)
);

-- Entidade Sala/Laboratório
CREATE TABLE Sala_Laboratorio (
    ID_Sala NUMERIC(5) PRIMARY KEY,
    Capacidade INT NOT NULL
);

-- Entidade Evento
CREATE TABLE Evento (
    ID_Evento INT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL
);

-- Relação Podem Participar entre Pessoa e Evento
CREATE TABLE Podem_Participar (
    ID_Pessoa CHAR(11) NOT NULL,
    ID_Event INT NOT NULL,
    CONSTRAINT pk_podem_participar PRIMARY KEY (ID_Pessoa, ID_Event),
    CONSTRAINT fk_podem_part_pessoa
        FOREIGN KEY (ID_Pessoa)
        REFERENCES Pessoa (cpf)
        ON DELETE CASCADE,
    CONSTRAINT fk_podem_part_event
        FOREIGN KEY (ID_Event)
        REFERENCES Evento (ID_Evento)
        ON DELETE CASCADE
);

-- Relação Ocorre em entre Evento e Sala/Laboratório
CREATE TABLE Ocorre_em (
    ID_Evento INT NOT NULL,
    ID_Sala_Num NUMERIC(5) NOT NULL,
    Data DATE NOT NULL,
    CONSTRAINT pk_ocorre_em PRIMARY KEY (ID_Evento, ID_Sala_Num, Data),
    CONSTRAINT fk_ocorre_em_event
        FOREIGN KEY (ID_Evento)
        REFERENCES Evento(ID_Evento)
        ON DELETE CASCADE,
    CONSTRAINT fk_ocorre_em_sala
        FOREIGN KEY (ID_Sala_Num)
        REFERENCES Sala_Laboratorio (ID_Sala)
        ON DELETE CASCADE
);

-- Relação Tem Acesso entre Pesquisador e Sala/Laboratório
CREATE TABLE tem_acesso (
    ID_Pesquisador CHAR(11) NOT NULL,
    ID_Sala NUMERIC(5) NOT NULL,
    CONSTRAINT pk_temacesso PRIMARY KEY (ID_Pesquisador, ID_Sala),
    CONSTRAINT fk_tem_acesso_pesq
        FOREIGN KEY (ID_Pesquisador)
        REFERENCES Pesquisador(cpf)
        ON DELETE CASCADE,
    CONSTRAINT fk_tem_acesso_sala
        FOREIGN KEY (ID_Sala)
        REFERENCES Sala_Laboratorio (ID_Sala)
        ON DELETE CASCADE
);

-- Relação Comparece entre Pesquisador e Evento
CREATE TABLE comparece (
    ID_Pesquisador CHAR(11) NOT NULL,
    ID_Evento INT NOT NULL,
    CONSTRAINT pk_comparece PRIMARY KEY (ID_Pesquisador, ID_Evento),
    CONSTRAINT fk_comparece_pesq
        FOREIGN KEY (ID_Pesquisador)
        REFERENCES Pesquisador(cpf)
        ON DELETE RESTRICT,
    CONSTRAINT fk_comparece_event
        FOREIGN KEY (ID_Evento)
        REFERENCES Evento (ID_Evento)
        ON DELETE RESTRICT
);

-- Entidade Projeto de Pesquisa
CREATE TABLE Projeto_Pesquisa (
    ID_Pesquisa NUMERIC(5) NOT NULL,
    Titulo VARCHAR(50) NOT NULL,
    CONSTRAINT pk_proj_pesquisa PRIMARY KEY (ID_Pesquisa),
    CONSTRAINT uk_proj_pesquisa UNIQUE (Titulo)
);

-- Relação Participa entre Pesquisador e Projeto de Pesquisa
CREATE TABLE Participa (
    Data_Inicio DATE NOT NULL,
    Data_Fim DATE NULL,
    ID_Pesquisador CHAR(11) NOT NULL,
    ID_Projeto NUMERIC(5) NOT NULL,
    CONSTRAINT pk_participa PRIMARY KEY (ID_Pesquisador, ID_Projeto),
    CONSTRAINT fk_participa_pesq
        FOREIGN KEY (ID_Pesquisador)
        REFERENCES Pesquisador (cpf)
        ON DELETE CASCADE,
    CONSTRAINT fk_participa_proj
        FOREIGN KEY (ID_Projeto)
        REFERENCES Projeto_Pesquisa (ID_Pesquisa)
        ON DELETE CASCADE
);

-- Relação Faz Uso entre Projeto de Pesquisa e Sala/Laboratório
CREATE TABLE Faz_Uso (
    ID_SalaL NUMERIC(5) NOT NULL,
    ID_Pesq_Proj NUMERIC(5) NOT NULL,
    CONSTRAINT pk_use PRIMARY KEY (ID_SalaL, ID_Pesq_Proj),
    CONSTRAINT fk_faz_uso_sala_lab
        FOREIGN KEY (ID_SalaL)
        REFERENCES Sala_Laboratorio (ID_Sala)
        ON DELETE CASCADE,
    CONSTRAINT fk_faz_uso_projeto_pesq
        FOREIGN KEY (ID_Pesq_Proj)
        REFERENCES Projeto_Pesquisa (ID_Pesquisa)
        ON DELETE CASCADE
);

-- Relação Podem Prover entre Bolsa e Projeto de Pesquisa
CREATE TABLE Podem_Prover (
    ID_Bolsa INT NOT NULL,
    ID_Pesquisa NUMERIC(5) NOT NULL,
    CONSTRAINT pk_podemprover PRIMARY KEY (ID_Bolsa, ID_Pesquisa),
    CONSTRAINT fk_podem_prover_pesq
        FOREIGN KEY (ID_Pesquisa)
        REFERENCES Projeto_Pesquisa (ID_Pesquisa)
        ON DELETE RESTRICT,
    CONSTRAINT fk_podem_prover_bolsa
        FOREIGN KEY (ID_Bolsa)
        REFERENCES Bolsa (ID_Bolsa)
        ON DELETE RESTRICT
);

-- Entidade Financiador
CREATE TABLE Financiador (
    ID_Financiador NUMERIC(5) NOT NULL,
    CONSTRAINT pk_financiador PRIMARY KEY (ID_Financiador)
);

-- Atributo Multivalorado, representando Telefones do Financiador
CREATE TABLE Telefone_F (
    ID_Financiador NUMERIC(5) NOT NULL,
    Telefone VARCHAR(15) NOT NULL,
    CONSTRAINT pk_telefone_financiador PRIMARY KEY (ID_Financiador, Telefone),
    CONSTRAINT fk_telefone_financiador
        FOREIGN KEY (ID_Financiador)
        REFERENCES Financiador(ID_Financiador)
        ON DELETE CASCADE
);

-- Relação Financia entre Financiador e Projeto de Pesquisa
CREATE TABLE Financia (
    ID_Financiador NUMERIC(5) NOT NULL,
    ID_Pesquisa NUMERIC(5) NOT NULL,
    Valor NUMERIC(10,2) NULL,
    DataInicio DATE NULL,
    DataFim DATE NULL,
    CONSTRAINT pk_financia PRIMARY KEY (ID_Financiador, ID_Pesquisa),
    CONSTRAINT fk_financia_financiador
        FOREIGN KEY (ID_Financiador)
        REFERENCES Financiador (ID_Financiador)
        ON DELETE CASCADE,
    CONSTRAINT fk_financia_pesquisa
        FOREIGN KEY (ID_Pesquisa)
        REFERENCES Projeto_Pesquisa (ID_Pesquisa)
        ON DELETE CASCADE
);

-- Entidade Espécie
CREATE TABLE Especie (
    ID_Especie NUMERIC(5) NOT NULL,
    Nome_Cientifico VARCHAR(50) NOT NULL,
    Reino VARCHAR(20) NULL,
    Genero VARCHAR(20) NULL,
    Dominio VARCHAR(20) NULL,
    Classe VARCHAR(20) NULL,
    Familia VARCHAR(20) NULL,
    Filo VARCHAR(20) NULL,
    CONSTRAINT pk_especie PRIMARY KEY (ID_Especie)
);

-- Entidade Ser de Teste
CREATE TABLE Ser_de_teste (
    ID_Ser NUMERIC(5) NOT NULL,
    Condicao VARCHAR(30) NOT NULL,
    ID_Especie NUMERIC(5) NOT NULL,
    ID_Pesquisa NUMERIC(5) NOT NULL,
    CONSTRAINT pk_ser PRIMARY KEY (ID_Ser),
    CONSTRAINT fk_st_especie
        FOREIGN KEY (ID_Especie)
        REFERENCES Especie (ID_Especie)
        ON DELETE RESTRICT,
    CONSTRAINT fk_st_proj_pesquisa
        FOREIGN KEY (ID_Pesquisa)
        REFERENCES Projeto_Pesquisa (ID_Pesquisa)
        ON DELETE RESTRICT
);

-- Entidade Experimento
CREATE TABLE Experimento (
    ID_Experimento NUMERIC(5) NOT NULL,
    Titulo VARCHAR(50) NOT NULL,
    Status VARCHAR(50) NOT NULL,
    ID_Pesquisa NUMERIC(5) NOT NULL,
    CONSTRAINT fk_experimento_pesquisa
        FOREIGN KEY (ID_Pesquisa)
        REFERENCES Projeto_Pesquisa (ID_Pesquisa)
        ON DELETE RESTRICT,
    CONSTRAINT pk_experimento PRIMARY KEY (ID_Experimento)
);

-- Atributo Multivalorado, representando Objetivos de Experimento
CREATE TABLE Objetivos (
    ID_Experimento NUMERIC(5) NOT NULL,
    Objetivo VARCHAR(100) NOT NULL,
    CONSTRAINT pk_objetivos_experimento PRIMARY KEY (ID_Experimento, Objetivo),
    CONSTRAINT fk_obejtivos_experimento
        FOREIGN KEY (ID_Experimento)
        REFERENCES Experimento (ID_Experimento)
        ON DELETE CASCADE
);

-- Entidade Associativa Faz Execução Experimento
CREATE TABLE Faz_Execucao_Experimento (
    ID_Execucao NUMERIC(5) NOT NULL,
    Funcao VARCHAR(100) NULL,
    Horas TIME NULL,
    cpf_pesquisador CHAR(11) NOT NULL,
    ID_Experimento NUMERIC(5) NOT NULL,
    CONSTRAINT pk_execucao PRIMARY KEY (ID_Execucao),
    CONSTRAINT fk_fez_pesquisador
        FOREIGN KEY (cpf_pesquisador)
        REFERENCES Pesquisador (cpf)
        ON DELETE RESTRICT,
    CONSTRAINT fk_fez_experimento
        FOREIGN KEY (ID_Experimento)
        REFERENCES Experimento (ID_Experimento)
        ON DELETE RESTRICT
);

-- Entidade Amostra
CREATE TABLE Amostra (
    ID_Amostra NUMERIC(5) NOT NULL,
    DataColeta DATE NOT NULL,
    Tipo VARCHAR(30) NOT NULL,
    ID_Ser NUMERIC(5) NOT NULL,
    ID_Execucao NUMERIC(5) NOT NULL,
    CONSTRAINT pk_amostra PRIMARY KEY (ID_Amostra, ID_Ser),
    CONSTRAINT fk_amostra_ser
        FOREIGN KEY (ID_Ser)
        REFERENCES Ser_de_teste (ID_Ser)
        ON DELETE RESTRICT,
    CONSTRAINT fk_amostra_fez
        FOREIGN KEY (ID_Execucao)
        REFERENCES Faz_Execucao_Experimento (ID_Execucao)
        ON DELETE RESTRICT
);

-- Entidade Equipamento
CREATE TABLE Equipamento (
    ID_Equipamento NUMERIC(5) NOT NULL,
    Nome VARCHAR(100) NOT NULL,
    Estado VARCHAR(50) NULL,
    Modelo VARCHAR(50) NOT NULL,
    Em_Uso BOOLEAN DEFAULT FALSE,
    CONSTRAINT pk_equipamento PRIMARY KEY (ID_Equipamento)
);

-- Entidade Seguro
CREATE TABLE Seguro (
    ID_Seguro NUMERIC(5) NOT NULL,
    Valor NUMERIC(10,2) NOT NULL,
    Cobertura VARCHAR(50) NOT NULL,
    ID_Equipamento NUMERIC(5) NOT NULL,
    CONSTRAINT pk_seguro PRIMARY KEY (ID_Seguro),
    CONSTRAINT uk_seguro_equip UNIQUE (ID_Equipamento),
    CONSTRAINT fk_seguro_equipamento
        FOREIGN KEY (ID_Equipamento)
        REFERENCES Equipamento (ID_Equipamento)
        ON DELETE CASCADE
);

-- Relação Teste Experimental
CREATE TABLE Teste_Experimental (
    ID_Amostra NUMERIC(5) NOT NULL,
    ID_Ser NUMERIC(5) NOT NULL,
    ID_Experimento NUMERIC(5) NOT NULL,
    ID_Equipamento NUMERIC(5) NOT NULL,
    ID_Teste NUMERIC(5) NOT NULL,
    Resultado VARCHAR(100),
    Data_Inicio DATE NOT NULL,
    Data_Fim DATE NULL,
    CONSTRAINT pk_te PRIMARY KEY (ID_Amostra, ID_Ser, ID_Experimento, ID_Equipamento, ID_Teste),
    CONSTRAINT fk_te_amostra
        FOREIGN KEY (ID_Amostra, ID_Ser)
        REFERENCES Amostra (ID_Amostra, ID_Ser)
        ON DELETE RESTRICT,
    CONSTRAINT fk_te_experimento
        FOREIGN KEY (ID_Experimento)
        REFERENCES Experimento (ID_Experimento)
        ON DELETE RESTRICT,
    CONSTRAINT fk_te_equipamento
        FOREIGN KEY (ID_Equipamento)
        REFERENCES Equipamento (ID_Equipamento)
        ON DELETE RESTRICT
);
