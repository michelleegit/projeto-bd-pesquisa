--------------------------- INSERTS ---------------------------

INSERT INTO Pessoa (cpf, nome, email, data_nascimento, cep, bairro, municipio, estado) VALUES
('11111111111', 'Ana Silva', 'ana.silva@email.com', '1980-05-15', 35400000, 'Centro', 'Ouro Preto', 'MG'),
('22222222222', 'Bruno Costa', 'bruno.c@email.com', '1985-08-20', 35400000, 'Bauxita', 'Ouro Preto', 'MG'),
('33333333333', 'Carla Souza', 'carla.s@email.com', '1975-03-10', 35400000, 'Pilar', 'Ouro Preto', 'MG'),
('44444444444', 'Diego Lima', 'diego.l@email.com', '1990-12-05', 35400000, 'Rosário', 'Ouro Preto', 'MG'),
('55555555555', 'Elena Meireles', 'elena.m@email.com', '2000-01-25', 31000000, 'Savassi', 'Belo Horizonte', 'MG'),
('66666666666', 'Fabio Junior', 'fabio.j@email.com', '2001-02-14', 31000000, 'Centro', 'Belo Horizonte', 'MG'),
('77777777777', 'Gisele Bündchen', 'gisele.b@email.com', '1999-07-20', 35400000, 'Lagoa', 'Ouro Preto', 'MG'),
('88888888888', 'Hugo Gloss', 'hugo.g@email.com', '2002-11-30', 35400000, 'Centro', 'Ouro Preto', 'MG'),
('99999999999', 'Iris Valverde', 'iris.v@email.com', '1982-04-12', 30000000, 'Centro', 'São Paulo', 'SP'),
('10101010101', 'João Kleber', 'joao.k@email.com', '1970-06-06', 30000000, 'Jardins', 'São Paulo', 'SP'),
('12121212121', 'Katia Cega', 'katia.c@email.com', '1998-09-09', 35400000, 'Bauxita', 'Ouro Preto', 'MG'),
('13131313131', 'Leonardo Dicaprio', 'leo.d@email.com', '1995-11-11', 35400000, 'Pilar', 'Ouro Preto', 'MG'),
('14141414141', 'Maria Bethania', 'maria.b@email.com', '1960-02-02', 20000000, 'Lapa', 'Rio de Janeiro', 'RJ'),
('15151515151', 'Neymar Junior', 'ney.j@email.com', '1992-02-05', 11000000, 'Gonzaga', 'Santos', 'SP'),
('16161616161', 'Otávio Mesquita', 'otavio.m@email.com', '2003-03-03', 35400000, 'Rosário', 'Ouro Preto', 'MG'),
('17171717171', 'Paola Carosella', 'paola.c@email.com', '1972-10-30', 30000000, 'Pinheiros', 'São Paulo', 'SP'),
('18181818181', 'Quico Dochaves', 'quico@email.com', '2001-05-05', 35400000, 'Centro', 'Ouro Preto', 'MG'),
('19191919191', 'Ratinho Massa', 'ratinho@email.com', '1965-08-15', 80000000, 'Centro', 'Curitiba', 'PR'),
('20202020202', 'Sandra Annenberg', 'sandra.a@email.com', '1988-12-12', 35400000, 'Bauxita', 'Ouro Preto', 'MG'),
('21212121212', 'Tiago Leifert', 'tiago.l@email.com', '1999-01-01', 35400000, 'Pilar', 'Ouro Preto', 'MG'),
('28282828282', 'André Motta', 'andre.m@email.com', '1987-01-14', 30100000, 'Savassi', 'Belo Horizonte', 'MG'),
('29292929292', 'Beatriz Cunha', 'beatriz.c@email.com', '1999-07-09', 35400000, 'Centro', 'Ouro Preto', 'MG'),
('30303030303', 'Carlos Henrique', 'carlos.h@email.com', '1978-11-22', 13000000, 'Taquaral', 'Campinas', 'SP'),
('31313131313', 'Daniela Rocha', 'daniela.r@email.com', '2001-03-17', 31000000, 'Lourdes', 'Belo Horizonte', 'MG'),
('32323232323', 'Felipe Araujo', 'felipe.a@email.com', '1995-10-05', 20000000, 'Copacabana', 'Rio de Janeiro', 'RJ'),
('34343434343', 'Helena Duarte', 'helena.d@email.com', '1982-06-30', 30000000, 'Mooca', 'São Paulo', 'SP'),
('35353535353', 'Igor Bastos', 'igor.b@email.com', '1998-09-19', 35400000, 'Pilar', 'Ouro Preto', 'MG'),
('36363636363', 'Juliana Teixeira', 'juliana.t@email.com', '1996-12-11', 30100000, 'Funcionários', 'Belo Horizonte', 'MG'),
('37373737373', 'Mateus Prado', 'mateus.p@email.com', '2000-02-02', 88000000, 'Centro', 'Florianópolis', 'SC'),
('38383838383', 'Renata Figueiredo', 'renata.f@email.com', '1989-08-27', 40000000, 'Barra', 'Salvador', 'BA');

