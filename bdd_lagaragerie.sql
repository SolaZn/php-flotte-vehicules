-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 08 nov. 2021 à 02:40
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
  `email` varchar(255) NOT NULL,
  `denomEnt` varchar(25) NOT NULL,
  `adresseEnt` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id`, `nom`, `pseudo`, `mdp`, `email`, `denomEnt`, `adresseEnt`) VALUES
(1, 'ITIZIAR Michel', 'itizmLIDLF', '$2y$10$FdiIKpX/Ns9vrK.QQsToaOjzuScxCkoggKgCdKkJMunJKnvMLRk16', 'michel.izitiar@lidl-france.fr', 'LIDL France Management', '19 quai des Orfèvres,\r\n75008 Paris\r\nFrance'),
(2, 'MARTIN Jeanne', 'marjeaCAPA', '$2y$10$twXoaa0iF5fKDJFsU4bY/.LwDckRh0q2KYjZ1k.xf1M1c83pcsJz2', 'jeanne.martin@ca-idf.fr', 'Crédit Agricole Paris IDF', '4 rue Saint Michel,\r\n94023 Saint Maur Des Fossés\r\nFrance'),
(14, 'CALMENT Frederic', 'fredCalUPARIS', '$2y$10$em1hConvy9zjGCbdeGp0dudoreCGIDnwX/Bit/GaKEb7UcFZkRV7S', 'frederic.calment@u-paris.fr', 'Université de Paris', '10 rue Georges Bernanos, 75015 Paris'),
(15, 'LOUEUR', 'loueur', '$2y$10$ALi5BoMyYXbg5Fz.l.j8e.N9EU0oS5sGUkXLz4RGHz4Q7DL6YmDJG', 'gestion@lagaragerie.fr', 'La Garagerie', '10 rue du Colonel Fabien,\r\n95040 Cergy\r\nFrance');

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
  `etatReglement` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `location` (`idClient`,`idVehicule`,`dateDebut`),
  KEY `idVehicule` (`idVehicule`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `facture`
--

INSERT INTO `facture` (`id`, `idClient`, `idVehicule`, `dateDebut`, `dateFin`, `montant`, `etatReglement`) VALUES
(7, 2, 1, '2021-11-10', '2021-11-16', 246, 0),
(8, 2, 3, '2021-11-10', '2021-11-16', 246, 0),
(9, 1, 4, '2021-11-23', '2021-11-29', 246, 0),
(10, 1, 10, '2021-11-23', '2021-11-29', 246, 0),
(11, 1, 13, '2021-11-17', NULL, 0, 0),
(12, 2, 18, '2021-11-24', '2021-12-20', 1144, 0),
(13, 2, 23, '2021-11-24', '2021-12-20', 2054, 0),
(14, 2, 14, '2021-11-17', NULL, 0, 0),
(15, 2, 17, '2021-11-15', '2021-12-31', 704, 0),
(16, 2, 20, '2021-11-15', '2021-12-31', 1264, 0),
(17, 14, 12, '2021-11-18', '2021-11-23', 185, 0),
(18, 14, 26, '2021-11-18', '2021-11-23', 205, 0),
(19, 14, 19, '2021-11-10', '2021-11-24', 616, 0),
(20, 14, 24, '2021-11-24', '2021-11-22', 158, 0);

-- --------------------------------------------------------

--
-- Structure de la table `vehicule`
--

DROP TABLE IF EXISTS `vehicule`;
CREATE TABLE IF NOT EXISTS `vehicule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `qte` int(11) NOT NULL DEFAULT '1',
  `specs` longtext NOT NULL,
  `image` varchar(255) NOT NULL,
  `etat` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `vehicule`
--

