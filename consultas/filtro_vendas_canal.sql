-- EXERCICIO 2
SELECT id_venda, dt_venda, valor_liquido
FROM tb_venda[span_3](start_span)[span_3](end_span)
WHERE canal = 'APP[span_4](start_span)'[span_4](end_span)
  AND status = 'FECHADA[span_5](start_span)'[span_5](end_span)
ORDER BY dt_venda DESC;
