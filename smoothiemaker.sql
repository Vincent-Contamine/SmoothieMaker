-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Jeu 09 Mai 2019 à 15:29
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

--
-- Contenu de la table `Ingredient`
--

INSERT INTO `Ingredient` (`Id`, `Name`) VALUES
(1, 'pomme'),
(2, 'myrtille'),
(3, 'poire'),
(4, 'banane'),
(5, 'mangue'),
(6, 'avocat'),
(7, 'pastèque'),
(8, 'ortie'),
(9, 'épinard'),
(10, 'raisin sans pépin'),
(11, 'jus de citron'),
(12, 'eau'),
(13, 'glacon');

-- --------------------------------------------------------

--
-- Structure de la table `Recette`
--

CREATE TABLE `Recette` (
  `Id` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Description` varchar(2000) NOT NULL,
  `Photo` varchar(30) NOT NULL,
  `Confidentielle` varchar(10) NOT NULL,
  `Mois` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `Recette`
--

INSERT INTO `Recette` (`Id`, `Name`, `Description`, `Photo`, `Confidentielle`, `Mois`) VALUES
(1, 'green oxydant', 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Dolores mollitia repellendus maxime hic, atque ut nostrum aperiam vel! Labore saepe iure adipisci? Quis, deserunt Dolores.\r\n\r\n<strong>Etapes:</strong> \r\n\r\n1 - Bien nettoyer les ingredients\r\n2 - Eplucher les pommes et les couper en morceaux\r\n3 - Si les raisin contiennent des pépins, pensez à les retirer\r\n4 - La normalement il y a les bétises racontées par Audrey\r\n5 - Verser les ingrédients dans le blender, et mixer avec queqlues glaçon\r\n6 - Servir frais\r\n \r\nLorem ipsum dolor sit amet consectetur adipisicing elit. Aut, hic, ipsam cupiditate quaerat ratione minima quam possimus nobis id illum fugiat laborum sapiente, nisi ad doloremque corporis unde. Doloribus, minus? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sed, quidem? Excepturi minus explicabo nesciunt rerum cupiditate aliquam esse nobis reprehenderit, quae ipsam cum quam architecto optio harum accusantium omnis aut?', 'smoothie-detox.jpg', 'true', '01'),
(2, 'teahupoo ', 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Dolores mollitia repellendus maxime hic, atque ut nostrum aperiam vel! Labore saepe iure adipisci? Quis, deserunt Dolores.\r\n\r\n<strong>Etapes:</strong> \r\n\r\n1 - Bien nettoyer les ingredients\r\n2 - Eplucher les pommes et les couper en morceaux\r\n3 - Si les raisin contiennent des pépins, pensez à les retirer\r\n4 - La normalement il y a les bétises racontées par Audrey\r\n5 - Verser les ingrédients dans le blender, et mixer avec queqlues glaçon\r\n6 - Servir frais\r\n \r\nLorem ipsum dolor sit amet consectetur adipisicing elit. Aut, hic, ipsam cupiditate quaerat ratione minima quam possimus nobis id illum fugiat laborum sapiente, nisi ad doloremque corporis unde. Doloribus, minus? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sed, quidem? Excepturi minus explicabo nesciunt rerum cupiditate aliquam esse nobis reprehenderit, quae ipsam cum quam architecto optio harum accusantium omnis aut?', 'betterave.jpg', 'false', '02'),
(3, 'avocado', 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Dolores mollitia repellendus maxime hic, atque ut nostrum aperiam vel! Labore saepe iure adipisci? Quis, deserunt Dolores.\r\n\r\n<strong>Etapes:</strong> \r\n\r\n1 - Bien nettoyer les ingredients\r\n2 - Eplucher les pommes et les couper en morceaux\r\n3 - Si les raisin contiennent des pépins, pensez à les retirer\r\n4 - La normalement il y a les bétises racontées par Audrey\r\n5 - Verser les ingrédients dans le blender, et mixer avec queqlues glaçon\r\n6 - Servir frais\r\n \r\nLorem ipsum dolor sit amet consectetur adipisicing elit. Aut, hic, ipsam cupiditate quaerat ratione minima quam possimus nobis id illum fugiat laborum sapiente, nisi ad doloremque corporis unde. Doloribus, minus? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sed, quidem? Excepturi minus explicabo nesciunt rerum cupiditate aliquam esse nobis reprehenderit, quae ipsam cum quam architecto optio harum accusantium omnis aut?', 'legumes verts.jpg', 'true', '03'),
(4, 'berry folie', 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Dolores mollitia repellendus maxime hic, atque ut nostrum aperiam vel! Labore saepe iure adipisci? Quis, deserunt Dolores.\r\n\r\n<strong>Etapes:</strong> \r\n\r\n1 - Bien nettoyer les ingredients\r\n2 - Eplucher les pommes et les couper en morceaux\r\n3 - Si les raisin contiennent des pépins, pensez à les retirer\r\n4 - La normalement il y a les bétises racontées par Audrey\r\n5 - Verser les ingrédients dans le blender, et mixer avec queqlues glaçon\r\n6 - Servir frais\r\n \r\nLorem ipsum dolor sit amet consectetur adipisicing elit. Aut, hic, ipsam cupiditate quaerat ratione minima quam possimus nobis id illum fugiat laborum sapiente, nisi ad doloremque corporis unde. Doloribus, minus? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sed, quidem? Excepturi minus explicabo nesciunt rerum cupiditate aliquam esse nobis reprehenderit, quae ipsam cum quam architecto optio harum accusantium omnis aut?', 'Rezepte-Blog.jpg', 'false', '04'),
(5, 'orange gourmandise', 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Dolores mollitia repellendus maxime hic, atque ut nostrum aperiam vel! Labore saepe iure adipisci? Quis, deserunt Dolores.\r\n\r\n<strong>Etapes:</strong> \r\n\r\n1 - Bien nettoyer les ingredients\r\n2 - Eplucher les pommes et les couper en morceaux\r\n3 - Si les raisin contiennent des pépins, pensez à les retirer\r\n4 - La normalement il y a les bétises racontées par Audrey\r\n5 - Verser les ingrédients dans le blender, et mixer avec queqlues glaçon\r\n6 - Servir frais\r\n \r\nLorem ipsum dolor sit amet consectetur adipisicing elit. Aut, hic, ipsam cupiditate quaerat ratione minima quam possimus nobis id illum fugiat laborum sapiente, nisi ad doloremque corporis unde. Doloribus, minus? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sed, quidem? Excepturi minus explicabo nesciunt rerum cupiditate aliquam esse nobis reprehenderit, quae ipsam cum quam architecto optio harum accusantium omnis aut?', 'jus-ananas-orange.jpg', 'true', '05'),
(6, 'pink pleasure', 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Dolores mollitia repellendus maxime hic, atque ut nostrum aperiam vel! Labore saepe iure adipisci? Quis, deserunt Dolores.\r\n\r\n<strong>Etapes:</strong> \r\n\r\n1 - Bien nettoyer les ingredients\r\n2 - Eplucher les pommes et les couper en morceaux\r\n3 - Si les raisin contiennent des pépins, pensez à les retirer\r\n4 - La normalement il y a les bétises racontées par Audrey\r\n5 - Verser les ingrédients dans le blender, et mixer avec queqlues glaçon\r\n6 - Servir frais\r\n \r\nLorem ipsum dolor sit amet consectetur adipisicing elit. Aut, hic, ipsam cupiditate quaerat ratione minima quam possimus nobis id illum fugiat laborum sapiente, nisi ad doloremque corporis unde. Doloribus, minus? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sed, quidem? Excepturi minus explicabo nesciunt rerum cupiditate aliquam esse nobis reprehenderit, quae ipsam cum quam architecto optio harum accusantium omnis aut?', 'smoothie-detox-2.jpg', 'false', '06'),
(7, 'yellow mango', 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Dolores mollitia repellendus maxime hic, atque ut nostrum aperiam vel! Labore saepe iure adipisci? Quis, deserunt Dolores.\r\n\r\n<strong>Etapes:</strong> \r\n\r\n1 - Bien nettoyer les ingredients\r\n2 - Eplucher les pommes et les couper en morceaux\r\n3 - Si les raisin contiennent des pépins, pensez à les retirer\r\n4 - La normalement il y a les bétises racontées par Audrey\r\n5 - Verser les ingrédients dans le blender, et mixer avec queqlues glaçon\r\n6 - Servir frais\r\n \r\nLorem ipsum dolor sit amet consectetur adipisicing elit. Aut, hic, ipsam cupiditate quaerat ratione minima quam possimus nobis id illum fugiat laborum sapiente, nisi ad doloremque corporis unde. Doloribus, minus? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sed, quidem? Excepturi minus explicabo nesciunt rerum cupiditate aliquam esse nobis reprehenderit, quae ipsam cum quam architecto optio harum accusantium omnis aut?', 'Smoothie_exotique.jpg', 'true', '07'),
(8, 'watermelon detox', 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Dolores mollitia repellendus maxime hic, atque ut nostrum aperiam vel! Labore saepe iure adipisci? Quis, deserunt Dolores.\r\n\r\n<strong>Etapes:</strong> \r\n\r\n1 - Bien nettoyer les ingredients\r\n2 - Eplucher les pommes et les couper en morceaux\r\n3 - Si les raisin contiennent des pépins, pensez à les retirer\r\n4 - La normalement il y a les bétises racontées par Audrey\r\n5 - Verser les ingrédients dans le blender, et mixer avec queqlues glaçon\r\n6 - Servir frais\r\n \r\nLorem ipsum dolor sit amet consectetur adipisicing elit. Aut, hic, ipsam cupiditate quaerat ratione minima quam possimus nobis id illum fugiat laborum sapiente, nisi ad doloremque corporis unde. Doloribus, minus? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sed, quidem? Excepturi minus explicabo nesciunt rerum cupiditate aliquam esse nobis reprehenderit, quae ipsam cum quam architecto optio harum accusantium omnis aut?', 'watermelon_smoothie.jpg', 'false', '08');

-- --------------------------------------------------------

--
-- Structure de la table `RecetteLine`
--

CREATE TABLE `RecetteLine` (
  `Id_Recette` int(11) NOT NULL,
  `Id_Ingredient` int(11) NOT NULL,
  `Quantite` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `RecetteLine`
--

INSERT INTO `RecetteLine` (`Id_Recette`, `Id_Ingredient`, `Quantite`) VALUES
(1, 1, '1'),
(1, 9, '100gr d\''),
(1, 10, '30gr de'),
(1, 11, '5cl de'),
(1, 12, '20cl'),
(1, 13, '50gr de'),
(2, 1, '1'),
(2, 2, '30gr de'),
(2, 10, '20gr de'),
(2, 12, '20cl d\''),
(2, 13, '50gr de'),
(3, 3, '1'),
(3, 6, '30gr de'),
(3, 7, '20gr de'),
(3, 12, '20cl d\''),
(3, 13, '50gr de'),
(4, 2, '50gr de'),
(4, 7, '30gr de'),
(4, 11, '20cl de'),
(4, 12, '20cl d\''),
(4, 13, '50gr de'),
(5, 4, '30gr de'),
(5, 9, '50gr de'),
(5, 11, '2cl de'),
(5, 12, '20cl d\''),
(5, 13, '50gr de'),
(6, 2, '50gr de'),
(6, 7, '30gr de'),
(6, 10, '25gr de'),
(6, 12, '20cl d\''),
(6, 13, '50gr de'),
(7, 4, '30gr de'),
(7, 5, '50gr de'),
(7, 10, '25gr de'),
(7, 12, '20cl d\''),
(7, 13, '50gr de'),
(8, 7, '50gr de'),
(8, 8, '30gr de'),
(8, 11, '2cl de'),
(8, 12, '20cl d\''),
(8, 13, '50gr de');

-- --------------------------------------------------------

--
-- Structure de la table `User`
--

CREATE TABLE `User` (
  `Id` int(11) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
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
  ADD PRIMARY KEY (`Id_Recette`,`Id_Ingredient`),
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
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT pour la table `Recette`
--
ALTER TABLE `Recette`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
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
