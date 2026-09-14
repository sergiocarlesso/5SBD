-- EXERCICIO 5
SELECT nome,
       preco_unit,
       CASE
           WHEN preco_unit < 50.00 THEN 'BARATO'
           WHEN preco_unit <= 200.00 THEN 'MÉDIO'
           ELSE 'CARO'
       END AS faixa_preco
FROM tb_produto[cite: 1]
ORDER BY preco_unit DESC;