INSERT INTO `vehicule` (`id`, `type`, `qte`, `specs`, `image`, `etat`) VALUES
(1, 'Ford Focus', 1, '{\"prix\": \"41\", \"annee\": \"2021\", \"boite\": \"manuelle\", \"moteur\": \"electrique\", \"places\": \"5 places\"}', '.\\vue\\content\\images\\vehicules\\fordfocus.png', '2'),
(3, 'Ford Focus', 1, '{\"prix\": \"41\", \"annee\": \"2021\", \"boite\": \"manuelle\", \"moteur\": \"electrique\", \"places\": \"5 places\"}', '.\\vue\\content\\images\\vehicules\\fordfocus.png', '2'),
(4, 'Ford Focus', 1, '{\"prix\": \"41\", \"annee\": \"2021\", \"boite\": \"manuelle\", \"moteur\": \"electrique\", \"places\": \"5 places\"}', '.\\vue\\content\\images\\vehicules\\fordfocus.png', '1'),
(10, 'Ford Focus', 1, '{\"prix\": \"41\", \"annee\": \"2021\", \"boite\": \"manuelle\", \"moteur\": \"electrique\", \"places\": \"5 places\"}', '.\\vue\\content\\images\\vehicules\\fordfocus.png', '1'),
(12, 'Fiat 500', 1, '{\"prix\": \"37\", \"type\": \"compacte\", \"annee\": \"2019\", \"boite\": \"automatique\", \"moteur\": \"essence\", \"places\": \"4 places\"}', '.\\vue\\content\\images\\vehicules\\fiat500.png', '14'),
(13, 'Fiat 500', 1, '{\"prix\": \"37\", \"type\": \"compacte\", \"annee\": \"2019\", \"boite\": \"automatique\", \"moteur\": \"essence\", \"places\": \"4 places\"}', '.\\vue\\content\\images\\vehicules\\fiat500.png', '1'),
(14, 'Fiat 500', 1, '{\"prix\": \"37\", \"type\": \"compacte\", \"annee\": \"2019\", \"boite\": \"automatique\", \"moteur\": \"essence\", \"places\": \"4 places\"}', '.\\vue\\content\\images\\vehicules\\fiat500.png', '2'),
(15, 'Fiat 500', 1, '{\"prix\": \"37\", \"type\": \"compacte\", \"annee\": \"2019\", \"boite\": \"automatique\", \"moteur\": \"essence\", \"places\": \"4 places\"}', '.\\vue\\content\\images\\vehicules\\fiat500.png', 'disponible'),
(16, 'Renault Clio', 1, '{\"prix\": \"44\", \"type\": \"citadine\", \"annee\": \"2019\", \"boite\": \"automatique\", \"moteur\": \"essence\", \"places\": \"5 places\"}', '.\\vue\\content\\images\\vehicules\\renaultclio.png', 'disponible'),
(17, 'Renault Clio', 1, '{\"prix\": \"44\", \"type\": \"citadine\", \"annee\": \"2019\", \"boite\": \"automatique\", \"moteur\": \"essence\", \"places\": \"5 places\"}', '.\\vue\\content\\images\\vehicules\\renaultclio.png', '2'),
(18, 'Renault Clio', 1, '{\"prix\": \"44\", \"type\": \"citadine\", \"annee\": \"2019\", \"boite\": \"automatique\", \"moteur\": \"essence\", \"places\": \"5 places\"}', '.\\vue\\content\\images\\vehicules\\renaultclio.png', '2'),
(19, 'Renault Clio', 1, '{\"prix\": \"44\", \"type\": \"citadine\", \"annee\": \"2019\", \"boite\": \"automatique\", \"moteur\": \"essence\", \"places\": \"5 places\"}', '.\\vue\\content\\images\\vehicules\\renaultclio.png', '14'),
(20, 'Mercedes Classe B', 1, '{\"prix\": \"79\", \"type\": \"monospace\", \"annee\": \"2019\", \"boite\": \"manuelle\", \"moteur\": \"diesel\", \"places\": \"7 places\"}', '.\\vue\\content\\images\\vehicules\\mercedesclasseb.png', '2'),
(21, 'Mercedes Classe B', 1, '{\"prix\": \"79\", \"type\": \"monospace\", \"annee\": \"2019\", \"boite\": \"manuelle\", \"moteur\": \"diesel\", \"places\": \"7 places\"}', '.\\vue\\content\\images\\vehicules\\mercedesclasseb.png', 'disponible'),
(23, 'Mercedes Classe B', 1, '{\"prix\": \"79\", \"type\": \"monospace\", \"annee\": \"2019\", \"boite\": \"manuelle\", \"moteur\": \"diesel\", \"places\": \"7 places\"}', '.\\vue\\content\\images\\vehicules\\mercedesclasseb.png', '2'),
(24, 'Mercedes Classe B', 1, '{\"prix\": \"79\", \"type\": \"monospace\", \"annee\": \"2019\", \"boite\": \"manuelle\", \"moteur\": \"diesel\", \"places\": \"7 places\"}', '.\\vue\\content\\images\\vehicules\\mercedesclasseb.png', '14'),
(25, 'Ford Focus', 1, '{\"prix\": \"41\", \"annee\": \"2021\", \"boite\": \"manuelle\", \"moteur\": \"electrique\", \"places\": \"5 places\"}', '.\\vue\\content\\images\\vehicules\\fordfocus.png', 'disponible'),
(26, 'Ford Focus', 1, '{\"prix\": \"41\", \"annee\": \"2021\", \"boite\": \"manuelle\", \"moteur\": \"electrique\", \"places\": \"5 places\"}', '.\\vue\\content\\images\\vehicules\\fordfocus.png', '14'),
(27, 'Peugeot 208', 1, '{\"prix\": \"41\", \"annee\": \"2021\", \"boite\": \"manuelle\", \"moteur\": \"hybride\", \"places\": \"5 places\"}', './vue/content/images/vehicules/peugeot208.jpg', 'disponible'),
(28, 'Peugeot 208', 1, '{\"prix\": \"41\", \"annee\": \"2021\", \"boite\": \"manuelle\", \"moteur\": \"hybride\", \"places\": \"5 places\"}', './vue/content/images/vehicules/peugeot208.jpg', 'disponible'),
(29, 'Fiat 500', 1, '{\"prix\": \"37\", \"type\": \"compacte\", \"annee\": \"2019\", \"boite\": \"automatique\", \"moteur\": \"essence\", \"places\": \"4 places\"}', '.\\vue\\content\\images\\vehicules\\fiat500.png', 'disponible'),
(30, 'Fiat 500', 1, '{\"prix\": \"37\", \"type\": \"compacte\", \"annee\": \"2019\", \"boite\": \"automatique\", \"moteur\": \"essence\", \"places\": \"4 places\"}', '.\\vue\\content\\images\\vehicules\\fiat500.png', 'disponible'),
(31, 'Fiat 500', 1, '{\"prix\": \"37\", \"type\": \"compacte\", \"annee\": \"2019\", \"boite\": \"automatique\", \"moteur\": \"essence\", \"places\": \"4 places\"}', '.\\vue\\content\\images\\vehicules\\fiat500.png', 'disponible'),
(32, 'Ford Focus', 1, '{\"prix\": \"41\", \"annee\": \"2021\", \"boite\": \"manuelle\", \"moteur\": \"electrique\", \"places\": \"5 places\"}', '.\\vue\\content\\images\\vehicules\\fordfocus.png', 'disponible'),
(33, 'Ford Focus', 1, '{\"prix\": \"41\", \"annee\": \"2021\", \"boite\": \"manuelle\", \"moteur\": \"electrique\", \"places\": \"5 places\"}', '.\\vue\\content\\images\\vehicules\\fordfocus.png', 'disponible'),
(34, 'Ford Focus', 1, '{\"prix\": \"41\", \"annee\": \"2021\", \"boite\": \"manuelle\", \"moteur\": \"electrique\", \"places\": \"5 places\"}', '.\\vue\\content\\images\\vehicules\\fordfocus.png', 'disponible'),
(35, 'Ford Focus', 1, '{\"prix\": \"41\", \"annee\": \"2021\", \"boite\": \"manuelle\", \"moteur\": \"electrique\", \"places\": \"5 places\"}', '.\\vue\\content\\images\\vehicules\\fordfocus.png', 'disponible'),
(36, 'Mercedes Classe B', 1, '{\"prix\": \"79\", \"type\": \"monospace\", \"annee\": \"2019\", \"boite\": \"manuelle\", \"moteur\": \"diesel\", \"places\": \"7 places\"}', '.\\vue\\content\\images\\vehicules\\mercedesclasseb.png', 'disponible'),
(37, 'Mercedes Classe B', 1, '{\"prix\": \"79\", \"type\": \"monospace\", \"annee\": \"2019\", \"boite\": \"manuelle\", \"moteur\": \"diesel\", \"places\": \"7 places\"}', '.\\vue\\content\\images\\vehicules\\mercedesclasseb.png', 'disponible'),
(41, 'Mercedes Classe B', 1, '{\"prix\": \"79\", \"type\": \"monospace\", \"annee\": \"2019\", \"boite\": \"manuelle\", \"moteur\": \"diesel\", \"places\": \"7 places\"}', '.\\vue\\content\\images\\vehicules\\mercedesclasseb.png', 'disponible'),
(43, 'Mercedes Classe B', 1, '{\"prix\": \"79\", \"type\": \"monospace\", \"annee\": \"2019\", \"boite\": \"manuelle\", \"moteur\": \"diesel\", \"places\": \"7 places\"}', '.\\vue\\content\\images\\vehicules\\mercedesclasseb.png', 'disponible'),
(44, 'Peugeot 208', 1, '{\"prix\": \"41\", \"annee\": \"2021\", \"boite\": \"manuelle\", \"moteur\": \"hybride\", \"places\": \"5 places\"}', './vue/content/images/vehicules/peugeot208.jpg', 'disponible'),
(45, 'Peugeot 208', 1, '{\"prix\": \"41\", \"annee\": \"2021\", \"boite\": \"manuelle\", \"moteur\": \"hybride\", \"places\": \"5 places\"}', './vue/content/images/vehicules/peugeot208.jpg', 'disponible'),
(46, 'Peugeot 208', 1, '{\"prix\": \"41\", \"annee\": \"2021\", \"boite\": \"manuelle\", \"moteur\": \"hybride\", \"places\": \"5 places\"}', './vue/content/images/vehicules/peugeot208.jpg', 'disponible'),
(47, 'Peugeot 208', 1, '{\"prix\": \"41\", \"annee\": \"2021\", \"boite\": \"manuelle\", \"moteur\": \"hybride\", \"places\": \"5 places\"}', './vue/content/images/vehicules/peugeot208.jpg', 'disponible');

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
