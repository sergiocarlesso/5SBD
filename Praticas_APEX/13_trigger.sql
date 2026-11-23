CREATE OR REPLACE TRIGGER trg_vw_empregados_insert
INSTEAD OF INSERT ON vw_empregados_resumo
FOR EACH ROW
BEGIN
    INSERT INTO tb_empregados (nome, cargo, salario)
    VALUES (:NEW.nome, :NEW.cargo, :NEW.salario);
END;
/

--A View utiliza JOIN e agrupamento, por isso não permite inserções diretamente. A Trigger INSTEAD OF intercepta o INSERT e direciona os dados para a tabela tb_empregados. O campo total_auditorias é calculado automaticamente pela View.

CREATE OR REPLACE TRIGGER trg_teste_mutating
AFTER INSERT OR UPDATE ON tb_empregados
FOR EACH ROW
DECLARE
    v_total NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_total
    FROM tb_empregados
    WHERE cargo = :NEW.cargo;
END;
/

-- O erro acontece porque a Trigger tenta consultar a própria tabela que está sendo modificada. O Oracle impede essa operação para evitar leituras inconsistentes durante o processamento das alterações.

CREATE OR REPLACE TRIGGER trg_auditoria_salario
AFTER UPDATE OF salario ON tb_empregados
FOR EACH ROW
WHEN (NEW.salario <> OLD.salario)
BEGIN
    INSERT INTO tb_auditoria_salarios (
        id_empregado,
        operacao,
        salario_anterior,
        salario_novo
    )
    VALUES (
        :OLD.id_empregado,
        'UPDATE',
        :OLD.salario,
        :NEW.salario
    );
END;
/

-- A cláusula WHEN verifica se o salário realmente foi alterado. Assim, a auditoria só é executada quando existe diferença entre o salário antigo e o novo, evitando registros desnecessários.

