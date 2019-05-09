-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Jeu 09 Mai 2019 à 12:06
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
-- Structure de la table `Favoris`
--

CREATE TABLE `Favoris` (
  `Id` int(11) NOT NULL,
  `Id_User` int(11) NOT NULL,
  `Id_Recette` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Ingredient`
--

CREATE TABLE `Ingredient` (
  `Id` int(11) NOT NULL,
  `Name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Recette`
--

CREATE TABLE `Recette` (
  `Id` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Description` varchar(400) NOT NULL,
  `Photo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `RecetteLine`
--

CREATE TABLE `RecetteLine` (
  `Id_Recette` int(11) NOT NULL,
  `Id_Ingredient` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `User`
--

CREATE TABLE `User` (
  `Id` int(11) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Password` varchar(64) NOT NULL,
  `FirsName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `Favoris`
--
ALTER TABLE `Favoris`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_User` (`Id_User`),
  ADD KEY `Id_Recette` (`Id_Recette`);

--
-- Index pour la table `Ingredient`
--
ALTER TABLE `Ingredient`
  ADD PRIMARY KEY (`Id`);

--
-- Index pour la table `Recette`
--
ALTER TABLE `Recette`
  ADD PRIMARY KEY (`Id`);

--
-- Index pour la table `RecetteLine`
--
ALTER TABLE `RecetteLine`
  ADD KEY `Id_Recette` (`Id_Recette`),
  ADD KEY `Id_Ingredient` (`Id_Ingredient`);

--
-- Index pour la table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `Favoris`
--
ALTER TABLE `Favoris`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `Ingredient`
--
ALTER TABLE `Ingredient`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `Recette`
--
ALTER TABLE `Recette`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `User`
--
ALTER TABLE `User`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `Favoris`
--
ALTER TABLE `Favoris`
  ADD CONSTRAINT `Favoris_ibfk_1` FOREIGN KEY (`Id_User`) REFERENCES `User` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Favoris_ibfk_2` FOREIGN KEY (`Id_Recette`) REFERENCES `Recette` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `RecetteLine`
--
ALTER TABLE `RecetteLine`
  ADD CONSTRAINT `RecetteLine_ibfk_1` FOREIGN KEY (`Id_Recette`) REFERENCES `Recette` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `RecetteLine_ibfk_2` FOREIGN KEY (`Id_Ingredient`) REFERENCES `Ingredient` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
