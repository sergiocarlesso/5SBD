WITH receita_vendedor AS (
    SELECT
        ve.nm_vendedor,
        SUM(v.valor_liquido)  AS receita_total
    FROM
        vendas     v
        JOIN vendedores ve ON ve.id_vendedor = v.id_vendedor
    WHERE
        v.status_venda = 'FECHADA'
    GROUP BY
        ve.nm_vendedor
)
SELECT
    nm_vendedor,
    receita_total,
    ROUND(
        receita_total / SUM(receita_total) OVER() * 100,
        2
    ) AS perc_participacao
FROM
    receita_vendedor
ORDER BY
    receita_total DESC;
