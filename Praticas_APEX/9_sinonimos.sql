/* O usuário ANALISTA_BI recebe permissão para consultar a tabela HR.EMPLOYEES e cria um sinônimo chamado FUNC.

Assim, consegue acessar os dados sem precisar escrever o nome completo da tabela. O sinônimo facilita o acesso, mas não substitui a permissão de leitura. */

-- Executar como administrador ou proprietário HR
GRANT SELECT ON hr.employees TO analista_bi;
GRANT CREATE SYNONYM TO analista_bi;

/* O Oracle prioriza os objetos existentes no próprio schema antes de procurar sinônimos privados ou públicos.

Ordem de prioridade:

Objeto local do usuário.

Sinônimo privado.

Sinônimo público.

Portanto, a tabela física possui prioridade na resolução do nome. */
