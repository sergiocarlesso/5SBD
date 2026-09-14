-- EXERCICIO 1 
-- Listagem de Clientes Ativos: Escreva uma consulta que retorne o nome, o e-mail e o telefone de todos os clientes que estão com o status ativo (ativo = 'S'). Ordene o resultado alfabeticamente pelo nome.
SELECT nome, email, telefone
FROM tb_cliente[span_0](start_span)[span_0](end_span)
WHERE ativo = 'S[span_1](start_span)'[span_1](end_span)
ORDER BY nome;
