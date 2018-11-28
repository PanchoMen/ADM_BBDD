-- -----------------------------------------------------
-- Schema Farmacia
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Farmacia
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS Farmacia;

-- -----------------------------------------------------
-- Table Farmacia.Laborartorio
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Farmacia.Laborartorio (
  Direccion VARCHAR(45) NULL,
  Fax INT NULL,
  Telefono INT NULL,
  Cod_Laboratorio VARCHAR(10) NOT NULL,
  Nombre VARCHAR(45) NULL,
  Pers_Contacto VARCHAR(45) NULL,
  PRIMARY KEY (Cod_Laboratorio));



-- -----------------------------------------------------
-- Table Farmacia.Medicamento
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Farmacia.Medicamento (
  Precio INT NULL,
  Tipo VARCHAR(45) NULL,
  Stock INT NULL,
  Cod_Barras VARCHAR(45) NOT NULL,
  Nombre VARCHAR(45) NULL,
  N_Ventas INT NULL,
  Receta INT NULL,
  PRIMARY KEY (Cod_Barras));



-- -----------------------------------------------------
-- Table Farmacia.Familia
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Farmacia.Familia (
  Descripción VARCHAR(100) NULL,
  Nomb_Familia VARCHAR(45) NOT NULL,
  PRIMARY KEY (Nomb_Familia));



-- -----------------------------------------------------
-- Table Farmacia.Compra
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Farmacia.Compra (
  Cod_Compra INT NOT NULL,
  Fecha TIMESTAMP(6) NULL,
  Importe DECIMAL NULL,
  PRIMARY KEY (Cod_Compra));



-- -----------------------------------------------------
-- Table Farmacia.C_Normal
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Farmacia.C_Normal (
  DNI VARCHAR(9) NOT NULL,
  Telefono INT NULL,
  Direccion VARCHAR(45) NULL,
  Nombre VARCHAR(45) NULL,
  Credito DECIMAL(2) NULL,
  F_Pago TIMESTAMP(6) NULL,
  N_Cuenta INT NULL,
  PRIMARY KEY (DNI));



-- -----------------------------------------------------
-- Table Farmacia.Con_Credito
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Farmacia.Con_Credito (
  DNI VARCHAR(9) NOT NULL,
  Telefono INT NULL,
  Direccion VARCHAR(45) NULL,
  Nombre VARCHAR(45) NULL,
  PRIMARY KEY (DNI));



-- -----------------------------------------------------
-- Table Farmacia.Lab_Med
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Farmacia.Lab_Med (
  Cod_Laboratorio VARCHAR(45) NOT NULL,
  Cod_Barras VARCHAR(45) NOT NULL,
  PRIMARY KEY (Cod_Laboratorio, Cod_Barras),
  CONSTRAINT Cod_Laboratorio
    FOREIGN KEY (Cod_Laboratorio)
    REFERENCES Farmacia.Laborartorio (Cod_Laboratorio)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT Cod_Barras
    FOREIGN KEY (Cod_Barras)
    REFERENCES Farmacia.Medicamento (Cod_Barras)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table Farmacia.Med_Fam
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Farmacia.Med_Fam (
  Cod_Barras VARCHAR(45) NOT NULL,
  Nomb_Familia VARCHAR(45) NOT NULL,
  PRIMARY KEY (Cod_Barras, Nomb_Familia),
  CONSTRAINT Cod_Barras
    FOREIGN KEY (Cod_Barras)
    REFERENCES Farmacia.Medicamento (Cod_Barras)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT Nomb_Familia
    FOREIGN KEY (Nomb_Familia)
    REFERENCES Farmacia.Familia (Nomb_Familia)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table Farmacia.Med_Comp
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Farmacia.Med_Comp (
  Cod_Compra INT NOT NULL,
  Cod_Barras VARCHAR(45) NOT NULL,
  Cantidad INT NULL,
  PRIMARY KEY (Cod_Compra, Cod_Barras),
  CONSTRAINT Cod_Compra
    FOREIGN KEY (Cod_Compra)
    REFERENCES Farmacia.Compra (Cod_Compra)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT Cod_Barras
    FOREIGN KEY (Cod_Barras)
    REFERENCES Farmacia.Medicamento (Cod_Barras)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table Farmacia.Con_Credito_Comp
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Farmacia.Con_Credito_Comp (
  DNI VARCHAR(9) NOT NULL,
  Cod_Compra INT NULL,
  PRIMARY KEY (DNI),
  CONSTRAINT DNI
    FOREIGN KEY (DNI)
    REFERENCES Farmacia.Con_Credito (DNI)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT Cod_Compra
    FOREIGN KEY (Cod_Compra)
    REFERENCES Farmacia.Compra (Cod_Compra)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table Farmacia.Normal_Comp
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Farmacia.Normal_Comp (
  DNI VARCHAR(9) NOT NULL,
  Cod_Compra INT NULL,
  PRIMARY KEY (DNI),
  CONSTRAINT DNI
    FOREIGN KEY (DNI)
    REFERENCES Farmacia.C_Normal (DNI)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT Cod_Compra
    FOREIGN KEY (Cod_Compra)
    REFERENCES Farmacia.Compra (Cod_Compra)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
