--------------------------- FUNÇÕES E TRIGGERS ---------------------------

-- Função para garantir que um Professor não possa ser um Aluno, e vice-versa.
-- Verifica se o CPF da pessoa que está sendo inserida na tabela Aluno
-- já não está na tabela Professor, e vice-versa.
CREATE OR REPLACE FUNCTION chk_prof_aluno_xor()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_TABLE_NAME = 'professor' THEN
        IF EXISTS (SELECT 1 FROM Aluno WHERE cpf = NEW.cpf) THEN
            RAISE EXCEPTION 'Pessoa não pode ser Professor e Aluno ao mesmo tempo';
        END IF;
    ELSIF TG_TABLE_NAME = 'aluno' THEN
        IF EXISTS (SELECT 1 FROM Professor WHERE cpf = NEW.cpf) THEN
            RAISE EXCEPTION 'Pessoa não pode ser Professor e Aluno ao mesmo tempo';
        END IF;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Acontece toda vez que se for inserir ou atualizar a tabela Professor
CREATE TRIGGER trg_prof_xor
BEFORE INSERT OR UPDATE ON Professor
FOR EACH ROW EXECUTE FUNCTION chk_prof_aluno_xor();

-- Acontece toda vez que se for inserir ou atualizar a tabela Aluno
CREATE TRIGGER trg_aluno_xor
BEFORE INSERT OR UPDATE ON Aluno
FOR EACH ROW EXECUTE FUNCTION chk_prof_aluno_xor();

-- Função responsável por popular o atributo derivado "Tipo" da entidade Pesquisador
CREATE OR REPLACE FUNCTION chk_tipo_pesquisador()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.tipo = 'P' AND NOT EXISTS (SELECT 1 FROM Professor WHERE cpf = NEW.cpf) THEN
        RAISE EXCEPTION 'Pesquisador tipo P deve existir em Professor';
    END IF;
    IF NEW.tipo = 'A' AND NOT EXISTS (SELECT 1 FROM Aluno WHERE cpf = NEW.cpf) THEN
        RAISE EXCEPTION 'Pesquisador tipo A deve existir em Aluno';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Acontece toda vez que tentar inserir ou atualizar a tabela Pesquisador
CREATE TRIGGER trg_chk_tipo_pesquisador
BEFORE INSERT OR UPDATE ON Pesquisador
FOR EACH ROW EXECUTE FUNCTION chk_tipo_pesquisador();
