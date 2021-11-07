-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : Dim 07 nov. 2021 à 03:48
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bdd_lagaragerie`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(25) NOT NULL,
  `pseudo` varchar(15) NOT NULL,
  `mdp` char(255) NOT NULL,
  `denomEnt` varchar(25) NOT NULL,
  `adresseEnt` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id`, `nom`, `pseudo`, `mdp`, `denomEnt`, `adresseEnt`) VALUES
(1, 'ITIZIAR Michel', 'itizmLIDLF', '$2y$10$FdiIKpX/Ns9vrK.QQsToaOjzuScxCkoggKgCdKkJMunJKnvMLRk16', 'LIDL France Management', '19 quai des Orfèvres,\r\n75008 Paris\r\nFrance'),
(2, 'MARTIN Jeanne', 'marjeaCAPA', '$2y$10$twXoaa0iF5fKDJFsU4bY/.LwDckRh0q2KYjZ1k.xf1M1c83pcsJz2', 'Crédit Agricole Paris IDF', '4 rue Saint Michel,\r\n94023 Saint Maur Des Fossés\r\nFrance');

-- --------------------------------------------------------

--
-- Structure de la table `facture`
--

DROP TABLE IF EXISTS `facture`;
CREATE TABLE IF NOT EXISTS `facture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idClient` int(11) NOT NULL,
  `idVehicule` int(11) NOT NULL,
  `dateDebut` date NOT NULL,
  `dateFin` date DEFAULT NULL,
  `montant` int(11) NOT NULL DEFAULT '0',
  `etatReglement` varchar(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `location` (`idClient`,`idVehicule`,`dateDebut`),
  KEY `idVehicule` (`idVehicule`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `facture`
--

INSERT INTO `facture` (`id`, `idClient`, `idVehicule`, `dateDebut`, `dateFin`, `montant`, `etatReglement`) VALUES
(7, 2, 1, '2021-11-10', '2021-11-16', 246, 'impayée'),
(8, 2, 3, '2021-11-10', '2021-11-16', 246, 'impayée'),
(9, 1, 4, '2021-11-23', '2021-11-29', 246, 'impayée'),
(10, 1, 10, '2021-11-23', '2021-11-29', 246, 'impayée'),
(11, 1, 13, '2021-11-17', NULL, 0, 'impayée');

-- --------------------------------------------------------

--
-- Structure de la table `vehicule`
--

DROP TABLE IF EXISTS `vehicule`;
CREATE TABLE IF NOT EXISTS `vehicule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `qte` int(11) NOT NULL,
  `specs` json NOT NULL,
  `image` varchar(255) NOT NULL,
  `etat` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `vehicule`
--

INSERT INTO `vehicule` (`id`, `type`, `qte`, `specs`, `image`, `etat`) VALUES
(1, 'Ford Focus', 1, '{\"prix\": \"41\", \"annee\": \"2021\", \"moteur\": \"electrique\"}', '.\\vue\\content\\images\\vehicules\\fordfocus.png', '2'),
(3, 'Ford Focus', 1, '{\"prix\": \"41\", \"annee\": \"2021\", \"moteur\": \"electrique\"}', '.\\vue\\content\\images\\vehicules\\fordfocus.png', '2'),
(4, 'Ford Focus', 1, '{\"prix\": \"41\", \"annee\": \"2021\", \"moteur\": \"electrique\"}', '.\\vue\\content\\images\\vehicules\\fordfocus.png', '1'),
(10, 'Ford Focus', 1, '{\"prix\": \"41\", \"annee\": \"2021\", \"moteur\": \"electrique\"}', '.\\vue\\content\\images\\vehicules\\fordfocus.png', '1'),
(12, 'Fiat 500', 1, '{\"prix\": \"37\", \"type\": \"compacte\", \"annee\": \"2019\", \"moteur\": \"essence\"}', '.\\vue\\content\\images\\vehicules\\fiat500.png', 'disponible'),
(13, 'Fiat 500', 1, '{\"prix\": \"37\", \"type\": \"compacte\", \"annee\": \"2019\", \"moteur\": \"essence\"}', '.\\vue\\content\\images\\vehicules\\fiat500.png', '1'),
(14, 'Fiat 500', 1, '{\"prix\": \"37\", \"type\": \"compacte\", \"annee\": \"2019\", \"moteur\": \"essence\"}', '.\\vue\\content\\images\\vehicules\\fiat500.png', 'disponible'),
(15, 'Fiat 500', 1, '{\"prix\": \"37\", \"type\": \"compacte\", \"annee\": \"2019\", \"moteur\": \"essence\"}', '.\\vue\\content\\images\\vehicules\\fiat500.png', 'disponible'),
(16, 'Renault Clio', 1, '{\"prix\": \"44\", \"type\": \"citadine\", \"annee\": \"2019\", \"moteur\": \"essence\"}', '.\\vue\\content\\images\\vehicules\\renaultclio.png', 'disponible'),
(17, 'Renault Clio', 1, '{\"prix\": \"44\", \"type\": \"citadine\", \"annee\": \"2019\", \"moteur\": \"essence\"}', '.\\vue\\content\\images\\vehicules\\renaultclio.png', 'disponible'),
(18, 'Renault Clio', 1, '{\"prix\": \"44\", \"type\": \"citadine\", \"annee\": \"2019\", \"moteur\": \"essence\"}', '.\\vue\\content\\images\\vehicules\\renaultclio.png', 'disponible'),
(19, 'Renault Clio', 1, '{\"prix\": \"44\", \"type\": \"citadine\", \"annee\": \"2019\", \"moteur\": \"essence\"}', '.\\vue\\content\\images\\vehicules\\renaultclio.png', 'disponible'),
(20, 'Mercedes Classe B', 1, '{\"prix\": \"79\", \"type\": \"monospace\", \"annee\": \"2019\", \"moteur\": \"diesel\"}', '.\\vue\\content\\images\\vehicules\\mercedesclasseb.png', 'disponible'),
(21, 'Mercedes Classe B', 1, '{\"prix\": \"79\", \"type\": \"monospace\", \"annee\": \"2019\", \"moteur\": \"diesel\"}', '.\\vue\\content\\images\\vehicules\\mercedesclasseb.png', 'disponible'),
(22, 'Mercedes Classe B', 1, '{\"prix\": \"79\", \"type\": \"monospace\", \"annee\": \"2019\", \"moteur\": \"diesel\"}', '.\\vue\\content\\images\\vehicules\\mercedesclasseb.png', 'disponible'),
(23, 'Mercedes Classe B', 1, '{\"prix\": \"79\", \"type\": \"monospace\", \"annee\": \"2019\", \"moteur\": \"diesel\"}', '.\\vue\\content\\images\\vehicules\\mercedesclasseb.png', 'disponible'),
(24, 'Mercedes Classe B', 1, '{\"prix\": \"79\", \"type\": \"monospace\", \"annee\": \"2019\", \"moteur\": \"diesel\"}', '.\\vue\\content\\images\\vehicules\\mercedesclasseb.png', 'disponible'),
(25, 'Ford Focus', 1, '{\"prix\": \"41\", \"annee\": \"2021\", \"moteur\": \"electrique\"}', '.\\vue\\content\\images\\vehicules\\fordfocus.png', 'disponible'),
(26, 'Ford Focus', 1, '{\"prix\": \"41\", \"annee\": \"2021\", \"moteur\": \"electrique\"}', '.\\vue\\content\\images\\vehicules\\fordfocus.png', 'disponible');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `facture`
--
ALTER TABLE `facture`
  ADD CONSTRAINT `facture_ibfk_1` FOREIGN KEY (`idClient`) REFERENCES `client` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `facture_ibfk_2` FOREIGN KEY (`idVehicule`) REFERENCES `vehicule` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
