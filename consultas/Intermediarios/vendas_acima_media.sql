SELECT v.id_venda,
       c.nome AS cliente,
       v.valor_liquido
FROM tb_venda v[cite: 1]
INNER JOIN tb_cliente c ON v.id_cliente = c.id_cliente[cite: 1]
WHERE v.status = 'FECHADA'[cite: 1]
  AND v.valor_liquido > (
      SELECT AVG(valor_liquido)
      FROM tb_venda[cite: 1]
      WHERE status = 'FECHADA'[cite: 1]
  )
ORDER BY v.valor_liquido DESC;
