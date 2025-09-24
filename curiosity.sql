-- phpMyAdmin SQL Dump
-- version 5.2.1deb1+deb12u1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : jeu. 18 sep. 2025 à 17:48
-- Version du serveur : 10.11.14-MariaDB-0+deb12u2
-- Version de PHP : 8.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `dbCuriosity`
--
CREATE DATABASE IF NOT EXISTS `dbCuriosity` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `dbCuriosity`;

-- --------------------------------------------------------

--
-- Structure de la table `characters`
--

CREATE TABLE IF NOT EXISTS `characters` (
  `id` varchar(30) NOT NULL,
  `firstName` varchar(25) NOT NULL,
  `lastName` varchar(25),
  `gender` varchar(3) NOT NULL,
  `speciesId` int(3) NOT NULL,
  `description` longtext NOT NULL,
  `deaths` int(5) NOT NULL,
  `originId` int(3) NOT NULL,
  `imageURL` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `characterSpecies` (`speciesId`),
  KEY `characterOrigin` (`originId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `origin`
--

CREATE TABLE IF NOT EXISTS `origin` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `mediaGenre` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `species`
--

CREATE TABLE IF NOT EXISTS `species` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `characters`
--

INSERT INTO `characters` (`id`, `firstName`, `lastName`, `gender`, `speciesId`, `description`, `deaths`, `originId`, `imageURL`) VALUES
('ID_BASSIE', 'Bassie', 'Bloomington', 'F', 2, 'Bassie is a brown wicker basket with two darker brown handles on each side, along with two eyelashes underneath her eyes as her mouth is formed into a small, cat-like smile. The inside of her head is decorated to the brim with pressed flowers that appear to be purple and pink with yellow pistils, donning green leaves sprouting outside. She is shy and timid, appearing to fidget during her idle animation. She has a fear of being replaced. She also feels resentment and jealousy towards  Cocoa, who is the fan favourite and who is the better picking for the Main Character class of her origin show. She is seen laughing uncontrollably whenever she feels like she is not keeping up with others\' expectations of her, which often makes other toons feel uncomfortable or weirded out. ', 0, 2, 'bassieCuriosityIcon.jpg'),
('ID_MARSHMALLOW', 'Marshmallow', NULL, 'F', 1, 'Marshmallow is a small white cylinder-shaped marshmallow with a gray outline, and some shading. She is a naïve, kind-hearted, fierce, and aggressive player. She is commonly characterized as sweet, joyful, and vivacious with others. As a critical and occasionally cynical person, Marshmallow is generally concerned only with her own interests and is not afraid to speak her mind without caring about the consequences. Though being so puny and inadequate, Marshmallow makes up for it with strong motivation and usually carries through challenges with ease. She can manipulate gravity without ease, can break glass by yelling and can heal from fire.', 0, 1, 'Untitled989_20241112065045.png');

--
-- Déchargement des données de la table `origin`
--

INSERT INTO `origin` (`id`, `name`, `mediaGenre`) VALUES
(1, 'Inanimate Insanity', 'Object Show'),
(2, 'Dandy\'s World', 'Game'),
(3, 'Candy\'s Bootleg World', 'AU'),
(4, 'Pressure', 'Game');

--
-- Déchargement des données de la table `species`
--

INSERT INTO `species` (`id`, `name`) VALUES
(1, 'Object'),
(2, 'Toon'),
(3, 'Human'),
(4, 'Deep Sea Bunny');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `characters`
--
ALTER TABLE `characters`
  ADD CONSTRAINT `characterOrigin` FOREIGN KEY (`originId`) REFERENCES `origin` (`id`),
  ADD CONSTRAINT `characterSpecies` FOREIGN KEY (`speciesId`) REFERENCES `species` (`id`);
COMMIT;
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