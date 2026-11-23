SELECT
    nome_categoria,
    faturamento_total,
    mes_referencia
FROM V_VENDAS_POR_CATEGORIA
WHERE mes_referencia >= TRUNC(SYSDATE, 'MM')
  AND mes_referencia < ADD_MONTHS(TRUNC(SYSDATE, 'MM'), 1)
  AND faturamento_total > 5000
ORDER BY faturamento_total DESC;
