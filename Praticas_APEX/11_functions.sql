CREATE OR REPLACE FUNCTION fnc_calcular_tempo_casa (
    p_data_admissao IN DATE
) RETURN NUMBER IS
BEGIN
    RETURN FLOOR(MONTHS_BETWEEN(SYSDATE, p_data_admissao) / 12);
END;
/

-- A função calcula há quantos anos completos o colaborador trabalha na empresa. O MONTHS_BETWEEN calcula a diferença em meses e o FLOOR arredonda o resultado para baixo, retornando apenas os anos completos.

CREATE OR REPLACE FUNCTION fnc_teste_dml
RETURN NUMBER IS
BEGIN
    UPDATE tb_colaboradores
    SET salario_base = salario_base + 100
    WHERE id_colaborador = 1;

    RETURN 1;
END;
/

-- O erro acontece porque a função tenta executar um UPDATE durante uma consulta SELECT. Funções utilizadas diretamente em consultas SQL não podem executar esse tipo de alteração nas condições normais de execução.

CREATE INDEX idx_colab_irrf
ON tb_colaboradores (fnc_calcular_irrf(salario_base));

/* O índice utiliza a função fnc_calcular_irrf para facilitar as consultas que filtram funcionários pelo valor do imposto calculado.

Como a função foi declarada DETERMINISTIC, o Oracle pode utilizar seu resultado na criação do índice.

O EXPLAIN PLAN permite comparar o plano de execução antes e depois da criação do índice e verificar se houve melhoria. */
