
# YQ Corretora de Investimentos

A YQ Corretora de Investimentos é uma corretora fictícia criada para o Projeto de Banco de Dados da disciplina de Banco de Dados I da Ada (Santander Coders 2023) Turma 1115, disciplina ministrada pelo professor Maurício Sobrinho.

A proposta da corretora é de oferecer investimentos para seus clientes com um portfólio diversificado, desde investimentos em renda fixa, variável, fundos de investimentos, criptomoedas e etc.


## Autores

- Alexandre Rodrigues Nettho
- Bruno Pinheiro
- Luciane Berger da Silva
- Márcio Siena
- Thiago Rodrigues Medeiros
- Vivian Brancaglioni
- Vinicius Melo



## Projeto de Banco de Dados

### Etapa 1 – Definição do tipo de banco de dados
Nesta etapa decidimos por criar um banco de dados na área de investimentos e o banco de dados escolhido foi o MySQL.

### Etapa 2 – Pré-Modelagem
Nesta etapa utilizamos o software Excel para elaboração das tabelas do banco de dados de investimentos para assim enxergarmos como funcionaria um sistema desenvolvido com base em um banco de dados de investimentos. Utilizar o Excel simulando cada planilha (aba) como se fosse uma tabela de um banco de dados, facilita e muito a construção e modelagem do banco de dados.

### Etapa 3 – Modelagem de Banco de Dados
Após a finalização da planilha do Excel (YQ Corretora de Investimentos.xlsx), chegou a hora de começar a modelar nas ferramentas BRModelo e também no MySQL Workbench (EER DIagram) para verificarmos a modelagem do banco de dados em forma visual.

###Restrições do Projeto
A YQ Corretora decidiu que os clientes poderão ter apenas um número de celular cadastrado ao qual será utilizado para validar a entrada no sistema para fazer as transações de compra e venda e recebimento de valores (utilizando a autenticação de dois fatores na hora de acessar o sistema “senha + ). Dessa forma, na modelagem o número de celular ficará na tabela de clientes. 

### Etapa 4 – Criação do banco e tabelas no MYSQL
Nesta etapa após a finalização da modelagem, foi criado o banco de dados YQ e suas respectivas tabelas.

### Etapa 5 – Consultas Inserções, alterações no banco de dados
Como a base de dados do YQ é uma base de dados fictícia, efetuamos as inserções dos conjuntos de dados através da importação dos dados .csv. 
Também efetuamos inserções e updates manualmente na base de dados conforme proposta do projeto. Os mesmos estão nos scripts .SQL anexadas ao projeto.
Efetuamos alterações em uma das tabelas do banco de dados para incluir uma nova coluna.
Fizemos diversas consultas (queries) para analisar o conjunto de dados.

## Regra de Negócio da Corretora YQ
Os investimentos são categorizados da seguinte forma:
- Categoria de Investimentos: É a parte mais genérica do conjunto de investimentos e é a parte que define em que grupo um investimento faz parte, ou seja, dependendo de que categoria de investimento ela faça parte o investimento poderá ter uma taxa de juros fixa acordada durante a contratação (renda fixa), ter preços que oscilam de acordo com o mercado financeiro (renda variável) e assim por diante.

- Tipos de Investimentos: São os tipos de ativos financeiros negociados dentro de uma corretora, por exemplo Tesouro Direto, CDBs, LCIs, LCAs, Ações, Fundos Imobiliários e etc.

- Investimentos: São os ativos propriamente ditos, como Tesouro SELIC (atrelado a taxa SELIC), CDB 100% do CDI, PETR4 (Ação da Petrobras), MXRF11 (Fundo Imobiliário de Papel) e entre outros.

Para que a corretora possa funcionar além de ter autorização pela CVM (Comissão de Valores Mobiliários) ela precisa de clientes, para isso o banco de dados deverá dispor de uma tabela clientes ao qual irá armazenar os dados necessários que identifiquem os clientes.
Da mesma forma, o banco de dados necessita também ter um registro dos interesses dos seus clientes quanto às diferentes modalidades de investimentos (categorias de investimentos) para assim, exibir somente os tipos de investimentos adequados ao cliente. Até mesmo porque imagine um cliente com o perfil de investimento mais conservador (perfil daquele cliente com interesse em investimentos mais seguros, renda fixa) e o sistema fica exibindo para o mesmo, investimentos com perfil mais arrojado “agressivo”, como ações, fundos de investimentos em renda variável, com preços que oscilam muito e alto risco de investimentos. O cliente certamente desistiria de utilizar o sistema da corretora e procuraria outra que atendesse aos seus interesses.
Sendo assim foi criado a tabela chamada clientes_interesses_categorias_investimentos que é uma tabela responsável por armazenar os diferentes tipos de interesses dos clientes para exibir somente os investimentos que fazem parte da categoria de interesse.
Outro ponto importante a mencionar é em relação às transações efetuadas pelos clientes dentro da corretora quanto as compras, vendas e demais possibilidades de negociações de ativos (investimentos), para isso é necessário categorizar os tipos de transações, sendo criada uma tabela para isso, categorizando as negociações da seguinte forma:

- Compra: Compra de Ativos
- Venda: Venda de Ativos
- Dividendos: Recebimento de Dividendos
- JCP: Recebimento de Juros sobre o capital próprio
- Aluguel: Aluguel de Ativos
- Resgate: Resgate de Ativos

Dessa forma o cliente possuí diversas possibilidades de negociações dos ativos (investimentos) dentro da corretora de forma a atender as suas necessidades. É possível também futuramente novas possibilidades de tipos de transações serem incorporadas na corretora YQ.

Por último, todas as negociações efetuadas pelos clientes ficam armazenadas na tabela de transações, facilitando as consultas provenientes dos sistemas da YQ para acompanhamento e controle das atividades dos ativos financeiros, como também acompanhamento de seus próprios clientes quanto aos investimentos efetuados.
Observação: O cliente só consegue enxergar as transações efetuadas por ele próprio no sistema. (Regra de segurança).