-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  sam. 21 mars 2020 à 20:49
-- Version du serveur :  5.7.26
-- Version de PHP :  7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `eboutique`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE IF NOT EXISTS `categorie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id`, `nom`) VALUES
(1, 'Hôtels'),
(2, 'Activités'),
(3, 'Restaurants'),
(4, 'Locations vacances'),
(5, 'Croisière');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `utilisateur_id` int(11) DEFAULT NULL,
  `date` datetime NOT NULL,
  `reference` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_6EEAA67DFB88E14F` (`utilisateur_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `commande_produit`
--

DROP TABLE IF EXISTS `commande_produit`;
CREATE TABLE IF NOT EXISTS `commande_produit` (
  `commande_id` int(11) NOT NULL,
  `produit_id` int(11) NOT NULL,
  PRIMARY KEY (`commande_id`,`produit_id`),
  KEY `IDX_DF1E9E8782EA2E54` (`commande_id`),
  KEY `IDX_DF1E9E87F347EFB` (`produit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `migration_versions`
--

DROP TABLE IF EXISTS `migration_versions`;
CREATE TABLE IF NOT EXISTS `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migration_versions`
--

INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
('20200309210756', '2020-03-09 21:08:15');

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categorie_id` int(11) NOT NULL,
  `nom` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prix` int(11) NOT NULL,
  `avis` int(11) NOT NULL,
  `note` double NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_29A5EC27BCF5E72D` (`categorie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id`, `categorie_id`, `nom`, `description`, `prix`, `avis`, `note`, `image`) VALUES
(1, 1, 'Ibis Styles Deauville Centre', 'Rapport qualité/prix nº 1 sur 37 hébergements à Ville de Deauville', 87, 752, 4.5, 'hotel-ibis-styles-deauville.jpg'),
(2, 1, 'Novotel Paris Les Halles', 'Rapport qualité/prix nº 1 sur 2 351 hébergements à Paris', 214, 5466, 4.8, '	\r\nhotel-novotel-paris-les-halles.jpg'),
(3, 1, 'Hotel Marignan Champs-Elysées', 'Rapport qualité/prix nº 2 à Paris', 304, 878, 4.5, 'hotel-marignan-paris.jpg'),
(4, 1, 'Maison Souquet', 'Rapport qualité/prix nº 4 à Paris', 358, 968, 5, 'hotel-maison-soquet.jpg'),
(5, 2, 'Spectacle au Moulin Rouge à Paris', 'Ressentez l\'atmosphère qui crépite tandis que le rideau révèle une exubérante troupe de danseuses, de danseurs et de musiciens prêts à hypnotiser le public.', 97, 3132, 4, 'activite-moulin-rouge.jpg'),
(6, 2, 'Croisière sur la Seine', 'Combinez les arrêts de tous les principaux sites parisiens au cours d\'une croisière pittoresque. Sautez le trafic routier et le métro en empruntant une croisière pittoresque', 17, 2059, 4, 'activite-croisiere-seine.jpg'),
(7, 2, 'Ascension guidée de la tour Eiffel', 'Montez la Tour Eiffel, un monument prisé de Paris, à pied avec un petit groupe de personnes. Éliminez les files d\'attente d\'ascenseurs et montez 704 marches (plus de 30 vols) vers la deuxième plateforme d\'observation, frais d\'entrée inclus.', 34, 859, 4.5, 'activite-tour-eiffel.jpg'),
(8, 2, 'Circuit en « Big Bus »', 'Découvrez davantage de Paris grâce à un bus à impériale à toit ouvert et laissez de côté vos inquiétudes sur la navigation dans les rues ou l\'utilisation des transports en commun.', 35, 3133, 4, 'activite-big-bus.jpg'),
(9, 3, 'Il Etait Un Square', 'Nº 2 sur 7 068 Française à Paris\r\nNº 4 sur 15 238 Restaurants à Paris', 12, 3289, 5, 'restaurant-il-etait-un-square.jpg'),
(10, 3, 'Pur\' - Jean-François Rouquette', 'Nº 3 sur 7 068 Française à Paris\r\nNº 7 sur 15 238 Restaurants à Paris', 325, 1154, 5, 'restaurant-pur-jean-francois-rouquette.jpg'),
(11, 3, 'Bistrot Kinzo', 'Nº 1 sur 910 Japonaise à Paris\r\nNº 8 sur 15 238 Restaurants à Paris', 40, 100, 5, 'restaurant-kinzo.jpg'),
(12, 3, 'Boutary', 'Nº 10 sur 15 238 Restaurants à Paris', 120, 1118, 5, 'restaurant-boutray.jpg'),
(13, 4, 'Le Marais', 'Situé à Paris, dans le pittoresque Aubriot rue, entre la rue de la Croix de Saint-Bretonnerie et les Blancs Manteaux, les voyageurs trouveront cet appartement de vacances à un prix abordable.', 285, 54, 4, 'vacances-le-marais.jpg'),
(14, 4, 'Deauville triangle d\'or\r\n', 'Appartement d\'exception d\'environ 100 m² en duplex avec 2 terrasses, idéalement situé: en plein coeur de Deauville.', 395, 2, 4, 'vacances-triangle-or.jpg'),
(15, 5, 'Norwegian Bliss', 'Norwegian Bliss est un navire de croisière pour Norwegian Cruise Line, qui est entré en service le 21 avril 2018. Le navire a été construit par Meyer Werft à Papenburg, en Allemagne.', 5000, 199, 4, 'croisiere-norwegian-bliss.jpg'),
(16, 5, 'Marella Discovery 2', 'Le Legend of the Seas est un navire de croisière de classe Vision construit en 1995 par les Chantiers de l\'Atlantique à Saint-Nazaire pour le compte de la Royal Caribbean Cruise Line sous pavillon Libérien. Il est aujourd\'hui sous pavillon Bahamas.', 1500, 182, 4.5, 'croisiere-marella-discovery.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_naissance` datetime NOT NULL,
  `sexe` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adresse` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_postal` int(11) NOT NULL,
  `ville` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `FK_6EEAA67DFB88E14F` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`);

--
-- Contraintes pour la table `commande_produit`
--
ALTER TABLE `commande_produit`
  ADD CONSTRAINT `FK_DF1E9E8782EA2E54` FOREIGN KEY (`commande_id`) REFERENCES `commande` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_DF1E9E87F347EFB` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `FK_29A5EC27BCF5E72D` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