INSERT INTO Professor (cpf, departamento, data_ingresso) VALUES
('11111111111', 'Computação', '2010-02-01'),
('22222222222', 'Biologia', '2012-03-15'),
('33333333333', 'Química', '2008-08-20'),
('44444444444', 'Física', '2015-01-10'),
('28282828282', 'Robótica', '2013-03-01'),
('30303030303', 'Biotecnologia', '2009-07-15'),
('34343434343', 'Engenharia de Materiais', '2011-05-10');

INSERT INTO Aluno (cpf, matricula, coeficiente, periodo_atual, formacao) VALUES
('55555555555', 2021001, 8.5, 5, 'Sistemas de Informação'),
('66666666666', 2021002, 7.2, 4, 'Ciência da Computação'),
('77777777777', 2022001, 9.0, 3, 'Engenharia Biológica'),
('88888888888', 2023001, 6.5, 2, 'Química Industrial'),
('29292929292', 2025001, 8.3, 4, 'Engenharia de Controle'),
('31313131313', 2025002, 7.1, 2, 'Biotecnologia'),
('35353535353', 2025003, 9.2, 6, 'Ciência da Computação'),
('36363636363', 2025004, 6.8, 5, 'Química');

INSERT INTO Pesquisador (cpf, tipo, nivel_acesso, carga_horaria) VALUES
('11111111111', 'P', 'Total', 40),
('22222222222', 'P', 'Parcial', 20),
('55555555555', 'A', 'Restrito', 12),
('77777777777', 'A', 'Restrito', 20),
('28282828282', 'P', 'Total', 40),
('30303030303', 'P', 'Parcial', 30),
('29292929292', 'A', 'Restrito', 12),
('35353535353', 'A', 'Restrito', 20);

INSERT INTO Sala_Laboratorio (ID_Sala, Capacidade) VALUES
(101, 20), (102, 15), (201, 30), (301, 10);

INSERT INTO IDs_Pesquisas (nome_linha) VALUES
('Inteligência Artificial'),
('Microbiologia Marinha'),
('Termodinâmica'),
('Polímeros'),
('Visão Computacional'),
('Genética Molecular'),
('Sistemas Embarcados'),
('Fármacos Sintéticos');

INSERT INTO Linha_Pesquisa (cpf, id_pesquisa) VALUES
('11111111111', 1),
('22222222222', 2),
('55555555555', 1),
('77777777777', 2),
('28282828282', 8),
('30303030303', 4),
('29292929292', 6),
('35353535353', 5);

INSERT INTO Projeto_Pesquisa (ID_Pesquisa, Titulo) VALUES
(1, 'Deep Learning em Saúde'),
(2, 'Análise de Algas'),
(3, 'Novos Materiais'),
(4, 'Física Quântica'),
(8, 'Drones Autônomos Inteligentes'),
(9, 'Mapeamento Genético de Vírus'),
(10, 'Microcontroladores para IoT'),
(11, 'Desenvolvimento de Novos Fármacos');

INSERT INTO Participa (Data_Inicio, ID_Pesquisador, ID_Projeto) VALUES
('2023-01-01', '11111111111', 1),
('2023-02-01', '55555555555', 1),
('2024-01-01', '22222222222', 2),
('2024-03-01', '77777777777', 2),
('2024-04-01', '28282828282', 8),
('2024-04-15', '29292929292', 8),
('2024-05-01', '30303030303', 9),
('2024-05-10', '35353535353', 10),
('2024-06-01', '28282828282', 11);

INSERT INTO Experimento (ID_Experimento, Titulo, Status, ID_Pesquisa) VALUES
(1, 'Teste de Algoritmo A*', 'Concluído', 1),
(2, 'Cultura de Bactéria X', 'Em Andamento', 2),
(3, 'Resistência Térmica Y', 'Planejado', 3),
(4, 'Reação Química Z', 'Concluído', 4),
(7, 'Teste de Navegação com Drones', 'Em Andamento', 8),
(8, 'Análise de Mutação Viral', 'Concluído', 9),
(9, 'Teste de Comunicação IoT', 'Planejado', 10),
(10, 'Síntese de Composto X', 'Em Andamento', 11);

