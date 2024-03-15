USE yq;

# REALIZANDO ALTERAÇÃO NA TABELA clientes INCLUINDO O CAMPO renda_mensal e defindo o valor default como 0.00

ALTER TABLE `yq`.`clientes` 
ADD COLUMN `renda_mensal` DECIMAL(10,2) NOT NULL DEFAULT 0.00 AFTER `senha`;

# CONSULTANDO NA TABELA clientes SE A COLUNA renda_mensal está criada e com o valor 0.00 (DEFAULT) em cada linha

SELECT * FROM clientes;

# ATUALIZANDO MANUALMENTE AS RENDAS MENSAIS DE CADA CLIENTE (simulando como se o cliente acessasse o app da YQ e atualizasse a informação)
UPDATE `yq`.`clientes` SET `renda_mensal` = '5000', `data_hora_atualizacao` = NOW() WHERE (`id_clientes` = '1');
UPDATE `yq`.`clientes` SET `renda_mensal` = '7500', `data_hora_atualizacao` = NOW() WHERE (`id_clientes` = '2');
UPDATE `yq`.`clientes` SET `renda_mensal` = '12000', `data_hora_atualizacao` = NOW() WHERE (`id_clientes` = '3');
UPDATE `yq`.`clientes` SET `renda_mensal` = '9600', `data_hora_atualizacao` = NOW() WHERE (`id_clientes` = '4');
UPDATE `yq`.`clientes` SET `renda_mensal` = '3450', `data_hora_atualizacao` = NOW() WHERE (`id_clientes` = '5');
UPDATE `yq`.`clientes` SET `renda_mensal` = '7800', `data_hora_atualizacao` = NOW() WHERE (`id_clientes` = '6');
UPDATE `yq`.`clientes` SET `renda_mensal` = '50000', `data_hora_atualizacao` = NOW() WHERE (`id_clientes` = '7');
UPDATE `yq`.`clientes` SET `renda_mensal` = '23000', `data_hora_atualizacao` = NOW() WHERE (`id_clientes` = '8');
UPDATE `yq`.`clientes` SET `renda_mensal` = '6300', `data_hora_atualizacao` = NOW() WHERE (`id_clientes` = '9');
UPDATE `yq`.`clientes` SET `renda_mensal` = '14000', `data_hora_atualizacao` = NOW() WHERE (`id_clientes` = '10');
UPDATE `yq`.`clientes` SET `renda_mensal` = '2900', `data_hora_atualizacao` = NOW() WHERE (`id_clientes` = '11');
UPDATE `yq`.`clientes` SET `renda_mensal` = '21000', `data_hora_atualizacao` = NOW() WHERE (`id_clientes` = '12');
UPDATE `yq`.`clientes` SET `renda_mensal` = '4780', `data_hora_atualizacao` = NOW() WHERE (`id_clientes` = '13');
UPDATE `yq`.`clientes` SET `renda_mensal` = '6520', `data_hora_atualizacao` = NOW() WHERE (`id_clientes` = '14');
UPDATE `yq`.`clientes` SET `renda_mensal` = '4890', `data_hora_atualizacao` = NOW() WHERE (`id_clientes` = '15');
UPDATE `yq`.`clientes` SET `renda_mensal` = '3000', `data_hora_atualizacao` = NOW() WHERE (`id_clientes` = '16');
UPDATE `yq`.`clientes` SET `renda_mensal` = '7000', `data_hora_atualizacao` = NOW() WHERE (`id_clientes` = '17');
UPDATE `yq`.`clientes` SET `renda_mensal` = '11000', `data_hora_atualizacao` = NOW() WHERE (`id_clientes` = '18');
UPDATE `yq`.`clientes` SET `renda_mensal` = '5100', `data_hora_atualizacao` = NOW() WHERE (`id_clientes` = '19');
UPDATE `yq`.`clientes` SET `renda_mensal` = '4200', `data_hora_atualizacao` = NOW() WHERE (`id_clientes` = '20');
UPDATE `yq`.`clientes` SET `renda_mensal` = '5230', `data_hora_atualizacao` = NOW() WHERE (`id_clientes` = '21');
UPDATE `yq`.`clientes` SET `renda_mensal` = '74800', `data_hora_atualizacao` = NOW() WHERE (`id_clientes` = '22');
UPDATE `yq`.`clientes` SET `renda_mensal` = '21000', `data_hora_atualizacao` = NOW() WHERE (`id_clientes` = '23');
UPDATE `yq`.`clientes` SET `renda_mensal` = '6000', `data_hora_atualizacao` = NOW() WHERE (`id_clientes` = '24');
UPDATE `yq`.`clientes` SET `renda_mensal` = '9500', `data_hora_atualizacao` = NOW() WHERE (`id_clientes` = '25');
UPDATE `yq`.`clientes` SET `renda_mensal` = '4780', `data_hora_atualizacao` = NOW() WHERE (`id_clientes` = '26');
UPDATE `yq`.`clientes` SET `renda_mensal` = '12500', `data_hora_atualizacao` = NOW() WHERE (`id_clientes` = '27');
UPDATE `yq`.`clientes` SET `renda_mensal` = '18500', `data_hora_atualizacao` = NOW() WHERE (`id_clientes` = '28');
UPDATE `yq`.`clientes` SET `renda_mensal` = '2350', `data_hora_atualizacao` = NOW() WHERE (`id_clientes` = '29');
UPDATE `yq`.`clientes` SET `renda_mensal` = '7400', `data_hora_atualizacao` = NOW() WHERE (`id_clientes` = '30');

