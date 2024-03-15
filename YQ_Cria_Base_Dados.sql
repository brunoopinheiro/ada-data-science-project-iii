-- SCRIPT PARA CRIAÇÃO DO BANCO DE DADOS DA YQ CORRETORA

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `YQ` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `YQ` ;

CREATE TABLE IF NOT EXISTS `YQ`.`clientes` (
  `id_clientes` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `sobrenome` VARCHAR(255) NOT NULL,
  `usuario` VARCHAR(100) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `cpf` CHAR(11) NOT NULL,
  `celular` VARCHAR(45) NOT NULL,
  `senha` CHAR(64) NOT NULL,
  `data_hora_cadastro` DATETIME NOT NULL,
  `data_hora_atualizacao` DATETIME NOT NULL,
  `status` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_clientes`),
  UNIQUE INDEX `id_clientes_UNIQUE` (`id_clientes` ASC) VISIBLE,
  UNIQUE INDEX `usuario_UNIQUE` (`usuario` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `cpf_UNIQUE` (`cpf` ASC) VISIBLE,
  UNIQUE INDEX `celular_UNIQUE` (`celular` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `YQ`.`categorias_investimentos` (
  `id_categorias_investimentos` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `categoria` VARCHAR(100) NOT NULL,
  `data_hora_cadastro` DATETIME NOT NULL,
  `data_hora_atualizacao` DATETIME NOT NULL,
  `status` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_categorias_investimentos`),
  UNIQUE INDEX `id_categorias_investimentos_UNIQUE` (`id_categorias_investimentos` ASC) VISIBLE,
  UNIQUE INDEX `categoria_UNIQUE` (`categoria` ASC) VISIBLE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `YQ`.`tipos_investimentos` (
  `id_tipos_investimentos` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `fk_categoria_investimento` SMALLINT UNSIGNED NOT NULL,
  `tipo_investimento` VARCHAR(100) NOT NULL,
  `descricao` VARCHAR(255) NOT NULL,
  `data_hora_cadastro` DATETIME NOT NULL,
  `data_hora_atualizacao` DATETIME NOT NULL,
  `status` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_tipos_investimentos`, `fk_categoria_investimento`),
  UNIQUE INDEX `id_tipos_investimentos_UNIQUE` (`id_tipos_investimentos` ASC) VISIBLE,
  INDEX `fk_categoria_investimento_idx` (`fk_categoria_investimento` ASC) INVISIBLE,
  UNIQUE INDEX `tipo_investimento_UNIQUE` (`tipo_investimento` ASC) VISIBLE,
  CONSTRAINT `fk_categoria_investimento`
    FOREIGN KEY (`fk_categoria_investimento`)
    REFERENCES `YQ`.`categorias_investimentos` (`id_categorias_investimentos`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `YQ`.`investimentos` (
  `id_investimentos` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `fk_tipo_investimento` SMALLINT UNSIGNED NOT NULL,
  `investimento` VARCHAR(255) NOT NULL,
  `descricao` VARCHAR(255) NOT NULL,
  `data_hora_cadastro` DATETIME NOT NULL,
  `data_hora_atualizacao` DATETIME NOT NULL,
  `status` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_investimentos`, `fk_tipo_investimento`),
  UNIQUE INDEX `id_investimentos_UNIQUE` (`id_investimentos` ASC) VISIBLE,
  INDEX `fk_tipo_investimento_idx` (`fk_tipo_investimento` ASC) VISIBLE,
  UNIQUE INDEX `investimento_UNIQUE` (`investimento` ASC) VISIBLE,
  CONSTRAINT `fk_tipo_investimento`
    FOREIGN KEY (`fk_tipo_investimento`)
    REFERENCES `YQ`.`tipos_investimentos` (`id_tipos_investimentos`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `YQ`.`tipos_transacoes` (
  `id_tipos_transacoes` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `tipo_transacao` VARCHAR(100) NOT NULL,
  `descricao` VARCHAR(255) NOT NULL,
  `data_hora_cadastro` DATETIME NOT NULL,
  `data_hora_atualizacao` DATETIME NOT NULL,
  `status` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_tipos_transacoes`),
  UNIQUE INDEX `id_tipos_transacoes_UNIQUE` (`id_tipos_transacoes` ASC) VISIBLE,
  UNIQUE INDEX `tipo_transacao_UNIQUE` (`tipo_transacao` ASC) VISIBLE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `YQ`.`transacoes` (
  `id_transacoes` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `fk_tipo_transacao` SMALLINT UNSIGNED NOT NULL,
  `fk_investimento` INT UNSIGNED NOT NULL,
  `fk_cliente` INT UNSIGNED NOT NULL,
  `qtde` INT UNSIGNED NOT NULL,
  `valor_total` DECIMAL(10,2) NOT NULL,
  `data_hora_transacao` DATETIME NOT NULL,
  `status` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_transacoes`, `fk_tipo_transacao`, `fk_investimento`, `fk_cliente`),
  UNIQUE INDEX `id_transacoes_UNIQUE` (`id_transacoes` ASC) VISIBLE,
  INDEX `fk_tipo_transacao_idx` (`fk_tipo_transacao` ASC) VISIBLE,
  INDEX `fk_investimento_idx` (`fk_investimento` ASC) VISIBLE,
  INDEX `fk_cliente_idx` (`fk_cliente` ASC) VISIBLE,
  CONSTRAINT `fk_tipo_transacao`
    FOREIGN KEY (`fk_tipo_transacao`)
    REFERENCES `YQ`.`tipos_transacoes` (`id_tipos_transacoes`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_investimento`
    FOREIGN KEY (`fk_investimento`)
    REFERENCES `YQ`.`investimentos` (`id_investimentos`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_cliente`
    FOREIGN KEY (`fk_cliente`)
    REFERENCES `YQ`.`clientes` (`id_clientes`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `YQ`.`clientes_interesses_categorias_investimentos` (
  `fk_clientes` INT UNSIGNED NOT NULL,
  `fk_categorias_investimentos` SMALLINT UNSIGNED NOT NULL,
  `data_hora_cadastro` DATETIME NOT NULL,
  `data_hora_atualizacao` DATETIME NOT NULL,
  `status` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`fk_clientes`, `fk_categorias_investimentos`),
  INDEX `fk_clientes_has_categorias_investimentos_categorias_investi_idx` (`fk_categorias_investimentos` ASC) VISIBLE,
  INDEX `fk_clientes_has_categorias_investimentos_clientes1_idx` (`fk_clientes` ASC) VISIBLE,
  CONSTRAINT `fk_clientes_has_categorias_investimentos_clientes1`
    FOREIGN KEY (`fk_clientes`)
    REFERENCES `YQ`.`clientes` (`id_clientes`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_clientes_has_categorias_investimentos_categorias_investime1`
    FOREIGN KEY (`fk_categorias_investimentos`)
    REFERENCES `YQ`.`categorias_investimentos` (`id_categorias_investimentos`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
