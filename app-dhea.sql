-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 04, 2022 at 03:33 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `app-dhea`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang_keluar`
--

CREATE TABLE `barang_keluar` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SKU` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` int(11) NOT NULL,
  `harga_satuan` decimal(13,2) DEFAULT NULL,
  `jumlah` decimal(13,2) DEFAULT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `jumlah_jual` int(11) DEFAULT NULL,
  `safety_stock` int(11) DEFAULT NULL,
  `lead_time` int(11) DEFAULT NULL,
  `id_month` tinyint(2) DEFAULT NULL,
  `nama_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `barang_keluar`
--

INSERT INTO `barang_keluar` (`id`, `nama_barang`, `SKU`, `keterangan`, `qty`, `harga_satuan`, `jumlah`, `tanggal`, `jumlah_jual`, `safety_stock`, `lead_time`, `id_month`, `nama_by`) VALUES
(53, 'Static Bolt 3,5cm', '202207060036', 'PT. Thomas Brother Indonesia', 100, '1500000.00', '150000000.00', '2022-07-11 13:12:33', NULL, NULL, NULL, NULL, NULL),
(54, 'Static Bolt 3,5cm', '202207060036', 'PT. Thomas Brother Indonesia', 1000, '1500000.00', '1500000000.00', '2022-07-14 06:48:16', NULL, NULL, NULL, NULL, NULL),
(55, 'contoh_1', '22/01', '111', 1000, '0.00', '0.00', '2022-07-14 06:51:28', NULL, NULL, NULL, NULL, NULL),
(56, 'contoh_1', '22/01', '111', 200, '0.00', '0.00', '2022-07-14 07:14:26', NULL, NULL, NULL, NULL, NULL),
(57, 'Pink Blouse', 'CTH-1', 'Pink Martini', 1, '0.00', '0.00', '2022-07-14 07:15:04', NULL, NULL, NULL, NULL, NULL),
(58, 'Pink Blouse', 'CTH-1', 'Pink Martini', 1, '0.00', '0.00', '2022-07-14 07:16:17', NULL, NULL, NULL, NULL, NULL),
(59, 'Static Bolt 3,5cm', '202207060036', 'PT. Thomas Brother Indonesia', 1000, '0.00', '0.00', '2022-07-14 11:02:31', NULL, NULL, NULL, NULL, NULL),
(60, 'Static Bolt 3,5cm', '202207060036', 'PT. Thomas Brother Indonesia', 50, '0.00', '0.00', '2022-08-04 08:37:07', NULL, NULL, NULL, NULL, 'Admin Warehouse');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` int(11) NOT NULL,
  `harga_satuan` decimal(13,2) NOT NULL,
  `jumlah` decimal(13,2) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`id`, `nama_barang`, `keterangan`, `qty`, `harga_satuan`, `jumlah`, `tanggal`) VALUES
(12, 'test3', 'teyetwfdwf', 500, '100000.00', '50000000.00', '2022-07-07 11:35:04'),
(13, 'test3', 'teyetwfdwf', 250, '100000.00', '25000000.00', '2022-07-07 15:04:04'),
(14, 'test3', 'teyetwfdwf', 250, '100000.00', '25000000.00', '2022-07-07 15:06:17'),
(15, 'contoh_1', 'supplier contoh1', 5000, '5000.00', '25000000.00', '2022-07-08 11:03:49'),
(16, 'contoh_1', 'supplier contoh1', 11, '5000.00', '55000.00', '2022-07-08 11:06:24'),
(17, 'contoh_1', 'qq', 11, '50000.00', '550000.00', '2022-07-08 11:26:33'),
(18, 'contoh_1', 'qq', 50, '50000.00', '2500000.00', '2022-07-08 11:26:52'),
(19, 'contoh_1', 'qq', 50, '50000.00', '2500000.00', '2022-07-08 11:27:08'),
(20, 'contoh_1', 'qq', 89, '50000.00', '-4350000.00', '2022-07-08 13:22:05'),
(21, 'Kartu Perdana', 'PT. Telkom Indonesia', 100, '5000.00', '500000.00', '2022-07-09 02:51:57'),
(22, 'Smart TV', 'PT.LG Indonesia', 200, '10000000.00', '2000000000.00', '2022-07-09 02:54:19'),
(23, 'Pink Blouse', 'Lara Fashion', 250, '40000.00', '10000000.00', '2022-07-09 05:12:56'),
(24, 'Pink Blouse', 'Lara Fashion', 500, '500.00', '250000.00', '2022-07-09 11:07:06'),
(25, 'Pink Blouse', 'Lara Fashion', 500, '500.00', '250000.00', '2022-07-09 11:08:41'),
(26, 'Pink Blouse', 'Lara Fashion', 500, '500.00', '250000.00', '2022-07-09 11:20:07'),
(27, 'Pink Blouse', 'Lara Fashion', 1000, '500.00', '500000.00', '2022-07-09 11:58:56'),
(28, 'contoh_2', 'qq', 11, '11.00', '121.00', '2022-07-10 04:26:31'),
(29, 'Pink Blouse', 'Pink Martini', 10, '20.00', '200.00', '2022-07-11 12:07:41'),
(30, 'Pink Blouse', 'Pink Martini', 1, '150000.00', '150000.00', '2022-07-14 07:00:27'),
(31, 'Pink Blouse', 'Pink Martini', 1, '150000.00', '150000.00', '2022-08-04 08:40:23');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_06_30_101528_barang', 1),
(6, '2022_06_30_120737_create__surat_p_o', 1),
(7, '2022_07_01_003851_create_permission_tables', 1),
(8, '2022_07_01_084442_create_spb', 2),
(9, '2022_07_02_041020_create_validasi_spb', 3),
(10, '2022_07_02_053800_create_valid_spb', 4),
(11, '2022_07_02_160600_create_no_valid_spb', 5),
(12, '2022_07_02_171204_create_valid_po', 6),
(13, '2022_07_02_171249_create_no_valid_po', 6),
(14, '2022_07_02_174006_create_history', 7),
(15, '2022_07_02_175108_create_table_barang', 7),
(16, '2022_07_04_131824_create_barang_keluar', 8);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2),
(3, 'App\\Models\\User', 3),
(4, 'App\\Models\\User', 4),
(5, 'App\\Models\\User', 5);

-- --------------------------------------------------------

--
-- Table structure for table `month`
--

CREATE TABLE `month` (
  `id_month` tinyint(2) NOT NULL,
  `dt` date DEFAULT NULL,
  `name_month` varchar(30) NOT NULL,
  `qty` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `month`
--

INSERT INTO `month` (`id_month`, `dt`, `name_month`, `qty`) VALUES
(1, '2022-01-11', 'Januari', 245),
(2, '2022-02-11', 'Februari', 278),
(3, '2022-03-11', 'Maret', 234),
(4, '2022-04-11', 'April', 278),
(5, '2022-05-11', 'Mei', 265),
(6, '2022-06-11', 'Juni', 287),
(7, '2022-07-11', 'Juli', 246),
(8, '2022-08-11', 'Agustus', 245),
(9, '2022-09-11', 'September', 222),
(10, '2022-10-11', 'Oktober', NULL),
(11, '2022-11-11', 'November', NULL),
(12, '2022-12-11', 'Desember', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `no_valid_po`
--

CREATE TABLE `no_valid_po` (
  `id_PO` int(10) UNSIGNED NOT NULL,
  `kode_PO` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` int(11) NOT NULL,
  `harga_satuan` decimal(13,2) DEFAULT NULL,
  `jumlah` decimal(13,2) NOT NULL,
  `tanggal_PO` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `no_valid_po`
