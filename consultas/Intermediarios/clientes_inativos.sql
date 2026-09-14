-- EXERCICIO 3 INTERMEDIARIO
SELECT c.nome, c.email
FROM tb_cliente c[span_22](start_span)[span_22](end_span)
WHERE NOT EXISTS (
    SELECT 1
    FROM tb_venda v[span_23](start_span)[span_23](end_span)
    WHERE v.id_cliente = c.id_cliente[span_24](start_span)[span_24](end_span)
)
ORDER BY c.nome;