# CONSULTANDO NA TABELA clientes SE A COLUNA renda_mensal e data_hora_atualização foram efetivadas

SELECT renda_mensal, data_hora_atualizacao FROM clientes;

# INSERINDO 3 NOVOS INVESTIMENTOS EM AÇÕES E 2 NOVOS INVESTIMENTOS EM FUNDOS IMOBILIÁRIOS

INSERT INTO `yq`.`investimentos`
(`fk_tipo_investimento`,
`investimento`,
`descricao`,
`data_hora_cadastro`,
`data_hora_atualizacao`)
VALUES
(6, 'SBSP3', 'SABESP', NOW(), NOW()),
(6, 'CPFE3', 'CPFL ENERGIA', NOW(), NOW()),
(6, 'EMBR3', 'EMBRAER', NOW(), NOW()),
(10, 'TORD11', 'TORDESILHAS EI FDO. INV. IMOB.', NOW(), NOW()),
(10, 'HGRU11', 'CSHG Renda Urbana', NOW(), NOW());

# CONSULTANDO A QUANTIDADE DE CLIENTES DA YQ Corretora

SELECT COUNT(nome) FROM clientes;

# CONSULTANDO AS CATEGORIAS DE INVESTIMENTOS DISPONÍVEIS NA YQ Corretora

SELECT categoria FROM categorias_investimentos; 

# CONSULTANDO OS TIPOS DE INVESTIMENTOS DISPONÍVEIS NA YQ CORRETORA YQ Corretora

SELECT tipo_investimento FROM tipos_investimentos;

# CONSULTANDO OS TIPOS DE INVESTIMENTOS POR CATEGORIAS DE INVESTIMENTOS DISPONÍVEIS NA YQ CORRETORA E ORDENANDO-OS POR CATEGORIA

SELECT c.categoria AS categoria, t.tipo_investimento AS tipo_investimento, t.descricao AS descrição 
FROM tipos_investimentos t  
INNER JOIN categorias_investimentos c  ON t.fk_categoria_investimento = c.id_categorias_investimentos
ORDER BY c.categoria;

# AGRUPANDO OS TIPOS DE INVESTIMENTO COM BASE EM SUAS CATEGORIAS

SELECT c.categoria AS categoria, 
       GROUP_CONCAT(t.tipo_investimento) AS tipos_investimento, 
       GROUP_CONCAT(t.descricao) AS descricao
FROM tipos_investimentos t  
INNER JOIN categorias_investimentos c  
ON t.fk_categoria_investimento = c.id_categorias_investimentos
GROUP BY c.categoria
ORDER BY c.categoria;

# CONSULTANDO OS INVESTIMENTOS DISPONÍVEIS NA YQ Corretora

SELECT investimento, descricao FROM investimentos;

# CONSULTANDO OS INVESTIMENTOS POR TIPOS DE INVESTIMENTOS DISPONÍVEIS NA YQ CORRETORA E ORDENANDO-OS POR TIPO DE INVESTIMENTO

SELECT t.tipo_investimento AS tipo_investimento, i.investimento AS investimento, i.descricao AS descrição 
FROM tipos_investimentos t  
INNER JOIN investimentos i  ON i.fk_tipo_investimento = t.id_tipos_investimentos
ORDER BY t.tipo_investimento;

# AGRUPANDO OS INVESTIMENTO COM BASE EM SEUS  TIPOS DE INVESTIMENTOS

SELECT t.tipo_investimento AS 'tipo de investimento', 
       GROUP_CONCAT(i.investimento) AS investimentos, 
       GROUP_CONCAT(i.descricao) AS descricao
FROM investimentos i  
INNER JOIN tipos_investimentos t  
ON i.fk_tipo_investimento = t.id_tipos_investimentos
GROUP BY t.tipo_investimento
ORDER BY t.tipo_investimento;

# QUANTOS INVESTIMENTOS EXISTEM PARA CADA TIPO DE INVESTIMENTO?
SELECT 
    t.tipo_investimento AS 'Tipo de Investimento', 
    COUNT(i.id_investimentos) AS 'Quantidade de Investimentos'
FROM 
    investimentos i  
