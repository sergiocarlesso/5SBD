SELECT
    c.nm_cliente,
    v.dt_venda,
    v.valor_liquido,
    ROW_NUMBER() OVER (
        PARTITION BY v.id_cliente
        ORDER BY     v.dt_venda
    ) AS numero_compra
FROM
    vendas    v
    JOIN clientes c ON c.id_cliente = v.id_cliente
WHERE
    v.status_venda = 'FECHADA'
ORDER BY
    c.nm_cliente,
    numero_compra;
