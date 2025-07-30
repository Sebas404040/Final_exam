# Clinica la esperanza 

**Clinica especializada en el cuidado de los pacientes**

## PROBLEMA: crear un sistema agil en base de datos 

## DDL:

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema Final_Exam
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Final_Exam
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Final_Exam` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `Final_Exam` ;

-- -----------------------------------------------------
-- Table `Final_Exam`.`cargo_empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Final_Exam`.`cargo_empleado` (
  `id_cargo` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_cargo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Final_Exam`.`horario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Final_Exam`.`horario` (
  `id_horarios` INT NOT NULL AUTO_INCREMENT,
  `hora_entrada` TIME NOT NULL,
  `hora_salida` TIME NOT NULL,
  PRIMARY KEY (`id_horarios`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Final_Exam`.`empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Final_Exam`.`empleado` (
  `id_empleado` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `ubicacion` VARCHAR(45) NOT NULL,
  `cargo_empleado_id_cargo` INT NOT NULL,
  `horario_id_horarios` INT NOT NULL,
  PRIMARY KEY (`id_empleado`, `cargo_empleado_id_cargo`, `horario_id_horarios`),
  INDEX `fk_empleado_cargo_empleado1_idx` (`cargo_empleado_id_cargo` ASC) VISIBLE,
  INDEX `fk_empleado_horario1_idx` (`horario_id_horarios` ASC) VISIBLE,
  CONSTRAINT `fk_empleado_cargo_empleado1`
    FOREIGN KEY (`cargo_empleado_id_cargo`)
    REFERENCES `Final_Exam`.`cargo_empleado` (`id_cargo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_empleado_horario1`
    FOREIGN KEY (`horario_id_horarios`)
    REFERENCES `Final_Exam`.`horario` (`id_horarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Final_Exam`.`tipo_medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Final_Exam`.`tipo_medico` (
  `id_tipo` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_tipo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Final_Exam`.`medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Final_Exam`.`medico` (
  `id_medico` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `tipo_medico_id_tipo` INT NOT NULL,
  `horario_id_horario` INT NOT NULL,
  PRIMARY KEY (`id_medico`, `tipo_medico_id_tipo`, `horario_id_horario`),
  INDEX `fk_medico_tipo_medico1_idx` (`tipo_medico_id_tipo` ASC) VISIBLE,
  INDEX `fk_medico_horario1_idx` (`horario_id_horario` ASC) VISIBLE,
  CONSTRAINT `fk_medico_tipo_medico1`
    FOREIGN KEY (`tipo_medico_id_tipo`)
    REFERENCES `Final_Exam`.`tipo_medico` (`id_tipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_medico_horario1`
    FOREIGN KEY (`horario_id_horario`)
    REFERENCES `Final_Exam`.`horario` (`id_horarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Final_Exam`.`paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Final_Exam`.`paciente` (
  `id_paciente` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_paciente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Final_Exam`.`vacaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Final_Exam`.`vacaciones` (
  `id_vacaciones` INT NOT NULL AUTO_INCREMENT,
  `disfrutadas` INT NOT NULL,
  `vacacion` INT NOT NULL,
  `empleado_id_empleado` INT NOT NULL,
  PRIMARY KEY (`id_vacaciones`, `empleado_id_empleado`),
  INDEX `fk_vacaciones_empleado1_idx` (`empleado_id_empleado` ASC) VISIBLE,
  CONSTRAINT `fk_vacaciones_empleado1`
    FOREIGN KEY (`empleado_id_empleado`)
    REFERENCES `Final_Exam`.`empleado` (`id_empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Final_Exam`.`Cita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Final_Exam`.`Cita` (
  `paciente_id_paciente` INT NOT NULL,
  `medico_id_medico` INT NOT NULL,
  `observaciones` VARCHAR(45) NOT NULL,
  `empleado_id_empleado` INT NOT NULL,
  PRIMARY KEY (`paciente_id_paciente`, `medico_id_medico`, `empleado_id_empleado`),
  INDEX `fk_paciente_has_medico_medico1_idx` (`medico_id_medico` ASC) VISIBLE,
  INDEX `fk_paciente_has_medico_paciente1_idx` (`paciente_id_paciente` ASC) VISIBLE,
  INDEX `fk_Cita_empleado1_idx` (`empleado_id_empleado` ASC) VISIBLE,
  CONSTRAINT `fk_paciente_has_medico_paciente1`
    FOREIGN KEY (`paciente_id_paciente`)
    REFERENCES `Final_Exam`.`paciente` (`id_paciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_paciente_has_medico_medico1`
    FOREIGN KEY (`medico_id_medico`)
    REFERENCES `Final_Exam`.`medico` (`id_medico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cita_empleado1`
    FOREIGN KEY (`empleado_id_empleado`)
    REFERENCES `Final_Exam`.`empleado` (`id_empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Final_Exam`.`vacaciones_medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Final_Exam`.`vacaciones_medico` (
  `id_vacaciones_medico` INT NOT NULL AUTO_INCREMENT,
  `disfrutadas` INT NOT NULL,
  `vacacion` INT NOT NULL,
  `medico_id_medico` INT NOT NULL,
  PRIMARY KEY (`id_vacaciones_medico`, `medico_id_medico`),
  INDEX `fk_vacaciones_medico_medico1_idx` (`medico_id_medico` ASC) VISIBLE,
  CONSTRAINT `fk_vacaciones_medico_medico1`
    FOREIGN KEY (`medico_id_medico`)
    REFERENCES `Final_Exam`.`medico` (`id_medico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

## DML: 

INSERT INTO tipo_medico(nombre) VALUES ("titular"), ("interino"), ("sustituto");

INSERT INTO cargo_empleado(nombre) VALUES ("auxiliar de enfermeria"), ("celador"), ("administrativo");

INSERT INTO horario(hora_entrada, hora_salida) VALUES ("8:00", "18:00"), ("10:00", "20:00"), ("6:00", "14:00");

INSERT INTO paciente(nombre) VALUES ("Juan"), ("Stefany"), ("Carlos"), ("Martin"), ("Nikol");

INSERT INTO empleado(nombre, ubicacion, cargo_empleado_id_cargo, horario_id_horarios) VALUES ("Monica Sanchez", "Giron", "1", "2"), ("Rick Sanchez", "Giron", "2", "2"), ("Morty Dominguez", "Giron", "3", "3");

INSERT INTO medico(nombre, tipo_medico_id_tipo, horario_id_horario) VALUES ("Jose Aguilar", "2", "1"), ("Josue Martinez", "1", "1"), ("Marta", "3", "3");

INSERT INTO vacaciones(disfrutadas, vacacion, empleado_id_empleado) VALUES ("23", "10", "1"), ("30", "20", "2"), ("10", "23", "3");

INSERT INTO vacaciones_medico(disfrutadas, vacacion, medico_id_medico) VALUES ("45", "12", "1"), ("56", "34", "2"), ("21", "45", "3");

INSERT INTO Cita(paciente_id_paciente, medico_id_medico, observaciones, empleado_id_empleado) VALUES ("1", "3", "Presenta malestar", "1"), ("1", "2", "Presenta malestar", "3"), ("2", "2", "Presenta malestar", "1"), ("3", "1", "Presenta malestar", "1"), ("3", "1", "Presenta malestar", "2");

## DQL: 
-- 1. Número de pacientes atendidos por cada médico

SELECT M.nombre, COUNT(CT.paciente_id_paciente) AS pacientes_atendidos
FROM medico AS M
JOIN Cita AS CT ON M.id_medico = CT.medico_id_medico
GROUP BY (M.nombre); 

-- 11.Empleados con mayor número de pacientes atendidos por los médicos bajo su supervisión
SELECT E.nombre, COUNT(CT.paciente_id_paciente) AS pacientes_atendidos
FROM empleado AS E
JOIN Cita AS CT ON E.id_empleado = CT.empleado_id_empleado
WHERE COUNT(CT.paciente_id_paciente) > (
	SELECT AVG(CT2.paciente_id_paciente)
    FROM Cita
    WHERE CT2.empleado_id_empleado = CT2.empleado_id_empleado
);