INNER JOIN 
    tipos_investimentos t  
ON 
    i.fk_tipo_investimento = t.id_tipos_investimentos
GROUP BY 
    t.tipo_investimento
ORDER BY 
    t.tipo_investimento;

# QUAIS SÃO OS TIPOS DE TRANSAÇÕES EXISTENTES NA CORRETORA?

SELECT tipo_transacao, descricao FROM tipos_transacoes;

# QUANTAS TRANSAÇÕES FORAM EFETUADAS NA CORRETORA?

SELECT COUNT(*) AS 'Qtde' FROM transacoes;

# QUANTAS TRANSAÇÕES FORAM FEITAS PELO CLIENTE PEDRO ALMEIDA DO CPF '91665606835'

SELECT COUNT(*) FROM transacoes WHERE fk_cliente = (SELECT id_clientes FROM clientes WHERE cpf = '91665606835');

# QUANTAS TRANSAÇÕES POR TIPO DE INVESTIMENTO FORAM FEITAS PELO CLIENTE PEDRO ALMEIDA DO CPF '91665606835' LISTAR OS VALORES TOTAIS TAMBÉM
SELECT
    tt.tipo_transacao AS 'Tipo de Transação',
    COUNT(*) AS 'Número de Transações',
    SUM(t.valor_total) AS 'Valor Total'
FROM
    transacoes t
INNER JOIN
    tipos_transacoes tt ON t.fk_tipo_transacao = tt.id_tipos_transacoes
INNER JOIN
    clientes c ON t.fk_cliente = c.id_clientes
WHERE
   c.cpf = '91665606835'
GROUP BY
    t.fk_tipo_transacao;

# LISTE TODAS AS TRANSAÇÕES EFETUADAS POR PEDRO ALMEIDA QUE TIVERAM ACIMA DE 5 TRANSAÇÕES
SELECT
    tt.tipo_transacao AS 'Tipo de Transação',
    COUNT(*) AS 'Número de Transações',
    SUM(t.valor_total) AS 'Valor Total'
FROM
    transacoes t
INNER JOIN
    tipos_transacoes tt ON t.fk_tipo_transacao = tt.id_tipos_transacoes
INNER JOIN
    clientes c ON t.fk_cliente = c.id_clientes
WHERE
   c.cpf = '91665606835'
GROUP BY
    t.fk_tipo_transacao
HAVING
    COUNT(*) > 5;

# REMOVENDO O INVESTIMENTO EM HGRU11 DOS FUNDOS IMOBILIÁRIOS DEVIDO A NÃO MAIS OFERTA PELA CORRETORA

DELETE FROM `yq`.`investimentos`
WHERE investimento = 'HGRU11';

# VERIFICANDO QUAIS ATIVOS (INVESTIMENTOS) AINDA NÃO POSSUEM TRANSAÇÕES EFETIVADAS PELOS CLIENTES
SELECT
    i.investimento,
    i.descricao
FROM
    investimentos i
WHERE NOT EXISTS (
    SELECT 1
    FROM transacoes t
    WHERE t.fk_investimento = i.id_investimentos
);

# VERIFICANDO OS 10 CLIENTES COM MAIORES TRANSAÇÕES NA YQ CORRETORA
SELECT
    c.id_clientes,
    c.nome,
    c.sobrenome,
    COUNT(*) AS 'Número de Transações'
FROM
    clientes c
INNER JOIN
    transacoes t ON c.id_clientes = t.fk_cliente
GROUP BY
    c.id_clientes
ORDER BY
    COUNT(*) DESC
LIMIT 10;

# VERIFICANDO OS 10 CLIENTES COM MAIORES TRANSAÇÕES NA YQ CORRETORA DE COMPRA E VENDA

SELECT
    c.id_clientes,
    c.nome,
    c.sobrenome,
    SUM(CASE WHEN tt.tipo_transacao = 'Compra' THEN 1 ELSE 0 END) AS 'Número de Compras',
    SUM(CASE WHEN tt.tipo_transacao = 'Venda' THEN 1 ELSE 0 END) AS 'Número de Vendas',
    SUM(CASE WHEN tt.tipo_transacao = 'Compra' THEN tr.valor_total ELSE 0 END) AS 'Valor Total de Compras',
    SUM(CASE WHEN tt.tipo_transacao = 'Venda' THEN tr.valor_total ELSE 0 END) AS 'Valor Total de Vendas'
FROM
    clientes c
INNER JOIN
    transacoes tr ON c.id_clientes = tr.fk_cliente
INNER JOIN
    tipos_transacoes tt ON tr.fk_tipo_transacao = tt.id_tipos_transacoes
WHERE
    tt.tipo_transacao IN ('Compra', 'Venda')
GROUP BY
    c.id_clientes, c.nome, c.sobrenome
ORDER BY
    COUNT(*) DESC
LIMIT 10;