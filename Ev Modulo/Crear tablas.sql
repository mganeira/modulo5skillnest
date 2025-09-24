-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema dbmodulo
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema dbmodulo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dbmodulo` DEFAULT CHARACTER SET utf8 ;
USE `dbmodulo` ;

-- -----------------------------------------------------
-- Table `dbmodulo`.`proveedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbmodulo`.`proveedores` (
  `id_proveedor` INT NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `fecha` DATE NOT NULL,
  `cantidad` INT NOT NULL,
  PRIMARY KEY (`id_proveedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbmodulo`.`productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbmodulo`.`productos` (
  `id_producto` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `cantidad` INT NOT NULL,
  `proveedores_id_proveedor` INT NOT NULL,
  PRIMARY KEY (`id_producto`, `proveedores_id_proveedor`),
  UNIQUE INDEX `id_producto_UNIQUE` (`id_producto` ASC) VISIBLE,
  INDEX `fk_productos_proveedores1_idx` (`proveedores_id_proveedor` ASC) VISIBLE,
  CONSTRAINT `fk_productos_proveedores1`
    FOREIGN KEY (`proveedores_id_proveedor`)
    REFERENCES `dbmodulo`.`proveedores` (`id_proveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbmodulo`.`transacciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbmodulo`.`transacciones` (
  `id_transaccion` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `direcccion` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `fecha` DATE NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `productos_id_producto` INT NOT NULL,
  PRIMARY KEY (`id_transaccion`),
  UNIQUE INDEX `id_transacciones_UNIQUE` (`id_transaccion` ASC) VISIBLE,
  INDEX `fk_transacciones_productos_idx` (`productos_id_producto` ASC) VISIBLE,
  CONSTRAINT `fk_transacciones_productos`
    FOREIGN KEY (`productos_id_producto`)
    REFERENCES `dbmodulo`.`productos` (`id_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
