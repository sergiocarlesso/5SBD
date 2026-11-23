PROCEDURE repor_estoque(
    p_id_produto IN NUMBER,
    p_quantidade IN NUMBER
) IS
BEGIN
    IF p_quantidade <= 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Quantidade inválida.');
    END IF;

    UPDATE tb_prod_estoque
    SET qtd_estoque = qtd_estoque + p_quantidade
    WHERE id_produto = p_id_produto;

END repor_estoque;

-- A procedure adiciona 10 unidades ao estoque do produto de ID 1. A validação impede reposições com quantidades iguais ou menores que zero.

FUNCTION obter_total_vendas_sessao RETURN NUMBER IS
BEGIN
    RETURN g_total_vendas_sessao;
END obter_total_vendas_sessao;

-- A função retorna a quantidade de vendas realizadas durante a sessão atual. Cada sessão de banco de dados possui seu próprio contador. Portanto, sessões diferentes possuem valores independentes, sem compartilhar essa variável.
