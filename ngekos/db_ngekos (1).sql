-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 10, 2026 at 04:22 AM
-- Server version: 8.0.30
-- PHP Version: 8.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_ngekos`
--

-- --------------------------------------------------------

--
-- Table structure for table `boarding_houses`
--

CREATE TABLE `boarding_houses` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city_id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `boarding_houses`
--

INSERT INTO `boarding_houses` (`id`, `name`, `slug`, `thumbnail`, `city_id`, `category_id`, `description`, `price`, `address`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Pade Hotel', 'pade-hotel', 'boarding_house/01KMG4MF5J56FDM1BAZP6FW49B.png', 1, 1, '<p>Pade hotel merupakan hotel yang sangat ramah dikantong dengan fasilitas yang sangat mewah dan dilengkapi dengan pemandangan yang sangat indah</p>', 350000, 'Jl. Simpang lima banda aceh', NULL, '2026-03-24 07:40:29', '2026-03-24 07:40:29'),
(2, 'Diana Hotel', 'diana-hotel', 'boarding_house/01KMG5M04TEJQRADHFW8N54TMN.png', 1, 1, '<p>Hotel terdekat dengan kota lhokseumawe dan lokasinya yang sangat strategis</p>', 250000, 'Jalan Keluar Kota Lhokseumawe', NULL, '2026-03-24 07:57:42', '2026-03-24 07:57:42'),
(6, 'Meuligoe Hotel', 'meuligoe-hotel', 'boarding_house/01KR63RH5B6DCNT5GGRJN9E850.webp', 1, 1, '<p>Hotel Meuligoe terletak dijalan banda aceh - medan yang sangat strategis bagi tourist yang mampir dikota bireuen</p>', 550000, 'Jln. Medan - Banda Aceh, Cot Gapu, Bireuen', NULL, '2026-05-09 03:15:36', '2026-05-09 03:15:36'),
(7, 'Daima Hotel', 'daima-hotel', 'boarding_house/01KR81TY5WWF74HSF9V5ZCYK7N.jpg', 3, 1, '<p>&nbsp;Daima Hotel Padang terletak di kawasan Padang Barat yang ramai, menyambut dua pelancong dengan nuansa taman air—seluncuran outdoor besar, kolam renang yang berkilau, tata letak yang Instagramable, lounge rooftop dengan pemandangan, serta warung makan dan pasar di sekitar. Berada di posisi strategis antara Pantai Padang dan situs peninggalan era Belanda, hotel ini memberi akses cepat ke Pantai Carocok, Pantai Padang Taplau dan Pecinan untuk bersantap dan berbelanja. Fasilitas di lokasi meliputi bar yang elegan, kedai kopi nyaman yang menyajikan kopi artisan, kolam renang dalam ruangan, dan sauna. Kamar tamu dilengkapi AC, Wi‑Fi gratis, brankas dalam kamar, dan perlengkapan mandi; beberapa kamar menawarkan pemandangan kota. Hiburan ramah keluarga dan akses mudah ke atraksi lokal menjadikan hotel ini ideal bagi dua pelancong yang mencari kenyamanan dan kesenangan. [Sebagian konten mungkin didukung oleh AI Generatif. Konten mungkin tidak akurat.</p><p><br></p><p><br>&nbsp;</p>', 368000, 'Pusat Kota Padang', NULL, '2026-05-09 21:20:27', '2026-05-09 21:20:27');

-- --------------------------------------------------------

--
-- Table structure for table `bonuses`
--

CREATE TABLE `bonuses` (
  `id` bigint UNSIGNED NOT NULL,
  `boarding_house_id` bigint UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bonuses`
--

