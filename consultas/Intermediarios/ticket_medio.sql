-- Exercicio 2 INTERMEDIARIO
SELECT ven.nome AS vendedor,
       ROUND(AVG(v.valor_liquido), 2) AS ticket_medio
FROM tb_vendedor ven[span_18](start_span)[span_18](end_span)
INNER JOIN tb_venda v ON ven.id_vendedor = v.id_vendedor[span_19](start_span)[span_19](end_span)
WHERE v.status = 'FECHADA[span_20](start_span)'[span_20](end_span)
GROUP BY ven.nome
ORDER BY ticket_medio DESC;