--

INSERT INTO `no_valid_po` (`id_PO`, `kode_PO`, `nama_barang`, `keterangan`, `qty`, `harga_satuan`, `jumlah`, `tanggal_PO`) VALUES
(5, 'PO/2022/005', 'Mata bor uk. diameter 20cm', 'PT. Suprinjo Tegal Indonesia', 500, NULL, '0.00', '2022-07-11 15:09:31'),
(6, 'PO/2022/005', 'Mata bor uk. diameter 20cm', 'PT. Suprinjo Tegal Indonesia', 500, NULL, '10000.00', '2022-07-11 15:09:48');

-- --------------------------------------------------------

--
-- Table structure for table `no_valid_spb`
--

CREATE TABLE `no_valid_spb` (
  `id_SPB` int(10) UNSIGNED NOT NULL,
  `kode_spb` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` int(11) NOT NULL,
  `tanggal_SPB` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `no_valid_spb`
--

INSERT INTO `no_valid_spb` (`id_SPB`, `kode_spb`, `nama_barang`, `keterangan`, `qty`, `tanggal_SPB`) VALUES
(7, 'PR/2022/008', 'Plastik Sampah uk.90CM', 'Toko Plastik Karina', 20, '2022-07-11 15:07:58'),
(8, 'PR/2022/001', 'Pink Blouse', 'Pink Martini', 10, '2022-07-13 15:50:00');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'edit', 'web', '2022-06-30 19:33:22', '2022-06-30 19:33:22'),
(2, 'delete', 'web', '2022-06-30 19:33:22', '2022-06-30 19:33:22'),
(3, 'validate', 'web', '2022-06-30 19:33:22', '2022-06-30 19:33:22'),
(4, 'unvalidate', 'web', '2022-06-30 19:33:22', '2022-06-30 19:33:22');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin-Purchasing', 'web', '2022-06-30 19:33:22', '2022-06-30 19:33:22'),
(2, 'Manager-Purchasing', 'web', '2022-06-30 19:33:22', '2022-06-30 19:33:22'),
(3, 'Admin-Warehouse', 'web', '2022-06-30 19:33:22', '2022-06-30 19:33:22'),
(4, 'Manager', 'web', '2022-06-30 19:33:22', '2022-06-30 19:33:22'),
(5, 'Super-Admin', 'web', '2022-06-30 19:33:22', '2022-06-30 19:33:22');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `spb`
--

CREATE TABLE `spb` (
  `id_SPB` int(10) UNSIGNED NOT NULL,
  `kode_spb` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` int(11) NOT NULL,
  `tanggal_SPB` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `table_barang`
--

CREATE TABLE `table_barang` (
  `id` int(10) UNSIGNED NOT NULL,
  `SKU` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` int(11) NOT NULL,
  `harga_satuan` decimal(13,2) DEFAULT NULL,
  `jumlah` decimal(13,2) DEFAULT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ramalan` int(11) DEFAULT NULL,
  `jumlah_jual` int(11) DEFAULT NULL,
  `id_month` tinyint(2) DEFAULT NULL,
  `nama_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `table_barang`
--

INSERT INTO `table_barang` (`id`, `SKU`, `nama_barang`, `keterangan`, `qty`, `harga_satuan`, `jumlah`, `tanggal`, `ramalan`, `jumlah_jual`, `id_month`, `nama_by`) VALUES
(37, '202207060036', 'Static Bolt 3,5cm', 'PT. Thomas Brother Indonesia', 950, '0.00', NULL, '2022-08-04 08:37:07', 47, 50, 1, NULL),
(38, '202201020056', 'Head Off Action Hammer', 'PT. Kawan Lama Indonesia', 1000, NULL, NULL, '2022-07-11 13:03:14', 81, 244, 1, NULL),
(39, '202207060034', 'Juxtapose Tape', 'SiliconeTape', 2000, NULL, NULL, '2022-07-11 13:03:14', 85, 254, 3, NULL),
(40, '202207060067', 'Fan Belt 5cm/1M', 'PT. Rubber Top Cisaruak', 1000, NULL, NULL, '2022-07-11 13:03:14', 84, 253, 4, NULL),
(41, '22/01', 'contoh_1', '111', 11111, '0.00', NULL, '2022-07-14 07:14:26', 197, 200, NULL, NULL),
(43, 'CTH-1', 'Pink Blouse', 'Pink Martini', 1, '150000.00', '150000.00', '2022-08-04 08:40:23', NULL, NULL, NULL, 'Admin Warehouse');

-- --------------------------------------------------------

--
-- Table structure for table `tb_movingaverage`
--

CREATE TABLE `tb_movingaverage` (
  `id` int(11) NOT NULL,
  `dt` date NOT NULL,
  `bulan` varchar(100) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_movingaverage`
--

INSERT INTO `tb_movingaverage` (`id`, `dt`, `bulan`, `qty`) VALUES
(1, '2020-11-01', 'Januari', 245),
(2, '2020-11-02', 'Februari', 278),
(3, '2020-11-03', 'Maret', 234),
(4, '2020-11-04', 'April', 278),
(5, '2020-11-05', 'Mei', 265),
(6, '2020-11-06', 'Juni', 287),
(7, '2020-11-07', 'Juli', 246),
(8, '2020-11-08', 'Agustus', 245),
(9, '2020-11-09', 'September', 222);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
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
(1, 'Admin Purchasing', 'AP@gmail.com', '2022-06-30 19:33:23', '$2y$10$bEXoon0V5zSnLkclJW5zJu7wwegvB/fXQIP.UpYOmHOK0kwolL88y', 'Ue7rmnTk3I4zaBnvJSPgdz8q96VswEgT4Y2o8DCBBkPLg4BIM0HsPiYPRNWK', '2022-06-30 19:33:23', '2022-06-30 19:33:23'),
(2, 'Manager Purchasing', 'MP@gmail.com', '2022-06-30 19:33:23', '$2y$10$qRPy/hK70LFvUIL5BjhOGeKS/HXzn9EA8OmyQ3q1S3Tr9mjYpTfbS', 'IKTzgmxNk4CZUvxisSzvM4qItBncZFwIMnku26p48v1HclC8sAPZjgNWOeeG', '2022-06-30 19:33:23', '2022-06-30 19:33:23'),
(3, 'Admin Warehouse', 'AW@gmail.com', '2022-06-30 19:33:23', '$2y$10$SSmg7DEia8Uy6TplbcCoxOBzMJ2Ln9mDmRjIZnZdiFf400z03zyh6', 'A0w2Tene57REyHLKsBMhaWnqJrIsO1PUTWrP5K2D05RIYeFtIsn7jonxwC9L', '2022-06-30 19:33:23', '2022-06-30 19:33:23'),
(4, 'Manager', 'manager@gmail.com', '2022-06-30 19:33:23', '$2y$10$8t8mMM.P4deLIZsSQ0udE.te.1u6wPorvCBE.C88.R091wgSa2C7K', 'vNhhrRIBFG93NPUGp1oFnapMzp7b4G8OjluS1A8MrukNxg2I7amxUgXN1zj2', '2022-06-30 19:33:23', '2022-06-30 19:33:23'),
(5, 'Example Super-Admin User', 'superadmin@example.com', '2022-06-30 19:33:23', '$2y$10$ZVR8bxW93d9/rd8BtuiX2eRFyek9lOT4p.vdcuHwtl1ZZCwdxHEl2', 'XrqwPwRwf4', '2022-06-30 19:33:23', '2022-06-30 19:33:23');

-- --------------------------------------------------------

--
-- Table structure for table `validasi_spb`
--

CREATE TABLE `validasi_spb` (
  `id_SPB` int(10) UNSIGNED NOT NULL,
  `nama_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` int(11) NOT NULL,
  `harga_satuan` decimal(13,2) DEFAULT NULL,
  `jumlah` decimal(13,2) DEFAULT NULL,
  `tanggal_SPB` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `valid_po`
--

CREATE TABLE `valid_po` (
  `id_PO` int(10) UNSIGNED NOT NULL,
  `kode_PO` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` int(11) NOT NULL,
  `harga_satuan` decimal(13,2) DEFAULT NULL,
  `jumlah` decimal(13,2) DEFAULT NULL,
  `tanggal_PO` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `valid_po`
--

INSERT INTO `valid_po` (`id_PO`, `kode_PO`, `nama_barang`, `keterangan`, `qty`, `harga_satuan`, `jumlah`, `tanggal_PO`) VALUES
(30, '11222333', 'Pink Blouse', 'Pink Martini', 8, '150000.00', '1200000.00', '2022-07-14 07:00:06');

-- --------------------------------------------------------

--
-- Table structure for table `valid_spb`
--

CREATE TABLE `valid_spb` (
  `id_SPB` int(10) UNSIGNED NOT NULL,
  `kode_spb` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` int(11) NOT NULL,
  `tanggal_SPB` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `valid_spb`
--

INSERT INTO `valid_spb` (`id_SPB`, `kode_spb`, `nama_barang`, `keterangan`, `qty`, `tanggal_SPB`) VALUES
(60, 'PR/2022/010', 'Hammer Action Keybed X32', 'PT. Bringer Indonesia', 50, '2022-07-11 15:07:21'),
(65, '122333', 'Static Bolt 3,5cm', 'PT. Thomas Brother Indonesia', 2000, '2022-07-13 15:53:32');

-- --------------------------------------------------------

--
-- Table structure for table `_surat_p_o`
--

CREATE TABLE `_surat_p_o` (
  `id_PO` bigint(20) UNSIGNED NOT NULL,
  `kode_PO` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` int(11) NOT NULL,
  `harga_satuan` decimal(13,2) DEFAULT NULL,
  `jumlah` decimal(13,2) NOT NULL,
  `tanggal_PO` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang_keluar`
--
ALTER TABLE `barang_keluar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_month` (`id_month`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `month`
--
ALTER TABLE `month`
  ADD PRIMARY KEY (`id_month`);

--
-- Indexes for table `no_valid_po`
--
ALTER TABLE `no_valid_po`
  ADD PRIMARY KEY (`id_PO`);

--
-- Indexes for table `no_valid_spb`
--
ALTER TABLE `no_valid_spb`
  ADD PRIMARY KEY (`id_SPB`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `spb`
--
ALTER TABLE `spb`
  ADD PRIMARY KEY (`id_SPB`);

--
-- Indexes for table `table_barang`
--
ALTER TABLE `table_barang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_month` (`id_month`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `validasi_spb`
--
ALTER TABLE `validasi_spb`
  ADD PRIMARY KEY (`id_SPB`);

--
-- Indexes for table `valid_po`
--
ALTER TABLE `valid_po`
  ADD PRIMARY KEY (`id_PO`);

--
-- Indexes for table `valid_spb`
--
ALTER TABLE `valid_spb`
  ADD PRIMARY KEY (`id_SPB`);

--
-- Indexes for table `_surat_p_o`
--
ALTER TABLE `_surat_p_o`
  ADD PRIMARY KEY (`id_PO`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang_keluar`
--
ALTER TABLE `barang_keluar`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `month`
--
ALTER TABLE `month`
  MODIFY `id_month` tinyint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `no_valid_po`
--
ALTER TABLE `no_valid_po`
  MODIFY `id_PO` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `no_valid_spb`
--
ALTER TABLE `no_valid_spb`
  MODIFY `id_SPB` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `spb`
--
ALTER TABLE `spb`
  MODIFY `id_SPB` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `table_barang`
--
ALTER TABLE `table_barang`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `validasi_spb`
--
ALTER TABLE `validasi_spb`
  MODIFY `id_SPB` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `valid_po`
--
ALTER TABLE `valid_po`
  MODIFY `id_PO` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `valid_spb`
--
ALTER TABLE `valid_spb`
  MODIFY `id_SPB` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `_surat_p_o`
--
ALTER TABLE `_surat_p_o`
  MODIFY `id_PO` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang_keluar`
--
ALTER TABLE `barang_keluar`
  ADD CONSTRAINT `barang_keluar_ibfk_1` FOREIGN KEY (`id_month`) REFERENCES `month` (`id_month`);

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `table_barang`
--
ALTER TABLE `table_barang`
  ADD CONSTRAINT `table_barang_ibfk_1` FOREIGN KEY (`id_month`) REFERENCES `month` (`id_month`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