INSERT INTO `bonuses` (`id`, `boarding_house_id`, `image`, `name`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES
(2, 1, 'bonuses/01KMG4MF5R9S2TTFXEQDS9BSSR.png', 'Laundry', '<p>Free Laundry Maksimal 5 Kilogram</p>', NULL, '2026-03-24 07:40:29', '2026-03-24 07:40:29'),
(3, 2, 'bonuses/01KMG5M050FF85YCQ444RCN7PV.png', 'Wifi', '<p>akses wifi dengan kecepatan full speed 100MBps</p>', NULL, '2026-03-24 07:57:42', '2026-03-24 07:57:42'),
(4, 6, 'bonuses/01KR63RH5KQBNQ663VVDFHGABZ.png', 'Obat - obatan', '<p>Tersedia obat obatan darurat untuk pertolongan pertama</p>', NULL, '2026-05-09 03:15:36', '2026-05-09 03:15:36'),
(5, 7, 'bonuses/01KR81TY63510K7RSK0BJ40DE6.webp', 'sarapan', '<p>Bonus sarapan pagi</p>', NULL, '2026-05-09 21:20:27', '2026-05-09 21:20:27'),
(6, 7, 'bonuses/01KR81TY673HQR9NRQWZBHT9DQ.webp', 'Fitness Area', '<p>Area Fitness cocok untuk yang ingin berolahraga di indoor</p>', NULL, '2026-05-09 21:20:27', '2026-05-09 21:20:27');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('da4b9237bacccdf19c0760cab7aec4a8359010b0', 'i:1;', 1778386883),
('da4b9237bacccdf19c0760cab7aec4a8359010b0:timer', 'i:1778386883;', 1778386883),
('livewire-rate-limiter:a17961fa74e9275d529f489537f179c05d50c2f3', 'i:1;', 1778385053),
('livewire-rate-limiter:a17961fa74e9275d529f489537f179c05d50c2f3:timer', 'i:1778385053;', 1778385053);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `image`, `name`, `slug`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'categories/01KMG3TVTV3E52XA9Y6AS52JW8.png', 'Hotel', 'hotel', NULL, '2026-01-04 21:07:30', '2026-03-24 07:26:30'),
(2, 'categories/01KMG3XBJJ387KM6JFKZWFBYMF.png', 'Villa', 'villa', NULL, '2026-01-04 21:07:47', '2026-03-24 07:27:52'),
(3, 'categories/01KMG3Z9GPCQVXAGQ2AQFWSME5.png', 'Apartemen', 'apartemen', NULL, '2026-01-04 21:08:04', '2026-03-24 07:28:55'),
(4, 'categories/01KMG40EQX7QQMF87HS01Q1HPB.png', 'Guest House', 'guest-house', NULL, '2026-01-04 21:08:20', '2026-03-24 07:29:33'),
(5, 'categories/01KMG41DMBXXZZARGGERK1617A.png', 'Kos', 'kos', NULL, '2026-01-04 21:08:39', '2026-03-24 07:30:05');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `image`, `name`, `slug`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'cities/01KMG42QRPZXCM6XEKR36MDKX8.jpg', 'Banda Aceh', 'banda-aceh', NULL, '2026-01-04 21:06:43', '2026-03-24 07:30:48'),
(2, 'cities/01KMG43T69J4Z0DWG6JG5CGNGN.jpg', 'Medan', 'medan', NULL, '2026-01-04 21:07:01', '2026-03-24 07:31:23'),
(3, 'cities/01KMG45NFVH0545DAJH0ZWEMBN.png', 'Padang', 'padang', NULL, '2026-01-04 21:07:15', '2026-03-24 07:32:24');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_01_04_033657_create_cities_table', 1),
(5, '2026_01_04_033738_create_categories_table', 1),
(6, '2026_01_04_033804_create_boarding_houses_table', 1),
(7, '2026_01_04_033829_create_rooms_table', 1),
(8, '2026_01_04_033845_create_room_images_table', 1),
(9, '2026_01_04_033901_create_bonuses_table', 1),
(10, '2026_01_04_033914_create_testimonials_table', 1),
(11, '2026_01_04_033935_create_transactions_table', 1),
(12, '2026_03_24_135016_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` bigint UNSIGNED NOT NULL,
  `boarding_house_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `room_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `square_feet` int NOT NULL,
  `capacity` int NOT NULL,
  `price_per_month` int NOT NULL,
  `is_available` tinyint(1) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `boarding_house_id`, `name`, `room_type`, `square_feet`, `capacity`, `price_per_month`, `is_available`, `deleted_at`, `created_at`, `updated_at`) VALUES