INSERT INTO Faz_Execucao_Experimento (ID_Execucao, Funcao, Horas, cpf_pesquisador, ID_Experimento) VALUES
(1, 'Coleta de Dados', '04:00:00', '11111111111', 1),
(2, 'Preparação Amostra', '02:30:00', '55555555555', 1),
(3, 'Análise Química', '08:00:00', '22222222222', 2),
(4, 'Supervisão', '01:00:00', '11111111111', 2),
(7, 'Programação de Rota', '05:00:00', '28282828282', 7),
(8, 'Sequenciamento Genético', '07:00:00', '30303030303', 8),
(9, 'Configuração de Hardware', '04:00:00', '35353535353', 9),
(10, 'Preparação Química', '06:30:00', '28282828282', 10);

INSERT INTO Especie (ID_Especie, Nome_Cientifico) VALUES
(1, 'Escherichia coli'),
(2, 'Rattus norvegicus'),
(3, 'Arabidopsis thaliana'),
(4, 'Drosophila melanogaster');

INSERT INTO Especie (ID_Especie, Nome_Cientifico, Reino, Genero) VALUES
(7, 'Danio rerio', 'Animalia', 'Danio'),
(8, 'Saccharomyces cerevisiae', 'Fungi', 'Saccharomyces'),
(9, 'Caenorhabditis elegans', 'Animalia', 'Caenorhabditis');

INSERT INTO Ser_de_teste (ID_Ser, Condicao, ID_Especie, ID_Pesquisa) VALUES
(1, 'Saudável', 1, 2),
(2, 'Infectado', 1, 2),
(3, 'Juvenil', 2, 2),
(4, 'Adulto', 2, 2),
(7, 'Exposto a estímulo', 7, 8),
(8, 'Controle', 8, 9),
(9, 'Mutante', 9, 9);

INSERT INTO Amostra (ID_Amostra, DataColeta, Tipo, ID_Ser, ID_Execucao) VALUES
(1, '2024-01-10', 'Sangue', 1, 1),
(2, '2024-01-10', 'Tecido', 2, 1),
(3, '2024-02-15', 'DNA', 3, 3),
(4, '2024-02-15', 'Saliva', 4, 3),
(7, '2024-07-01', 'Neural', 7, 7),
(8, '2024-07-05', 'Genética', 8, 8),
(9, '2024-07-10', 'Proteica', 9, 8);

INSERT INTO Equipamento (ID_Equipamento, Nome, Estado, Modelo, Em_Uso) VALUES
(1, 'Microscópio Eletrônico', 'Bom', 'ZEISS-X1', TRUE),
(2, 'Centrífuga', 'Novo', 'HITACHI-20', FALSE),
(3, 'Supercomputador', 'Excelente', 'NVIDIA-DGX', TRUE),
(4, 'Espectrômetro', 'Manutenção', 'SHIMADZU', FALSE);

INSERT INTO Seguro (ID_Seguro, Valor, Cobertura, ID_Equipamento) VALUES
(1, 5000.00, 'Danos Materiais', 1),
(2, 2000.00, 'Roubo', 2),
(3, 50000.00, 'Total', 3),
(4, 1500.00, 'Incêndio', 4);

INSERT INTO Bolsa (Nome, Valor, matricula_aluno) VALUES
('Iniciação Científica', 700.00, 2021001),
('Mestrado', 2100.00, 2021002),
('Doutorado', 3100.00, 2022001),
('Treinamento Técnico', 1200.00, 2023001);

INSERT INTO Financiador (ID_Financiador) VALUES
(1), (2), (3), (4), (5), (6), (7), (8);

INSERT INTO Evento (ID_Evento, titulo) VALUES
(1, 'Simpósio de IA'),
(2, 'Congresso de Genética'),
(3, 'Workshop de Python'),
(4, 'Semana da Ciência'),
(7, 'Feira de Robótica'),
(8, 'Simpósio de Genética'),
(9, 'Congresso de IoT');

INSERT INTO Ocorre_em (ID_Evento, ID_Sala_Num, Data) VALUES
(1, 201, '2026-05-20'),
(2, 101, '2026-06-15'),
(3, 102, '2026-07-10'),
(4, 201, '2026-08-05'),
(7, 101, '2026-11-01'),
(8, 101, '2026-11-02'),
(9, 301, '2026-11-03');

