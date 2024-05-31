-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema attacks_on_aids_workers
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema attacks_on_aids_workers
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `attacks_on_aids_workers` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `attacks_on_aids_workers` ;

-- -----------------------------------------------------
-- Table `attacks_on_aids_workers`.`incidents`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `attacks_on_aids_workers`.`incidents` (
  `incident_id` INT NOT NULL,
  `year` YEAR(4) NULL DEFAULT NULL,
  `month` INT NULL DEFAULT NULL,
  `day` INT NULL DEFAULT NULL,
  `country_code` VARCHAR(100) NULL DEFAULT NULL,
  `country` VARCHAR(100) NULL DEFAULT NULL,
  `region` VARCHAR(100) NULL DEFAULT NULL,
  `district` VARCHAR(100) NULL DEFAULT NULL,
  `city` VARCHAR(100) NULL DEFAULT NULL,
  `un` INT NULL DEFAULT NULL,
  `ingo` INT NULL DEFAULT NULL,
  `icrc` INT NULL DEFAULT NULL,
  `nrcs_and_ifrc` INT NULL DEFAULT NULL,
  `nngo` INT NULL DEFAULT NULL,
  `other` INT NULL DEFAULT NULL,
  `nationals_killed` INT NULL DEFAULT NULL,
  `nationals_wounded` INT NULL DEFAULT NULL,
  `nationals_kidnapped` INT NULL DEFAULT NULL,
  `total_nationals` INT NULL DEFAULT NULL,
  `internationals_killed` INT NULL DEFAULT NULL,
  `internationals_wounded` INT NULL DEFAULT NULL,
  `internationals_kidnapped` INT NULL DEFAULT NULL,
  `total_internationals` INT NULL DEFAULT NULL,
  `total_killed` INT NULL DEFAULT NULL,
  `total_wounded` INT NULL DEFAULT NULL,
  `total_kidnapped` INT NULL DEFAULT NULL,
  `total_affected` INT NULL DEFAULT NULL,
  `gender_male` INT NULL DEFAULT NULL,
  `gender_female` INT NULL DEFAULT NULL,
  `gender_unknown` INT NULL DEFAULT NULL,
  `means_of_attack` VARCHAR(100) NULL DEFAULT NULL,
  `attack_context` VARCHAR(100) NULL DEFAULT NULL,
  `location` VARCHAR(100) NULL DEFAULT NULL,
  `latitude` DECIMAL(65) NULL DEFAULT NULL,
  `longitude` DECIMAL(65) NULL DEFAULT NULL,
  `motive` VARCHAR(100) NULL DEFAULT NULL,
  `actor_type` VARCHAR(100) NULL DEFAULT NULL,
  `actor_name` VARCHAR(100) NULL DEFAULT NULL,
  `details` TEXT NULL DEFAULT NULL,
  `verified` VARCHAR(100) NULL DEFAULT NULL,
  `source` VARCHAR(100) NULL DEFAULT NULL,
  `country_iso` INT NULL DEFAULT NULL,
  PRIMARY KEY (`incident_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `attacks_on_aids_workers`.`country_data`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `attacks_on_aids_workers`.`country_data` (
  `year` YEAR(4) NOT NULL,
  `country_iso` INT NULL DEFAULT NULL,
  `country_fatalities` INT NULL DEFAULT NULL,
  `incidents_incident_id` INT NOT NULL,
  PRIMARY KEY (`year`, `incidents_incident_id`),
  INDEX `fk_country_data_incidents1_idx` (`incidents_incident_id` ASC) VISIBLE,
  CONSTRAINT `fk_country_data_incidents1`
    FOREIGN KEY (`incidents_incident_id`)
    REFERENCES `attacks_on_aids_workers`.`incidents` (`incident_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `attacks_on_aids_workers`.`global_data`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `attacks_on_aids_workers`.`global_data` (
  `year` YEAR(4) NOT NULL,
  `events` INT NULL DEFAULT NULL,
  `total_fatalities` INT NULL,
  `civilian_fatalities` INT NULL DEFAULT NULL,
  `global_data_year` YEAR(4) NOT NULL,
  `incidents_incident_id` INT NOT NULL,
  `country_data_year` YEAR(4) NOT NULL,
  `country_data_incidents_incident_id` INT NOT NULL,
  PRIMARY KEY (`year`, `global_data_year`, `incidents_incident_id`, `country_data_year`, `country_data_incidents_incident_id`),
  INDEX `fk_global_data_incidents_idx` (`incidents_incident_id` ASC) VISIBLE,
  INDEX `fk_global_data_country_data1_idx` (`country_data_year` ASC, `country_data_incidents_incident_id` ASC) VISIBLE,
  CONSTRAINT `fk_global_data_incidents`
    FOREIGN KEY (`incidents_incident_id`)
    REFERENCES `attacks_on_aids_workers`.`incidents` (`incident_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_global_data_country_data1`
    FOREIGN KEY (`country_data_year` , `country_data_incidents_incident_id`)
    REFERENCES `attacks_on_aids_workers`.`country_data` (`year` , `incidents_incident_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