(2, 1, 'Basic Room', 'Standard', 6, 2, 350000, 1, NULL, '2026-03-24 07:40:29', '2026-03-24 07:40:29'),
(3, 2, 'Deluxe', 'Deluxe', 6, 2, 250000, 1, NULL, '2026-03-24 07:57:42', '2026-03-24 07:57:42'),
(4, 6, 'Standard Double', 'Standard', 12, 2, 550000, 1, NULL, '2026-05-09 03:15:36', '2026-05-09 03:15:36'),
(5, 6, 'Deluxe Twin', 'Deluxe', 20, 2, 600000, 1, NULL, '2026-05-09 03:15:36', '2026-05-09 03:15:36'),
(6, 7, 'Basic Room', 'Basic', 24, 2, 368000, 1, NULL, '2026-05-09 21:20:27', '2026-05-09 21:20:27'),
(7, 7, 'Superior Room', 'Superior', 24, 2, 460000, 1, NULL, '2026-05-09 21:20:27', '2026-05-09 21:20:27');

-- --------------------------------------------------------

--
-- Table structure for table `room_images`
--

CREATE TABLE `room_images` (
  `id` bigint UNSIGNED NOT NULL,
  `room_id` bigint UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `room_images`
--

INSERT INTO `room_images` (`id`, `room_id`, `image`, `deleted_at`, `created_at`, `updated_at`) VALUES
(2, 2, 'rooms/01KMG4MF6235S2RB870R9FXSH7.png', NULL, '2026-03-24 07:40:29', '2026-03-24 07:40:29'),
(3, 2, 'rooms/01KMG4MF677FXP5X78BYVYV8NE.png', NULL, '2026-03-24 07:40:29', '2026-03-24 07:40:29'),
(4, 3, 'rooms/01KMG5M05E8RXT46V1AJWD13TN.png', NULL, '2026-03-24 07:57:42', '2026-03-24 07:57:42'),
(5, 3, 'rooms/01KMG5M05KTM01195WY8XRA2A2.png', NULL, '2026-03-24 07:57:42', '2026-03-24 07:57:42'),
(6, 4, 'rooms/01KR63RH5T20ZXW8KE8KXPV932.webp', NULL, '2026-05-09 03:15:36', '2026-05-09 03:15:36'),
(7, 5, 'rooms/01KR63RH61WXE8GM58VXTBJR5C.jpg', NULL, '2026-05-09 03:15:36', '2026-05-09 03:15:36'),
(8, 6, 'rooms/01KR81TY6HKHF8KKACR7F9T1TJ.webp', NULL, '2026-05-09 21:20:27', '2026-05-09 21:20:27'),
(9, 7, 'rooms/01KR81TY6RP3K2GJ8AY9ZE7TYE.webp', NULL, '2026-05-09 21:20:27', '2026-05-09 21:20:27');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('eywhdRK5OGE8MEpyGhX2JaOtsqjG2v3RS3uvl0Gl', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.118.1 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT0xmM3hXbFQ1VjU5eERWTjdLSlZjN3lQQWRMcEtXSEdXWTdDNkltaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1778384840),
('uM6rLg3C6Mm9NM4xdZQHZt9oW7HeI7sChIdBPxK9', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiSkJESHNvRHQ4VGs1bkZHUUE2aE5ZSVVvUlNwSHVwejdmekplRENCdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9rb3MvbWV1bGlnb2UtaG90ZWwiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjM6InVybCI7YTowOnt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEyJHExQXZoOFp4eTVUWWcwbE5xNmx0bE9IVmdiV2plUFFORmZJMUtkUzdGQUZoTTVUN0Vub1ZLIjtzOjg6ImZpbGFtZW50IjthOjA6e319', 1778386907);

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint UNSIGNED NOT NULL,
  `boarding_house_id` bigint UNSIGNED NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` int NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `boarding_house_id`, `photo`, `name`, `content`, `rating`, `deleted_at`, `created_at`, `updated_at`) VALUES
(2, 6, 'testimonials/01KR80Y8R51D79M45HRM26VAZM.jpg', 'Hanis', 'Kebersihan kamar sangat bagus dan pelayanan beserta fasilitasnya juga mantap', 4, NULL, '2026-05-09 21:04:48', '2026-05-09 21:04:48'),
(3, 2, 'testimonials/01KR814216ZDPAFGAFSMBXGJ3H.jpg', 'Sural', 'Tempatnya kurang nyaman karena terlalu dekat dengan Jalan Raya. Kebersihan oke pelayanan juga oke. sayangnya sarapan kurang nikmat', 3, NULL, '2026-05-09 21:07:57', '2026-05-09 21:07:57'),
(4, 1, 'testimonials/01KR816QM8WYYT3K3FGZ84R0NA.png', 'Aditya', 'Hotelnya sangat mewah dan bersih, pelayanan juga ramah. Saranan juga lengkap', 5, NULL, '2026-05-09 21:09:25', '2026-05-09 21:09:25');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `boarding_house_id` bigint UNSIGNED NOT NULL,
  `room_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` enum('down_payment','full_payment') COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date NOT NULL,
  `duration` int NOT NULL,
  `total_amount` int DEFAULT NULL,
  `transaction_date` date DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `code`, `boarding_house_id`, `room_id`, `name`, `email`, `phone_number`, `payment_method`, `payment_status`, `start_date`, `duration`, `total_amount`, `transaction_date`, `deleted_at`, `created_at`, `updated_at`) VALUES
(15, 'TRX-636594', 1, 2, 'reva', 'reva@gmail.com', '08123242334', 'full_payment', 'pending', '2026-03-25', 1, 392000, '2026-03-23', '2026-05-08 23:25:21', '2026-03-23 09:56:11', '2026-05-08 23:25:21'),
(16, 'TRX-685115', 1, 2, 'asww', 'asw@gmail.com', '081234536776', 'full_payment', 'pending', '2026-03-26', 1, 392000, '2026-03-23', '2026-05-08 23:25:21', '2026-03-23 10:12:16', '2026-05-08 23:25:21'),
(17, 'TRX-942246', 1, 2, 'sur', 'sural@gmail.com', '0812344', 'full_payment', 'pending', '2026-03-26', 1, 392000, '2026-03-23', '2026-05-08 23:25:21', '2026-03-23 10:15:51', '2026-05-08 23:25:21'),
(18, 'TRX-157665', 1, 2, 'lek', 'lek@gmail.com', '081263132787', 'full_payment', 'pending', '2026-05-09', 1, 392000, '2026-05-09', '2026-05-08 23:25:21', '2026-05-08 22:31:18', '2026-05-08 23:25:21'),
(19, 'TRX-330792', 2, 3, 'dinda', 'dinda@gmail.com', '0812345433', 'full_payment', 'pending', '2026-05-10', 2, 560000, '2026-05-09', '2026-05-08 23:25:21', '2026-05-08 22:36:51', '2026-05-08 23:25:21'),
(20, 'TRX-626472', 2, 3, 'aswadi', 'aswadi@gmail.com', '0812123434', 'full_payment', 'pending', '2026-05-10', 3, 840000, '2026-05-09', '2026-05-08 23:25:21', '2026-05-08 23:04:41', '2026-05-08 23:25:21'),
(21, 'TRX-152693', 1, 2, 'lora', 'lora@gmail.com', '081234567654', 'full_payment', 'pending', '2026-05-11', 2, 784000, '2026-05-09', '2026-05-08 23:25:21', '2026-05-08 23:11:58', '2026-05-08 23:25:21'),
(22, 'TRX-896187', 2, 3, 'rekha agustina', 'rekah@gmail.com', '081342542314', 'full_payment', 'pending', '2026-05-12', 5, 1400000, '2026-05-09', '2026-05-08 23:25:21', '2026-05-08 23:24:02', '2026-05-08 23:25:21'),
(23, 'TRX-804162', 2, 3, 'intan', 'tatan@gmail.com', '0812323241516', 'full_payment', 'success', '2026-05-12', 9, 2520000, '2026-05-09', NULL, '2026-05-08 23:28:57', '2026-05-08 23:29:35'),
(24, 'TRX-728551', 2, 3, 'Anna', 'Anna@gmail.com', '08123467882', 'full_payment', 'success', '2026-05-10', 2, 560000, '2026-05-09', NULL, '2026-05-08 23:44:22', '2026-05-08 23:44:38'),
(25, 'TRX-437939', 2, 3, 'Hanis', 'hanis@gmail.com', '082211887734', 'full_payment', 'success', '2026-05-10', 1, 280000, '2026-05-09', NULL, '2026-05-09 00:38:19', '2026-05-09 00:40:20'),
(26, 'TRX-437761', 1, 2, 'liza', 'liza@pembeli.com', '0811677068', 'down_payment', 'success', '2026-05-12', 3, 352800, '2026-05-09', NULL, '2026-05-09 02:23:55', '2026-05-09 02:24:11'),
(27, 'TRX-509139', 1, 2, 'Afra Diana', 'afra@gmail.com', '081212343131', 'full_payment', 'success', '2026-05-10', 10, 3920000, '2026-05-09', NULL, '2026-05-09 02:46:12', '2026-05-09 02:48:08'),
(28, 'TRX-479258', 1, 2, 'weslin', 'weslin@gmail.com', '081256567898', 'full_payment', 'success', '2026-05-10', 5, 1960000, '2026-05-09', NULL, '2026-05-09 03:01:38', '2026-05-09 03:02:14'),
(29, 'TRX-545284', 1, 2, 'Amin', 'amin@gmail.com', '081234567890', 'full_payment', 'pending', '2026-05-10', 15, 5880000, '2026-05-09', NULL, '2026-05-09 03:04:45', '2026-05-09 03:04:45'),
(30, 'TRX-621737', 6, 5, 'asrita', 'asrita@gmail.com', '082345456565', 'full_payment', 'success', '2026-05-10', 2, 1344000, '2026-05-09', NULL, '2026-05-09 03:19:09', '2026-05-09 03:19:35');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Test User', 'test@example.com', '2026-03-24 07:11:03', '$2y$12$9.Ljnix8Scg1NgRzVDMyl./TYUXo4PmLWYYpawlGGHvVyw4YpSwgW', 'WPmUSPpVVB', '2026-03-24 07:11:04', '2026-03-24 07:11:04'),
(2, 'admin', 'admin@ngekos.com', '2026-03-24 07:11:05', '$2y$12$q1Avh8Zxy5TYg0lNq6ltlOHVgbWjePQNFfI1KdS7FAFhM5T7EnoVK', 'dY6bmsUGyk', '2026-03-24 07:11:05', '2026-03-24 07:11:05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `boarding_houses`
--
ALTER TABLE `boarding_houses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `boarding_houses_city_id_foreign` (`city_id`),
  ADD KEY `boarding_houses_category_id_foreign` (`category_id`);

--
-- Indexes for table `bonuses`
--
ALTER TABLE `bonuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bonuses_boarding_house_id_foreign` (`boarding_house_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rooms_boarding_house_id_foreign` (`boarding_house_id`);

--
-- Indexes for table `room_images`
--
ALTER TABLE `room_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_images_room_id_foreign` (`room_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `testimonials_boarding_house_id_foreign` (`boarding_house_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_boarding_house_id_foreign` (`boarding_house_id`),
  ADD KEY `transactions_room_id_foreign` (`room_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `boarding_houses`
--
ALTER TABLE `boarding_houses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `bonuses`
--
ALTER TABLE `bonuses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `room_images`
--
ALTER TABLE `room_images`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `boarding_houses`
--
ALTER TABLE `boarding_houses`
  ADD CONSTRAINT `boarding_houses_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `boarding_houses_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bonuses`
--
ALTER TABLE `bonuses`
  ADD CONSTRAINT `bonuses_boarding_house_id_foreign` FOREIGN KEY (`boarding_house_id`) REFERENCES `boarding_houses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_boarding_house_id_foreign` FOREIGN KEY (`boarding_house_id`) REFERENCES `boarding_houses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `room_images`
--
ALTER TABLE `room_images`
  ADD CONSTRAINT `room_images_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD CONSTRAINT `testimonials_boarding_house_id_foreign` FOREIGN KEY (`boarding_house_id`) REFERENCES `boarding_houses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_boarding_house_id_foreign` FOREIGN KEY (`boarding_house_id`) REFERENCES `boarding_houses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
