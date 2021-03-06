-- MySQL Script generated by MySQL Workbench
-- mié 28 nov 2018 09:12:56 WET
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Laborartorio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Laborartorio` (
  `Direccion` VARCHAR(45) NULL,
  `Fax` INT NULL,
  `Teléfono` INT NULL,
  `Cod_Laboratorio` VARCHAR(10) NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Pers_Contacto` VARCHAR(45) NULL,
  PRIMARY KEY (`Cod_Laboratorio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Medicamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Medicamento` (
  `Precio` INT NULL,
  `Tipo` VARCHAR(45) NULL,
  `Stock` INT NULL,
  `Cod_Barras` VARCHAR(45) NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `N_Ventas` INT NULL,
  `Receta` INT NULL,
  PRIMARY KEY (`Cod_Barras`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Familia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Familia` (
  `Descripción` VARCHAR(100) NULL,
  `Nomb_Familia` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Nomb_Familia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Compra` (
  `Cod_Compra` INT NOT NULL,
  `Fecha` TIMESTAMP(6) NULL,
  `Importe` DECIMAL NULL,
  PRIMARY KEY (`Cod_Compra`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`C_Normal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`C_Normal` (
  `DNI` VARCHAR(9) NOT NULL,
  `Teléfono` INT(40) NULL,
  `Direccion` VARCHAR(45) NULL,
  `Nombre` VARCHAR(45) NULL,
  `Credito` DECIMAL(2) NULL,
  `F_Pago` TIMESTAMP(6) NULL,
  `N_Cuenta` INT NULL,
  PRIMARY KEY (`DNI`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Con_Credito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Con_Credito` (
  `DNI` VARCHAR(9) NOT NULL,
  `Teléfono` INT(40) NULL,
  `Direccion` VARCHAR(45) NULL,
  `Nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`DNI`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Lab_Med`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Lab_Med` (
  `Cod_Laboratorio` VARCHAR(45) NOT NULL,
  `Cod_Barras` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Cod_Laboratorio`, `Cod_Barras`),
  INDEX `Cod_Barras_idx` (`Cod_Barras` ASC),
  CONSTRAINT `Cod_Laboratorio`
    FOREIGN KEY (`Cod_Laboratorio`)
    REFERENCES `mydb`.`Laborartorio` (`Cod_Laboratorio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Cod_Barras`
    FOREIGN KEY (`Cod_Barras`)
    REFERENCES `mydb`.`Medicamento` (`Cod_Barras`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Med_Fam`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Med_Fam` (
  `Cod_Barras` VARCHAR(45) NOT NULL,
  `Nomb_Familia` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Cod_Barras`, `Nomb_Familia`),
  INDEX `Nomb_Familia_idx` (`Nomb_Familia` ASC),
  CONSTRAINT `Cod_Barras`
    FOREIGN KEY (`Cod_Barras`)
    REFERENCES `mydb`.`Medicamento` (`Cod_Barras`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Nomb_Familia`
    FOREIGN KEY (`Nomb_Familia`)
    REFERENCES `mydb`.`Familia` (`Nomb_Familia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Med_Comp`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Med_Comp` (
  `Cod_Compra` INT NOT NULL,
  `Cod_Barras` VARCHAR(45) NOT NULL,
  `Cantidad` INT NULL,
  PRIMARY KEY (`Cod_Compra`, `Cod_Barras`),
  INDEX `Cod_Barras_idx` (`Cod_Barras` ASC),
  CONSTRAINT `Cod_Compra`
    FOREIGN KEY (`Cod_Compra`)
    REFERENCES `mydb`.`Compra` (`Cod_Compra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Cod_Barras`
    FOREIGN KEY (`Cod_Barras`)
    REFERENCES `mydb`.`Medicamento` (`Cod_Barras`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Con_Credito_Comp`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Con_Credito_Comp` (
  `DNI` VARCHAR(9) NOT NULL,
  `Cod_Compra` INT NULL,
  PRIMARY KEY (`DNI`),
  INDEX `Cod_Compra_idx` (`Cod_Compra` ASC),
  CONSTRAINT `DNI`
    FOREIGN KEY (`DNI`)
    REFERENCES `mydb`.`Con_Credito` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Cod_Compra`
    FOREIGN KEY (`Cod_Compra`)
    REFERENCES `mydb`.`Compra` (`Cod_Compra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Normal_Comp`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Normal_Comp` (
  `DNI` VARCHAR(9) NOT NULL,
  `Cod_Compra` INT NULL,
  PRIMARY KEY (`DNI`),
  INDEX `Cod_Compra_idx` (`Cod_Compra` ASC),
  CONSTRAINT `DNI`
    FOREIGN KEY (`DNI`)
    REFERENCES `mydb`.`C_Normal` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Cod_Compra`
    FOREIGN KEY (`Cod_Compra`)
    REFERENCES `mydb`.`Compra` (`Cod_Compra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
