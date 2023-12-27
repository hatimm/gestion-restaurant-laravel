-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3316
-- Généré le : lun. 29 août 2022 à 15:36
-- Version du serveur : 10.4.22-MariaDB
-- Version de PHP : 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestion-restaurant`
--

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `title`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Salade Marocain', 'salade-marocain', '2022-07-28 09:24:28', '2022-07-28 09:33:10'),
(3, 'Déjeuner', 'dejeuner', '2022-08-17 07:04:07', '2022-08-17 07:04:07'),
(4, 'Dinner', 'dinner', '2022-08-17 07:05:00', '2022-08-17 07:05:00'),
(5, 'Petit Déjeuner', 'petit-dejeuner', '2022-08-17 07:07:34', '2022-08-17 07:07:34');

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `menus`
--

INSERT INTO `menus` (`id`, `title`, `slug`, `description`, `price`, `image`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'salade marocain', 'salade-marocain', 'salade', '15.00', '1660469232_téléchargement.jfif', 1, '2022-08-14 08:27:12', '2022-08-17 07:08:16'),
(2, 'Omlete', 'omlete', 'omlete', '8.00', '1660723934_omlete.jpg', 5, '2022-08-17 07:12:14', '2022-08-17 07:12:14'),
(3, 'Poulet', 'poulet', 'poulet', '30.00', '1660724143_chicken-1001767_960_720.jpg', 4, '2022-08-17 07:15:43', '2022-08-17 07:15:43'),
(4, 'Pizza', 'pizza', 'pizza', '20.00', '1660724200_pizza-3007395_960_720.jpg', 3, '2022-08-17 07:16:40', '2022-08-17 07:16:40');

-- --------------------------------------------------------

--
-- Structure de la table `menu_sales`
--

CREATE TABLE `menu_sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_id` bigint(20) UNSIGNED NOT NULL,
  `sales_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `menu_sales`
--

INSERT INTO `menu_sales` (`id`, `menu_id`, `sales_id`) VALUES
(1, 1, 2),
(2, 3, 3),
(3, 4, 4),
(4, 3, 5),
(5, 1, 6),
(6, 4, 6);

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2022_07_24_141623_create_servants_table', 1),
(5, '2022_07_25_140943_create_sales_table', 1),
(6, '2022_07_25_141446_create_tables_table', 1),
(7, '2022_07_26_140135_create_categories_table', 1),
(8, '2022_07_26_140355_create_menus_table', 1),
(9, '2022_07_26_155730_create_sale_table', 1),
(10, '2022_07_26_160025_create_menu_sale_table', 1),
(11, '2022_08_22_153709_create_menu_sales_table', 2),
(12, '2022_08_22_153942_create_sales_table_table', 2);

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `sales`
--

CREATE TABLE `sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `servants_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `total_price` decimal(8,2) NOT NULL DEFAULT 0.00,
  `total_recieved` decimal(8,2) NOT NULL DEFAULT 0.00,
  `change` decimal(8,2) NOT NULL DEFAULT 0.00,
  `payment_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cash',
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'paid',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `sales`
--

INSERT INTO `sales` (`id`, `servants_id`, `quantity`, `total_price`, `total_recieved`, `change`, `payment_type`, `payment_status`, `created_at`, `updated_at`) VALUES
(2, 1, 1, '15.00', '15.00', '0.00', 'cash', 'paid', '2022-08-22 14:54:56', '2022-08-22 14:54:56'),
(3, 1, 1, '30.00', '30.00', '0.00', 'card', 'unpaid', '2022-08-22 15:01:12', '2022-08-22 15:01:12'),
(4, 1, 1, '20.00', '20.00', '0.00', 'cash', 'paid', '2022-08-23 11:55:37', '2022-08-23 11:55:37'),
(5, 1, 1, '30.00', '30.00', '0.00', 'card', 'paid', '2022-08-23 12:17:54', '2022-08-23 12:17:54'),
(6, 1, 1, '35.00', '35.00', '0.00', 'card', 'paid', '2022-08-25 12:33:55', '2022-08-25 12:55:31');

-- --------------------------------------------------------

--
-- Structure de la table `sales_table`
--

CREATE TABLE `sales_table` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `table_id` bigint(20) UNSIGNED NOT NULL,
  `sales_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `sales_table`
--

INSERT INTO `sales_table` (`id`, `table_id`, `sales_id`) VALUES
(1, 1, 2),
(2, 1, 3),
(3, 1, 4),
(4, 4, 5),
(5, 1, 6),
(6, 4, 6);

-- --------------------------------------------------------

--
-- Structure de la table `servants`
--

CREATE TABLE `servants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adresse` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `servants`
--

INSERT INTO `servants` (`id`, `name`, `adresse`, `phone`, `created_at`, `updated_at`) VALUES
(1, 'Hatim mef', NULL, 687264178, '2022-07-31 13:40:12', '2022-08-02 12:47:07');

-- --------------------------------------------------------

--
-- Structure de la table `tables`
--

CREATE TABLE `tables` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `tables`
--

INSERT INTO `tables` (`id`, `name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'table 1', 'table-1', 1, '2022-07-30 13:29:41', '2022-07-30 13:29:41'),
(4, 'table 2', 'table-2', 1, '2022-08-17 07:06:39', '2022-08-17 07:06:39'),
(5, 'table 3', 'table-3', 1, '2022-08-17 07:06:50', '2022-08-17 07:06:50');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(4, 'admin', 'admin@email.com', '2022-07-27 09:15:39', '$2y$10$6Y3Hv/uW2BngzXjtrj4mHeReERM5c5vTEbZKtrm8sZxnh/ZghC6hS', 'bR4025dnwrdWcf97hCoDu2k6dKeGJ6N5baFPk8lAAeYBjr1uE7jRGLMsyd8j', '2022-07-27 09:15:39', '2022-07-27 09:15:39');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menus_category_id_foreign` (`category_id`);

--
-- Index pour la table `menu_sales`
--
ALTER TABLE `menu_sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_sales_menu_id_foreign` (`menu_id`),
  ADD KEY `menu_sales_sales_id_foreign` (`sales_id`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Index pour la table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sales_servants_id_foreign` (`servants_id`);

--
-- Index pour la table `sales_table`
--
ALTER TABLE `sales_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sales_table_table_id_foreign` (`table_id`),
  ADD KEY `sales_table_sales_id_foreign` (`sales_id`);

--
-- Index pour la table `servants`
--
ALTER TABLE `servants`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `tables`
--
ALTER TABLE `tables`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `menu_sales`
--
ALTER TABLE `menu_sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `sales_table`
--
ALTER TABLE `sales_table`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `servants`
--
ALTER TABLE `servants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `tables`
--
ALTER TABLE `tables`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `menus`
--
ALTER TABLE `menus`
  ADD CONSTRAINT `menus_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `menu_sales`
--
ALTER TABLE `menu_sales`
  ADD CONSTRAINT `menu_sales_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `menu_sales_sales_id_foreign` FOREIGN KEY (`sales_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_servants_id_foreign` FOREIGN KEY (`servants_id`) REFERENCES `servants` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `sales_table`
--
ALTER TABLE `sales_table`
  ADD CONSTRAINT `sales_table_sales_id_foreign` FOREIGN KEY (`sales_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sales_table_table_id_foreign` FOREIGN KEY (`table_id`) REFERENCES `tables` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
