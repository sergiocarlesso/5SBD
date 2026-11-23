/* O índice idx_func_dep_cargo_sal foi criado na ordem (departamento, cargo, salario). Como a consulta utiliza apenas a coluna cargo, o Oracle não consegue aproveitar diretamente a primeira coluna do índice.

Isso acontece porque a regra Leading Column determina que a primeira coluna é a principal referência de organização do índice composto.

Por esse motivo, o Oracle pode optar por realizar um FULL TABLE SCAN, em vez de utilizar o índice de maneira eficiente. */

idx_func_ano_admissao
ON tb_funcionarios (EXTRACT(YEAR FROM data_admissao));

/* Criar índices para todas as colunas não é uma boa prática, pois cada índice precisa ser atualizado quando ocorrem operações de INSERT, UPDATE e DELETE. Isso aumenta o processamento e pode deixar as operações de escrita mais lentas.

Além disso, os índices ocupam espaço em disco e utilizam memória do Buffer Cache, podendo afetar o desempenho geral do banco de dados.

O otimizador do Oracle também analisa o custo de cada consulta antes de escolher um índice. Portanto, nem todo índice será utilizado, principalmente quando a coluna possui poucos valores diferentes ou quando a consulta retorna muitos registros.

Por isso, os índices devem ser criados de acordo com as consultas mais frequentes e as necessidades reais do sistema.*/
