--
-- Database `dbCuriosity`
--
DROP DATABASE IF EXISTS `dbCuriosity`;
CREATE DATABASE `dbCuriosity`;
USE `dbCuriosity`;
---------------------------
--
-- `species` table structure
--
CREATE TABLE IF NOT EXISTS `species`(
    `id` INT(3) NOT NULL,
    `name` VARCHAR(25) NOT NULL,
    PRIMARY KEY(`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
--
-- `characters` table structure
--
CREATE TABLE IF NOT EXISTS `characters`(
    `id` VARCHAR(30) NOT NULL,
    `fisrtName` VARCHAR(25) DEFAULT NULL,
    `lastName` VARCHAR(25) DEFAULT NULL,
    `speciesId` INT(3) NOT NULL,
    `description` LONGTEXT DEFAULT NULL,
    `deaths` INT(5) DEFAULT NULL,
    `originId` INT(3) DEFAULT NULL,
    PRIMARY KEY(`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
--
-- `origin` table structure
--
CREATE TABLE IF NOT EXISTS `origin`(
    `id` INT(3),
    `name` VARCHAR(25),
    `mediaGenre` VARCHAR(25),
    PRIMARY KEY(`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4
--
-- foreign keys
--
ALTER TABLE `characters`
ADD CONSTRAINT `characterSpecies` FOREIGN KEY (`speciesId`) REFERENCES `species`(`id`),
ADD CONSTRAINT `characterOrigin` FOREIGN KEY (`originId`) REFERENCES `origin`(`id`);
--
-- users creation
--
CREATE USER IF NOT EXISTS 'jiro' IDENTIFIED BY 'jsegoe21';
CREATE USER IF NOT EXISTS 'guest' IDENTIFIED BY 'visitor';
--
-- privilege grantings
--
GRANT ALL PRIVILEGES ON dbCuriosity.* TO 'jiro';
GRANT SELECT ON dbCuriosity.* TO 'guest';