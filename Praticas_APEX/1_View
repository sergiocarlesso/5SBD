CREATE OR REPLACE VIEW V_VENDAS_RESUMO AS
SELECT
    v.id_venda,
    v.dt_venda,
    v.status,
    v.canal,
    c.nome AS nome_cliente,
    vend.nome AS nome_vendedor,
    NVL(
        SUM(
            (vi.preco_unit - NVL(vi.desconto_item, 0))
            * vi.quantidade
        ), 0
    ) AS valor_liquido
FROM tb_venda v
INNER JOIN tb_cliente c
    ON v.id_cliente = c.id_cliente
INNER JOIN tb_vendedor vend
    ON v.id_vendedor = vend.id_vendedor
LEFT JOIN tb_venda_item vi
    ON v.id_venda = vi.id_venda
GROUP BY
    v.id_venda,
    v.dt_venda,
    v.status,
    v.canal,
    c.id_cliente,
    c.nome,
    vend.id_vendedor,
    vend.nome;
