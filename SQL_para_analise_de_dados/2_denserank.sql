WITH faturamento_mensal AS (
    SELECT
        v.id_vendedor,
        ve.nm_vendedor,
        TO_CHAR(v.dt_venda, 'YYYY-MM')  AS ano_mes,
        SUM(v.valor_liquido)             AS total_vendido
    FROM
        vendas     v
        JOIN vendedores ve ON ve.id_vendedor = v.id_vendedor
    GROUP BY
        v.id_vendedor,
        ve.nm_vendedor,
        TO_CHAR(v.dt_venda, 'YYYY-MM')
)
SELECT
    ano_mes,
    nm_vendedor,
    total_vendido,
    DENSE_RANK() OVER (
        PARTITION BY ano_mes
        ORDER BY     total_vendido DESC
    ) AS posicao_ranking
FROM
    faturamento_mensal
ORDER BY
    ano_mes,
    posicao_ranking;
