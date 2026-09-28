WITH ranking_produtos AS (
    SELECT
        cat.nm_categoria,
        p.nm_produto,
        SUM(iv.qtd_vendida)    AS total_qtd_vendida,
        DENSE_RANK() OVER (
            PARTITION BY p.id_categoria
            ORDER BY     SUM(iv.qtd_vendida) DESC
        )                      AS ranking_categoria
    FROM
        itens_venda  iv
        JOIN produtos    p   ON p.id_produto    = iv.id_produto
        JOIN categorias  cat ON cat.id_categoria = p.id_categoria
    GROUP BY
        p.id_categoria,
        cat.nm_categoria,
        p.nm_produto
)
SELECT
    nm_categoria,
    nm_produto,
    total_qtd_vendida,
    ranking_categoria
FROM
    ranking_produtos
WHERE
    ranking_categoria <= 2
ORDER BY
    nm_categoria,
    ranking_categoria;
