CREATE SEQUENCE seq_ticket_diario
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 5
CYCLE
CACHE 2;

/* A sequência começa no valor 1 e incrementa de um em um até atingir o limite máximo de 5.

Como foi configurada com CYCLE, ao ultrapassar o valor 5, ela retorna automaticamente ao valor mínimo 1.

Portanto, os valores gerados serão 1, 2, 3, 4, 5, 1 e 2. */

CREATE OR REPLACE TRIGGER trg_cliente_id
BEFORE INSERT ON tb_clientes_apex
FOR EACH ROW
BEGIN
    IF :NEW.id_cliente IS NULL THEN
        :NEW.id_cliente := seq_clientes_id.NEXTVAL;
    END IF;
END;

/* A forma antiga utiliza uma Trigger para preencher automaticamente o ID do cliente antes da inserção de um registro.

Já a forma moderna utiliza DEFAULT seq_clientes_id.NEXTVAL diretamente na definição da coluna.

A utilização de DEFAULT torna o código mais simples, facilita a manutenção e elimina a necessidade de criar uma Trigger apenas para gerar identificadores.

A opção NOCACHE faz com que o Oracle não mantenha uma quantidade de valores da sequência previamente armazenada na memória.

Em sistemas com muitas operações simultâneas, isso pode aumentar a contenção na SGA, principalmente por meio de row cache lock, além de gerar mais acessos ao dicionário de dados.

Como consequência, a geração de novos números pode ficar mais lenta, prejudicando o desempenho das operações de INSERT.

Por isso, a utilização de CACHE é recomendada em sistemas com alto volume de operações, pois mantém valores disponíveis na memória e melhora a performance. */
