-- Exercicio 1 INTERMEDIARIO
SELECT canal,
       SUM(valor_liquido) AS faturamento_total
FROM tb_venda[span_15](start_span)[span_15](end_span)
WHERE status = 'FECHADA[span_16](start_span)'[span_16](end_span)
GROUP BY canal
ORDER BY faturamento_total DESC;
