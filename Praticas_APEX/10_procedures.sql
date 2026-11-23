CREATE OR REPLACE PROCEDURE prc_reajustar_saldo_em_massa (
    p_percentual IN NUMBER,
    p_total_atualizado OUT NUMBER
) IS
BEGIN
    UPDATE tb_contas
    SET saldo = saldo * (1 + p_percentual / 100)
    WHERE status = 'ATIVA';

    p_total_atualizado := SQL%ROWCOUNT;

    COMMIT;
END;
/
  
-- O SQL%ROWCOUNT informa quantas contas foram atualizadas e o parâmetro OUT retorna essa quantidade.

-- O FOR UPDATE bloqueia temporariamente o registro consultado para impedir que outra transação o modifique enquanto a operação está sendo realizada.

-- Sem esse bloqueio, duas operações poderiam consultar o mesmo saldo ao mesmo tempo e tentar realizar transferências simultâneas, causando inconsistências, como saldo negativo.

CREATE OR REPLACE PROCEDURE prc_sanitizar_texto (
    p_texto IN OUT VARCHAR2
) IS
BEGIN
    p_texto := UPPER(TRIM(p_texto));
END;
/

/* O TRIM remove os espaços no início e no final do texto, enquanto o UPPER transforma todas as letras em maiúsculas.

O parâmetro IN OUT permite receber o texto original e devolver o texto já modificado. */
