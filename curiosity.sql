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
  `lastName` varchar(25) NOT NULL,
  `gender` varchar(3) NOT NULL,
  `speciesId` int(3) NOT NULL,
  `description` longtext NOT NULL,
  `deaths` int(5) NOT NULL,
  `originId` int(3) NOT NULL,
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