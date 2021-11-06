-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : sam. 06 nov. 2021 à 05:54
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
  `id` int(11) NOT NULL,
  `nom` varchar(25) NOT NULL,
  `pseudo` varchar(15) NOT NULL,
  `mdp` char(255) NOT NULL,
  `denomEnt` varchar(25) NOT NULL,
  `adresseEnt` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `id` int(11) NOT NULL,
  `idEntreprise` int(11) NOT NULL,
  `idVehicule` int(11) NOT NULL,
  `dateDebut` date NOT NULL,
  `dateFin` int(11) NOT NULL,
  `montant` int(11) NOT NULL,
  `etatReglement` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `location` (`idEntreprise`,`idVehicule`,`dateDebut`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `vehicule`
--

DROP TABLE IF EXISTS `vehicule`;
CREATE TABLE IF NOT EXISTS `vehicule` (
  `id` int(11) NOT NULL,
  `type` varchar(11) NOT NULL,
  `qte` int(11) NOT NULL,
  `specs` json NOT NULL,
  `image` varchar(255) NOT NULL,
  `etat` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
