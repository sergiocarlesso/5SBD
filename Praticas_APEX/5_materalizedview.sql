CREATE MATERIALIZED VIEW mv_vendas_categoria
BUILD IMMEDIATE
REFRESH COMPLETE ON DEMAND
AS
SELECT
    p.categoria AS categoria_produto,
    COUNT(*) AS quantidade_vendas,
    SUM(v.quantidade) AS qtd_total_vendida,
    SUM(v.valor_total) AS faturamento_total
FROM tb_vendas v
INNER JOIN tb_produtos p
    ON v.id_produto = p.id_produto
GROUP BY
    p.categoria;

/* A Materialized View mv_vendas_categoria consolida o faturamento e a quantidade de vendas agrupados por categoria de produto.

O comando INNER JOIN relaciona as tabelas tb_vendas e tb_produtos, permitindo identificar a categoria correspondente a cada venda.

A função COUNT(*) contabiliza a quantidade de registros de vendas, enquanto SUM(v.quantidade) calcula a quantidade total de unidades vendidas e SUM(v.valor_total) calcula o faturamento acumulado.

A configuração REFRESH COMPLETE ON DEMAND determina que a atualização será feita manualmente, recalculando todos os resultados da consulta original.

Essa estrutura facilita a geração de relatórios e dashboards de BI, reduzindo a necessidade de executar repetidamente consultas complexas sobre as tabelas transacionais.
