-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  Dim 05 avr. 2020 à 11:29
-- Version du serveur :  5.7.26
-- Version de PHP :  7.3.5

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
-- Structure de la table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Hôtels'),
(2, 'Activités'),
(3, 'Restaurants'),
(4, 'Locations vacances'),
(5, 'Croisière');

-- --------------------------------------------------------

--
-- Structure de la table `command`
--

DROP TABLE IF EXISTS `command`;
CREATE TABLE IF NOT EXISTS `command` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `order_number` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8ECAEAD4A76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `command`
--

INSERT INTO `command` (`id`, `user_id`, `order_number`, `state`, `date_time`) VALUES
(23, 4, 'OMNI-RF32419', 'en cours', '2020-04-05 10:41:23'),
(24, 4, 'OMNI-RF79957', 'en cours', '2020-04-05 10:48:09');

-- --------------------------------------------------------

--
-- Structure de la table `command_line`
--

DROP TABLE IF EXISTS `command_line`;
CREATE TABLE IF NOT EXISTS `command_line` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `command_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_70BE1A7B4584665A` (`product_id`),
  KEY `IDX_70BE1A7B33E1689A` (`command_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `command_line`
--

INSERT INTO `command_line` (`id`, `product_id`, `command_id`, `quantity`) VALUES
(1, 12, 1, 3),
(11, 3, 14, 1),
(14, 11, 14, 3),
(15, 9, 20, 1),
(16, 12, 20, 1),
(17, 1, 21, 2),
(18, 1, 22, 2),
(19, 1, 23, 3),
(20, 1, 24, 1),
(21, 2, 24, 1),
(22, 3, 24, 4);

-- --------------------------------------------------------

--
-- Structure de la table `customer_address`
--

DROP TABLE IF EXISTS `customer_address`;
CREATE TABLE IF NOT EXISTS `customer_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` int(11) DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postcode` int(11) NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1193CB3FA76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `customer_address`
--

INSERT INTO `customer_address` (`id`, `user_id`, `name`, `first_name`, `phone`, `address`, `postcode`, `city`, `country`, `type`) VALUES
(1, 3, 'Test Test', 'Admin_name', 101010101, '4 Test', 77210, 'Test', 'France', 'address');

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
('20200309210756', '2020-03-09 21:08:15'),
('20200325150637', '2020-03-25 15:06:49'),
('20200325151557', '2020-03-25 15:16:03'),
('20200325153645', '2020-03-25 15:36:58'),
('20200328115419', '2020-03-28 11:54:49'),
('20200330135400', '2020-03-30 13:54:11');

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `notice` int(11) NOT NULL,
  `grade` double NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D34A04AD12469DE2` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `category_id`, `name`, `description`, `price`, `notice`, `grade`, `image`) VALUES
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
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `name`, `first_name`) VALUES
(3, 'admin@test.fr', '[\"ROLE_ADMIN\"]', '$2y$13$qOmATPg7UQefZsLfEH8zguGC0IPexo434g/FZDtvlQW8t.WpPm0HK', 'admin', 'admin'),
(4, 'test@test.fr', '[\"ROLE_USER\"]', '$2y$13$S1s44Wkx9K39kffLNlG6iOP.VdZyuA22JTfB/pKm0nMCgSzgvmL4.', 'Test1', 'Test2');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `command`
--
ALTER TABLE `command`
  ADD CONSTRAINT `FK_8ECAEAD4A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `command_line`
--
ALTER TABLE `command_line`
  ADD CONSTRAINT `FK_70BE1A7B4584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Contraintes pour la table `customer_address`
--
ALTER TABLE `customer_address`
  ADD CONSTRAINT `FK_1193CB3FA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_D34A04AD12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
