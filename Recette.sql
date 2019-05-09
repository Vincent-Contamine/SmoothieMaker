-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Jeu 09 Mai 2019 à 12:26
-- Version du serveur :  5.7.26-0ubuntu0.16.04.1
-- Version de PHP :  7.0.33-0ubuntu0.16.04.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `smoothiemaker`
--

-- --------------------------------------------------------

--
-- Structure de la table `Recette`
--

CREATE TABLE `Recette` (
  `Id` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Description` varchar(400) NOT NULL,
  `Photo` varchar(30) NOT NULL,
  `Confidentielle` varchar(10) NOT NULL,
  `Mois` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `Recette`
--
ALTER TABLE `Recette`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `Recette`
--
ALTER TABLE `Recette`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
