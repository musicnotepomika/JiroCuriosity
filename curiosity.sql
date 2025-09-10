--
-- Database `dbCuriosity`
--
DROP DATABASE IF EXISTS `dbCuriosity`;
USE `dbCuriosity`;
---------------------------
--
-- `species` table structure
--
CREATE TABLE IF NOT EXISTS `species`(
    `id` INT(3) NOT NULL
    `name` VARCHAR(25) NOT NULL
    PRIMARY KEY(`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- `characters` table structure
--
CREATE TABLE IF NOT EXISTS `characters`(
    `id` VARCHAR(30) NOT NULL
    `fisrtName` VARCHAR(25) DEFAULT NULL
    `lastName` VARCHAR(25) DEFAULT NULL
    `speciesId` INT(3) NOT NULL
    `description` LONGTEXT DEFAULT NULL
    `deaths` INT(5) DEFAULT NULL
    PRIMARY KEY(`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- species foreign key
--
ALTER TABLE `characters`
ADD CONSTRAINT `characterSpecies` FOREIGN KEY (`speciesId`) REFERENCES `species`(`id`);
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