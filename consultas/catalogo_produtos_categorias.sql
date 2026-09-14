-- Exercicio 3
SELECT p.nome AS produto,
       p.sku,
       c.nome AS categoria
FROM tb_produto p[span_7](start_span)[span_7](end_span)
INNER JOIN tb_categoria c ON p.id_categoria = c.id_categoria[span_8](start_span)[span_8](end_span)
ORDER BY c.nome, p.nome;
