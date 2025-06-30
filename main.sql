-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Online_Hotel_Reservation
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Online_Hotel_Reservation` ;

-- -----------------------------------------------------
-- Schema Online_Hotel_Reservation
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Online_Hotel_Reservation` DEFAULT CHARACTER SET utf8 ;
USE `Online_Hotel_Reservation` ;

-- -----------------------------------------------------
-- Table `Online_Hotel_Reservation`.`Hotel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Online_Hotel_Reservation`.`Hotel` ;

CREATE TABLE IF NOT EXISTS `Online_Hotel_Reservation`.`Hotel` (
  `Name` VARCHAR(50) NULL,
  `phone` INT NULL,
  `Location` VARCHAR(45) NULL,
  `ID` INT NOT NULL,
  `Total_num_of_rooms` INT NULL,
  `Total_num_of_halls` INT NULL,
  `num_of_free_rooms` INT NULL,
  `num_of_free_halls` INT NULL,
  `MGR_SSN` VARCHAR(15) NOT NULL,
  `MGR_start_date` DATE NULL,
  UNIQUE INDEX `Name_UNIQUE` (`Name` ASC) VISIBLE,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Online_Hotel_Reservation`.`Employee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Online_Hotel_Reservation`.`Employee` ;

CREATE TABLE IF NOT EXISTS `Online_Hotel_Reservation`.`Employee` (
  `Fname` VARCHAR(30) NULL,
  `minit` CHAR NULL,
  `Lname` VARCHAR(45) NULL,
  `SSN` VARCHAR(15) NOT NULL,
  `phone` INT NULL,
  `salary` FLOAT NULL,
  `sex` CHAR NULL,
  `Bdate` DATE NULL,
  `Nationality` VARCHAR(45) NULL,
  `jop_description` VARCHAR(45) NULL,
  `Address` VARCHAR(45) NULL,
  `Hotel_ID` INT NOT NULL,
  `Super_ssn` VARCHAR(15) NULL,
  PRIMARY KEY (`SSN`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Online_Hotel_Reservation`.`Guest`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Online_Hotel_Reservation`.`Guest` ;

CREATE TABLE IF NOT EXISTS `Online_Hotel_Reservation`.`Guest` (
  `Fname` VARCHAR(30) NULL,
  `minit` CHAR NULL,
  `Lname` VARCHAR(45) NULL,
  `SSN` VARCHAR(15) NOT NULL,
  `phone` INT NULL,
  `sex` CHAR NULL,
  `Bdate` DATE NULL,
  `Nationality` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  PRIMARY KEY (`SSN`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Online_Hotel_Reservation`.`Owner`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Online_Hotel_Reservation`.`Owner` ;

CREATE TABLE IF NOT EXISTS `Online_Hotel_Reservation`.`Owner` (
  `Fname` VARCHAR(30) NULL,
  `minit` CHAR NULL,
  `Lname` VARCHAR(45) NULL,
  `SSN` VARCHAR(15) NOT NULL,
  `phone` INT NULL,
  `sex` CHAR NULL,
  `Bdate` DATE NULL,
  `Nationality` VARCHAR(45) NULL,
  PRIMARY KEY (`SSN`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Online_Hotel_Reservation`.`Hotel_service`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Online_Hotel_Reservation`.`Hotel_service` ;

CREATE TABLE IF NOT EXISTS `Online_Hotel_Reservation`.`Hotel_service` (
  `Service` VARCHAR(45) NOT NULL,
  `Hotel_ID` INT NOT NULL,
  PRIMARY KEY (`Service`, `Hotel_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Online_Hotel_Reservation`.`Room`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Online_Hotel_Reservation`.`Room` ;

CREATE TABLE IF NOT EXISTS `Online_Hotel_Reservation`.`Room` (
  `Type` VARCHAR(50) NULL,
  `price` FLOAT NULL,
  `Room_num` INT NOT NULL,
  `Floor` VARCHAR(45) NULL,
  `Hotel_ID` INT NOT NULL,
  PRIMARY KEY (`Room_num`, `Hotel_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Online_Hotel_Reservation`.`Hall`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Online_Hotel_Reservation`.`Hall` ;

CREATE TABLE IF NOT EXISTS `Online_Hotel_Reservation`.`Hall` (
  `Capacity` INT NULL,
  `Hall_num` VARCHAR(45) NOT NULL,
  `Hotel_ID` INT NOT NULL,
  UNIQUE INDEX `Hall_num_UNIQUE` (`Hall_num` ASC) VISIBLE,
  PRIMARY KEY (`Hall_num`, `Hotel_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Online_Hotel_Reservation`.`Dependent`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Online_Hotel_Reservation`.`Dependent` ;

CREATE TABLE IF NOT EXISTS `Online_Hotel_Reservation`.`Dependent` (
  `name` VARCHAR(50) NOT NULL,
  `Address` VARCHAR(45) NULL,
  `sex` CHAR NULL,
  `phone` INT NULL,
  `Bdate` DATE NULL,
  `Relation` VARCHAR(45) NULL,
  `Employee_SSN` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`name`, `Employee_SSN`),
  UNIQUE INDEX `idDependent_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Online_Hotel_Reservation`.`Own`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Online_Hotel_Reservation`.`Own` ;

CREATE TABLE IF NOT EXISTS `Online_Hotel_Reservation`.`Own` (
  `Owner_SSN` VARCHAR(15) NOT NULL,
  `Hotel_ID` INT NOT NULL,
  PRIMARY KEY (`Owner_SSN`, `Hotel_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Online_Hotel_Reservation`.`Review`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Online_Hotel_Reservation`.`Review` ;

CREATE TABLE IF NOT EXISTS `Online_Hotel_Reservation`.`Review` (
  `Hotel_ID` INT NOT NULL,
  `Guest_SSN` VARCHAR(15) NOT NULL,
  `Rate_stars` VARCHAR(10) NULL,
  PRIMARY KEY (`Hotel_ID`, `Guest_SSN`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Online_Hotel_Reservation`.`Book_Room`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Online_Hotel_Reservation`.`Book_Room` ;

CREATE TABLE IF NOT EXISTS `Online_Hotel_Reservation`.`Book_Room` (
  `Guest_SSN` VARCHAR(15) NOT NULL,
  `Room_num` INT NOT NULL,
  `Hotel_ID` INT NOT NULL,
  `Check_in_date` DATE NULL,
  `Check_out_date` DATE NULL,
  `Amount` FLOAT NULL,
  `Review` VARCHAR(10) NULL,
  `Code` INT NULL,
  `Pay_method` VARCHAR(45) NULL,
  PRIMARY KEY (`Guest_SSN`, `Room_num`, `Hotel_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Online_Hotel_Reservation`.`Book_Hall`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Online_Hotel_Reservation`.`Book_Hall` ;

CREATE TABLE IF NOT EXISTS `Online_Hotel_Reservation`.`Book_Hall` (
  `Guest_SSN` VARCHAR(15) NOT NULL,
  `Hall_num` VARCHAR(45) NOT NULL,
  `Hotel_ID` INT NOT NULL,
  `Date` DATE NULL,
  `Time` TIME NULL,
  PRIMARY KEY (`Guest_SSN`, `Hall_num`, `Hotel_ID`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
