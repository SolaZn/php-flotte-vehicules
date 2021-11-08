-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : Dim 07 nov. 2021 à 22:11
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
-- Base de données : `d`
--

-- --------------------------------------------------------

--
-- Structure de la table `vehicule`
--

DROP TABLE IF EXISTS `vehicule`;
CREATE TABLE IF NOT EXISTS `vehicule` (
  `id_v` int(11) NOT NULL AUTO_INCREMENT,
  `type_v` text COLLATE utf8_bin NOT NULL,
  `energie_v` text COLLATE utf8_bin NOT NULL,
  `boite_v` text COLLATE utf8_bin NOT NULL,
  `places_v` int(11) NOT NULL,
  `location_v` text COLLATE utf8_bin NOT NULL,
  `photo_v` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_v`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `vehicule`
--

INSERT INTO `vehicule` (`id_v`, `type_v`, `energie_v`, `boite_v`, `places_v`, `location_v`, `photo_v`) VALUES
(1, 'Renault zoé', 'électrique', 'automatique', 2, 'disponible', './vue/Photo/Renault.jpg'),
(2, 'Peugeot 206', 'hybride', 'manuelle', 5, 'loué', './vue/Photo/Peugeot.jpg'),
(3, 'Ferrari', 'hybride', 'manuelle', 2, 'disponible', './vue/Photo/Ferrari.jpg'),
(4, 'Citroën c4', 'hybride', 'automatique', 5, 'loué', './vue/Photo/Citroen.jpg'),
(5, 'Tesla', 'électrique', 'automatique', 7, 'loué', './vue/Photo/Tesla.jpg'),
(6, 'Mercedes', 'hybride', 'manuelle', 5, 'disponible', './vue/Photo/Mercedes.jpg'),
(7, 'Honda', 'électrique', 'manuelle', 5, 'disponible', './vue/Photo/Honda.jpg'),
(8, 'Nissan', 'hybride', 'manuelle', 5, 'disponible', './vue/Photo/Nissan.jpg'),
(9, 'Opel', 'électrique', 'automatique', 5, 'disponible', './vue/Photo/Opel.jpg'),
(10, 'Audi', 'hybride', 'manuelle', 5, 'disponible', './vue/Photo/Audi.jpg'),
(11, 'BMW', 'hybride', 'automatique', 5, 'en_révision', './vue/Photo/BMW.jpg'),
(12, 'Fiat', 'électrique', 'automatique', 3, 'en_révision', './vue/Photo/Fiat.jpg'),
(13, 'Ford', 'hybride', 'manuelle', 5, 'disponible', './vue/Photo/Ford.jpg'),
(14, 'Rolls Royce', 'hybride', 'automatique', 5, 'disponible', './vue/Photo/RR.jpg'),
(15, 'Suzuki', 'électrique', 'automatique', 2, 'loué', './vue/Photo/Suzuki.jpg'),
(16, 'Chevrolet', 'hybride', 'automatique', 5, 'disponible', './vue/Photo/Chevrolet.jpg'),
(17, 'Aston Martin', 'électrique', 'manuelle', 3, 'loué', './vue/Photo/Aston.jpg'),
(18, 'Mazda', 'électrique', 'automatique', 5, 'disponible', './vue/Photo/Mazda.jpg'),
(19, 'Hummer', 'hybride', 'manuelle', 3, 'en_révision', './vue/Photo/Hummer.jpg'),
(20, 'Jaguar', 'hybride', 'automatique', 2, 'disponible', './vue/Photo/Jaguar.jpg'),
(21, 'Land Rover', 'hybride', 'automatique', 1, 'en_révision', './vue/Photo/LR.jpg'),
(22, 'BatMobile', 'électrique', 'manuelle', 1, 'loué', './vue/Photo/Batmobile.jpg'),
(23, 'Crinale', 'électrique', 'manuelle', 1, 'disponible', './vue/Photo/Crinale.jpg'),
(24, 'Kamata Longinus', 'électrique', 'automatique', 1, 'disponible', './vue/Photo/Kamata.jpg'),
(25, 'Nosferatu', 'électrique', 'manuelle', 1, 'en_révision', './vue/Photo/Nosferatu.jpg'),
(27, 'eeee', 'électrique', 'manuelle', 3, 'en_révision', './vue/Photo/the-long-ly-garden.jpg');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