INSERT INTO Telefone_F (ID_Financiador, Telefone) VALUES
(1, '(11) 91111-1111'),
(2, '(21) 92222-2222'),
(3, '(31) 93333-3333'),
(4, '(41) 94444-4444'),
(5, '(51) 95555-5555');

INSERT INTO Telefone_P (cpf, telefone) VALUES
('11111111111', '(31) 99999-1111'), -- Ana Silva
('22222222222', '(31) 99999-2222'), -- Bruno Costa
('33333333333', '(31) 99999-3333'), -- Carla Souza
('44444444444', '(31) 99999-4444'); -- Diego Lima

INSERT INTO tem_acesso (ID_Pesquisador, ID_Sala) VALUES
('11111111111', 101),
('22222222222', 102),
('55555555555', 201),
('77777777777', 301);

INSERT INTO Teste_Experimental (ID_Amostra, ID_Ser, ID_Experimento, ID_Equipamento, ID_Teste, Resultado, Data_Inicio, Data_Fim) VALUES
(1, 1, 1, 1, 100, 'Positivo', '2024-04-01', '2024-04-02'),
(2, 2, 1, 2, 101, 'Negativo', '2024-04-03', '2024-04-04'),
(3, 3, 3, 3, 102, 'Inconclusivo', '2024-04-05', NULL),
(4, 4, 3, 4, 103, 'Aguardando', '2024-04-06', NULL),
(7, 7, 2, 3, 300, 'Sucesso', '2024-07-15', NULL),
(8, 8, 4, 4, 301, 'Falha Parcial', '2024-07-16', '2024-07-18'),
(9, 9, 4, 1, 302, 'Sucesso', '2024-07-20', NULL);

INSERT INTO Podem_Participar (ID_Pessoa, ID_Event) VALUES
('13131313131', 1), ('14141414141', 2),
('15151515151', 3), ('16161616161', 4),
('28282828282', 7), ('29292929292', 7),
('30303030303', 7), ('31313131313', 7),
('32323232323', 7), ('34343434343', 7),
('35353535353', 7), ('36363636363', 7),
('37373737373', 7), ('38383838383', 7),
('11111111111', 7), ('22222222222', 7),
('33333333333', 7), ('44444444444', 7),
('55555555555', 7), ('66666666666', 7),
('77777777777', 7), ('88888888888', 7),
('99999999999', 7), ('10101010101', 7);

INSERT INTO Podem_Prover (ID_Bolsa, ID_Pesquisa) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

INSERT INTO Patente (ID_Patente, Titulo, Registro, cpf) VALUES
(500, 'Algoritmo Genético', 'REG-2024-001', '11111111111'),
(501, 'Bio-Combustível', 'REG-2024-002', '22222222222'),
(502, 'Compilador Otim.', 'REG-2024-003', '55555555555'),
(503, 'Sensor Quântico', 'REG-2024-004', '77777777777');

INSERT INTO Orienta (cpf_prof, matricula_aluno) VALUES
('11111111111', 2021001),
('22222222222', 2021002),
('33333333333', 2022001),
('44444444444', 2023001);

INSERT INTO Objetivos (ID_Experimento, Objetivo) VALUES
(1, 'Validar taxa de acerto acima de 95%'),
(2, 'Observar crescimento em 24h'),
(3, 'Testar ponto de fusão'),
(4, 'Confirmar teoria das cordas');

INSERT INTO Faz_Uso (ID_SalaL, ID_Pesq_Proj) VALUES
(101, 1),
(102, 2),
(201, 3),
(301, 4);

INSERT INTO Financia (ID_Financiador, ID_Pesquisa, Valor, DataInicio, DataFim) VALUES
(1, 1, 150000.00, '2023-01-01', '2023-12-31'),
(2, 2, 50000.00, '2023-02-01', '2023-12-31'),
(3, 3, 200000.00, '2023-03-01', '2024-03-01'),
(4, 4, 80000.00, '2023-04-01', '2024-04-01'),
(6, 8, 300000.00, '2024-01-01', '2025-01-01'),
(7, 9, 180000.00, '2024-02-01', '2024-12-31'),
(8, 11, 400000.00, '2024-03-01', '2026-03-01');

INSERT INTO comparece (ID_Pesquisador, ID_Evento) VALUES
('11111111111', 1),
('22222222222', 2),
('55555555555', 3),
('77777777777', 4);
