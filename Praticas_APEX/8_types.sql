CREATE OR REPLACE TYPE BODY t_retangulo AS

    MEMBER FUNCTION calcular_area RETURN NUMBER IS
    BEGIN
        RETURN largura * altura;
    END;

    MEMBER FUNCTION calcular_perimetro RETURN NUMBER IS
    BEGIN
        RETURN 2 * (largura + altura);
    END;

END;
/* O tipo t_retangulo possui largura e altura. O método calcular_area multiplica essas medidas, enquanto calcular_perimetro soma os lados do retângulo. */

CREATE OR REPLACE TYPE BODY t_retangulo AS

    MEMBER FUNCTION calcular_area RETURN NUMBER IS
    BEGIN
        RETURN largura * altura;
    END;

    MEMBER FUNCTION calcular_perimetro RETURN NUMBER IS
    BEGIN
        RETURN 2 * (largura + altura);
    END;

    MAP MEMBER FUNCTION ordenar RETURN NUMBER IS
    BEGIN
        RETURN largura * altura;
    END;

END;
/* As Nested Tables permitem armazenar vários registros relacionados dentro de uma coluna de uma tabela principal, facilitando a organização de dados agrupados. Porém, as consultas podem ficar mais complexas quando precisamos acessar os elementos internos.

Na modelagem relacional tradicional, utilizamos duas tabelas relacionadas por uma chave estrangeira (Foreign Key). Essa abordagem facilita consultas SQL, JOINs e a manutenção da integridade dos dados.

Além disso, ferramentas de integração e ORM geralmente possuem melhor suporte para tabelas relacionais tradicionais. Já as Nested Tables podem apresentar dificuldades de mapeamento.

Em cargas massivas de dados (ETL), as Nested Tables também podem gerar maior custo de processamento e I/O devido ao armazenamento auxiliar. 

Por isso, a modelagem relacional tradicional costuma ser mais indicada para sistemas corporativos que exigem consultas frequentes, integração e manutenção de dados. */
