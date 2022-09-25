CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `idCliente` INT NOT NULL,
  `Nome` VARCHAR(45) NULL,
  `CPF` VARCHAR(45) NULL,
  `Endereço` VARCHAR(45) NULL,
  `Autoriza` VARCHAR(45) NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB

CREATE TABLE IF NOT EXISTS `mydb`.`Mecanico` (
  `idMecanicos` INT NOT NULL,
  `Ordem de Serviço_idOrdem de Serviço` INT NOT NULL,
  `Avalia_Veiculo` VARCHAR(45) NULL,
  `Executa_Serviços` VARCHAR(45) NULL,
  `Nome` VARCHAR(45) NULL,
  `Endereço` VARCHAR(45) NULL,
  `Especialidade` VARCHAR(45) NULL,
  PRIMARY KEY (`idMecanicos`, `Ordem de Serviço_idOrdem de Serviço`),
  INDEX `fk_Mecanicos_Ordem de Serviço1_idx` (`Ordem de Serviço_idOrdem de Serviço` ASC) VISIBLE,
  CONSTRAINT `fk_Mecanicos_Ordem de Serviço1`
    FOREIGN KEY (`Ordem de Serviço_idOrdem de Serviço`)
    REFERENCES `mydb`.`Ordem de Serviço` (`idOrdem de Serviço`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB

CREATE TABLE IF NOT EXISTS `mydb`.`Serviços` (
  `idServiços` INT NOT NULL,
  `Conserto` VARCHAR(45) NULL,
  `Revisão` VARCHAR(45) NULL,
  PRIMARY KEY (`idServiços`))
ENGINE = InnoDB

CREATE TABLE IF NOT EXISTS `mydb`.`Ordem de Serviço` (
  `idOrdem de Serviço` INT NOT NULL,
  `Valor_serviço` FLOAT NULL,
  `Data de Emissão` DATE NULL,
  `Status` VARCHAR(45) NULL,
  `Data Conclusão` DATE NULL,
  PRIMARY KEY (`idOrdem de Serviço`))
ENGINE = InnoDB

CREATE TABLE IF NOT EXISTS `mydb`.`Serviços_has_Ordem de Serviço` (
  `Serviços_idServiços` INT NOT NULL,
  `Ordem de Serviço_idOrdem de Serviço` INT NOT NULL,
  PRIMARY KEY (`Serviços_idServiços`, `Ordem de Serviço_idOrdem de Serviço`),
  INDEX `fk_Serviços_has_Ordem de Serviço_Ordem de Serviço1_idx` (`Ordem de Serviço_idOrdem de Serviço` ASC) VISIBLE,
  INDEX `fk_Serviços_has_Ordem de Serviço_Serviços1_idx` (`Serviços_idServiços` ASC) VISIBLE,
  CONSTRAINT `fk_Serviços_has_Ordem de Serviço_Serviços1`
    FOREIGN KEY (`Serviços_idServiços`)
    REFERENCES `mydb`.`Serviços` (`idServiços`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Serviços_has_Ordem de Serviço_Ordem de Serviço1`
    FOREIGN KEY (`Ordem de Serviço_idOrdem de Serviço`)
    REFERENCES `mydb`.`Ordem de Serviço` (`idOrdem de Serviço`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB

CREATE TABLE IF NOT EXISTS `mydb`.`Veiculo` (
  `idVeiculo` INT NOT NULL,
  `Cliente_idCliente` INT NOT NULL,
  `Mecanicos_idMecanicos` INT NOT NULL,
  `Ordem de Serviço_idOrdem de Serviço` INT NOT NULL,
  PRIMARY KEY (`idVeiculo`, `Cliente_idCliente`, `Mecanicos_idMecanicos`, `Ordem de Serviço_idOrdem de Serviço`),
  INDEX `fk_Veiculo_Cliente_idx` (`Cliente_idCliente` ASC) VISIBLE,
  INDEX `fk_Veiculo_Mecanicos1_idx` (`Mecanicos_idMecanicos` ASC) VISIBLE,
  INDEX `fk_Veiculo_Ordem de Serviço1_idx` (`Ordem de Serviço_idOrdem de Serviço` ASC) VISIBLE,
  CONSTRAINT `fk_Veiculo_Cliente`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `mydb`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Veiculo_Mecanicos1`
    FOREIGN KEY (`Mecanicos_idMecanicos`)
    REFERENCES `mydb`.`Mecanico` (`idMecanicos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Veiculo_Ordem de Serviço1`
    FOREIGN KEY (`Ordem de Serviço_idOrdem de Serviço`)
    REFERENCES `mydb`.`Ordem de Serviço` (`idOrdem de Serviço`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB


CREATE TABLE IF NOT EXISTS `mydb`.`Ordem de Serviço_has_Veiculo` (
  `Ordem de Serviço_idOrdem de Serviço` INT NOT NULL,
  `Veiculo_idVeiculo` INT NOT NULL,
  PRIMARY KEY (`Ordem de Serviço_idOrdem de Serviço`, `Veiculo_idVeiculo`),
  INDEX `fk_Ordem de Serviço_has_Veiculo_Veiculo1_idx` (`Veiculo_idVeiculo` ASC) VISIBLE,
  INDEX `fk_Ordem de Serviço_has_Veiculo_Ordem de Serviço1_idx` (`Ordem de Serviço_idOrdem de Serviço` ASC) VISIBLE,
  CONSTRAINT `fk_Ordem de Serviço_has_Veiculo_Ordem de Serviço1`
    FOREIGN KEY (`Ordem de Serviço_idOrdem de Serviço`)
    REFERENCES `mydb`.`Ordem de Serviço` (`idOrdem de Serviço`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ordem de Serviço_has_Veiculo_Veiculo1`
    FOREIGN KEY (`Veiculo_idVeiculo`)
    REFERENCES `mydb`.`Veiculo` (`idVeiculo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB