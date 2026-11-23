CREATE OR REPLACE VIEW V_VENDAS_POR_CATEGORIA AS
SELECT
    TRUNC(v.dt_venda, 'MM') AS mes_referencia,
    cat.id_categoria,
    cat.nome AS nome_categoria,
    SUM(
        (vi.preco_unit - NVL(vi.desconto_item, 0))
        * vi.quantidade
    ) AS faturamento_total
FROM tb_venda v
INNER JOIN tb_venda_item vi
    ON v.id_venda = vi.id_venda
INNER JOIN tb_produto p
    ON vi.id_produto = p.id_produto
INNER JOIN tb_categoria cat
    ON p.id_categoria = cat.id_categoria
WHERE v.status = 'FECHADA'
GROUP BY
    TRUNC(v.dt_venda, 'MM'),
    cat.id_categoria,
    cat.nome;
