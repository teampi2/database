-- MySQL Script generated by MySQL Workbench
-- Thu Nov 21 22:52:54 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema localdb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema localdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `localdb` DEFAULT CHARACTER SET utf8 ;
USE `localdb` ;

-- -----------------------------------------------------
-- Table `localdb`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `localdb`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(60) NOT NULL,
  `role` ENUM("scholarship", "coordinator", "monitor", "student") NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_user_unique` (`email` ASC) VISIBLE,
  CONSTRAINT chk_user_email_format CHECK (`email` LIKE '%@%.%'))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `localdb`.`school`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `localdb`.`school` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cnpj` VARCHAR(18) NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `address` VARCHAR(100) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `phone` VARCHAR(25) NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `cnpj_school_unique` (`cnpj` ASC) VISIBLE,
  CONSTRAINT chk_school_email_format CHECK (`email` LIKE '%@%.%'),
  CONSTRAINT chk_school_cnpj_format CHECK (`cnpj` REGEXP '^[0-9]{2}\\.[0-9]{3}\\.[0-9]{3}/[0-9]{4}-[0-9]{2}$'))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `localdb`.`class`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `localdb`.`class` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `shift` ENUM("morning", "afternoon", "evening") NOT NULL,
  `academic_year` VARCHAR(6) NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `school_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_class_school_idx` (`school_id` ASC) VISIBLE,
  CONSTRAINT `fk_class_school_id`
    FOREIGN KEY (`school_id`)
    REFERENCES `localdb`.`school` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT chk_class_academic_year_format CHECK (`academic_year` REGEXP '^[0-9]{4}(\.[1-2])?$'))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `localdb`.`lesson_plan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `localdb`.`lesson_plan` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NOT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `objectives` TEXT NULL DEFAULT NULL,
  `materials` TEXT NULL DEFAULT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `class_id` INT NOT NULL,
  `school_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_lesson_plan_school_idx` (`school_id` ASC) VISIBLE,
  INDEX `fk_lesson_plan_class_idx` (`class_id` ASC) VISIBLE,
  CONSTRAINT `fk_lesson_plan_school_id`
    FOREIGN KEY (`school_id`)
    REFERENCES `localdb`.`school` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_lesson_plan_class_id`
    FOREIGN KEY (`class_id`)
    REFERENCES `localdb`.`class` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `localdb`.`lesson`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `localdb`.`lesson` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NOT NULL,
  `theme` VARCHAR(100) NOT NULL,
  `date` DATETIME NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `class_id` INT NOT NULL,
  `school_id` INT NOT NULL,
  `lesson_plan_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_lesson_class_idx` (`class_id` ASC) VISIBLE,
  INDEX `fk_lesson_school_idx` (`school_id` ASC) VISIBLE,
  INDEX `fk_lesson_lesson_plan_idx` (`lesson_plan_id` ASC) VISIBLE,
  UNIQUE INDEX `lesson_plan_lesson_unique` (`lesson_plan_id` ASC) VISIBLE,
  CONSTRAINT `fk_lesson_class_id`
    FOREIGN KEY (`class_id`)
    REFERENCES `localdb`.`class` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_lesson_school_id`
    FOREIGN KEY (`school_id`)
    REFERENCES `localdb`.`school` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_lesson_lesson_plan_id`
    FOREIGN KEY (`lesson_plan_id`)
    REFERENCES `localdb`.`lesson_plan` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `localdb`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `localdb`.`student` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `enrollment` VARCHAR(25) NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `class_id` INT NOT NULL,
  `school_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `enrollment_student_unique` (`enrollment` ASC) VISIBLE,
  INDEX `fk_student_class_idx` (`class_id` ASC) VISIBLE,
  INDEX `fk_student_school_idx` (`school_id` ASC) VISIBLE,
  CONSTRAINT `fk_student_class_id`
    FOREIGN KEY (`class_id`)
    REFERENCES `localdb`.`class` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_school_id`
    FOREIGN KEY (`school_id`)
    REFERENCES `localdb`.`school` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `localdb`.`attendance`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `localdb`.`attendance` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `is_present` TINYINT(1) NOT NULL DEFAULT 1,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lesson_id` INT NOT NULL,
  `student_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_attendance_lesson_idx` (`lesson_id` ASC) VISIBLE,
  INDEX `fk_attendance_student_idx` (`student_id` ASC) VISIBLE,
  CONSTRAINT `fk_attendance_lesson_id`
    FOREIGN KEY (`lesson_id`)
    REFERENCES `localdb`.`lesson` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_attendance_student_id`
    FOREIGN KEY (`student_id`)
    REFERENCES `localdb`.`student` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT chk_is_present CHECK (is_present IN (0, 1)))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `localdb`.`activity`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `localdb`.`activity` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NOT NULL,
  `description` TEXT NULL,
  `due_date` DATETIME NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` INT NOT NULL,
  `class_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_activity_user_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_activity_class_idx` (`class_id` ASC) VISIBLE,
  CONSTRAINT `fk_activity_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `localdb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_activity_class_id`
    FOREIGN KEY (`class_id`)
    REFERENCES `localdb`.`class` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `localdb`.`announcement`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `localdb`.`announcement` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NOT NULL,
  `content` TEXT NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` INT NOT NULL,
  `class_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_announcement_class_idx` (`class_id` ASC) VISIBLE,
  INDEX `fk_announcement_user_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_announcement_class_id`
    FOREIGN KEY (`class_id`)
    REFERENCES `localdb`.`class` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_announcement_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `localdb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `localdb`.`student_performance`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `localdb`.`student_performance` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `average_grade` DECIMAL(10,2) NOT NULL,
  `attendance_count` INT NOT NULL,
  `percentage_correct` DECIMAL(5,2) NOT NULL,
  `attendance_percentage` DECIMAL(5,2) NOT NULL,
  `tasks_submitted` INT NOT NULL,
  `tasks_not_submitted` INT NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `student_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_student_performance_student_idx` (`student_id` ASC) VISIBLE,
  CONSTRAINT `fk_student_performance_student_id`
    FOREIGN KEY (`student_id`)
    REFERENCES `localdb`.`student` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT chk_student_performance_percentage_correct CHECK (`percentage_correct` BETWEEN 0 AND 1),
  CONSTRAINT chk_student_performance_attendance_percentage CHECK (`attendance_percentage` BETWEEN 0 AND 1))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `localdb`.`student_activity`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `localdb`.`student_activity` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `note` DECIMAL(4,2) NULL DEFAULT NULL,
  `was_submitted` TINYINT(1) NOT NULL DEFAULT 0,
  `submission_date` DATETIME NULL DEFAULT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `student_id` INT NOT NULL,
  `activity_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_student_activity_student_idx` (`student_id` ASC) VISIBLE,
  INDEX `fk_student_activity_activity_idx` (`activity_id` ASC) VISIBLE,
  CONSTRAINT `fk_student_activity_student_id`
    FOREIGN KEY (`student_id`)
    REFERENCES `localdb`.`student` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_activity_activity_id`
    FOREIGN KEY (`activity_id`)
    REFERENCES `localdb`.`activity` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT chk_was_submitted CHECK (was_submitted IN (0, 1)),
  CONSTRAINT chk_student_activity_note CHECK (`note` BETWEEN 0 AND 10))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Trigger to create student_activity for each student when an activity is created
-- -----------------------------------------------------
DELIMITER $$

CREATE TRIGGER trg_after_activity_insert
AFTER INSERT ON activity
FOR EACH ROW
BEGIN
    INSERT INTO student_activity (activity_id, student_id)
    SELECT NEW.id, s.id
    FROM student s
    WHERE s.class_id = NEW.class_id;
END$$

DELIMITER ;


-- -----------------------------------------------------
-- Trigger to create attendance for each student when a lesson is created
-- -----------------------------------------------------
DELIMITER $$

CREATE TRIGGER trg_after_lesson_insert
AFTER INSERT ON lesson
FOR EACH ROW
BEGIN
    INSERT INTO attendance (lesson_id, student_id)
    SELECT NEW.id, s.id
    FROM student s
    WHERE s.class_id = NEW.class_id;
END$$

DELIMITER ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;