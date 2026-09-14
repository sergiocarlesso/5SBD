-- Exercicio 5
SELECT nome, preco_unit
FROM tb_produto[span_12](start_span)[span_12](end_span)
WHERE ativo = 'S[span_13](start_span)'[span_13](end_span)
ORDER BY preco_unit DESC;
