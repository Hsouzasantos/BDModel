CREATE TABLE IF NOT EXISTS `mydb`.`ClientePF` (
  `idCliente` INT NOT NULL,
  `Nome` VARCHAR(45) NULL,
  `CPF` VARCHAR(45) NULL,
  `Endereço` VARCHAR(45) NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB
CREATE TABLE IF NOT EXISTS `mydb`.`ClientePJ` (
  `idCliente` INT NOT NULL,
  `Nome` VARCHAR(45) NULL,
  `CNPJ` VARCHAR(45) NULL,
  `Endereço` VARCHAR(45) NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB

CREATE TABLE IF NOT EXISTS `mydb`.`ClientePJ` (
  `idCliente` INT NOT NULL,
  `Nome` VARCHAR(45) NULL,
  `CNPJ` VARCHAR(45) NULL,
  `Endereço` VARCHAR(45) NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB

CREATE TABLE IF NOT EXISTS `mydb`.`Produto` (
  `idProduto` INT NOT NULL,
  `Nome` VARCHAR(45) NULL,
  `Pedido_idPedido` INT NOT NULL,
  `Pedido_Cliente_idCliente` INT NOT NULL,
  `Descrição` VARCHAR(45) NULL,
  `Categoria` VARCHAR(45) NULL,
  PRIMARY KEY (`idProduto`, `Pedido_idPedido`, `Pedido_Cliente_idCliente`))
ENGINE = InnoDB

CREATE TABLE IF NOT EXISTS `mydb`.`Fornecedor` (
  `idFornecedor` INT NOT NULL,
  `Nome` VARCHAR(45) NULL,
  `CNPJ` VARCHAR(45) NULL,
  PRIMARY KEY (`idFornecedor`))
ENGINE = InnoDB

CREATE TABLE IF NOT EXISTS `mydb`.`Estoque` (
  `idEstoque` INT NOT NULL,
  `Local` VARCHAR(45) NULL,
  PRIMARY KEY (`idEstoque`))
ENGINE = InnoDB

CREATE TABLE IF NOT EXISTS `mydb`.`Pedido` (
  `idPedido` INT NOT NULL,
  `ClientePF_idCliente` INT NULL,
  `ClientePJ_idCliente` INT NULL,
  `Descrição` VARCHAR(45) NULL,
  `Status do pedido` VARCHAR(45) NULL,
  `Frete` FLOAT NULL,
  `Status_Entrega` VARCHAR(10) NULL,
  PRIMARY KEY (`idPedido`),
  INDEX `fk_Pedido_Cliente_idx` (`ClientePF_idCliente` ASC) VISIBLE,
  INDEX `fk_Pedido_Cliente_copy11_idx` (`ClientePJ_idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_Pedido_Cliente`
    FOREIGN KEY (`ClientePF_idCliente`)
    REFERENCES `mydb`.`ClientePF` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_Cliente_copy11`
    FOREIGN KEY (`ClientePJ_idCliente`)
    REFERENCES `mydb`.`ClientePJ` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB

CREATE TABLE IF NOT EXISTS `mydb`.`Disponibilizando` (
  `Produto_idProduto` INT NOT NULL,
  `Fornecedor_idFornecedor` INT NOT NULL,
  PRIMARY KEY (`Produto_idProduto`, `Fornecedor_idFornecedor`),
  INDEX `fk_Produto_has_Fornecedor_Fornecedor1_idx` (`Fornecedor_idFornecedor` ASC) VISIBLE,
  INDEX `fk_Produto_has_Fornecedor_Produto1_idx` (`Produto_idProduto` ASC) VISIBLE,
  CONSTRAINT `fk_Produto_has_Fornecedor_Produto1`
    FOREIGN KEY (`Produto_idProduto`)
    REFERENCES `mydb`.`Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produto_has_Fornecedor_Fornecedor1`
    FOREIGN KEY (`Fornecedor_idFornecedor`)
    REFERENCES `mydb`.`Fornecedor` (`idFornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB

CREATE TABLE IF NOT EXISTS `mydb`.`Estoque_has_Produto` (
  `Estoque_idEstoque` INT NOT NULL,
  `Produto_idProduto` INT NOT NULL,
  PRIMARY KEY (`Estoque_idEstoque`, `Produto_idProduto`),
  INDEX `fk_Estoque_has_Produto_Produto1_idx` (`Produto_idProduto` ASC) VISIBLE,
  INDEX `fk_Estoque_has_Produto_Estoque1_idx` (`Estoque_idEstoque` ASC) VISIBLE,
  CONSTRAINT `fk_Estoque_has_Produto_Estoque1`
    FOREIGN KEY (`Estoque_idEstoque`)
    REFERENCES `mydb`.`Estoque` (`idEstoque`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Estoque_has_Produto_Produto1`
    FOREIGN KEY (`Produto_idProduto`)
    REFERENCES `mydb`.`Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
CREATE TABLE IF NOT EXISTS `mydb`.`Estoque` (
  `idEstoque` INT NOT NULL,
  `Local` VARCHAR(45) NULL,
  PRIMARY KEY (`idEstoque`))
ENGINE = InnoDB

CREATE TABLE IF NOT EXISTS `mydb`.`Solicitação` (
  `Estoque_idEstoque` INT NOT NULL,
  `Quantidade` INT NULL,
  `Produto_idProduto` INT NOT NULL,
  `Produto_Pedido_idPedido` INT NOT NULL,
  `Produto_Pedido_Cliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`Estoque_idEstoque`, `Produto_idProduto`, `Produto_Pedido_idPedido`, `Produto_Pedido_Cliente_idCliente`),
  INDEX `fk_Produto_has_Estoque_has_Estoque_Estoque1_idx` (`Estoque_idEstoque` ASC) VISIBLE,
  INDEX `fk_Solicitação_Produto1_idx` (`Produto_idProduto` ASC, `Produto_Pedido_idPedido` ASC, `Produto_Pedido_Cliente_idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_Produto_has_Estoque_has_Estoque_Estoque1`
    FOREIGN KEY (`Estoque_idEstoque`)
    REFERENCES `mydb`.`Estoque` (`idEstoque`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Solicitação_Produto1`
    FOREIGN KEY (`Produto_idProduto` , `Produto_Pedido_idPedido` , `Produto_Pedido_Cliente_idCliente`)
    REFERENCES `mydb`.`Produto` (`idProduto` , `Pedido_idPedido` , `Pedido_Cliente_idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB

CREATE TABLE IF NOT EXISTS `mydb`.`Produto_Pedido` (
  `Produto_idProduto` INT NOT NULL,
  `Pedido_idPedido` INT NOT NULL,
  `Quantidade` INT NULL,
  PRIMARY KEY (`Produto_idProduto`, `Pedido_idPedido`),
  INDEX `fk_Pedido_has_Produto_Produto1_idx` (`Produto_idProduto` ASC) VISIBLE,
  INDEX `fk_Pedido_has_Produto_Pedido1_idx` (`Pedido_idPedido` ASC) VISIBLE,
  CONSTRAINT `fk_Pedido_has_Produto_Pedido1`
    FOREIGN KEY (`Pedido_idPedido`)
    REFERENCES `mydb`.`Pedido` (`idPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_has_Produto_Produto1`
    FOREIGN KEY (`Produto_idProduto`)
    REFERENCES `mydb`.`Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
