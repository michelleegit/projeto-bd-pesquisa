--------------------------- VIEWS ---------------------------

-- Responsável por controlar o atributo derivado "Lotação máxima" da entidade Evento
CREATE VIEW Evento_Capacidade_Status AS
SELECT
    e.ID_Evento,
    e.titulo,
    oe.Data,
    s.ID_Sala,
    s.Capacidade AS capacidade_sala,
    COUNT(pp.ID_Pessoa) AS participantes,
    CASE
        WHEN COUNT(pp.ID_Pessoa) >= s.Capacidade
        THEN 'SIM'
        ELSE 'NAO'
    END AS em_capacidade_maxima
FROM Evento e
JOIN Ocorre_em oe
    ON oe.ID_Evento = e.ID_Evento
JOIN Sala_Laboratorio s
    ON s.ID_Sala = oe.ID_Sala_Num
LEFT JOIN Podem_Participar pp
    ON pp.ID_Event = e.ID_Evento
GROUP BY
    e.ID_Evento,
    e.titulo,
    oe.Data,
    s.ID_Sala,
    s.Capacidade;

-- Responsável por controlar o atributo derivado "Aniversário" da entidade Aluno
CREATE VIEW Aluno_Com_Aniversario AS
SELECT
    a.*,
    CASE
        WHEN EXTRACT(MONTH FROM p.data_nascimento) = EXTRACT(MONTH FROM CURRENT_DATE)
         AND EXTRACT(DAY FROM p.data_nascimento) = EXTRACT(DAY FROM CURRENT_DATE)
        THEN 'SIM'
        ELSE 'NAO'
    END AS birthday
FROM Aluno a
JOIN Pessoa p ON p.cpf = a.cpf;
