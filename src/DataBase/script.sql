-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bd_libreria` DEFAULT CHARACTER SET utf8 ;
USE `bd_libreria` ;

-- -----------------------------------------------------
-- Table `mydb`.`tbl_cat_editorial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_libreria`.`tbl_cat_editorial` (
  `editorial_id` INT NOT NULL AUTO_INCREMENT,
  `editorial_editorial` VARCHAR(45) NULL,
  `editorial_activo` INT NULL,
  PRIMARY KEY (`editorial_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tbl_cat_genero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_libreria`.`tbl_cat_genero` (
  `genero_id` INT NOT NULL AUTO_INCREMENT,
  `genero_genero` VARCHAR(45) NULL,
  `genero_activo` INT NULL,
  PRIMARY KEY (`genero_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tbl_cat_idioma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_libreria`.`tbl_cat_idioma` (
  `idioma_id` INT NOT NULL AUTO_INCREMENT,
  `idioma_idioma` VARCHAR(45) NULL,
  `idioma_activo` INT NULL,
  PRIMARY KEY (`idioma_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tbl_ope_libro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_libreria`.`tbl_ope_libro` (
  `libro_id` INT NOT NULL AUTO_INCREMENT,
  `libro_libro` VARCHAR(45) NULL,
  `libro_costo` INT NULL,
  `libro_cantidad` INT NULL,
  `libro_editorial_id` INT NULL,
  `libro_genero_id` INT NULL,
  `libro_idioma_id` INT NULL,
  `libro_activo` INT NULL,
  PRIMARY KEY (`libro_id`),
  INDEX `libro_editorial_id_idx` (`libro_editorial_id` ASC) ,
  INDEX `libro_genero_id_idx` (`libro_genero_id` ASC) ,
  INDEX `libro_idioma_id_idx` (`libro_idioma_id` ASC) ,
  CONSTRAINT `libro_editorial_id`
    FOREIGN KEY (`libro_editorial_id`)
    REFERENCES `mydb`.`tbl_cat_editorial` (`editorial_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `libro_genero_id`
    FOREIGN KEY (`libro_genero_id`)
    REFERENCES `mydb`.`tbl_cat_genero` (`genero_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `libro_idioma_id`
    FOREIGN KEY (`libro_idioma_id`)
    REFERENCES `mydb`.`tbl_cat_idioma` (`idioma_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tbl_hist_ventas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_libreria`.`tbl_hist_ventas` (
  `venta_id` INT NOT NULL AUTO_INCREMENT,
  `venta_libro_id` INT NULL,
  `venta_cantidad` INT NULL,
  `venta_costo` INT NULL,
  `venta_total` INT NULL,
  PRIMARY KEY (`venta_id`),
  INDEX `venta_libro_id_idx` (`venta_libro_id` ASC) ,
  CONSTRAINT `venta_libro_id`
    FOREIGN KEY (`venta_libro_id`)
    REFERENCES `mydb`.`tbl_ope_libro` (`libro_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
