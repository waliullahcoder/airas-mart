-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.4.3 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for airas_mart
DROP DATABASE IF EXISTS `airas_mart`;
CREATE DATABASE IF NOT EXISTS `airas_mart` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `airas_mart`;

-- Dumping structure for table airas_mart.account_transactions
DROP TABLE IF EXISTS `account_transactions`;
CREATE TABLE IF NOT EXISTS `account_transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `account_transaction_auto_id` bigint unsigned NOT NULL,
  `voucher_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `voucher_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `coa_id` bigint unsigned NOT NULL,
  `coa_head_code` bigint NOT NULL,
  `narration` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `debit_amount` decimal(16,2) NOT NULL DEFAULT '0.00',
  `credit_amount` decimal(16,2) NOT NULL DEFAULT '0.00',
  `document` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `posted` tinyint(1) NOT NULL DEFAULT '0',
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  `approved_by` bigint unsigned DEFAULT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account_transactions_account_transaction_auto_id_foreign` (`account_transaction_auto_id`),
  KEY `account_transactions_coa_id_foreign` (`coa_id`),
  KEY `account_transactions_approved_by_foreign` (`approved_by`),
  KEY `account_transactions_created_by_foreign` (`created_by`),
  KEY `account_transactions_updated_by_foreign` (`updated_by`),
  KEY `account_transactions_deleted_by_foreign` (`deleted_by`),
  CONSTRAINT `account_transactions_account_transaction_auto_id_foreign` FOREIGN KEY (`account_transaction_auto_id`) REFERENCES `account_transaction_autos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `account_transactions_approved_by_foreign` FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `account_transactions_coa_id_foreign` FOREIGN KEY (`coa_id`) REFERENCES `coas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `account_transactions_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `account_transactions_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `account_transactions_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.account_transactions: ~0 rows (approximately)
DELETE FROM `account_transactions`;

-- Dumping structure for table airas_mart.account_transaction_autos
DROP TABLE IF EXISTS `account_transaction_autos`;
CREATE TABLE IF NOT EXISTS `account_transaction_autos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `voucher_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `voucher_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `coa_id` bigint unsigned NOT NULL,
  `coa_head_code` bigint NOT NULL,
  `narration` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `debit_amount` decimal(16,2) NOT NULL DEFAULT '0.00',
  `credit_amount` decimal(16,2) NOT NULL DEFAULT '0.00',
  `document` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `posted` tinyint(1) NOT NULL DEFAULT '0',
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  `approved_by` bigint unsigned DEFAULT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account_transaction_autos_coa_id_foreign` (`coa_id`),
  KEY `account_transaction_autos_approved_by_foreign` (`approved_by`),
  KEY `account_transaction_autos_created_by_foreign` (`created_by`),
  KEY `account_transaction_autos_updated_by_foreign` (`updated_by`),
  KEY `account_transaction_autos_deleted_by_foreign` (`deleted_by`),
  CONSTRAINT `account_transaction_autos_approved_by_foreign` FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `account_transaction_autos_coa_id_foreign` FOREIGN KEY (`coa_id`) REFERENCES `coas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `account_transaction_autos_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `account_transaction_autos_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `account_transaction_autos_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.account_transaction_autos: ~0 rows (approximately)
DELETE FROM `account_transaction_autos`;
INSERT INTO `account_transaction_autos` (`id`, `voucher_no`, `voucher_type`, `date`, `coa_id`, `coa_head_code`, `narration`, `debit_amount`, `credit_amount`, `document`, `posted`, `approved`, `approved_by`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 'CS2603001', 'Client Sales', '1970-01-01', 281, 1010172, 'Client Sales Against Invoice No - CS2603001', 0.00, 0.00, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '2026-03-13 21:56:06', '2026-03-13 21:56:06'),
	(2, 'CS2603001', 'Client Sales', '1970-01-01', 63, 30201, 'Client Sales Against Invoice No - CS2603001', 0.00, 0.00, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '2026-03-13 21:56:06', '2026-03-13 21:56:06');

-- Dumping structure for table airas_mart.admin_menus
DROP TABLE IF EXISTS `admin_menus`;
CREATE TABLE IF NOT EXISTS `admin_menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` bigint unsigned NOT NULL,
  `parent_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `route` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `is_deletable` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_menus_permission_id_foreign` (`permission_id`),
  KEY `admin_menus_parent_id_foreign` (`parent_id`),
  CONSTRAINT `admin_menus_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `admin_menus` (`id`) ON DELETE CASCADE,
  CONSTRAINT `admin_menus_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.admin_menus: ~47 rows (approximately)
DELETE FROM `admin_menus`;
INSERT INTO `admin_menus` (`id`, `permission_id`, `parent_id`, `name`, `route`, `icon`, `order`, `status`, `is_deletable`, `created_at`, `updated_at`) VALUES
	(1, 1, NULL, 'Dashboard', 'admin.dashboard', '<span class="material-symbols-outlined fs-22"> home_app_logo </span>', 1, 1, 1, '2026-01-19 05:33:09', '2026-01-19 05:33:09'),
	(2, 2, NULL, 'User & Role Manage', NULL, '<span class="material-symbols-outlined fs-22"> settings_cinematic_blur </span>', 2, 1, 1, '2026-01-19 05:34:47', '2026-02-25 23:25:47'),
	(3, 3, 2, 'Roles', 'admin.role.index', NULL, 1, 1, 1, '2026-01-19 05:35:46', '2026-01-19 05:35:46'),
	(4, 4, 2, 'Users', 'admin.user.index', NULL, 2, 1, 1, '2026-01-19 05:36:43', '2026-01-19 05:36:43'),
	(6, 6, 26, 'Admin Settings', 'admin.admin-settings.index', NULL, 4, 1, 1, '2026-01-19 05:37:50', '2026-02-25 23:45:51'),
	(9, 21, NULL, 'Product Management', NULL, '<span class="material-symbols-outlined fs-22"> menu_book </span>', 4, 1, 1, '2026-01-20 03:47:59', '2026-03-05 20:11:29'),
	(10, 22, 9, 'Category', 'admin.category.index', NULL, 4, 1, 1, '2026-01-20 03:49:56', '2026-01-20 03:49:56'),
	(11, 26, 9, 'Manage Product', 'admin.product.index', NULL, 4, 1, 1, '2026-01-20 03:56:07', '2026-03-05 20:44:33'),
	(12, 27, 9, 'UOM', 'admin.uom.index', NULL, 4, 1, 1, '2026-01-20 04:04:00', '2026-01-20 04:04:00'),
	(13, 28, 9, 'Brand', 'admin.brand.index', NULL, 4, 1, 1, '2026-01-20 04:04:36', '2026-01-20 04:04:36'),
	(15, 32, 9, 'Vendor', 'admin.vendor.index', NULL, 4, 1, 1, '2026-01-20 04:12:04', '2026-01-20 04:12:04'),
	(16, 34, 9, 'Attribute', 'admin.attribute.index', NULL, 4, 1, 1, '2026-01-20 04:19:04', '2026-01-20 04:19:04'),
	(17, 36, 9, 'publication', 'admin.publication.index', NULL, 4, 1, 1, '2026-01-20 04:22:54', '2026-01-20 04:22:54'),
	(18, 39, NULL, 'User Menu', NULL, NULL, 5, 0, 1, '2026-01-20 05:21:16', '2026-01-28 23:16:55'),
	(19, 40, 18, 'Main Menu', 'admin.menu.index', NULL, 5, 1, 1, '2026-01-20 05:22:04', '2026-01-20 05:22:04'),
	(21, 45, 27, 'UI Settings', 'admin.settings.index', NULL, 2, 1, 1, '2026-01-20 06:07:06', '2026-02-25 23:24:47'),
	(22, 47, 9, 'Author', 'admin.author.index', NULL, 5, 1, 1, '2026-01-22 04:29:15', '2026-01-22 04:29:15'),
	(23, 55, NULL, 'Orders Management', NULL, '<span class="material-symbols-outlined fs-22"> receipt_long </span>', 6, 1, 1, '2026-01-31 22:22:32', '2026-02-25 23:43:01'),
	(24, 56, 23, 'Order List', 'admin.orders.index', NULL, 6, 1, 1, '2026-01-31 22:25:06', '2026-01-31 22:28:50'),
	(25, 57, 27, 'Slider', 'admin.slider.index', '#', 2, 1, 1, '2026-02-02 04:09:16', '2026-02-25 23:45:04'),
	(26, 59, NULL, 'Business Setup', NULL, '<span class="material-symbols-outlined fs-24"> api </span>', 2, 1, 1, '2026-02-25 23:12:24', '2026-02-25 23:12:24'),
	(27, 60, NULL, 'Website Setup', NULL, '<span class="material-symbols-outlined fs-22"> build </span>', 11, 1, 1, '2026-02-25 23:23:51', '2026-03-02 01:02:23'),
	(28, 61, NULL, 'Inventory', NULL, '<span class="material-symbols-outlined fs-24"> inventory </span>', 8, 1, 1, '2026-02-26 01:33:52', '2026-02-26 01:33:52'),
	(29, 62, 28, 'Production', 'admin.production.index', NULL, 1, 1, 1, '2026-02-26 01:35:08', '2026-02-26 01:35:08'),
	(30, 65, 26, 'Stores', 'admin.store.index', NULL, 5, 1, 1, '2026-02-26 01:49:40', '2026-02-26 01:49:40'),
	(31, 68, 28, 'Stock', 'admin.stock-status.index', NULL, 2, 1, 1, '2026-02-26 02:01:06', '2026-02-26 02:01:06'),
	(32, 69, NULL, 'Investor Panel', NULL, '<span class="material-symbols-outlined fs-22"> account_balance </span>', 9, 1, 1, '2026-03-01 21:58:22', '2026-03-01 21:59:14'),
	(33, 70, 32, 'Investor', 'admin.investor.index', NULL, 1, 1, 1, '2026-03-01 22:00:26', '2026-03-01 22:02:17'),
	(34, 71, 32, 'Invest Process', 'admin.invest.index', NULL, 2, 1, 1, '2026-03-01 22:04:26', '2026-03-01 22:04:26'),
	(35, 72, 32, 'Profit Distribution', 'admin.profit-distribution.index', NULL, 3, 1, 1, '2026-03-01 22:06:32', '2026-03-01 22:06:32'),
	(36, 73, 32, 'Investor Payment', 'admin.investor-payment.index', NULL, 4, 1, 1, '2026-03-01 22:08:13', '2026-03-01 22:08:13'),
	(37, 74, 32, 'Invest Settlements', 'admin.invest-sattlement.index', NULL, 5, 1, 1, '2026-03-01 22:10:04', '2026-03-01 22:10:04'),
	(38, 75, 32, 'Investor Statement', 'admin.investor-statement.index', NULL, 6, 1, 1, '2026-03-01 22:15:11', '2026-03-01 22:15:11'),
	(39, 86, NULL, 'Sales Management', NULL, '<span class="material-symbols-outlined fs-24"> bar_chart_4_bars </span>', 5, 1, 1, '2026-03-01 22:34:26', '2026-03-02 02:35:58'),
	(40, 87, 39, 'Clients', 'admin.client.index', NULL, 1, 1, 1, '2026-03-01 22:42:47', '2026-03-01 22:42:47'),
	(41, 90, 39, 'Sales', 'admin.sales.index', NULL, 2, 1, 1, '2026-03-01 22:45:09', '2026-03-01 22:45:09'),
	(42, 93, 39, 'Collections', 'admin.collection.index', NULL, 3, 1, 1, '2026-03-01 22:50:23', '2026-03-01 22:50:23'),
	(43, 96, NULL, 'Reports', NULL, '<span class="material-symbols-outlined fs-22"> article </span>', 10, 1, 1, '2026-03-01 22:57:48', '2026-03-01 22:57:48'),
	(44, 97, 43, 'Sales Report', 'admin.sales-report.index', NULL, 1, 1, 1, '2026-03-01 23:55:22', '2026-03-01 23:55:22'),
	(45, 98, 43, 'Collection Report', 'admin.collection-report.index', NULL, 2, 1, 1, '2026-03-01 23:57:00', '2026-03-01 23:57:00'),
	(46, 99, 43, 'Sales Return Report', 'admin.sales-return-report.index', NULL, 3, 1, 1, '2026-03-02 00:03:47', '2026-03-02 00:03:47'),
	(47, 100, NULL, 'Expenses', 'admin.expense.index', '<span class="material-symbols-outlined fs-22"> payment </span>', 5, 1, 1, '2026-03-02 00:16:46', '2026-03-02 00:19:38'),
	(48, 104, 43, 'Income Statement', 'admin.income-statement.index', NULL, 4, 1, 1, '2026-03-02 00:29:11', '2026-03-02 00:29:11'),
	(49, 105, 26, 'Admin Menu', 'admin.admin-menu.index', NULL, 6, 1, 1, '2026-03-02 00:35:14', '2026-03-02 00:35:14'),
	(50, 113, NULL, 'Purchase Manage', NULL, '<span class="material-symbols-outlined fs-22"> receipt_long </span>', 4, 1, 1, '2026-03-02 02:34:09', '2026-03-02 02:39:06'),
	(51, 114, 50, 'Purchase Order', 'admin.purchase-order.index', NULL, 1, 1, 1, '2026-03-02 02:38:30', '2026-03-02 02:38:30'),
	(52, 117, 50, 'Purchase Create', 'admin.purchase-order.create', NULL, 2, 1, 1, '2026-03-02 23:47:17', '2026-03-02 23:47:17');

-- Dumping structure for table airas_mart.admin_menu_actions
DROP TABLE IF EXISTS `admin_menu_actions`;
CREATE TABLE IF NOT EXISTS `admin_menu_actions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` bigint unsigned NOT NULL,
  `admin_menu_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `route` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_menu_actions_permission_id_foreign` (`permission_id`),
  KEY `admin_menu_actions_admin_menu_id_foreign` (`admin_menu_id`),
  CONSTRAINT `admin_menu_actions_admin_menu_id_foreign` FOREIGN KEY (`admin_menu_id`) REFERENCES `admin_menus` (`id`) ON DELETE CASCADE,
  CONSTRAINT `admin_menu_actions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.admin_menu_actions: ~54 rows (approximately)
DELETE FROM `admin_menu_actions`;
INSERT INTO `admin_menu_actions` (`id`, `permission_id`, `admin_menu_id`, `name`, `route`, `status`, `created_at`, `updated_at`) VALUES
	(8, 14, 3, 'create', 'admin.role.create', 1, '2026-01-19 23:59:12', '2026-01-19 23:59:12'),
	(10, 18, 3, 'edit', 'admin.role.edit', 1, '2026-01-20 03:24:24', '2026-01-20 03:24:24'),
	(11, 19, 3, 'delete', 'admin.role.destroy', 1, '2026-01-20 03:25:16', '2026-01-20 03:29:11'),
	(12, 20, 3, 'Edit Permission', 'admin.role-permission.edit', 1, '2026-01-20 03:31:59', '2026-01-20 03:31:59'),
	(13, 23, 11, 'create', 'admin.product.create', 1, '2026-01-20 03:51:53', '2026-01-20 03:51:53'),
	(14, 24, 11, 'edit', 'admin.product.edit', 1, '2026-01-20 03:52:09', '2026-01-20 03:52:09'),
	(15, 25, 9, 'delete', 'admin.product.destroy', 1, '2026-01-20 03:52:34', '2026-01-20 03:52:34'),
	(16, 29, 12, 'create', 'admin.uom.create', 1, '2026-01-20 04:06:48', '2026-01-20 04:06:48'),
	(17, 31, 13, 'create', 'admin.brand.create', 1, '2026-01-20 04:09:27', '2026-01-20 04:09:27'),
	(18, 33, 15, 'create', 'admin.vendor.create', 1, '2026-01-20 04:12:41', '2026-01-20 04:12:41'),
	(19, 35, 16, 'create', 'admin.attribute.create', 1, '2026-01-20 04:21:01', '2026-01-20 04:21:01'),
	(20, 37, 17, 'create', 'admin.publication.create', 1, '2026-01-20 04:23:43', '2026-01-20 04:23:43'),
	(21, 38, 11, 'show', 'admin.product.show', 1, '2026-01-20 04:59:33', '2026-01-20 04:59:33'),
	(22, 41, 19, 'create', 'admin.menu.create', 1, '2026-01-20 05:23:01', '2026-01-20 05:23:01'),
	(24, 44, 19, 'menu-item', 'admin.menu-item.index', 1, '2026-01-20 05:33:58', '2026-01-20 05:33:58'),
	(25, 46, 19, 'edit', 'admin.menu.edit', 1, '2026-01-21 00:48:49', '2026-01-21 00:48:49'),
	(26, 48, 22, 'create', 'admin.author.create', 1, '2026-01-22 04:30:36', '2026-01-22 04:30:36'),
	(27, 49, 22, 'edit', 'admin.author.edit', 1, '2026-01-22 04:30:52', '2026-01-22 04:30:52'),
	(28, 50, 22, 'delete', 'admin.author.destroy', 1, '2026-01-22 04:31:06', '2026-01-22 04:31:06'),
	(29, 51, 22, 'show', 'admin.author.show', 1, '2026-01-22 04:31:22', '2026-01-22 04:31:22'),
	(30, 52, 17, 'edit', 'admin.publication.edit', 1, '2026-01-22 04:33:21', '2026-01-22 04:33:21'),
	(31, 53, 17, 'show', 'admin.publication.show', 1, '2026-01-22 04:33:41', '2026-01-22 04:33:41'),
	(32, 54, 18, 'delete', 'admin.menu.destroy', 1, '2026-01-28 23:15:51', '2026-01-28 23:15:51'),
	(33, 58, 25, 'edit', 'admin.slider.edit', 1, '2026-02-02 04:09:53', '2026-02-02 04:09:53'),
	(34, 63, 29, 'create', 'admin.production.create', 1, '2026-02-26 01:35:53', '2026-02-26 01:35:53'),
	(35, 64, 29, 'edit', 'admin.production.edit', 1, '2026-02-26 01:36:39', '2026-02-26 01:36:39'),
	(36, 66, 30, 'create', 'admin.store.create', 1, '2026-02-26 01:50:44', '2026-02-26 01:50:44'),
	(37, 67, 30, 'edit', 'admin.store.edit', 1, '2026-02-26 01:51:03', '2026-02-26 01:51:03'),
	(38, 76, 33, 'create', 'admin.investor.create', 1, '2026-03-01 22:17:06', '2026-03-01 22:17:06'),
	(40, 78, 34, 'create', 'admin.invest.create', 1, '2026-03-01 22:20:32', '2026-03-01 22:20:32'),
	(41, 79, 33, 'edit', 'admin.investor.edit', 1, '2026-03-01 22:21:50', '2026-03-01 22:21:50'),
	(42, 80, 35, 'create', 'admin.profit-distribution.create', 1, '2026-03-01 22:22:35', '2026-03-01 22:22:35'),
	(43, 81, 35, 'show', 'admin.profit-distribution.show', 1, '2026-03-01 22:24:39', '2026-03-01 22:24:39'),
	(44, 82, 36, 'create', 'admin.investor-payment.create', 1, '2026-03-01 22:25:41', '2026-03-01 22:25:41'),
	(45, 83, 36, 'edit', 'admin.investor-payment.edit', 1, '2026-03-01 22:26:02', '2026-03-01 22:26:02'),
	(46, 84, 37, 'create', 'admin.invest-sattlement.create', 1, '2026-03-01 22:26:57', '2026-03-01 22:26:57'),
	(47, 85, 37, 'show', 'admin.invest-sattlement.show', 1, '2026-03-01 22:27:09', '2026-03-01 22:27:09'),
	(48, 88, 40, 'create', 'admin.client.create', 1, '2026-03-01 22:43:16', '2026-03-01 22:43:16'),
	(49, 89, 40, 'edit', 'admin.client.edit', 1, '2026-03-01 22:43:27', '2026-03-01 22:43:27'),
	(50, 91, 41, 'create', 'admin.sales.create', 1, '2026-03-01 22:46:57', '2026-03-01 22:46:57'),
	(51, 92, 41, 'show', 'admin.sales.show', 1, '2026-03-01 22:47:20', '2026-03-01 22:47:20'),
	(52, 94, 42, 'create', 'admin.collection.create', 1, '2026-03-01 22:51:54', '2026-03-01 22:51:54'),
	(53, 95, 42, 'show', 'admin.collection.show', 1, '2026-03-01 22:52:07', '2026-03-01 22:52:07'),
	(55, 102, 47, 'create', 'admin.expense.create', 1, '2026-03-02 00:20:20', '2026-03-02 00:20:20'),
	(56, 103, 47, 'show', 'admin.expense.show', 1, '2026-03-02 00:21:24', '2026-03-02 00:21:24'),
	(57, 106, 49, 'create', 'admin.admin-menu.create', 1, '2026-03-02 00:51:22', '2026-03-02 00:51:22'),
	(58, 107, 49, 'edit', 'admin.admin-menu.edit', 1, '2026-03-02 00:52:37', '2026-03-02 00:52:37'),
	(59, 108, 49, 'view actions', 'admin.admin-menu-action.index', 1, '2026-03-02 00:56:38', '2026-03-02 00:56:38'),
	(60, 109, 49, 'create action', 'admin.admin-menu-action.create', 1, '2026-03-02 00:57:37', '2026-03-02 00:57:37'),
	(61, 110, 49, 'edit action', 'admin.admin-menu-action.edit', 1, '2026-03-02 00:58:54', '2026-03-02 00:58:54'),
	(62, 111, 49, 'delete action', 'admin.admin-menu-action.destroy', 1, '2026-03-02 00:59:45', '2026-03-02 00:59:45'),
	(63, 112, 49, 'destroy', 'admin.admin-menu.destroy', 1, '2026-03-02 01:00:30', '2026-03-02 01:00:30'),
	(64, 115, 51, 'create', 'admin.purchase-order.create', 1, '2026-03-02 02:39:57', '2026-03-02 02:39:57'),
	(65, 116, 51, 'show', 'admin.purchase-order.show', 1, '2026-03-02 02:40:17', '2026-03-02 02:40:17'),
	(66, 118, 15, 'edit', 'admin.vendor.edit', 1, '2026-03-06 21:50:54', '2026-03-06 21:50:54'),
	(67, 119, 13, 'edit', 'admin.brand.edit', 1, '2026-03-06 21:55:05', '2026-03-06 21:55:05'),
	(68, 120, 25, 'create', 'admin.slider.create', 1, '2026-03-07 02:57:41', '2026-03-07 02:59:03');

-- Dumping structure for table airas_mart.admin_settings
DROP TABLE IF EXISTS `admin_settings`;
CREATE TABLE IF NOT EXISTS `admin_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `small_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primary_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondary_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whatsapp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.admin_settings: ~1 rows (approximately)
DELETE FROM `admin_settings`;
INSERT INTO `admin_settings` (`id`, `logo`, `small_logo`, `favicon`, `title`, `footer_text`, `primary_color`, `secondary_color`, `facebook`, `twitter`, `linkedin`, `whatsapp`, `google`, `created_at`, `updated_at`) VALUES
	(1, 'storage/admin-setting//2026-03-06-558eg8B0rLYEM2wuMwlSW09uRMKaWshms54SVqQV.webp', 'storage/admin-setting//2026-03-06-KLPl9B9XaDhqYdXaXsUb393rOY2U5pj8VMOmwltr.webp', 'storage/admin-setting//2026-03-06-j4GghoETMflv9ZGRCbL3qzBK8qlShGI5XbohkGaS.webp', 'Airas Mart', 'sdfsdfsdf', '#e80c9b', '#18ba64', 'sdfs', 'fsdf', 'sdfsd', 'dfsdf', NULL, '2026-01-19 05:04:11', '2026-03-05 21:14:20');

-- Dumping structure for table airas_mart.areas
DROP TABLE IF EXISTS `areas`;
CREATE TABLE IF NOT EXISTS `areas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `region_id` bigint unsigned NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `incharge` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `areas_code_unique` (`code`),
  KEY `areas_region_id_foreign` (`region_id`),
  KEY `areas_created_by_foreign` (`created_by`),
  KEY `areas_updated_by_foreign` (`updated_by`),
  KEY `areas_deleted_by_foreign` (`deleted_by`),
  CONSTRAINT `areas_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `areas_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `areas_region_id_foreign` FOREIGN KEY (`region_id`) REFERENCES `regions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `areas_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.areas: ~51 rows (approximately)
DELETE FROM `areas`;
INSERT INTO `areas` (`id`, `region_id`, `code`, `name`, `incharge`, `phone`, `email`, `address`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 1, NULL, 'নীলক্ষেত', NULL, NULL, NULL, NULL, 1, NULL, 10, NULL, NULL, '2025-07-22 03:18:40', '2025-10-26 00:13:31'),
	(2, 2, NULL, 'ভোলা', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-25 23:52:58', '2025-10-25 23:52:58'),
	(3, 5, NULL, 'বগুড়া', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-26 00:04:06', '2025-10-26 00:04:06'),
	(4, 2, NULL, 'পটুয়াখালী', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-26 00:05:53', '2025-10-26 00:05:53'),
	(5, 5, NULL, 'নওগাঁ', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-26 00:07:44', '2025-10-26 00:07:44'),
	(6, 4, NULL, 'শেরপুর', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-26 00:08:25', '2025-10-26 00:08:25'),
	(7, 3, NULL, 'কুষ্টিয়া', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-26 00:09:43', '2025-10-26 00:09:43'),
	(8, 6, NULL, 'গাইবান্ধা', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-26 00:10:24', '2025-10-26 00:10:24'),
	(9, 6, NULL, 'দিনাজপুর', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-26 00:14:44', '2025-10-26 00:14:44'),
	(10, 6, NULL, 'লালমনিরহাট', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-26 00:15:15', '2025-10-26 00:15:15'),
	(11, 1, NULL, 'নরসিংদী', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-26 00:15:47', '2025-10-26 00:15:47'),
	(12, 5, NULL, 'চাঁপাইনবাবগঞ্জ', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-26 00:16:47', '2025-10-26 00:16:47'),
	(13, 5, NULL, 'ঈশ্বরদী', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-26 00:17:29', '2025-10-26 00:17:29'),
	(14, 9, NULL, 'Area-1', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-26 00:19:33', '2025-10-26 00:19:33'),
	(15, 5, NULL, 'Area-1', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-26 00:31:22', '2025-10-26 00:31:22'),
	(16, 7, NULL, 'Area-1', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-26 01:11:55', '2025-10-26 01:11:55'),
	(17, 7, NULL, 'কুমিল্লা', NULL, NULL, NULL, NULL, 1, 10, NULL, 10, '2025-10-30 05:19:41', '2025-10-26 01:12:36', '2025-10-30 05:19:41'),
	(18, 7, NULL, 'ফেনী', NULL, NULL, NULL, NULL, 1, 10, NULL, 10, '2025-10-30 05:19:47', '2025-10-26 01:12:56', '2025-10-30 05:19:47'),
	(19, 7, NULL, 'চাঁদপুর', NULL, NULL, NULL, NULL, 1, 10, NULL, 10, '2025-10-30 05:19:12', '2025-10-26 01:13:17', '2025-10-30 05:19:12'),
	(20, 1, NULL, 'সাভার', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-30 04:29:58', '2025-10-30 04:29:58'),
	(21, 1, NULL, 'মুন্সীগঞ্জ', NULL, NULL, NULL, NULL, 1, 10, 10, NULL, NULL, '2025-10-30 04:34:11', '2025-11-01 01:20:01'),
	(22, 1, NULL, 'মাধবদী,নরসিংদী', NULL, NULL, NULL, NULL, 1, 10, 10, NULL, NULL, '2025-10-30 04:35:11', '2025-11-01 01:26:48'),
	(23, 1, NULL, 'গাজীপুর, মাওনা', NULL, NULL, NULL, NULL, 1, 10, 10, NULL, NULL, '2025-10-30 05:10:16', '2025-10-30 05:10:40'),
	(24, 2, NULL, 'পিরোজপুর', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-30 05:11:18', '2025-10-30 05:11:18'),
	(25, 2, NULL, 'বরগুনা', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-30 05:11:45', '2025-10-30 05:11:45'),
	(26, 3, NULL, 'যশোর', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-30 05:12:55', '2025-10-30 05:12:55'),
	(27, 3, NULL, 'নোয়াপাড়া, খুলনা', NULL, NULL, NULL, NULL, 1, 10, 10, NULL, NULL, '2025-10-30 05:14:38', '2025-11-01 00:30:35'),
	(28, 4, NULL, 'জামালপুর', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-30 05:15:09', '2025-10-30 05:15:09'),
	(29, 4, NULL, 'নেত্রকোনা', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-30 05:15:31', '2025-10-30 05:15:31'),
	(30, 4, NULL, 'টাঙ্গাইল', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-30 05:15:56', '2025-10-30 05:15:56'),
	(31, 4, NULL, 'ময়মনসিংহ', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-30 05:17:27', '2025-10-30 05:17:27'),
	(32, 7, NULL, 'কুমিল্লা', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-30 05:17:49', '2025-10-30 05:17:49'),
	(33, 7, NULL, 'চট্টগ্রাম', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-30 05:18:09', '2025-10-30 05:18:09'),
	(34, 7, NULL, 'ফেনী', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-30 05:18:28', '2025-10-30 05:18:28'),
	(35, 7, NULL, 'চাঁদপুর', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-30 05:18:42', '2025-10-30 05:18:42'),
	(36, 8, NULL, 'সিলেট', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-30 05:20:59', '2025-10-30 05:20:59'),
	(37, 8, NULL, 'হবিগঞ্জ', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-30 05:21:36', '2025-10-30 05:21:36'),
	(38, 8, NULL, 'মৌলভীবাজার', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-30 05:22:37', '2025-10-30 05:22:37'),
	(39, 8, NULL, 'সুনামগঞ্জ', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-30 05:23:16', '2025-10-30 05:23:16'),
	(40, 5, NULL, 'সিরাজগঞ্জ', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-30 05:23:36', '2025-10-30 05:23:36'),
	(41, 5, NULL, 'পাবনা', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-30 05:23:56', '2025-10-30 05:23:56'),
	(42, 5, NULL, 'রাজশাহী', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-30 05:24:37', '2025-10-30 05:24:37'),
	(43, 5, NULL, 'বগুড়া', NULL, NULL, NULL, NULL, 1, 10, NULL, 10, '2025-11-01 01:54:26', '2025-10-30 05:25:11', '2025-11-01 01:54:26'),
	(44, 6, NULL, 'রংপুর', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-30 05:25:35', '2025-10-30 05:25:35'),
	(45, 6, NULL, 'পঞ্চগড়', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-30 05:26:38', '2025-10-30 05:26:38'),
	(46, 3, NULL, 'খুলনা', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 00:30:57', '2025-11-01 00:30:57'),
	(47, 1, NULL, 'মালিবাগ', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 01:08:45', '2025-11-01 01:08:45'),
	(48, 2, NULL, 'ঝালকাঠি', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 01:17:09', '2025-11-01 01:17:09'),
	(49, 1, NULL, 'নারায়ণগঞ্জ', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 01:20:16', '2025-11-01 01:20:16'),
	(50, 2, NULL, 'বরিশাল', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-02 03:05:45', '2025-11-02 03:05:45'),
	(51, 1, NULL, 'বাংলা বাজার', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2026-01-24 05:20:36', '2026-01-24 05:20:36');

-- Dumping structure for table airas_mart.attributes
DROP TABLE IF EXISTS `attributes`;
CREATE TABLE IF NOT EXISTS `attributes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attributes_slug_unique` (`slug`),
  KEY `attributes_created_by_foreign` (`created_by`),
  KEY `attributes_updated_by_foreign` (`updated_by`),
  KEY `attributes_deleted_by_foreign` (`deleted_by`),
  CONSTRAINT `attributes_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `attributes_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `attributes_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.attributes: ~0 rows (approximately)
DELETE FROM `attributes`;
INSERT INTO `attributes` (`id`, `name`, `slug`, `description`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 'attrbuts', 'attrbuts', 'zzzxczxcz', 1, NULL, NULL, NULL, NULL, '2026-01-20 04:21:28', '2026-01-20 04:21:28');

-- Dumping structure for table airas_mart.attribute_values
DROP TABLE IF EXISTS `attribute_values`;
CREATE TABLE IF NOT EXISTS `attribute_values` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_values_attribute_id_foreign` (`attribute_id`),
  KEY `attribute_values_created_by_foreign` (`created_by`),
  KEY `attribute_values_updated_by_foreign` (`updated_by`),
  CONSTRAINT `attribute_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attribute_values_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `attribute_values_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.attribute_values: ~0 rows (approximately)
DELETE FROM `attribute_values`;

-- Dumping structure for table airas_mart.authors
DROP TABLE IF EXISTS `authors`;
CREATE TABLE IF NOT EXISTS `authors` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `authors_slug_unique` (`slug`),
  KEY `authors_created_by_foreign` (`created_by`),
  KEY `authors_updated_by_foreign` (`updated_by`),
  KEY `authors_deleted_by_foreign` (`deleted_by`),
  CONSTRAINT `authors_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `authors_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `authors_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.authors: ~2 rows (approximately)
DELETE FROM `authors`;
INSERT INTO `authors` (`id`, `name`, `slug`, `image`, `cover_image`, `description`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 'Airas Mart', 'airas-mart-1', 'storage/author/2026-01-22-zeIQ6hqzq0S5fMSdNwjKvP71YvOQVfeDJdi8CtFq.webp', NULL, 'Airas Kitchen', 1, NULL, NULL, NULL, '2026-03-06 22:37:13', '2026-01-22 04:32:15', '2026-03-06 22:37:13'),
	(2, 'Airas Mart', 'airas-mart', 'storage/author/2026-01-22-T02ZWzSpmM23u47w1cOI5T34THWIlNdQq4nuDjUA.webp', NULL, 'Airas Mart', 1, NULL, NULL, NULL, NULL, '2026-01-22 04:32:35', '2026-03-06 21:47:24');

-- Dumping structure for table airas_mart.brands
DROP TABLE IF EXISTS `brands`;
CREATE TABLE IF NOT EXISTS `brands` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `brands_slug_unique` (`slug`),
  KEY `brands_created_by_foreign` (`created_by`),
  KEY `brands_updated_by_foreign` (`updated_by`),
  KEY `brands_deleted_by_foreign` (`deleted_by`),
  CONSTRAINT `brands_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `brands_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `brands_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.brands: ~3 rows (approximately)
DELETE FROM `brands`;
INSERT INTO `brands` (`id`, `name`, `slug`, `image`, `description`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 'RELYON', 'relyon', 'storage/brand/2026-01-20-mH033TDt5IhVVLvH7rpLvNfYNUawDwaI0kR4lDnL.webp', 'RELYON', 1, NULL, NULL, NULL, NULL, '2026-01-20 04:10:04', '2026-03-06 21:55:25'),
	(2, 'Airas Mart', 'airas-mart', NULL, 'Airas Mart', 1, NULL, NULL, NULL, NULL, '2026-03-07 02:36:40', '2026-03-07 02:36:40'),
	(3, 'Frozen Foodi', 'frozen-foodi', NULL, 'Frozen Foodi', 1, NULL, NULL, NULL, NULL, '2026-03-07 02:37:48', '2026-03-07 02:37:48');

-- Dumping structure for table airas_mart.cache
DROP TABLE IF EXISTS `cache`;
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.cache: ~3 rows (approximately)
DELETE FROM `cache`;
INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
	('books_books_cache_admin_menus', 'O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:6:{i:0;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:1;s:13:"permission_id";i:1;s:9:"parent_id";N;s:4:"name";s:9:"Dashboard";s:5:"route";s:15:"admin.dashboard";s:4:"icon";s:68:"<span class="material-symbols-outlined fs-22"> home_app_logo </span>";s:5:"order";i:1;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-01-19 11:33:09";s:10:"updated_at";s:19:"2026-01-19 11:33:09";}s:11:"\0*\0original";a:11:{s:2:"id";i:1;s:13:"permission_id";i:1;s:9:"parent_id";N;s:4:"name";s:9:"Dashboard";s:5:"route";s:15:"admin.dashboard";s:4:"icon";s:68:"<span class="material-symbols-outlined fs-22"> home_app_logo </span>";s:5:"order";i:1;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-01-19 11:33:09";s:10:"updated_at";s:19:"2026-01-19 11:33:09";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:2:{s:8:"children";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:0:{}s:28:"\0*\0escapeWhenCastingToString";b:0;}s:7:"actions";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:0:{}s:28:"\0*\0escapeWhenCastingToString";b:0;}}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:1;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:2;s:13:"permission_id";i:2;s:9:"parent_id";N;s:4:"name";s:15:"System Settings";s:5:"route";N;s:4:"icon";s:78:"<span class="material-symbols-outlined fs-22"> settings_cinematic_blur </span>";s:5:"order";i:2;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-01-19 11:34:47";s:10:"updated_at";s:19:"2026-01-19 11:34:47";}s:11:"\0*\0original";a:11:{s:2:"id";i:2;s:13:"permission_id";i:2;s:9:"parent_id";N;s:4:"name";s:15:"System Settings";s:5:"route";N;s:4:"icon";s:78:"<span class="material-symbols-outlined fs-22"> settings_cinematic_blur </span>";s:5:"order";i:2;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-01-19 11:34:47";s:10:"updated_at";s:19:"2026-01-19 11:34:47";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:2:{s:8:"children";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:4:{i:0;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:3;s:13:"permission_id";i:3;s:9:"parent_id";i:2;s:4:"name";s:5:"Roles";s:5:"route";s:16:"admin.role.index";s:4:"icon";N;s:5:"order";i:1;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-01-19 11:35:46";s:10:"updated_at";s:19:"2026-01-19 11:35:46";}s:11:"\0*\0original";a:11:{s:2:"id";i:3;s:13:"permission_id";i:3;s:9:"parent_id";i:2;s:4:"name";s:5:"Roles";s:5:"route";s:16:"admin.role.index";s:4:"icon";N;s:5:"order";i:1;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-01-19 11:35:46";s:10:"updated_at";s:19:"2026-01-19 11:35:46";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:1;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:4;s:13:"permission_id";i:4;s:9:"parent_id";i:2;s:4:"name";s:5:"Users";s:5:"route";s:16:"admin.user.index";s:4:"icon";N;s:5:"order";i:2;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-01-19 11:36:43";s:10:"updated_at";s:19:"2026-01-19 11:36:43";}s:11:"\0*\0original";a:11:{s:2:"id";i:4;s:13:"permission_id";i:4;s:9:"parent_id";i:2;s:4:"name";s:5:"Users";s:5:"route";s:16:"admin.user.index";s:4:"icon";N;s:5:"order";i:2;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-01-19 11:36:43";s:10:"updated_at";s:19:"2026-01-19 11:36:43";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:2;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:25;s:13:"permission_id";i:57;s:9:"parent_id";i:2;s:4:"name";s:6:"Slider";s:5:"route";s:18:"admin.slider.index";s:4:"icon";s:1:"#";s:5:"order";i:2;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-02-02 10:09:16";s:10:"updated_at";s:19:"2026-02-02 10:09:16";}s:11:"\0*\0original";a:11:{s:2:"id";i:25;s:13:"permission_id";i:57;s:9:"parent_id";i:2;s:4:"name";s:6:"Slider";s:5:"route";s:18:"admin.slider.index";s:4:"icon";s:1:"#";s:5:"order";i:2;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-02-02 10:09:16";s:10:"updated_at";s:19:"2026-02-02 10:09:16";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:3;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:6;s:13:"permission_id";i:6;s:9:"parent_id";i:2;s:4:"name";s:14:"Admin Settings";s:5:"route";s:26:"admin.admin-settings.index";s:4:"icon";N;s:5:"order";i:4;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-01-19 11:37:50";s:10:"updated_at";s:19:"2026-01-19 11:37:50";}s:11:"\0*\0original";a:11:{s:2:"id";i:6;s:13:"permission_id";i:6;s:9:"parent_id";i:2;s:4:"name";s:14:"Admin Settings";s:5:"route";s:26:"admin.admin-settings.index";s:4:"icon";N;s:5:"order";i:4;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-01-19 11:37:50";s:10:"updated_at";s:19:"2026-01-19 11:37:50";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}}s:28:"\0*\0escapeWhenCastingToString";b:0;}s:7:"actions";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:0:{}s:28:"\0*\0escapeWhenCastingToString";b:0;}}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:2;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:21;s:13:"permission_id";i:45;s:9:"parent_id";N;s:4:"name";s:8:"settings";s:5:"route";s:20:"admin.settings.index";s:4:"icon";N;s:5:"order";i:2;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-01-20 12:07:06";s:10:"updated_at";s:19:"2026-01-20 12:07:06";}s:11:"\0*\0original";a:11:{s:2:"id";i:21;s:13:"permission_id";i:45;s:9:"parent_id";N;s:4:"name";s:8:"settings";s:5:"route";s:20:"admin.settings.index";s:4:"icon";N;s:5:"order";i:2;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-01-20 12:07:06";s:10:"updated_at";s:19:"2026-01-20 12:07:06";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:2:{s:8:"children";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:0:{}s:28:"\0*\0escapeWhenCastingToString";b:0;}s:7:"actions";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:0:{}s:28:"\0*\0escapeWhenCastingToString";b:0;}}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:3;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:5;s:13:"permission_id";i:5;s:9:"parent_id";N;s:4:"name";s:10:"Admin Menu";s:5:"route";s:22:"admin.admin-menu.index";s:4:"icon";N;s:5:"order";i:3;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-01-19 11:37:27";s:10:"updated_at";s:19:"2026-01-20 08:51:54";}s:11:"\0*\0original";a:11:{s:2:"id";i:5;s:13:"permission_id";i:5;s:9:"parent_id";N;s:4:"name";s:10:"Admin Menu";s:5:"route";s:22:"admin.admin-menu.index";s:4:"icon";N;s:5:"order";i:3;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-01-19 11:37:27";s:10:"updated_at";s:19:"2026-01-20 08:51:54";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:2:{s:8:"children";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:0:{}s:28:"\0*\0escapeWhenCastingToString";b:0;}s:7:"actions";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:7:{i:0;O:26:"App\\Models\\AdminMenuAction":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:18:"admin_menu_actions";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:8:{s:2:"id";i:1;s:13:"permission_id";i:7;s:13:"admin_menu_id";i:5;s:4:"name";s:6:"create";s:5:"route";s:23:"admin.admin-menu.create";s:6:"status";i:1;s:10:"created_at";s:19:"2026-01-19 11:39:02";s:10:"updated_at";s:19:"2026-01-19 11:39:02";}s:11:"\0*\0original";a:8:{s:2:"id";i:1;s:13:"permission_id";i:7;s:13:"admin_menu_id";i:5;s:4:"name";s:6:"create";s:5:"route";s:23:"admin.admin-menu.create";s:6:"status";i:1;s:10:"created_at";s:19:"2026-01-19 11:39:02";s:10:"updated_at";s:19:"2026-01-19 11:39:02";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:1:{s:6:"status";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:5:{i:0;s:13:"permission_id";i:1;s:13:"admin_menu_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:6:"status";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:1;O:26:"App\\Models\\AdminMenuAction":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:18:"admin_menu_actions";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:8:{s:2:"id";i:2;s:13:"permission_id";i:8;s:13:"admin_menu_id";i:5;s:4:"name";s:4:"edit";s:5:"route";s:21:"admin.admin-menu.edit";s:6:"status";i:1;s:10:"created_at";s:19:"2026-01-19 11:39:14";s:10:"updated_at";s:19:"2026-01-19 11:39:14";}s:11:"\0*\0original";a:8:{s:2:"id";i:2;s:13:"permission_id";i:8;s:13:"admin_menu_id";i:5;s:4:"name";s:4:"edit";s:5:"route";s:21:"admin.admin-menu.edit";s:6:"status";i:1;s:10:"created_at";s:19:"2026-01-19 11:39:14";s:10:"updated_at";s:19:"2026-01-19 11:39:14";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:1:{s:6:"status";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:5:{i:0;s:13:"permission_id";i:1;s:13:"admin_menu_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:6:"status";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:2;O:26:"App\\Models\\AdminMenuAction":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:18:"admin_menu_actions";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:8:{s:2:"id";i:3;s:13:"permission_id";i:9;s:13:"admin_menu_id";i:5;s:4:"name";s:6:"delete";s:5:"route";s:24:"admin.admin-menu.destroy";s:6:"status";i:1;s:10:"created_at";s:19:"2026-01-19 11:39:24";s:10:"updated_at";s:19:"2026-01-19 11:39:24";}s:11:"\0*\0original";a:8:{s:2:"id";i:3;s:13:"permission_id";i:9;s:13:"admin_menu_id";i:5;s:4:"name";s:6:"delete";s:5:"route";s:24:"admin.admin-menu.destroy";s:6:"status";i:1;s:10:"created_at";s:19:"2026-01-19 11:39:24";s:10:"updated_at";s:19:"2026-01-19 11:39:24";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:1:{s:6:"status";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:5:{i:0;s:13:"permission_id";i:1;s:13:"admin_menu_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:6:"status";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:3;O:26:"App\\Models\\AdminMenuAction":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:18:"admin_menu_actions";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:8:{s:2:"id";i:4;s:13:"permission_id";i:10;s:13:"admin_menu_id";i:5;s:4:"name";s:12:"view actions";s:5:"route";s:29:"admin.admin-menu-action.index";s:6:"status";i:1;s:10:"created_at";s:19:"2026-01-19 11:39:36";s:10:"updated_at";s:19:"2026-01-19 11:39:36";}s:11:"\0*\0original";a:8:{s:2:"id";i:4;s:13:"permission_id";i:10;s:13:"admin_menu_id";i:5;s:4:"name";s:12:"view actions";s:5:"route";s:29:"admin.admin-menu-action.index";s:6:"status";i:1;s:10:"created_at";s:19:"2026-01-19 11:39:36";s:10:"updated_at";s:19:"2026-01-19 11:39:36";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:1:{s:6:"status";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:5:{i:0;s:13:"permission_id";i:1;s:13:"admin_menu_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:6:"status";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:4;O:26:"App\\Models\\AdminMenuAction":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:18:"admin_menu_actions";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:8:{s:2:"id";i:5;s:13:"permission_id";i:11;s:13:"admin_menu_id";i:5;s:4:"name";s:13:"create action";s:5:"route";s:30:"admin.admin-menu-action.create";s:6:"status";i:1;s:10:"created_at";s:19:"2026-01-19 11:39:45";s:10:"updated_at";s:19:"2026-01-19 11:39:45";}s:11:"\0*\0original";a:8:{s:2:"id";i:5;s:13:"permission_id";i:11;s:13:"admin_menu_id";i:5;s:4:"name";s:13:"create action";s:5:"route";s:30:"admin.admin-menu-action.create";s:6:"status";i:1;s:10:"created_at";s:19:"2026-01-19 11:39:45";s:10:"updated_at";s:19:"2026-01-19 11:39:45";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:1:{s:6:"status";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:5:{i:0;s:13:"permission_id";i:1;s:13:"admin_menu_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:6:"status";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:5;O:26:"App\\Models\\AdminMenuAction":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:18:"admin_menu_actions";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:8:{s:2:"id";i:6;s:13:"permission_id";i:12;s:13:"admin_menu_id";i:5;s:4:"name";s:11:"edit action";s:5:"route";s:28:"admin.admin-menu-action.edit";s:6:"status";i:1;s:10:"created_at";s:19:"2026-01-19 11:40:14";s:10:"updated_at";s:19:"2026-01-19 11:40:14";}s:11:"\0*\0original";a:8:{s:2:"id";i:6;s:13:"permission_id";i:12;s:13:"admin_menu_id";i:5;s:4:"name";s:11:"edit action";s:5:"route";s:28:"admin.admin-menu-action.edit";s:6:"status";i:1;s:10:"created_at";s:19:"2026-01-19 11:40:14";s:10:"updated_at";s:19:"2026-01-19 11:40:14";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:1:{s:6:"status";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:5:{i:0;s:13:"permission_id";i:1;s:13:"admin_menu_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:6:"status";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:6;O:26:"App\\Models\\AdminMenuAction":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:18:"admin_menu_actions";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:8:{s:2:"id";i:7;s:13:"permission_id";i:13;s:13:"admin_menu_id";i:5;s:4:"name";s:13:"delete action";s:5:"route";s:31:"admin.admin-menu-action.destroy";s:6:"status";i:1;s:10:"created_at";s:19:"2026-01-19 11:40:27";s:10:"updated_at";s:19:"2026-01-19 11:40:27";}s:11:"\0*\0original";a:8:{s:2:"id";i:7;s:13:"permission_id";i:13;s:13:"admin_menu_id";i:5;s:4:"name";s:13:"delete action";s:5:"route";s:31:"admin.admin-menu-action.destroy";s:6:"status";i:1;s:10:"created_at";s:19:"2026-01-19 11:40:27";s:10:"updated_at";s:19:"2026-01-19 11:40:27";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:1:{s:6:"status";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:5:{i:0;s:13:"permission_id";i:1;s:13:"admin_menu_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:6:"status";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}}s:28:"\0*\0escapeWhenCastingToString";b:0;}}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:4;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:9;s:13:"permission_id";i:21;s:9:"parent_id";N;s:4:"name";s:8:"Products";s:5:"route";N;s:4:"icon";N;s:5:"order";i:4;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-01-20 09:47:59";s:10:"updated_at";s:19:"2026-01-20 09:55:33";}s:11:"\0*\0original";a:11:{s:2:"id";i:9;s:13:"permission_id";i:21;s:9:"parent_id";N;s:4:"name";s:8:"Products";s:5:"route";N;s:4:"icon";N;s:5:"order";i:4;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-01-20 09:47:59";s:10:"updated_at";s:19:"2026-01-20 09:55:33";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:2:{s:8:"children";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:8:{i:0;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:10;s:13:"permission_id";i:22;s:9:"parent_id";i:9;s:4:"name";s:8:"Category";s:5:"route";s:20:"admin.category.index";s:4:"icon";N;s:5:"order";i:4;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-01-20 09:49:56";s:10:"updated_at";s:19:"2026-01-20 09:49:56";}s:11:"\0*\0original";a:11:{s:2:"id";i:10;s:13:"permission_id";i:22;s:9:"parent_id";i:9;s:4:"name";s:8:"Category";s:5:"route";s:20:"admin.category.index";s:4:"icon";N;s:5:"order";i:4;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-01-20 09:49:56";s:10:"updated_at";s:19:"2026-01-20 09:49:56";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:1;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:11;s:13:"permission_id";i:26;s:9:"parent_id";i:9;s:4:"name";s:14:"Product Manage";s:5:"route";s:19:"admin.product.index";s:4:"icon";N;s:5:"order";i:4;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-01-20 09:56:07";s:10:"updated_at";s:19:"2026-01-20 09:56:07";}s:11:"\0*\0original";a:11:{s:2:"id";i:11;s:13:"permission_id";i:26;s:9:"parent_id";i:9;s:4:"name";s:14:"Product Manage";s:5:"route";s:19:"admin.product.index";s:4:"icon";N;s:5:"order";i:4;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-01-20 09:56:07";s:10:"updated_at";s:19:"2026-01-20 09:56:07";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:2;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:12;s:13:"permission_id";i:27;s:9:"parent_id";i:9;s:4:"name";s:3:"UOM";s:5:"route";s:15:"admin.uom.index";s:4:"icon";N;s:5:"order";i:4;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-01-20 10:04:00";s:10:"updated_at";s:19:"2026-01-20 10:04:00";}s:11:"\0*\0original";a:11:{s:2:"id";i:12;s:13:"permission_id";i:27;s:9:"parent_id";i:9;s:4:"name";s:3:"UOM";s:5:"route";s:15:"admin.uom.index";s:4:"icon";N;s:5:"order";i:4;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-01-20 10:04:00";s:10:"updated_at";s:19:"2026-01-20 10:04:00";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:3;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:13;s:13:"permission_id";i:28;s:9:"parent_id";i:9;s:4:"name";s:5:"Brand";s:5:"route";s:17:"admin.brand.index";s:4:"icon";N;s:5:"order";i:4;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-01-20 10:04:36";s:10:"updated_at";s:19:"2026-01-20 10:04:36";}s:11:"\0*\0original";a:11:{s:2:"id";i:13;s:13:"permission_id";i:28;s:9:"parent_id";i:9;s:4:"name";s:5:"Brand";s:5:"route";s:17:"admin.brand.index";s:4:"icon";N;s:5:"order";i:4;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-01-20 10:04:36";s:10:"updated_at";s:19:"2026-01-20 10:04:36";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:4;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:15;s:13:"permission_id";i:32;s:9:"parent_id";i:9;s:4:"name";s:6:"Vendor";s:5:"route";s:18:"admin.vendor.index";s:4:"icon";N;s:5:"order";i:4;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-01-20 10:12:04";s:10:"updated_at";s:19:"2026-01-20 10:12:04";}s:11:"\0*\0original";a:11:{s:2:"id";i:15;s:13:"permission_id";i:32;s:9:"parent_id";i:9;s:4:"name";s:6:"Vendor";s:5:"route";s:18:"admin.vendor.index";s:4:"icon";N;s:5:"order";i:4;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-01-20 10:12:04";s:10:"updated_at";s:19:"2026-01-20 10:12:04";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:5;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:16;s:13:"permission_id";i:34;s:9:"parent_id";i:9;s:4:"name";s:9:"Attribute";s:5:"route";s:21:"admin.attribute.index";s:4:"icon";N;s:5:"order";i:4;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-01-20 10:19:04";s:10:"updated_at";s:19:"2026-01-20 10:19:04";}s:11:"\0*\0original";a:11:{s:2:"id";i:16;s:13:"permission_id";i:34;s:9:"parent_id";i:9;s:4:"name";s:9:"Attribute";s:5:"route";s:21:"admin.attribute.index";s:4:"icon";N;s:5:"order";i:4;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-01-20 10:19:04";s:10:"updated_at";s:19:"2026-01-20 10:19:04";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:6;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:17;s:13:"permission_id";i:36;s:9:"parent_id";i:9;s:4:"name";s:11:"publication";s:5:"route";s:23:"admin.publication.index";s:4:"icon";N;s:5:"order";i:4;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-01-20 10:22:54";s:10:"updated_at";s:19:"2026-01-20 10:22:54";}s:11:"\0*\0original";a:11:{s:2:"id";i:17;s:13:"permission_id";i:36;s:9:"parent_id";i:9;s:4:"name";s:11:"publication";s:5:"route";s:23:"admin.publication.index";s:4:"icon";N;s:5:"order";i:4;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-01-20 10:22:54";s:10:"updated_at";s:19:"2026-01-20 10:22:54";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:7;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:22;s:13:"permission_id";i:47;s:9:"parent_id";i:9;s:4:"name";s:6:"Author";s:5:"route";s:18:"admin.author.index";s:4:"icon";N;s:5:"order";i:5;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-01-22 10:29:15";s:10:"updated_at";s:19:"2026-01-22 10:29:15";}s:11:"\0*\0original";a:11:{s:2:"id";i:22;s:13:"permission_id";i:47;s:9:"parent_id";i:9;s:4:"name";s:6:"Author";s:5:"route";s:18:"admin.author.index";s:4:"icon";N;s:5:"order";i:5;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-01-22 10:29:15";s:10:"updated_at";s:19:"2026-01-22 10:29:15";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}}s:28:"\0*\0escapeWhenCastingToString";b:0;}s:7:"actions";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:3:{i:0;O:26:"App\\Models\\AdminMenuAction":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:18:"admin_menu_actions";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:8:{s:2:"id";i:13;s:13:"permission_id";i:23;s:13:"admin_menu_id";i:9;s:4:"name";s:6:"create";s:5:"route";s:20:"admin.product.create";s:6:"status";i:1;s:10:"created_at";s:19:"2026-01-20 09:51:53";s:10:"updated_at";s:19:"2026-01-20 09:51:53";}s:11:"\0*\0original";a:8:{s:2:"id";i:13;s:13:"permission_id";i:23;s:13:"admin_menu_id";i:9;s:4:"name";s:6:"create";s:5:"route";s:20:"admin.product.create";s:6:"status";i:1;s:10:"created_at";s:19:"2026-01-20 09:51:53";s:10:"updated_at";s:19:"2026-01-20 09:51:53";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:1:{s:6:"status";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:5:{i:0;s:13:"permission_id";i:1;s:13:"admin_menu_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:6:"status";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:1;O:26:"App\\Models\\AdminMenuAction":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:18:"admin_menu_actions";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:8:{s:2:"id";i:14;s:13:"permission_id";i:24;s:13:"admin_menu_id";i:9;s:4:"name";s:4:"edit";s:5:"route";s:18:"admin.product.edit";s:6:"status";i:1;s:10:"created_at";s:19:"2026-01-20 09:52:09";s:10:"updated_at";s:19:"2026-01-20 09:52:09";}s:11:"\0*\0original";a:8:{s:2:"id";i:14;s:13:"permission_id";i:24;s:13:"admin_menu_id";i:9;s:4:"name";s:4:"edit";s:5:"route";s:18:"admin.product.edit";s:6:"status";i:1;s:10:"created_at";s:19:"2026-01-20 09:52:09";s:10:"updated_at";s:19:"2026-01-20 09:52:09";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:1:{s:6:"status";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:5:{i:0;s:13:"permission_id";i:1;s:13:"admin_menu_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:6:"status";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:2;O:26:"App\\Models\\AdminMenuAction":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:18:"admin_menu_actions";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:8:{s:2:"id";i:15;s:13:"permission_id";i:25;s:13:"admin_menu_id";i:9;s:4:"name";s:6:"delete";s:5:"route";s:21:"admin.product.destroy";s:6:"status";i:1;s:10:"created_at";s:19:"2026-01-20 09:52:34";s:10:"updated_at";s:19:"2026-01-20 09:52:34";}s:11:"\0*\0original";a:8:{s:2:"id";i:15;s:13:"permission_id";i:25;s:13:"admin_menu_id";i:9;s:4:"name";s:6:"delete";s:5:"route";s:21:"admin.product.destroy";s:6:"status";i:1;s:10:"created_at";s:19:"2026-01-20 09:52:34";s:10:"updated_at";s:19:"2026-01-20 09:52:34";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:1:{s:6:"status";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:5:{i:0;s:13:"permission_id";i:1;s:13:"admin_menu_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:6:"status";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}}s:28:"\0*\0escapeWhenCastingToString";b:0;}}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:5;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:23;s:13:"permission_id";i:55;s:9:"parent_id";N;s:4:"name";s:17:"Orders Management";s:5:"route";N;s:4:"icon";N;s:5:"order";i:6;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-02-01 04:22:32";s:10:"updated_at";s:19:"2026-02-01 04:24:38";}s:11:"\0*\0original";a:11:{s:2:"id";i:23;s:13:"permission_id";i:55;s:9:"parent_id";N;s:4:"name";s:17:"Orders Management";s:5:"route";N;s:4:"icon";N;s:5:"order";i:6;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-02-01 04:22:32";s:10:"updated_at";s:19:"2026-02-01 04:24:38";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:2:{s:8:"children";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:1:{i:0;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:24;s:13:"permission_id";i:56;s:9:"parent_id";i:23;s:4:"name";s:10:"Order List";s:5:"route";s:18:"admin.orders.index";s:4:"icon";N;s:5:"order";i:6;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-02-01 04:25:06";s:10:"updated_at";s:19:"2026-02-01 04:28:50";}s:11:"\0*\0original";a:11:{s:2:"id";i:24;s:13:"permission_id";i:56;s:9:"parent_id";i:23;s:4:"name";s:10:"Order List";s:5:"route";s:18:"admin.orders.index";s:4:"icon";N;s:5:"order";i:6;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-02-01 04:25:06";s:10:"updated_at";s:19:"2026-02-01 04:28:50";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}}s:28:"\0*\0escapeWhenCastingToString";b:0;}s:7:"actions";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:0:{}s:28:"\0*\0escapeWhenCastingToString";b:0;}}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}}s:28:"\0*\0escapeWhenCastingToString";b:0;}', 1771919380),
	('books_books_cache_admin_setting', 'O:23:"App\\Models\\AdminSetting":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:14:"admin_settings";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:15:{s:2:"id";i:1;s:4:"logo";s:79:"storage/admin-setting//2026-01-19-WOkDhHTNPYsXyYppCJmHwrY9oLAUS0GyfybMRVZ0.webp";s:10:"small_logo";s:79:"storage/admin-setting//2026-01-19-OJFe5jFdx2IBzbbmhVTaY0E5lm2I5ER7OwoEGMPA.webp";s:7:"favicon";s:79:"storage/admin-setting//2026-01-19-DhG2fWtAwUI17NKIMiQKmQQZKanvyCBQnFoRYhUl.webp";s:5:"title";s:5:"Books";s:11:"footer_text";s:9:"sdfsdfsdf";s:13:"primary_color";s:7:"#e80c9b";s:15:"secondary_color";s:7:"#18ba64";s:8:"facebook";s:4:"sdfs";s:7:"twitter";s:4:"fsdf";s:8:"linkedin";s:5:"sdfsd";s:8:"whatsapp";s:5:"dfsdf";s:6:"google";N;s:10:"created_at";s:19:"2026-01-19 11:04:11";s:10:"updated_at";s:19:"2026-01-19 11:04:11";}s:11:"\0*\0original";a:15:{s:2:"id";i:1;s:4:"logo";s:79:"storage/admin-setting//2026-01-19-WOkDhHTNPYsXyYppCJmHwrY9oLAUS0GyfybMRVZ0.webp";s:10:"small_logo";s:79:"storage/admin-setting//2026-01-19-OJFe5jFdx2IBzbbmhVTaY0E5lm2I5ER7OwoEGMPA.webp";s:7:"favicon";s:79:"storage/admin-setting//2026-01-19-DhG2fWtAwUI17NKIMiQKmQQZKanvyCBQnFoRYhUl.webp";s:5:"title";s:5:"Books";s:11:"footer_text";s:9:"sdfsdfsdf";s:13:"primary_color";s:7:"#e80c9b";s:15:"secondary_color";s:7:"#18ba64";s:8:"facebook";s:4:"sdfs";s:7:"twitter";s:4:"fsdf";s:8:"linkedin";s:5:"sdfsd";s:8:"whatsapp";s:5:"dfsdf";s:6:"google";N;s:10:"created_at";s:19:"2026-01-19 11:04:11";s:10:"updated_at";s:19:"2026-01-19 11:04:11";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:0:{}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:12:{i:0;s:4:"logo";i:1;s:10:"small_logo";i:2;s:7:"favicon";i:3;s:5:"title";i:4;s:11:"footer_text";i:5;s:13:"primary_color";i:6;s:15:"secondary_color";i:7;s:8:"facebook";i:8;s:7:"twitter";i:9;s:8:"linkedin";i:10;s:8:"whatsapp";i:11;s:6:"google";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}', 1771919380),
	('books_books_cache_setting', 'O:18:"App\\Models\\Setting":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:8:"settings";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:42:{s:2:"id";i:1;s:8:"app_name";s:15:"Books and Books";s:5:"title";s:15:"Books and Books";s:13:"primary_phone";s:11:"01575020231";s:15:"secondary_phone";s:11:"01921588567";s:13:"primary_email";s:23:"booksandbooks@gmail.com";s:15:"secondary_email";s:23:"booksandbooks@gmail.com";s:11:"office_time";N;s:7:"address";s:22:"Aftabnager, Dhaka-1212";s:11:"description";N;s:10:"banner_one";s:73:"storage/settings/2026-02-02-GF8iNzEQw10DQX3hGgXKvIxe4fI7GR7kjt8TCcXZ.webp";s:15:"banner_one_link";N;s:17:"banner_one_status";i:1;s:10:"banner_two";N;s:15:"banner_two_link";N;s:17:"banner_two_status";i:1;s:15:"page_heading_bg";s:73:"storage/settings/2026-02-02-6btudjpIhD9wkXsltv1kfnMekRN4YTuKpP1eUaQT.webp";s:10:"meta_title";N;s:12:"meta_keyword";N;s:16:"meta_description";N;s:10:"meta_image";s:73:"storage/settings/2026-02-02-9xnG106bbdYpc2rUuzNhoyqMKOGHlgoUWrK9aXuy.webp";s:10:"google_map";N;s:7:"favicon";s:73:"storage/settings/2026-01-21-V4Q3LAERhKBYrp5zL6fOf2BdZ83NJFuqn0lf317n.webp";s:4:"logo";s:73:"storage/settings/2026-01-21-3u5FB5fLxnC4FK4pIV24Pli0lW1d0I8gBIfHLqM3.webp";s:11:"footer_logo";N;s:11:"placeholder";s:73:"storage/settings/2026-02-02-JYguxUfcqzekqfG4Eh7ZmqP2bzGXy1Iuv5UxSuLC.webp";s:13:"facebook_page";N;s:14:"facebook_group";N;s:7:"youtube";N;s:7:"twitter";N;s:8:"linkedin";N;s:6:"google";N;s:8:"whatsapp";N;s:9:"instagram";N;s:9:"pinterest";N;s:11:"sms_api_url";N;s:11:"sms_api_key";N;s:10:"sms_api_id";N;s:12:"bkash_status";i:1;s:12:"nagad_status";i:1;s:10:"created_at";s:19:"2026-01-19 11:10:51";s:10:"updated_at";s:19:"2026-02-02 10:07:54";}s:11:"\0*\0original";a:42:{s:2:"id";i:1;s:8:"app_name";s:15:"Books and Books";s:5:"title";s:15:"Books and Books";s:13:"primary_phone";s:11:"01575020231";s:15:"secondary_phone";s:11:"01921588567";s:13:"primary_email";s:23:"booksandbooks@gmail.com";s:15:"secondary_email";s:23:"booksandbooks@gmail.com";s:11:"office_time";N;s:7:"address";s:22:"Aftabnager, Dhaka-1212";s:11:"description";N;s:10:"banner_one";s:73:"storage/settings/2026-02-02-GF8iNzEQw10DQX3hGgXKvIxe4fI7GR7kjt8TCcXZ.webp";s:15:"banner_one_link";N;s:17:"banner_one_status";i:1;s:10:"banner_two";N;s:15:"banner_two_link";N;s:17:"banner_two_status";i:1;s:15:"page_heading_bg";s:73:"storage/settings/2026-02-02-6btudjpIhD9wkXsltv1kfnMekRN4YTuKpP1eUaQT.webp";s:10:"meta_title";N;s:12:"meta_keyword";N;s:16:"meta_description";N;s:10:"meta_image";s:73:"storage/settings/2026-02-02-9xnG106bbdYpc2rUuzNhoyqMKOGHlgoUWrK9aXuy.webp";s:10:"google_map";N;s:7:"favicon";s:73:"storage/settings/2026-01-21-V4Q3LAERhKBYrp5zL6fOf2BdZ83NJFuqn0lf317n.webp";s:4:"logo";s:73:"storage/settings/2026-01-21-3u5FB5fLxnC4FK4pIV24Pli0lW1d0I8gBIfHLqM3.webp";s:11:"footer_logo";N;s:11:"placeholder";s:73:"storage/settings/2026-02-02-JYguxUfcqzekqfG4Eh7ZmqP2bzGXy1Iuv5UxSuLC.webp";s:13:"facebook_page";N;s:14:"facebook_group";N;s:7:"youtube";N;s:7:"twitter";N;s:8:"linkedin";N;s:6:"google";N;s:8:"whatsapp";N;s:9:"instagram";N;s:9:"pinterest";N;s:11:"sms_api_url";N;s:11:"sms_api_key";N;s:10:"sms_api_id";N;s:12:"bkash_status";i:1;s:12:"nagad_status";i:1;s:10:"created_at";s:19:"2026-01-19 11:10:51";s:10:"updated_at";s:19:"2026-02-02 10:07:54";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:0:{}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:39:{i:0;s:8:"app_name";i:1;s:5:"title";i:2;s:13:"primary_phone";i:3;s:15:"secondary_phone";i:4;s:13:"primary_email";i:5;s:15:"secondary_email";i:6;s:11:"office_time";i:7;s:7:"address";i:8;s:11:"description";i:9;s:10:"banner_one";i:10;s:15:"banner_one_link";i:11;s:17:"banner_one_status";i:12;s:10:"banner_two";i:13;s:15:"banner_two_link";i:14;s:17:"banner_two_status";i:15;s:15:"page_heading_bg";i:16;s:10:"meta_title";i:17;s:12:"meta_keyword";i:18;s:16:"meta_description";i:19;s:10:"meta_image";i:20;s:10:"google_map";i:21;s:7:"favicon";i:22;s:4:"logo";i:23;s:11:"footer_logo";i:24;s:11:"placeholder";i:25;s:13:"facebook_page";i:26;s:14:"facebook_group";i:27;s:7:"youtube";i:28;s:7:"twitter";i:29;s:8:"linkedin";i:30;s:6:"google";i:31;s:8:"whatsapp";i:32;s:9:"instagram";i:33;s:9:"pinterest";i:34;s:11:"sms_api_url";i:35;s:11:"sms_api_key";i:36;s:10:"sms_api_id";i:37;s:12:"bkash_status";i:38;s:12:"nagad_status";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}', 1771919380);

-- Dumping structure for table airas_mart.cache_locks
DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.cache_locks: ~0 rows (approximately)
DELETE FROM `cache_locks`;

-- Dumping structure for table airas_mart.categories
DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'header',
  `url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  KEY `categories_created_by_foreign` (`created_by`),
  KEY `categories_updated_by_foreign` (`updated_by`),
  KEY `categories_deleted_by_foreign` (`deleted_by`),
  CONSTRAINT `categories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `categories_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `categories_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.categories: ~35 rows (approximately)
DELETE FROM `categories`;
INSERT INTO `categories` (`id`, `parent_id`, `name`, `type`, `slug`, `image`, `description`, `status`, `position`, `url`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, NULL, 'Men Collections', 'other', 'amar-itihas', 'storage/category/2026-01-20-ML4RobJCoxQrhxcUTXiRgZC4TXdfkN8vNe14bkcA.webp', 'সকল আলোচনা', 1, 'header', '#', NULL, NULL, NULL, NULL, '2026-01-20 03:44:44', '2026-03-05 22:42:16'),
	(2, 1, 'T-Shirt', 'other', 'itihas', 'storage/category/2026-01-25-A5GUscpZWSmrLr0xXmWYQSegvXP9ZN2fhgMSSjAd.webp', 'T-Shirt', 1, 'header', '#', NULL, NULL, NULL, NULL, '2026-01-20 03:46:02', '2026-03-05 23:10:51'),
	(3, 4, 'Three Piece', 'other', 'es-es-si', 'storage/category/2026-01-25-X7ut7OeRn9ZovzDhNdGSxUNwZ8inNzNx51OBw2Zt.webp', 'Three Piece', 1, 'header', '#', NULL, NULL, NULL, NULL, '2026-01-21 04:33:12', '2026-03-07 02:29:37'),
	(4, NULL, 'Women Collections', 'other', 'ekademik', 'storage/category/2026-01-21-pLTcQNE1TC5RKHwntlvgDiX9wYN9vbisByj7KeVu.webp', 'ইলেক্ট্রনিক্স', 1, 'header', '#', NULL, NULL, NULL, NULL, '2026-01-21 05:50:48', '2026-03-05 22:42:29'),
	(5, NULL, 'Mirror Collections', 'other', 'kartun-er-glp', 'storage/category/2026-01-20-HS8XmhC2g9rbCbXWO8fNyt5dKzaM370aar4KZM1M.webp', 'সকল', 1, 'header', '#', NULL, NULL, NULL, NULL, '2026-01-21 22:39:35', '2026-03-05 22:43:52'),
	(6, 4, 'T-Shirt', 'other', 'eisessi', 'storage/category/2026-01-25-WCUZ8WW5OfIAtRyi4yvV0lSWSokmTxYrWCkSQAbj.webp', 'Boroka', 1, 'header_top', '#', NULL, NULL, NULL, NULL, '2026-01-21 23:44:00', '2026-03-07 02:29:57'),
	(7, 4, 'Sharee', 'other', 'iunivarsiti-vrti', 'storage/category/2026-01-25-cVOMfDXxut0kWOLWSITIcGVcN7JiqdKBiWkXw512.webp', 'Sharee', 1, 'header_top', '#', NULL, NULL, NULL, NULL, '2026-01-21 23:44:48', '2026-03-07 02:30:32'),
	(8, 5, 'Round Shape', 'other', 'kartun-er-val-glp', 'storage/category/2026-01-25-eXypOGkciWmMflByx1hhc6P9uarA7XRZklaxAR7B.webp', NULL, 1, 'header', '#', NULL, NULL, NULL, NULL, '2026-01-25 05:24:59', '2026-03-06 21:30:10'),
	(9, 5, 'Oval Shape', 'other', 'ajb-thakurer-ktha', 'storage/category/2026-01-25-o95VBf7carOoVlVnUd9J718AlcnCmldK2jKTuT1L.webp', 'সদফসদ', 1, 'header_top', '#', NULL, NULL, NULL, NULL, '2026-01-25 05:26:01', '2026-03-06 21:29:54'),
	(10, 1, 'Shirt', 'other', 'gerila-zuddh', 'storage/category/2026-01-25-lSfUto37Rogh00r0HFPSi5rP3cBwwWbLVZ9YaCtO.webp', 'Shirt', 1, 'header', '#', NULL, NULL, NULL, NULL, '2026-01-25 05:26:39', '2026-03-05 23:11:03'),
	(11, NULL, 'Just click for message or Call on (Whatsapp Number) +8801575020231', 'other', 'ghre-bse-ay-krun', 'storage/category/2026-01-26-RsPtfwny0ZVUNEiVFvOK4JhryKDUjqm17WMcIBeC.webp', 'Hello How can help you?', 1, 'header_top', 'https://wa.me/8801575020231?text=Hello%20I%20want%20to%20contact%20you', NULL, NULL, NULL, NULL, '2026-01-25 22:07:30', '2026-03-05 22:28:17'),
	(12, NULL, 'info.mart@aairass.com', 'other', 'rkmari-kuij', 'storage/category/2026-01-26-cgw8o9oGv4zJvYYgY5OFEC1WLfVgYmAhOYGaBn8o.webp', 'info.mart@aairaas.com', 1, 'header_top', 'mailto:info.mart@aairass.com?subject=Contact&body=Hello I want to contact you', NULL, NULL, NULL, NULL, '2026-01-25 22:08:06', '2026-03-05 22:34:57'),
	(30, NULL, 'Home', 'other', 'hom', NULL, 'Description', 1, 'homepage', '#', NULL, NULL, NULL, NULL, '2026-02-01 05:18:55', '2026-03-05 22:40:54'),
	(48, NULL, 'Packaging Products', 'other', 'kids-jon', NULL, NULL, 1, 'header', '#', NULL, NULL, NULL, NULL, '2026-02-02 23:54:35', '2026-03-05 22:44:47'),
	(49, NULL, 'Frozen Foods', 'other', 'pratishthanik-ordar', NULL, NULL, 1, 'header', '#', NULL, NULL, NULL, NULL, '2026-02-02 23:55:04', '2026-03-05 22:45:26'),
	(61, NULL, 'Others', 'other', 'others', NULL, 'Others', 1, 'header', '#', NULL, NULL, NULL, NULL, '2026-03-05 23:12:42', '2026-03-05 23:24:00'),
	(62, 61, 'Invelap', 'other', 'invelap', NULL, NULL, 1, 'header', '#', NULL, NULL, NULL, NULL, '2026-03-05 23:27:50', '2026-03-05 23:27:50'),
	(63, NULL, '📘Facebook', 'other', 'i-classfab-fa-facebook-fi', NULL, NULL, 1, 'header_top', 'https://www.facebook.com/aairassmart/', NULL, 1, NULL, NULL, '2026-03-06 01:00:25', '2026-03-14 07:11:08'),
	(64, NULL, '▶️YouTube', 'other', 'youtube', NULL, NULL, 1, 'header_top', '#', NULL, NULL, NULL, NULL, '2026-03-06 01:02:13', '2026-03-06 01:02:13'),
	(68, NULL, '🐦  Twitter / X', 'other', 'twitter-x', NULL, NULL, 1, 'footer_col2', '#', NULL, NULL, NULL, NULL, '2026-03-06 01:05:03', '2026-03-13 23:03:57'),
	(69, NULL, '💼  LinkedIn', 'other', 'linkedin', NULL, NULL, 1, 'footer_col2', '#', NULL, NULL, NULL, NULL, '2026-03-06 01:05:19', '2026-03-13 23:04:09'),
	(70, NULL, '📌  Pinterest', 'other', 'pinterest', NULL, NULL, 1, 'footer_col2', '#', NULL, NULL, NULL, NULL, '2026-03-06 01:05:31', '2026-03-13 23:04:18'),
	(71, NULL, '💬  WhatsApp', 'other', 'whatsapp', NULL, NULL, 1, 'footer_col2', '#', NULL, NULL, NULL, NULL, '2026-03-06 01:05:52', '2026-03-06 01:05:52'),
	(72, NULL, '✈️  Telegram', 'other', 'telegram', NULL, NULL, 1, 'footer_col2', '#', NULL, NULL, NULL, NULL, '2026-03-06 01:06:06', '2026-03-06 01:06:06'),
	(73, NULL, '📘 Facebook', 'other', 'snapchat', NULL, NULL, 1, 'footer_col2', 'https://www.facebook.com/aairassmart/', NULL, 1, NULL, NULL, '2026-03-06 01:06:16', '2026-03-14 07:10:50'),
	(74, NULL, '🎵  TikTok', 'other', 'tiktok', NULL, NULL, 1, 'footer_col2', '#', NULL, NULL, NULL, NULL, '2026-03-06 01:06:29', '2026-03-06 01:06:29'),
	(75, NULL, '▶️  YouTube', 'other', 'discord', NULL, NULL, 1, 'footer_col2', '#', NULL, NULL, NULL, NULL, '2026-03-06 01:06:42', '2026-03-13 22:58:29'),
	(76, NULL, '📷  Instagram', 'other', 'reddit', NULL, NULL, 1, 'footer_col2', '#', NULL, NULL, NULL, NULL, '2026-03-06 01:06:58', '2026-03-13 22:59:17'),
	(77, 5, 'Rectangle Shape', 'other', 'rectangle-shape', NULL, NULL, 1, 'header', '#', NULL, NULL, NULL, NULL, '2026-03-06 21:29:41', '2026-03-06 21:29:41'),
	(78, 5, 'Others Shape', 'other', 'others-shape', NULL, NULL, 1, 'header', '#', NULL, NULL, NULL, NULL, '2026-03-06 21:34:19', '2026-03-06 21:34:19'),
	(79, 49, 'Frozen Foods', 'other', 'frozen-foods', NULL, 'Frozen Foods', 1, 'header', '#', NULL, NULL, NULL, NULL, '2026-03-07 02:32:54', '2026-03-07 02:32:54'),
	(80, 49, 'Chicken Mixed Frozen', 'other', 'chicken-mixed-frozen', NULL, NULL, 1, 'header', '#', NULL, NULL, NULL, NULL, '2026-03-07 03:33:07', '2026-03-07 03:33:07'),
	(81, 49, 'Vegetable Mixed Frozen', 'other', 'vegetable-mixed-frozen', NULL, 'Vegetable Mixed Frozen', 1, 'header', '#', NULL, NULL, NULL, NULL, '2026-03-07 03:33:35', '2026-03-07 03:33:35'),
	(82, NULL, 'About Us', 'other', 'about-us', NULL, '<p data-start="325" data-end="555">Welcome to <strong data-start="336" data-end="350">Airas Mart</strong>, a modern and reliable e-commerce platform where customers can easily purchase a wide range of products from one place. Our goal is to make online shopping simple, affordable, and accessible for everyone.</p><p data-start="557" data-end="930"><strong data-start="557" data-end="571">Airas Mart</strong> is designed to provide a smooth shopping experience for customers who want quality products at competitive prices. Our platform offers a large collection of products including clothing, fashion accessories, cosmetics, sanitary products, electrical items, home essentials, frozen foods, stationery, mirrors, kitchen items, and many more daily-needed products.</p><p data-start="932" data-end="1242">We believe that online shopping should be easy and trustworthy. That is why <strong data-start="1008" data-end="1022">Airas Mart</strong> focuses on product quality, secure payments, and reliable delivery services. Customers can purchase products at both <strong data-start="1140" data-end="1171">retail and wholesale prices</strong>, making it suitable for individual buyers as well as small businesses.</p><p data-start="1244" data-end="1499">Our marketplace also provides opportunities for sellers to list their products and reach more customers through our growing online platform. By connecting sellers and buyers together, <strong data-start="1428" data-end="1442">Airas Mart</strong> helps build a convenient and trusted online marketplace.</p><p data-start="1501" data-end="1648">We are continuously improving our services by expanding product categories, improving delivery systems, and ensuring a secure shopping environment.</p><p data-start="191" data-end="411">\r\n\r\n\r\n\r\n\r\n</p><p data-start="1650" data-end="1779">Our mission is to become one of the most trusted e-commerce platforms where customers can find everything they need in one place.</p>', 1, 'footer', '#', NULL, NULL, NULL, NULL, '2026-03-13 23:08:22', '2026-03-13 23:19:36'),
	(83, NULL, 'Contact Us', 'other', 'contact-us', NULL, '<p data-start="1800" data-end="1964" style="font-size: medium;">Thank you for visiting <strong data-start="1823" data-end="1837">Airas Mart</strong>. If you have any questions, feedback, or need support regarding orders, products, or services, please feel free to contact us.</p><p data-start="1966" data-end="2051" style="font-size: medium;">Our support team is always ready to assist you and provide the best possible service.</p><p data-start="2053" data-end="2076" style="font-size: medium;"><strong data-start="2053" data-end="2076">Contact Information</strong></p><p data-start="2078" data-end="2174" style="font-size: medium;">Website: Airas Mart<br data-start="2097" data-end="2100"><span data-start="1446" data-end="1456" style="--tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-weight: 600;">Email:</span>&nbsp;<a data-start="1457" data-end="1478" class="decorated-link cursor-pointer" rel="noopener" style="font-weight: 400; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; background-color: rgb(255, 255, 255); transition-property: all; font-family: sans-serif;">info.mart@aairass.com<span aria-hidden="true" class="ms-0.5 inline-block align-middle leading-none" style="--tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" aria-hidden="true" data-rtl-flip="" class="block h-[0.75em] w-[0.75em] stroke-current stroke-[0.75]"><use href="/cdn/assets/sprites-core-il7yfj1b.svg#304883" fill="currentColor"></use></svg></span></a><br data-start="1478" data-end="1481" style="--tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;"><span data-start="1481" data-end="1491" style="--tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-weight: 600;">Phone:</span>&nbsp;+8801575020231 (Whatsapp,Telegram,Imo)<br data-start="1506" data-end="1509" style="--tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;"><span data-start="1509" data-end="1521" style="--tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-weight: 600;">Address:</span>&nbsp;Dhaka, Bangladesh</p><p data-start="2176" data-end="2309" style="font-size: medium;">You can also contact us through the contact form available on our website. We aim to respond to all inquiries as quickly as possible.</p><p data-start="2311" data-end="2419" style="font-size: medium;">Customer satisfaction is very important to us, and we always strive to provide helpful support to our users.</p><p data-start="1446" data-end="1534" style="font-size: medium;"><br></p>', 1, 'footer', '#', NULL, NULL, NULL, NULL, '2026-03-13 23:10:11', '2026-03-13 23:21:48'),
	(84, NULL, 'Privacy Policy', 'other', 'privacy-policy', NULL, '<p data-start="2444" data-end="2631">At <strong data-start="2447" data-end="2461">Airas Mart</strong>, protecting the privacy of our users is a top priority. This Privacy Policy explains how we collect, use, and protect your personal information when you use our website.</p><p data-start="2633" data-end="2728">When you visit or make a purchase from our website, we may collect certain information such as:</p><ul data-start="2730" data-end="2850">\r\n<li data-section-id="1t2yru7" data-start="2730" data-end="2738">\r\n<p data-start="2732" data-end="2738"><b>Name:</b></p>\r\n</li>\r\n<li data-section-id="wk4jiq" data-start="2739" data-end="2756">\r\n<p data-start="2741" data-end="2756"><b>Email address:</b></p>\r\n</li>\r\n<li data-section-id="1tzdck7" data-start="2757" data-end="2773">\r\n<p data-start="2759" data-end="2773"><b>Phone number:</b></p>\r\n</li>\r\n<li data-section-id="1s5hkcs" data-start="2774" data-end="2806">\r\n<p data-start="2776" data-end="2806"><b>Billing and shipping address:</b></p>\r\n</li>\r\n<li data-section-id="mwr6xz" data-start="2807" data-end="2850">\r\n<p data-start="2809" data-end="2850"><b>Order details and transaction information:</b></p>\r\n</li>\r\n</ul><p data-start="2852" data-end="2984">This information is used to process orders, provide customer support, improve our services, and ensure a smooth shopping experience.</p><p data-start="2986" data-end="3199">We do not sell, trade, or rent your personal information to third parties. Your information may only be shared with trusted service providers such as payment processors and delivery partners for order fulfillment.</p><p data-start="3201" data-end="3309">Our website may use cookies and analytics tools to understand user behavior and improve website performance.</p><p data-start="3311" data-end="3423">We implement appropriate security measures to protect your data from unauthorized access, misuse, or disclosure.</p><p data-start="1717" data-end="1818">\r\n\r\n\r\n\r\n\r\n\r\n\r\n</p><p data-start="3425" data-end="3503">By using our website, you agree to the terms described in this Privacy Policy.</p>', 1, 'footer', '#', NULL, NULL, NULL, NULL, '2026-03-13 23:18:04', '2026-03-13 23:23:21'),
	(85, NULL, 'Terms & Conditions', 'other', 'terms-conditions', NULL, '<p data-start="3532" data-end="3655">Welcome to <strong data-start="3543" data-end="3557">Airas Mart</strong>. By accessing and using our website, you agree to comply with the following terms and conditions.</p><p data-start="3657" data-end="3799">All content, products, and services available on this website are provided for general use and may be updated or changed without prior notice.</p><p data-start="3801" data-end="3973">Customers are responsible for providing accurate information when creating accounts or placing orders. Any false or misleading information may result in order cancellation.</p><p data-start="3975" data-end="4073">Users are not allowed to misuse the website for illegal activities, fraud, or unauthorized access.</p><p data-start="4075" data-end="4213"><strong data-start="4075" data-end="4089">Airas Mart</strong> reserves the right to cancel orders, restrict accounts, or refuse service if suspicious or fraudulent activity is detected.</p><p data-start="4215" data-end="4375">All product descriptions, images, and prices are displayed for informational purposes. While we try to keep information accurate, errors may occasionally occur.</p><p data-start="2528" data-end="2637">\r\n\r\n\r\n\r\n\r\n\r\n</p><p data-start="4377" data-end="4468">By continuing to use this website, you acknowledge and agree to these terms and conditions.</p>', 1, 'footer', '#', NULL, NULL, NULL, NULL, '2026-03-13 23:18:27', '2026-03-13 23:23:40'),
	(86, NULL, 'Refund / Return Policy', 'other', 'refund-return-policy', NULL, '<p data-start="4501" data-end="4680">At <strong data-start="4504" data-end="4518">Airas Mart</strong>, we want our customers to be fully satisfied with their purchases. If you receive a damaged, defective, or incorrect product, you may request a return or refund.</p><p data-start="4682" data-end="4767">Return requests must be submitted within <strong data-start="4723" data-end="4738">3 to 7 days</strong> after receiving the product.</p><p data-start="4769" data-end="4815">To be eligible for a return, the product must:</p><ul data-start="4817" data-end="4906">\r\n<li data-section-id="d3f7ub" data-start="4817" data-end="4830">\r\n<p data-start="4819" data-end="4830"><b>Be unused</b></p>\r\n</li>\r\n<li data-section-id="18g2n4w" data-start="4831" data-end="4863">\r\n<p data-start="4833" data-end="4863"><b>Be in its original packaging</b></p>\r\n</li>\r\n<li data-section-id="cjnaxi" data-start="4864" data-end="4906">\r\n<p data-start="4866" data-end="4906"><b>Include all original accessories or tags</b></p>\r\n</li>\r\n</ul><p data-start="4908" data-end="5023">After we receive the returned item and verify its condition, we will process the refund or replacement accordingly.</p><p data-start="5025" data-end="5084">Certain products may not be eligible for return, including:</p><ul data-start="5086" data-end="5166">\r\n<li data-section-id="1946yd2" data-start="5086" data-end="5116">\r\n<p data-start="5088" data-end="5116">Opened personal care items</p>\r\n</li>\r\n<li data-section-id="i16mdz" data-start="5117" data-end="5134">\r\n<p data-start="5119" data-end="5134">Used products</p>\r\n</li>\r\n<li data-section-id="na33c7" data-start="5135" data-end="5166">\r\n<p data-start="5137" data-end="5166">Items damaged by the customer</p>\r\n</li>\r\n</ul><p data-start="5168" data-end="5243">Refunds will be processed using the original payment method where possible.</p><p data-start="3217" data-end="3401">\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n</p><p data-start="5245" data-end="5333">If you need assistance with a return or refund request, please contact our support team.</p>', 1, 'footer', '#', NULL, NULL, NULL, NULL, '2026-03-13 23:18:46', '2026-03-13 23:24:25'),
	(87, 48, 'Aluminum Food Box', 'other', 'aluminum-food-box-450ml', NULL, NULL, 1, 'header', '#', 1, 1, NULL, NULL, '2026-03-14 07:36:01', '2026-03-14 07:36:39'),
	(88, 48, 'Plastic Bati', 'other', 'plastic-bati', NULL, NULL, 1, 'header', '#', 1, NULL, NULL, NULL, '2026-03-14 07:37:00', '2026-03-14 07:37:00'),
	(89, 48, 'Percel Bag', 'other', 'food-bag', NULL, NULL, 1, 'header', '#', 1, 1, NULL, NULL, '2026-03-14 07:37:25', '2026-03-14 07:37:51');

-- Dumping structure for table airas_mart.clients
DROP TABLE IF EXISTS `clients`;
CREATE TABLE IF NOT EXISTS `clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `coa_id` bigint unsigned DEFAULT NULL,
  `region_id` bigint unsigned DEFAULT NULL,
  `area_id` bigint unsigned DEFAULT NULL,
  `territory_id` bigint unsigned DEFAULT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_person` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credit_limit` decimal(16,0) DEFAULT NULL,
  `bin_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `clients_code_unique` (`code`),
  KEY `clients_coa_id_foreign` (`coa_id`),
  KEY `clients_region_id_foreign` (`region_id`),
  KEY `clients_area_id_foreign` (`area_id`),
  KEY `clients_territory_id_foreign` (`territory_id`),
  KEY `clients_created_by_foreign` (`created_by`),
  KEY `clients_updated_by_foreign` (`updated_by`),
  KEY `clients_deleted_by_foreign` (`deleted_by`),
  CONSTRAINT `clients_area_id_foreign` FOREIGN KEY (`area_id`) REFERENCES `areas` (`id`) ON DELETE SET NULL,
  CONSTRAINT `clients_coa_id_foreign` FOREIGN KEY (`coa_id`) REFERENCES `coas` (`id`) ON DELETE SET NULL,
  CONSTRAINT `clients_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `clients_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `clients_region_id_foreign` FOREIGN KEY (`region_id`) REFERENCES `regions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `clients_territory_id_foreign` FOREIGN KEY (`territory_id`) REFERENCES `territories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `clients_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.clients: ~68 rows (approximately)
DELETE FROM `clients`;
INSERT INTO `clients` (`id`, `coa_id`, `region_id`, `area_id`, `territory_id`, `user_id`, `code`, `name`, `contact_person`, `phone`, `email`, `address`, `credit_limit`, `bin_no`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(3, 127, 1, 1, 1, NULL, NULL, 'Apon Library', 'Deen Mohammad', NULL, NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-25 00:36:24', '2025-10-25 00:36:24'),
	(4, 128, 9, 14, 1, NULL, NULL, 'Saiful Shaheb', NULL, NULL, NULL, NULL, NULL, NULL, 0, 10, NULL, NULL, NULL, '2025-10-26 00:26:48', '2025-11-01 02:01:21'),
	(5, 129, 9, 14, 1, NULL, NULL, 'Ali Ahammad Bahar', NULL, NULL, NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-26 00:28:32', '2025-11-01 02:01:18'),
	(6, 130, 9, 14, 1, NULL, NULL, 'Tso Mostafa', NULL, NULL, NULL, NULL, NULL, NULL, 0, 10, NULL, NULL, NULL, '2025-10-26 00:29:20', '2025-11-01 02:01:17'),
	(7, 131, 5, 15, 2, NULL, NULL, 'Moonlight Library', NULL, NULL, NULL, NULL, NULL, NULL, 1, 10, 10, NULL, NULL, '2025-10-26 00:30:53', '2025-11-01 02:01:15'),
	(9, 141, 7, 16, 4, NULL, NULL, 'Tso Anamul', NULL, NULL, NULL, NULL, NULL, NULL, 0, 10, NULL, NULL, NULL, '2025-10-26 03:04:53', '2025-11-01 02:01:13'),
	(10, 142, 9, 14, 1, NULL, NULL, 'Tso Bahar', NULL, NULL, NULL, NULL, NULL, NULL, 0, 10, NULL, NULL, NULL, '2025-10-26 03:13:58', '2025-11-01 02:01:12'),
	(11, 143, 1, 47, 49, NULL, NULL, 'কারেন্ট লাইব্রেরী মালিবাগ', NULL, NULL, NULL, NULL, NULL, NULL, 1, 10, 10, NULL, NULL, '2025-10-29 23:19:00', '2025-11-01 01:09:24'),
	(12, 144, 1, 1, 44, NULL, NULL, 'ইউনিটি বুক সাপ্লাই নীলক্ষেত (M)', NULL, NULL, NULL, NULL, NULL, NULL, 1, 10, 10, NULL, NULL, '2025-10-29 23:23:27', '2025-11-01 01:06:57'),
	(13, 145, 1, 23, 47, NULL, NULL, 'গাজীপুর, মাওনা', NULL, NULL, NULL, NULL, NULL, NULL, 1, 10, NULL, 10, '2025-11-01 01:12:16', '2025-11-01 01:12:07', '2025-11-01 01:12:16'),
	(14, 146, 1, 23, 47, NULL, NULL, 'গাজীপুর, মাওনা', NULL, NULL, NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 01:12:07', '2025-11-01 01:12:07'),
	(15, 147, 1, 20, 32, NULL, NULL, 'সাভার', NULL, NULL, NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 01:12:54', '2025-11-01 01:12:54'),
	(16, 148, 2, 24, 28, NULL, NULL, 'পিরোজপুর', NULL, NULL, NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 01:24:22', '2025-11-01 01:24:22'),
	(17, 149, 2, 4, 45, NULL, NULL, 'পটুয়াখালী', NULL, NULL, NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 01:24:55', '2025-11-01 01:24:55'),
	(18, 150, 2, 25, 46, NULL, NULL, 'বরগুনা', NULL, NULL, NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 01:30:07', '2025-11-01 01:30:07'),
	(19, 151, 3, 26, 26, NULL, NULL, 'যশোর', NULL, NULL, NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 01:32:05', '2025-11-01 01:32:05'),
	(20, 152, 3, 27, 25, NULL, NULL, 'নোয়াপাড়া', NULL, NULL, NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 01:32:49', '2025-11-01 01:32:49'),
	(21, 153, 4, 6, 40, NULL, NULL, 'শেরপুর', NULL, NULL, NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 01:33:32', '2025-11-01 01:33:32'),
	(22, 154, 4, 28, 24, NULL, NULL, 'জামালপুর', NULL, NULL, NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 01:34:07', '2025-11-01 01:34:07'),
	(23, 155, 4, 29, 23, NULL, NULL, 'নেত্রকোনা', NULL, NULL, NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 01:34:30', '2025-11-01 01:34:30'),
	(24, 156, 4, 30, 22, NULL, NULL, 'টাঙ্গাইল', NULL, NULL, NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 01:35:09', '2025-11-01 01:35:09'),
	(25, 157, 4, 31, 21, NULL, NULL, 'ময়মনসিংহ', NULL, NULL, NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 01:36:08', '2025-11-01 01:36:08'),
	(26, 158, 7, 35, 17, NULL, NULL, 'চাঁদপুর', NULL, NULL, NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 01:36:45', '2025-11-01 01:36:45'),
	(27, 159, 7, 32, 19, NULL, NULL, 'কুমিল্লা', NULL, NULL, NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 01:37:12', '2025-11-01 01:37:12'),
	(28, 160, 7, 33, 20, NULL, NULL, 'চট্টগ্রাম', NULL, NULL, NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 01:37:41', '2025-11-01 01:37:41'),
	(29, 161, 7, 34, 18, NULL, NULL, 'ফেনী', NULL, NULL, NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 01:38:15', '2025-11-01 01:38:15'),
	(30, 162, 8, 36, 16, NULL, NULL, 'সিলেট', NULL, NULL, NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 01:39:40', '2025-11-01 01:39:40'),
	(31, 163, 8, 37, 15, NULL, NULL, 'হবিগঞ্জ', NULL, NULL, NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 01:40:24', '2025-11-01 01:40:24'),
	(32, 164, 8, 38, 14, NULL, NULL, 'মৌলভীবাজার', NULL, NULL, NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 01:44:44', '2025-11-01 01:44:44'),
	(33, 165, 8, 39, 13, NULL, NULL, 'সুনামগঞ্জ', NULL, NULL, NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 01:45:35', '2025-11-01 01:45:35'),
	(34, 166, 2, 48, 50, NULL, NULL, 'ঝালকাঠি', NULL, NULL, NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 01:46:31', '2025-11-01 01:46:31'),
	(35, 167, 2, 2, 48, NULL, NULL, 'ভোলা', NULL, NULL, NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 01:47:19', '2025-11-01 01:47:19'),
	(36, 168, 1, 1, 44, NULL, NULL, 'নীলক্ষেত', NULL, NULL, NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 01:47:43', '2025-11-01 01:47:43'),
	(37, 169, 1, 11, 36, NULL, NULL, 'নরসিংদী', NULL, NULL, NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 01:48:14', '2025-11-01 01:48:14'),
	(38, 170, 1, 22, 29, NULL, NULL, 'মাধবদী, নরসিংদী', NULL, NULL, NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 01:49:38', '2025-11-01 01:49:38'),
	(39, 171, 1, 21, 30, NULL, NULL, 'মুন্সীগঞ্জ,', NULL, NULL, NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 01:50:07', '2025-11-01 01:50:07'),
	(40, 172, 1, 49, 51, NULL, NULL, 'নারায়ণগঞ্জ', NULL, NULL, NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 01:50:46', '2025-11-01 01:50:46'),
	(41, 173, 5, 40, 12, NULL, NULL, 'সিরাজগঞ্জ', NULL, NULL, NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 01:52:22', '2025-11-01 01:52:22'),
	(42, 174, 5, 41, 11, NULL, NULL, 'পাবনা', NULL, NULL, NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 01:52:57', '2025-11-01 01:52:57'),
	(43, 175, 5, 42, 10, NULL, NULL, 'রাজশাহী', NULL, NULL, NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 01:53:28', '2025-11-01 01:53:28'),
	(44, 176, 5, 3, 9, NULL, NULL, 'বগুড়া', NULL, NULL, NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 01:54:07', '2025-11-01 01:54:07'),
	(45, 177, 5, 13, 33, NULL, NULL, 'ঈশ্বরদী', NULL, NULL, NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 01:55:02', '2025-11-01 01:55:02'),
	(46, 178, 5, 12, 35, NULL, NULL, 'চাঁপাইনবাবগঞ্জ', NULL, NULL, NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 01:55:34', '2025-11-01 01:55:34'),
	(47, 179, 5, 12, 35, NULL, NULL, 'চাঁপাইনবাবগঞ্জ', NULL, NULL, NULL, NULL, NULL, NULL, 1, 10, NULL, 10, '2025-11-01 01:55:58', '2025-11-01 01:55:34', '2025-11-01 01:55:58'),
	(48, 180, 5, 5, 41, NULL, NULL, 'নওগাঁ', NULL, NULL, NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 01:56:49', '2025-11-01 01:56:49'),
	(49, 181, 6, 44, 8, NULL, NULL, 'রংপুর', NULL, NULL, NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 01:57:25', '2025-11-01 01:57:25'),
	(50, 182, 6, 45, 5, NULL, NULL, 'পঞ্চগড়', NULL, NULL, NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 01:57:51', '2025-11-01 01:57:51'),
	(51, 183, 6, 9, 38, NULL, NULL, 'দিনাজপুর', NULL, NULL, NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 01:58:55', '2025-11-01 01:58:55'),
	(52, 184, 6, 8, 7, NULL, NULL, 'গাইবান্ধা', NULL, NULL, NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 01:59:28', '2025-11-01 01:59:28'),
	(53, 185, 6, 10, 37, NULL, NULL, 'লালমনিরহাট', NULL, NULL, NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 01:59:46', '2025-11-01 01:59:46'),
	(54, 186, 3, 7, 39, NULL, NULL, 'কুষ্টিয়া', NULL, NULL, NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 02:00:34', '2025-11-01 02:00:34'),
	(55, 187, 3, 46, 52, NULL, NULL, 'সোহাগ বুক ডিপো', NULL, NULL, NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-02 02:43:36', '2025-11-02 02:43:36'),
	(56, 188, 3, 46, 52, NULL, NULL, 'খুলনা', NULL, NULL, NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-02 03:01:26', '2025-11-02 03:01:26'),
	(57, 189, 2, 50, 53, NULL, NULL, 'বরিশাল', NULL, NULL, NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-02 03:06:19', '2025-11-02 03:06:19'),
	(58, 228, 3, 46, 52, NULL, NULL, 'ঝিনাইদাহ', NULL, NULL, NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-12-21 21:52:04', '2025-12-21 21:52:04'),
	(59, 229, 1, 47, 49, NULL, NULL, 'মীরপুর (১০)', NULL, NULL, NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-12-21 21:54:34', '2025-12-21 21:54:34'),
	(60, 230, 1, 11, 36, NULL, NULL, 'মীরপুর (2)', NULL, NULL, NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-12-21 21:54:52', '2025-12-21 21:54:52'),
	(61, 231, 1, 11, 36, NULL, NULL, 'ফার্মগেট', NULL, NULL, NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-12-21 21:55:10', '2025-12-21 21:55:10'),
	(62, 232, 1, 1, 44, NULL, NULL, 'নেক্সাস', NULL, NULL, NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-12-23 21:46:21', '2025-12-23 21:46:21'),
	(63, 269, 1, 51, 54, NULL, NULL, 'রকমারি', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2026-01-24 05:23:13', '2026-01-24 05:23:13'),
	(64, 270, 5, 3, 9, NULL, NULL, 'নাটোর', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2026-01-30 09:35:18', '2026-01-30 09:35:18'),
	(65, 271, 4, 31, 21, NULL, NULL, 'পপুলার লাইব্রেরী ক্তাগাছা, ময়মনসিংহ', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2026-01-30 09:52:50', '2026-01-30 09:52:50'),
	(66, 272, 4, 31, 21, NULL, NULL, 'আরাফাত লাইব্রেরী ক্তাগাছা, ময়মনসিংহ', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2026-01-30 09:53:11', '2026-01-30 09:53:11'),
	(67, 273, 6, 45, 5, NULL, NULL, 'ঠাকুর গাঁও', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2026-02-04 05:38:55', '2026-02-04 05:38:55'),
	(68, 277, 2, 48, 50, 2, 'cde111', 'Aira', NULL, '22222222', 'aira@gmail.com', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2026-03-03 22:43:38', '2026-03-03 22:43:38'),
	(69, 278, 2, 48, 50, 8, NULL, 'Mitul', NULL, '44444444', 'mitul@gmail.com', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2026-03-03 22:57:35', '2026-03-03 22:59:46'),
	(70, 279, 7, 32, 19, 1, NULL, 'Admin', NULL, '33333333333', 'wali@gmail.com', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2026-03-03 23:04:39', '2026-03-03 23:04:39'),
	(71, 280, 7, 16, 4, 3, 'code3', 'warid', NULL, '333333333333', 'warid@gmail.com', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2026-03-04 00:34:21', '2026-03-04 00:34:42'),
	(72, 281, NULL, NULL, NULL, 10, NULL, 'Wali', NULL, '01575020231', '01575020231@email.com', 'Afff', NULL, NULL, 1, 10, NULL, NULL, NULL, '2026-03-13 21:53:58', '2026-03-13 21:53:58');

-- Dumping structure for table airas_mart.coas
DROP TABLE IF EXISTS `coas`;
CREATE TABLE IF NOT EXISTS `coas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint unsigned DEFAULT NULL,
  `head_code` bigint NOT NULL,
  `head_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction` tinyint(1) NOT NULL DEFAULT '0',
  `general` tinyint(1) NOT NULL DEFAULT '0',
  `head_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `updateable` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `coas_head_code_unique` (`head_code`),
  KEY `coas_parent_id_foreign` (`parent_id`),
  KEY `coas_created_by_foreign` (`created_by`),
  KEY `coas_updated_by_foreign` (`updated_by`),
  KEY `coas_deleted_by_foreign` (`deleted_by`),
  CONSTRAINT `coas_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `coas_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `coas_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `coas` (`id`) ON DELETE SET NULL,
  CONSTRAINT `coas_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=282 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.coas: ~216 rows (approximately)
DELETE FROM `coas`;
INSERT INTO `coas` (`id`, `parent_id`, `head_code`, `head_name`, `transaction`, `general`, `head_type`, `status`, `updateable`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, NULL, 1, 'Assets', 0, 0, 'A', 1, 0, NULL, NULL, NULL, NULL, '2025-06-17 12:32:17', '2025-06-17 12:32:17'),
	(2, NULL, 2, 'Liabilities', 0, 0, 'L', 1, 0, NULL, NULL, NULL, NULL, '2025-06-17 12:32:17', '2025-06-17 12:32:17'),
	(3, NULL, 3, 'Income', 0, 0, 'I', 1, 0, NULL, NULL, NULL, NULL, '2025-06-17 12:34:45', '2025-06-17 12:34:45'),
	(4, NULL, 4, 'Expense', 0, 0, 'E', 1, 0, NULL, NULL, NULL, NULL, '2025-06-17 12:34:45', '2025-06-17 12:34:45'),
	(5, 1, 101, 'Current Asset', 0, 0, 'A', 1, 0, NULL, NULL, NULL, NULL, '2025-06-17 06:41:07', '2025-06-17 06:41:07'),
	(6, 1, 102, 'Fixed Asset', 0, 0, 'A', 1, 0, NULL, NULL, NULL, NULL, '2025-06-17 06:48:44', '2025-06-17 06:48:44'),
	(7, 5, 10101, 'Cash Receivable', 0, 1, 'A', 1, 0, NULL, NULL, NULL, NULL, '2025-06-17 06:48:58', '2025-06-17 06:48:58'),
	(8, 5, 10102, 'Cash In Hand', 0, 1, 'A', 1, 0, NULL, NULL, NULL, NULL, '2025-06-17 06:49:12', '2025-06-17 06:49:12'),
	(9, 5, 10103, 'Cash at Bank', 0, 1, 'A', 1, 0, NULL, NULL, NULL, NULL, '2025-06-17 06:49:30', '2025-06-17 06:49:30'),
	(10, 2, 201, 'Cash Payable', 0, 1, 'L', 1, 0, NULL, NULL, NULL, NULL, '2025-06-17 06:50:27', '2025-06-17 06:50:27'),
	(11, 2, 202, 'Investor Capital', 0, 1, 'L', 1, 0, NULL, NULL, NULL, NULL, '2025-06-17 06:50:42', '2025-06-17 06:50:42'),
	(13, 8, 1010201, 'Cash at Fattah', 1, 0, 'A', 1, 1, NULL, NULL, NULL, NULL, '2025-06-18 00:10:11', '2025-06-18 00:10:11'),
	(14, 9, 1010301, 'UCB Bank (33217)', 1, 0, 'A', 1, 1, NULL, NULL, NULL, NULL, '2025-06-18 00:10:23', '2025-06-18 00:10:23'),
	(26, 3, 301, 'Project Income', 0, 1, 'I', 1, 0, NULL, NULL, NULL, NULL, '2025-06-22 22:49:53', '2025-06-22 22:49:53'),
	(27, 4, 401, 'Project Expense', 0, 1, 'E', 1, 0, NULL, NULL, NULL, NULL, '2025-06-22 22:50:06', '2025-06-22 22:50:06'),
	(42, 4, 402, 'Investor Profit', 0, 1, 'E', 1, 1, NULL, NULL, NULL, NULL, '2025-07-01 21:56:15', '2025-07-01 21:56:15'),
	(62, 3, 302, 'Direct Income', 0, 1, 'I', 1, 1, NULL, NULL, NULL, NULL, '2025-07-20 06:35:32', '2025-07-20 06:35:32'),
	(63, 62, 30201, 'Product Sales', 1, 0, 'I', 1, 1, NULL, NULL, NULL, NULL, '2025-07-20 06:35:37', '2025-07-20 06:35:37'),
	(64, 62, 30202, 'Sales Return', 1, 0, 'I', 1, 1, NULL, NULL, NULL, NULL, '2025-07-21 07:01:16', '2025-07-21 07:01:16'),
	(70, 11, 20202, 'Faysal Ovi', 1, 0, 'L', 1, 0, NULL, NULL, NULL, NULL, '2025-07-26 05:54:59', '2025-07-26 05:54:59'),
	(71, 42, 40202, 'Faysal Ovi - Profit', 1, 0, 'E', 1, 0, NULL, NULL, NULL, NULL, '2025-07-26 05:54:59', '2025-07-26 05:54:59'),
	(72, 11, 20203, 'SK Turag', 1, 0, 'L', 1, 0, NULL, NULL, NULL, NULL, '2025-07-26 05:56:27', '2025-07-26 05:56:27'),
	(73, 42, 40203, 'SK Turag - Profit', 1, 0, 'E', 1, 0, NULL, NULL, NULL, NULL, '2025-07-26 05:56:27', '2025-07-26 05:56:27'),
	(74, 11, 20204, 'Ibrahim Kholil', 1, 0, 'L', 1, 0, NULL, NULL, NULL, NULL, '2025-08-03 06:26:44', '2025-08-03 06:26:44'),
	(75, 42, 40204, 'Ibrahim Kholil - Profit', 1, 0, 'E', 1, 0, NULL, NULL, NULL, NULL, '2025-08-03 06:26:44', '2025-08-03 06:26:44'),
	(77, 11, 20205, 'Rana Ibrahim', 1, 0, 'L', 1, 0, NULL, NULL, NULL, NULL, '2025-08-04 00:29:56', '2025-08-04 00:29:56'),
	(78, 42, 40205, 'Rana Ibrahim - Profit', 1, 0, 'E', 1, 0, NULL, NULL, NULL, NULL, '2025-08-04 00:29:56', '2025-08-04 00:29:56'),
	(79, 11, 20206, 'Kartik Biswas', 1, 0, 'L', 1, 0, NULL, NULL, NULL, NULL, '2025-08-13 02:44:17', '2025-08-13 02:44:17'),
	(80, 42, 40206, 'Kartik Biswas - Profit', 1, 0, 'E', 1, 0, NULL, NULL, NULL, NULL, '2025-08-13 02:44:17', '2025-08-13 02:44:17'),
	(81, 2, 203, 'Share Equity', 0, 1, 'L', 1, 1, NULL, NULL, NULL, NULL, '2025-08-31 21:49:37', '2025-08-31 21:49:40'),
	(82, 81, 20301, 'Business Box', 1, 0, 'L', 1, 1, NULL, NULL, NULL, NULL, '2025-08-31 21:49:55', '2025-08-31 21:49:55'),
	(83, 11, 20207, 'Mamunur Rashid', 1, 0, 'L', 1, 0, NULL, NULL, NULL, NULL, '2025-08-31 22:36:09', '2025-08-31 22:36:09'),
	(84, 42, 40207, 'Mamunur Rashid - Profit', 1, 0, 'E', 1, 0, NULL, NULL, NULL, NULL, '2025-08-31 22:36:09', '2025-08-31 22:36:09'),
	(85, 4, 403, 'Operational Exp.', 0, 1, 'E', 1, 1, NULL, NULL, NULL, NULL, '2025-08-31 22:58:16', '2025-08-31 22:58:16'),
	(86, 4, 404, 'Documentation Exp.', 0, 1, 'E', 1, 1, NULL, NULL, NULL, NULL, '2025-08-31 22:59:00', '2025-08-31 22:59:00'),
	(87, 86, 40401, 'Agreement Prepare & Notery', 1, 0, 'E', 1, 1, NULL, NULL, NULL, NULL, '2025-08-31 22:59:10', '2025-08-31 22:59:10'),
	(89, 6, 10201, 'Electronics & Devices', 0, 1, 'A', 1, 1, NULL, NULL, NULL, NULL, '2025-08-31 22:59:50', '2025-08-31 22:59:50'),
	(90, 4, 405, 'Salary & Remunaration', 0, 1, 'E', 1, 1, NULL, NULL, NULL, NULL, '2025-08-31 23:00:06', '2025-08-31 23:00:17'),
	(91, 89, 1020101, 'Computer, Laptop, Printer', 1, 0, 'A', 1, 1, NULL, NULL, NULL, NULL, '2025-08-31 23:00:46', '2025-08-31 23:01:09'),
	(92, 27, 40101, 'Book Publication', 1, 0, 'E', 1, 1, NULL, NULL, NULL, NULL, '2025-08-31 23:08:37', '2025-08-31 23:08:37'),
	(93, 85, 40301, 'Stationary Equipment', 1, 0, 'E', 1, 1, NULL, NULL, NULL, NULL, '2025-08-31 23:19:14', '2025-08-31 23:19:14'),
	(94, 85, 40302, 'Books load unload', 1, 0, 'E', 1, 1, NULL, NULL, NULL, NULL, '2025-08-31 23:20:30', '2025-08-31 23:20:30'),
	(95, 85, 40303, 'Office Rent', 1, 0, 'E', 1, 1, NULL, NULL, NULL, NULL, '2025-08-31 23:23:35', '2025-08-31 23:23:35'),
	(96, 11, 20208, 'Abdullah Faysal', 1, 0, 'L', 1, 0, NULL, NULL, NULL, NULL, '2025-09-08 03:55:39', '2025-09-08 03:55:39'),
	(97, 42, 40208, 'Abdullah Faysal - Profit', 1, 0, 'E', 1, 0, NULL, NULL, NULL, NULL, '2025-09-08 03:55:39', '2025-09-08 03:55:39'),
	(98, 8, 1010202, 'Cash at CEO Sir', 1, 0, 'A', 1, 1, NULL, NULL, NULL, NULL, '2025-09-13 23:36:20', '2025-09-13 23:36:20'),
	(99, 89, 1020102, 'Mobile Purchase', 1, 0, 'A', 1, 1, NULL, NULL, NULL, NULL, '2025-09-18 04:29:43', '2025-09-18 04:29:43'),
	(100, 85, 40304, 'Book Purchase', 1, 0, 'E', 1, 1, NULL, NULL, NULL, NULL, '2025-09-18 04:41:25', '2025-09-18 04:41:25'),
	(101, 85, 40305, 'Food Expense', 1, 0, 'E', 1, 1, NULL, NULL, NULL, NULL, '2025-09-18 04:58:36', '2025-09-18 04:58:36'),
	(102, 85, 40306, 'Compose Expense', 1, 0, 'E', 1, 1, NULL, NULL, NULL, NULL, '2025-09-18 05:02:35', '2025-09-18 05:02:35'),
	(103, 85, 40307, 'Writer Expnese', 1, 0, 'E', 1, 1, NULL, NULL, NULL, NULL, '2025-09-18 05:02:50', '2025-09-18 05:02:50'),
	(104, 85, 40308, 'Proof Expense', 1, 0, 'E', 1, 1, NULL, NULL, NULL, NULL, '2025-09-18 05:03:04', '2025-09-18 05:03:04'),
	(105, 85, 40309, 'Conveyance Exp.', 1, 0, 'E', 1, 1, NULL, NULL, NULL, NULL, '2025-09-18 05:12:55', '2025-09-18 05:12:55'),
	(106, 85, 40310, 'Mobile Recharge', 1, 0, 'E', 1, 1, NULL, NULL, NULL, NULL, '2025-09-18 05:13:20', '2025-09-18 05:13:20'),
	(107, 85, 40311, 'Bkash Charge', 1, 0, 'E', 1, 1, NULL, NULL, NULL, NULL, '2025-09-18 05:13:32', '2025-09-18 05:13:32'),
	(108, 85, 40312, 'Miscellaneous Expenses', 1, 0, 'E', 1, 1, NULL, NULL, NULL, NULL, '2025-09-18 05:14:31', '2025-09-18 05:14:31'),
	(109, 85, 40313, 'Keyboard Purchase', 1, 0, 'E', 1, 1, NULL, NULL, NULL, NULL, '2025-09-18 05:27:32', '2025-09-18 05:27:32'),
	(110, 85, 40314, 'Packaging Expense', 1, 0, 'E', 1, 1, 10, NULL, NULL, NULL, '2025-09-19 23:33:12', '2025-09-19 23:33:12'),
	(111, 85, 40315, 'Computer Servicing', 1, 0, 'E', 1, 1, 10, NULL, NULL, NULL, '2025-09-20 00:44:36', '2025-09-20 00:44:36'),
	(112, 85, 40316, 'Print Expense', 1, 0, 'E', 1, 1, 10, NULL, NULL, NULL, '2025-09-20 00:48:44', '2025-09-20 00:48:44'),
	(113, 90, 40501, 'zakir saheb salary', 1, 0, 'E', 1, 1, 10, NULL, NULL, NULL, '2025-09-20 00:54:26', '2025-09-20 00:54:26'),
	(114, 85, 40317, 'Accessories Purchase', 1, 0, 'E', 1, 1, 10, 10, NULL, NULL, '2025-09-20 01:28:52', '2025-09-20 01:29:08'),
	(115, 85, 40318, 'Make up Expense', 1, 0, 'E', 1, 1, 10, NULL, NULL, NULL, '2025-09-20 01:40:00', '2025-09-20 01:40:00'),
	(116, 85, 40319, 'Pen Drive', 1, 0, 'E', 1, 1, 10, NULL, NULL, NULL, '2025-09-20 01:59:02', '2025-09-20 01:59:02'),
	(117, 85, 40320, 'Book Cover Designer', 1, 0, 'E', 1, 1, 10, NULL, NULL, NULL, '2025-09-20 03:01:06', '2025-09-20 03:01:06'),
	(118, 85, 40321, 'Shaju salary', 1, 0, 'E', 1, 1, 10, NULL, NULL, NULL, '2025-09-20 03:10:43', '2025-09-20 03:10:43'),
	(119, 85, 40322, 'Jahangir salary', 1, 0, 'E', 1, 1, 10, NULL, NULL, NULL, '2025-09-22 02:12:05', '2025-09-22 02:12:05'),
	(120, 85, 40323, 'Telephone and Internet', 1, 0, 'E', 1, 1, 10, NULL, NULL, NULL, '2025-09-22 02:38:24', '2025-09-22 02:38:24'),
	(121, 85, 40324, 'courier', 1, 0, 'E', 1, 1, 10, NULL, NULL, NULL, '2025-09-22 04:30:25', '2025-09-22 04:30:25'),
	(122, 85, 40325, 'TSO Mostofa', 1, 0, 'E', 1, 1, 10, NULL, NULL, NULL, '2025-09-22 04:46:23', '2025-09-22 04:46:23'),
	(123, 85, 40326, 'TSO Ali Ahmed', 1, 0, 'E', 1, 1, 10, NULL, NULL, NULL, '2025-09-22 04:57:01', '2025-09-22 04:57:01'),
	(124, 5, 10104, 'Loan/Advance', 0, 1, 'A', 1, 1, 10, NULL, NULL, NULL, '2025-10-13 00:04:24', '2025-10-13 00:04:24'),
	(125, 124, 1010401, 'Loan Zakir Saheb', 1, 0, 'A', 1, 1, 10, NULL, NULL, NULL, '2025-10-13 00:04:51', '2025-10-13 00:04:51'),
	(126, 124, 1010402, 'Loan Delowar Sir', 1, 0, 'A', 1, 1, 10, NULL, NULL, NULL, '2025-10-13 00:05:04', '2025-10-13 00:05:04'),
	(127, 7, 1010102, 'Apon Library', 1, 0, 'A', 1, 0, 10, NULL, NULL, NULL, '2025-10-25 00:36:24', '2025-10-25 00:36:24'),
	(128, 7, 1010103, 'Saiful Shaheb', 1, 0, 'A', 1, 0, 10, NULL, NULL, NULL, '2025-10-26 00:26:48', '2025-10-26 00:26:48'),
	(129, 7, 1010104, 'Ali Ahammad Bahar', 1, 0, 'A', 1, 0, 10, NULL, NULL, NULL, '2025-10-26 00:28:32', '2025-10-26 00:28:32'),
	(130, 7, 1010105, 'Tso Mostafa', 1, 0, 'A', 1, 0, 10, NULL, NULL, NULL, '2025-10-26 00:29:20', '2025-10-26 00:29:20'),
	(131, 7, 1010106, 'Moonlight Library', 1, 0, 'A', 1, 0, 10, 10, NULL, NULL, '2025-10-26 00:30:53', '2025-10-26 00:31:59'),
	(141, 7, 1010107, 'Tso Anamul', 1, 0, 'A', 1, 0, 10, NULL, NULL, NULL, '2025-10-26 03:04:53', '2025-10-26 03:04:53'),
	(142, 7, 1010108, 'Tso Bahar', 1, 0, 'A', 1, 0, 10, NULL, NULL, NULL, '2025-10-26 03:13:58', '2025-10-26 03:13:58'),
	(143, 7, 1010109, 'কারেন্ট লাইব্রেরী মালিবাগ', 1, 0, 'A', 1, 0, 10, 10, NULL, NULL, '2025-10-29 23:19:00', '2025-11-01 01:09:24'),
	(144, 7, 1010110, 'ইউনিটি বুক সাপ্লাই নীলক্ষেত (M)', 1, 0, 'A', 1, 0, 10, 10, NULL, NULL, '2025-10-29 23:23:27', '2025-11-01 01:06:57'),
	(145, 7, 1010111, 'গাজীপুর, মাওনা', 1, 0, 'A', 1, 0, 10, NULL, 10, '2025-11-01 01:12:16', '2025-11-01 01:12:07', '2025-11-01 01:12:16'),
	(146, 7, 1010112, 'গাজীপুর, মাওনা', 1, 0, 'A', 1, 0, 10, NULL, NULL, NULL, '2025-11-01 01:12:07', '2025-11-01 01:12:07'),
	(147, 7, 1010113, 'সাভার', 1, 0, 'A', 1, 0, 10, NULL, NULL, NULL, '2025-11-01 01:12:54', '2025-11-01 01:12:54'),
	(148, 7, 1010114, 'পিরোজপুর', 1, 0, 'A', 1, 0, 10, NULL, NULL, NULL, '2025-11-01 01:24:22', '2025-11-01 01:24:22'),
	(149, 7, 1010115, 'পটুয়াখালী', 1, 0, 'A', 1, 0, 10, NULL, NULL, NULL, '2025-11-01 01:24:55', '2025-11-01 01:24:55'),
	(150, 7, 1010116, 'বরগুনা', 1, 0, 'A', 1, 0, 10, NULL, NULL, NULL, '2025-11-01 01:30:07', '2025-11-01 01:30:07'),
	(151, 7, 1010117, 'যশোর', 1, 0, 'A', 1, 0, 10, NULL, NULL, NULL, '2025-11-01 01:32:05', '2025-11-01 01:32:05'),
	(152, 7, 1010118, 'নোয়াপাড়া', 1, 0, 'A', 1, 0, 10, NULL, NULL, NULL, '2025-11-01 01:32:49', '2025-11-01 01:32:49'),
	(153, 7, 1010119, 'শেরপুর', 1, 0, 'A', 1, 0, 10, NULL, NULL, NULL, '2025-11-01 01:33:32', '2025-11-01 01:33:32'),
	(154, 7, 1010120, 'জামালপুর', 1, 0, 'A', 1, 0, 10, NULL, NULL, NULL, '2025-11-01 01:34:07', '2025-11-01 01:34:07'),
	(155, 7, 1010121, 'নেত্রকোনা', 1, 0, 'A', 1, 0, 10, NULL, NULL, NULL, '2025-11-01 01:34:30', '2025-11-01 01:34:30'),
	(156, 7, 1010122, 'টাঙ্গাইল', 1, 0, 'A', 1, 0, 10, NULL, NULL, NULL, '2025-11-01 01:35:09', '2025-11-01 01:35:09'),
	(157, 7, 1010123, 'ময়মনসিংহ', 1, 0, 'A', 1, 0, 10, NULL, NULL, NULL, '2025-11-01 01:36:08', '2025-11-01 01:36:08'),
	(158, 7, 1010124, 'চাঁদপুর', 1, 0, 'A', 1, 0, 10, NULL, NULL, NULL, '2025-11-01 01:36:45', '2025-11-01 01:36:45'),
	(159, 7, 1010125, 'কুমিল্লা', 1, 0, 'A', 1, 0, 10, NULL, NULL, NULL, '2025-11-01 01:37:12', '2025-11-01 01:37:12'),
	(160, 7, 1010126, 'চট্টগ্রাম', 1, 0, 'A', 1, 0, 10, NULL, NULL, NULL, '2025-11-01 01:37:41', '2025-11-01 01:37:41'),
	(161, 7, 1010127, 'ফেনী', 1, 0, 'A', 1, 0, 10, NULL, NULL, NULL, '2025-11-01 01:38:15', '2025-11-01 01:38:15'),
	(162, 7, 1010128, 'সিলেট', 1, 0, 'A', 1, 0, 10, NULL, NULL, NULL, '2025-11-01 01:39:40', '2025-11-01 01:39:40'),
	(163, 7, 1010129, 'হবিগঞ্জ', 1, 0, 'A', 1, 0, 10, NULL, NULL, NULL, '2025-11-01 01:40:24', '2025-11-01 01:40:24'),
	(164, 7, 1010130, 'মৌলভীবাজার', 1, 0, 'A', 1, 0, 10, NULL, NULL, NULL, '2025-11-01 01:44:44', '2025-11-01 01:44:44'),
	(165, 7, 1010131, 'সুনামগঞ্জ', 1, 0, 'A', 1, 0, 10, NULL, NULL, NULL, '2025-11-01 01:45:35', '2025-11-01 01:45:35'),
	(166, 7, 1010132, 'ঝালকাঠি', 1, 0, 'A', 1, 0, 10, NULL, NULL, NULL, '2025-11-01 01:46:31', '2025-11-01 01:46:31'),
	(167, 7, 1010133, 'ভোলা', 1, 0, 'A', 1, 0, 10, NULL, NULL, NULL, '2025-11-01 01:47:19', '2025-11-01 01:47:19'),
	(168, 7, 1010134, 'নীলক্ষেত', 1, 0, 'A', 1, 0, 10, NULL, NULL, NULL, '2025-11-01 01:47:43', '2025-11-01 01:47:43'),
	(169, 7, 1010135, 'নরসিংদী', 1, 0, 'A', 1, 0, 10, NULL, NULL, NULL, '2025-11-01 01:48:14', '2025-11-01 01:48:14'),
	(170, 7, 1010136, 'মাধবদী, নরসিংদী', 1, 0, 'A', 1, 0, 10, NULL, NULL, NULL, '2025-11-01 01:49:38', '2025-11-01 01:49:38'),
	(171, 7, 1010137, 'মুন্সীগঞ্জ,', 1, 0, 'A', 1, 0, 10, NULL, NULL, NULL, '2025-11-01 01:50:07', '2025-11-01 01:50:07'),
	(172, 7, 1010138, 'নারায়ণগঞ্জ', 1, 0, 'A', 1, 0, 10, NULL, NULL, NULL, '2025-11-01 01:50:46', '2025-11-01 01:50:46'),
	(173, 7, 1010139, 'সিরাজগঞ্জ', 1, 0, 'A', 1, 0, 10, NULL, NULL, NULL, '2025-11-01 01:52:22', '2025-11-01 01:52:22'),
	(174, 7, 1010140, 'পাবনা', 1, 0, 'A', 1, 0, 10, NULL, NULL, NULL, '2025-11-01 01:52:57', '2025-11-01 01:52:57'),
	(175, 7, 1010141, 'রাজশাহী', 1, 0, 'A', 1, 0, 10, NULL, NULL, NULL, '2025-11-01 01:53:28', '2025-11-01 01:53:28'),
	(176, 7, 1010142, 'বগুড়া', 1, 0, 'A', 1, 0, 10, NULL, NULL, NULL, '2025-11-01 01:54:07', '2025-11-01 01:54:07'),
	(177, 7, 1010143, 'ঈশ্বরদী', 1, 0, 'A', 1, 0, 10, NULL, NULL, NULL, '2025-11-01 01:55:02', '2025-11-01 01:55:02'),
	(178, 7, 1010144, 'চাঁপাইনবাবগঞ্জ', 1, 0, 'A', 1, 0, 10, NULL, NULL, NULL, '2025-11-01 01:55:34', '2025-11-01 01:55:34'),
	(179, 7, 1010145, 'চাঁপাইনবাবগঞ্জ', 1, 0, 'A', 1, 0, 10, NULL, 10, '2025-11-01 01:55:58', '2025-11-01 01:55:34', '2025-11-01 01:55:58'),
	(180, 7, 1010146, 'নওগাঁ', 1, 0, 'A', 1, 0, 10, NULL, NULL, NULL, '2025-11-01 01:56:49', '2025-11-01 01:56:49'),
	(181, 7, 1010147, 'রংপুর', 1, 0, 'A', 1, 0, 10, NULL, NULL, NULL, '2025-11-01 01:57:25', '2025-11-01 01:57:25'),
	(182, 7, 1010148, 'পঞ্চগড়', 1, 0, 'A', 1, 0, 10, NULL, NULL, NULL, '2025-11-01 01:57:51', '2025-11-01 01:57:51'),
	(183, 7, 1010149, 'দিনাজপুর', 1, 0, 'A', 1, 0, 10, NULL, NULL, NULL, '2025-11-01 01:58:55', '2025-11-01 01:58:55'),
	(184, 7, 1010150, 'গাইবান্ধা', 1, 0, 'A', 1, 0, 10, NULL, NULL, NULL, '2025-11-01 01:59:28', '2025-11-01 01:59:28'),
	(185, 7, 1010151, 'লালমনিরহাট', 1, 0, 'A', 1, 0, 10, NULL, NULL, NULL, '2025-11-01 01:59:46', '2025-11-01 01:59:46'),
	(186, 7, 1010152, 'কুষ্টিয়া', 1, 0, 'A', 1, 0, 10, NULL, NULL, NULL, '2025-11-01 02:00:34', '2025-11-01 02:00:34'),
	(187, 7, 1010153, 'সোহাগ বুক ডিপো', 1, 0, 'A', 1, 0, 10, NULL, NULL, NULL, '2025-11-02 02:43:36', '2025-11-02 02:43:36'),
	(188, 7, 1010154, 'খুলনা', 1, 0, 'A', 1, 0, 10, NULL, NULL, NULL, '2025-11-02 03:01:26', '2025-11-02 03:01:26'),
	(189, 7, 1010155, 'বরিশাল', 1, 0, 'A', 1, 0, 10, NULL, NULL, NULL, '2025-11-02 03:06:19', '2025-11-02 03:06:19'),
	(190, 6, 10202, 'Funtiture', 0, 1, 'A', 1, 1, NULL, NULL, NULL, NULL, '2025-11-18 09:49:02', '2025-11-18 09:49:02'),
	(191, 190, 1020201, 'Funtiture Purchase', 1, 0, 'A', 1, 1, NULL, NULL, NULL, NULL, '2025-11-18 09:49:27', '2025-11-18 09:49:43'),
	(192, 85, 40327, 'Software', 1, 0, 'E', 1, 1, NULL, NULL, NULL, NULL, '2025-11-18 09:55:25', '2025-11-18 09:55:25'),
	(193, 85, 40328, 'Domain & Hosting Bill', 1, 0, 'E', 1, 1, NULL, NULL, NULL, NULL, '2025-11-18 09:59:44', '2025-11-18 09:59:44'),
	(194, 27, 40102, 'Bad Depth', 1, 0, 'E', 1, 1, 10, 10, NULL, NULL, '2025-11-19 00:57:57', '2025-12-31 05:55:44'),
	(195, 11, 20209, 'Mehedi Khan', 1, 0, 'L', 1, 0, 10, NULL, NULL, NULL, '2025-11-22 22:29:00', '2025-11-22 22:29:00'),
	(196, 42, 40209, 'Mehedi Khan - Profit', 1, 0, 'E', 1, 0, 10, NULL, NULL, NULL, '2025-11-22 22:29:00', '2025-11-22 22:29:00'),
	(197, 11, 20210, 'Al Emran', 1, 0, 'L', 1, 0, 10, NULL, NULL, NULL, '2025-11-22 23:09:01', '2025-11-22 23:09:01'),
	(198, 42, 40210, 'Al Emran - Profit', 1, 0, 'E', 1, 0, 10, NULL, NULL, NULL, '2025-11-22 23:09:01', '2025-11-22 23:09:01'),
	(199, 11, 20211, 'Subal Mahato Rahul', 1, 0, 'L', 1, 0, 10, NULL, NULL, NULL, '2025-11-22 23:10:18', '2025-11-22 23:10:18'),
	(200, 42, 40211, 'Subal Mahato Rahul - Profit', 1, 0, 'E', 1, 0, 10, NULL, NULL, NULL, '2025-11-22 23:10:18', '2025-11-22 23:10:18'),
	(201, 11, 20212, 'মুফতি মাওলানা আব্দুল্লাহ', 1, 0, 'L', 1, 0, 10, NULL, NULL, NULL, '2025-11-22 23:11:49', '2025-11-22 23:11:49'),
	(202, 42, 40212, 'মুফতি মাওলানা আব্দুল্লাহ - Profit', 1, 0, 'E', 1, 0, 10, NULL, NULL, NULL, '2025-11-22 23:11:49', '2025-11-22 23:11:49'),
	(203, 11, 20213, 'Islam Zahirul', 1, 0, 'L', 1, 0, 10, NULL, NULL, NULL, '2025-11-23 00:05:32', '2025-11-23 00:05:32'),
	(204, 42, 40213, 'Islam Zahirul - Profit', 1, 0, 'E', 1, 0, 10, NULL, NULL, NULL, '2025-11-23 00:05:32', '2025-11-23 00:05:32'),
	(205, 89, 1020103, 'Plate Purchase', 1, 0, 'A', 1, 1, 10, NULL, NULL, NULL, '2025-11-24 00:24:23', '2025-11-24 00:24:23'),
	(206, 6, 10203, 'Books Plate', 0, 1, 'A', 1, 1, 10, NULL, NULL, NULL, '2025-11-24 00:37:57', '2025-11-24 00:37:57'),
	(207, 11, 20214, 'Abeda Sultana', 1, 0, 'L', 1, 0, 10, NULL, NULL, NULL, '2025-11-24 00:39:55', '2025-11-24 00:39:55'),
	(208, 42, 40214, 'Abeda Sultana - Profit', 1, 0, 'E', 1, 0, 10, NULL, NULL, NULL, '2025-11-24 00:39:55', '2025-11-24 00:39:55'),
	(209, 206, 1020301, 'বিদ্যুৎ বিভাগ নিয়োগ সহায়ীকা', 1, 0, 'A', 1, 1, 10, NULL, NULL, NULL, '2025-11-24 00:42:46', '2025-11-24 00:42:46'),
	(210, 4, 406, 'Marketing Expense', 0, 1, 'E', 1, 1, 10, NULL, NULL, NULL, '2025-11-24 01:21:27', '2025-11-24 01:21:27'),
	(211, 210, 40601, 'বিদ্যুৎ বিভাগ নিয়োগ সহায়ীকা', 1, 0, 'E', 1, 1, 10, 10, NULL, NULL, '2025-11-24 01:21:38', '2025-11-24 01:21:55'),
	(212, 206, 1020302, 'বিজিবি নিয়োগ সহায়ীকা', 1, 0, 'A', 1, 1, 10, NULL, NULL, NULL, '2025-11-24 03:33:46', '2025-11-24 03:33:46'),
	(213, 210, 40602, 'বিজিবি নিয়োগ সহায়ীকা', 1, 0, 'E', 1, 1, 10, NULL, NULL, NULL, '2025-11-24 03:33:53', '2025-11-24 03:33:53'),
	(214, 85, 40329, 'Comp. Correction Makeup', 1, 0, 'E', 1, 1, 10, NULL, NULL, NULL, '2025-11-24 03:40:49', '2025-11-24 03:40:49'),
	(215, 206, 1020303, 'সাস্থ সহকারী নিয়োগ সহায়ীকা', 1, 0, 'A', 1, 1, 10, NULL, NULL, NULL, '2025-11-24 03:47:08', '2025-11-24 03:47:08'),
	(216, 210, 40603, 'সাস্থ সহকারী নিয়োগ সহায়ীকা', 1, 0, 'E', 1, 1, 10, NULL, NULL, NULL, '2025-11-24 03:47:19', '2025-11-24 03:47:19'),
	(217, 206, 1020304, 'পানি উন্নয়ন বোর্ড নিয়োগ সহায়ীকা', 1, 0, 'A', 1, 1, 10, NULL, NULL, NULL, '2025-11-24 03:52:23', '2025-11-24 03:52:23'),
	(218, 210, 40604, 'পানি উন্নয়ন বোর্ড নিয়োগ সহায়ীকা', 1, 0, 'E', 1, 1, 10, NULL, NULL, NULL, '2025-11-24 03:52:32', '2025-11-24 03:52:32'),
	(219, 210, 40605, 'পুলিশ নিয়োগ সহায়ীকা', 1, 0, 'E', 1, 1, 10, NULL, NULL, NULL, '2025-11-24 04:48:08', '2025-11-24 04:48:08'),
	(220, 206, 1020305, 'নৌ, সেনা, বিমান নিয়োগ সহায়ীকা', 1, 0, 'A', 1, 1, 10, NULL, NULL, NULL, '2025-11-25 00:34:36', '2025-11-25 00:34:36'),
	(221, 210, 40606, 'নৌ, সেনা, বিমান নিয়োগ সহায়ীকা', 1, 0, 'E', 1, 1, 10, NULL, NULL, NULL, '2025-11-25 00:34:42', '2025-11-25 00:34:42'),
	(222, 206, 1020306, 'প্রাথমিক শিক্ষক নিয়োগ সহায়ীকা', 1, 0, 'A', 1, 1, 10, 10, NULL, NULL, '2025-11-25 04:17:56', '2025-11-25 04:18:16'),
	(223, 210, 40607, 'প্রাথমিক শিক্ষক নিয়োগ সহায়ীকা', 1, 0, 'E', 1, 1, 10, NULL, NULL, NULL, '2025-11-25 04:18:22', '2025-11-25 04:18:22'),
	(224, 7, 1010156, 'Unkown Sales', 1, 0, 'A', 1, 1, 10, NULL, NULL, NULL, '2025-11-25 04:26:13', '2025-11-25 04:26:13'),
	(225, 11, 20215, 'Ahmedul Haq', 1, 0, 'L', 1, 0, 10, NULL, NULL, NULL, '2025-11-25 23:04:21', '2025-11-25 23:04:21'),
	(226, 42, 40215, 'Ahmedul Haq - Profit', 1, 0, 'E', 1, 0, 10, NULL, NULL, NULL, '2025-11-25 23:04:21', '2025-11-25 23:04:21'),
	(227, 210, 40608, 'Branding & Promotion Expense', 1, 0, 'E', 1, 1, 10, NULL, NULL, NULL, '2025-12-10 06:31:47', '2025-12-10 06:31:47'),
	(228, 7, 1010157, 'ঝিনাইদাহ', 1, 0, 'A', 1, 0, 10, NULL, NULL, NULL, '2025-12-21 21:52:04', '2025-12-21 21:52:04'),
	(229, 7, 1010158, 'মীরপুর (১০)', 1, 0, 'A', 1, 0, 10, NULL, NULL, NULL, '2025-12-21 21:54:34', '2025-12-21 21:54:34'),
	(230, 7, 1010159, 'মীরপুর (2)', 1, 0, 'A', 1, 0, 10, NULL, NULL, NULL, '2025-12-21 21:54:52', '2025-12-21 21:54:52'),
	(231, 7, 1010160, 'ফার্মগেট', 1, 0, 'A', 1, 0, 10, NULL, NULL, NULL, '2025-12-21 21:55:10', '2025-12-21 21:55:10'),
	(232, 7, 1010161, 'নেক্সাস', 1, 0, 'A', 1, 0, 10, NULL, NULL, NULL, '2025-12-23 21:46:21', '2025-12-23 21:46:21'),
	(233, 6, 10204, 'Documentation', 0, 1, 'A', 1, 1, 10, NULL, NULL, NULL, '2025-12-31 05:16:26', '2025-12-31 05:16:26'),
	(234, 233, 1020401, 'Membership Fee', 1, 0, 'A', 1, 1, 10, NULL, NULL, NULL, '2025-12-31 05:17:04', '2025-12-31 05:17:04'),
	(235, 233, 1020402, 'Trade License', 1, 0, 'A', 1, 1, 10, NULL, NULL, NULL, '2025-12-31 05:27:17', '2025-12-31 05:27:17'),
	(236, 7, 1010162, 'Saiful Shaheb', 1, 0, 'A', 1, 1, 10, NULL, NULL, NULL, '2025-12-31 05:55:24', '2025-12-31 05:55:24'),
	(237, 206, 1020307, 'পুলিশ কনস্টেবল নিয়োগ সহায়িকা', 1, 0, 'A', 1, 1, 10, NULL, NULL, NULL, '2025-12-31 06:14:48', '2025-12-31 06:14:48'),
	(238, 206, 1020308, 'Cover Plate', 1, 0, 'A', 1, 1, 10, NULL, NULL, NULL, '2025-12-31 06:24:03', '2025-12-31 06:24:03'),
	(239, 210, 40609, 'Paper Expense', 1, 0, 'E', 1, 1, 10, NULL, NULL, NULL, '2025-12-31 06:26:54', '2025-12-31 06:26:54'),
	(240, 210, 40610, 'Cover Board', 1, 0, 'E', 1, 1, 10, NULL, NULL, NULL, '2025-12-31 06:28:41', '2025-12-31 06:28:41'),
	(241, 210, 40611, 'Cover Print', 1, 0, 'E', 1, 1, 10, NULL, NULL, NULL, '2025-12-31 06:28:51', '2025-12-31 06:28:51'),
	(242, 210, 40612, 'Cover Lamination', 1, 0, 'E', 1, 1, 10, NULL, NULL, NULL, '2025-12-31 06:29:05', '2025-12-31 06:29:05'),
	(243, 210, 40613, 'Forma Print', 1, 0, 'E', 1, 1, 10, NULL, NULL, NULL, '2025-12-31 06:29:30', '2025-12-31 06:29:30'),
	(244, 85, 40330, 'Binding', 1, 0, 'E', 1, 1, 10, NULL, NULL, NULL, '2025-12-31 06:29:49', '2025-12-31 06:29:49'),
	(245, 85, 40331, 'Salary Expense', 1, 0, 'E', 1, 1, 10, NULL, NULL, NULL, '2025-12-31 09:51:16', '2025-12-31 09:51:16'),
	(246, 210, 40614, 'Marketing', 1, 0, 'E', 1, 1, 10, 10, NULL, NULL, '2025-12-31 09:52:37', '2025-12-31 09:52:46'),
	(247, 85, 40332, 'Rokomari Ad', 1, 0, 'E', 1, 1, 10, NULL, NULL, NULL, '2025-12-31 09:53:01', '2025-12-31 09:53:01'),
	(248, 210, 40615, 'Business Card/ Pad', 1, 0, 'E', 1, 1, 10, NULL, NULL, NULL, '2025-12-31 09:54:56', '2025-12-31 09:54:56'),
	(249, 210, 40616, 'Poster', 1, 0, 'E', 1, 1, 10, NULL, NULL, NULL, '2025-12-31 09:55:09', '2025-12-31 09:55:09'),
	(250, 85, 40333, 'Office Expense', 1, 0, 'E', 1, 1, 10, NULL, NULL, NULL, '2025-12-31 09:55:25', '2025-12-31 09:55:25'),
	(252, 85, 40334, 'Printing Paper', 1, 0, 'E', 1, 1, 10, NULL, NULL, NULL, '2025-12-31 09:59:53', '2025-12-31 09:59:53'),
	(253, 85, 40335, 'Faisal Printing', 1, 0, 'E', 1, 1, 10, NULL, NULL, NULL, '2025-12-31 10:00:12', '2025-12-31 10:00:12'),
	(254, 85, 40336, 'Compose/Proof etc', 1, 0, 'E', 1, 1, 10, NULL, NULL, NULL, '2025-12-31 10:00:52', '2025-12-31 10:00:52'),
	(255, 210, 40617, 'transport', 1, 0, 'E', 1, 1, 28, NULL, NULL, NULL, '2026-01-01 01:28:13', '2026-01-01 01:28:13'),
	(256, 11, 20216, 'Ashfaque Rahman', 1, 0, 'L', 1, 0, NULL, NULL, NULL, NULL, '2026-01-01 01:45:27', '2026-01-01 01:45:27'),
	(257, 42, 40216, 'Ashfaque Rahman - Profit', 1, 0, 'E', 1, 0, NULL, NULL, NULL, NULL, '2026-01-01 01:45:27', '2026-01-01 01:45:27'),
	(258, 11, 20217, 'Md. Zakir Hossain suny', 1, 0, 'L', 1, 0, NULL, NULL, NULL, NULL, '2026-01-08 00:50:14', '2026-01-08 00:50:14'),
	(259, 42, 40217, 'Md. Zakir Hossain suny - Profit', 1, 0, 'E', 1, 0, NULL, NULL, NULL, NULL, '2026-01-08 00:50:14', '2026-01-08 00:50:14'),
	(260, 85, 40337, 'Tso Enamul Haque', 1, 0, 'E', 1, 1, 28, NULL, NULL, NULL, '2026-01-11 09:25:24', '2026-01-11 09:25:24'),
	(261, 85, 40338, 'TSO Enamul Haque Salary', 1, 0, 'E', 1, 1, 28, NULL, NULL, NULL, '2026-01-11 09:27:07', '2026-01-11 09:27:07'),
	(262, 85, 40339, 'Crockeries', 1, 0, 'E', 1, 1, 28, 28, NULL, NULL, '2026-01-12 01:14:19', '2026-01-12 01:15:34'),
	(263, 85, 40340, 'Furniture Purchese', 1, 0, 'E', 1, 1, 28, NULL, NULL, NULL, '2026-01-14 09:56:20', '2026-01-14 09:56:20'),
	(264, 206, 1020309, 'জেনারেল নলেজ', 1, 0, 'A', 1, 1, NULL, NULL, NULL, NULL, '2026-01-14 23:18:14', '2026-01-14 23:18:14'),
	(265, 206, 1020310, 'Inner Plate (4 books)', 1, 0, 'A', 1, 1, NULL, NULL, NULL, NULL, '2026-01-19 09:16:09', '2026-01-19 09:16:09'),
	(266, 85, 40341, 'Internet Connection', 1, 0, 'E', 1, 1, NULL, NULL, NULL, NULL, '2026-01-20 22:01:23', '2026-01-20 22:01:23'),
	(267, 85, 40342, 'Stove', 1, 0, 'E', 1, 1, NULL, NULL, NULL, NULL, '2026-01-20 22:01:56', '2026-01-20 22:01:56'),
	(268, 85, 40343, 'carpet', 1, 0, 'E', 1, 1, NULL, NULL, NULL, NULL, '2026-01-20 22:02:45', '2026-01-20 22:02:45'),
	(269, 7, 1010163, 'রকমারি', 1, 0, 'A', 1, 0, NULL, NULL, NULL, NULL, '2026-01-24 05:23:13', '2026-01-24 05:23:13'),
	(270, 7, 1010164, 'নাটোর', 1, 0, 'A', 1, 0, NULL, NULL, NULL, NULL, '2026-01-30 09:35:18', '2026-01-30 09:35:18'),
	(271, 7, 1010165, 'পপুলার লাইব্রেরী ক্তাগাছা, ময়মনসিংহ', 1, 0, 'A', 1, 0, NULL, NULL, NULL, NULL, '2026-01-30 09:52:50', '2026-01-30 09:52:50'),
	(272, 7, 1010166, 'আরাফাত লাইব্রেরী ক্তাগাছা, ময়মনসিংহ', 1, 0, 'A', 1, 0, NULL, NULL, NULL, NULL, '2026-01-30 09:53:11', '2026-01-30 09:53:11'),
	(273, 7, 1010167, 'ঠাকুর গাঁও', 1, 0, 'A', 1, 0, NULL, NULL, NULL, NULL, '2026-02-04 05:38:55', '2026-02-04 05:38:55'),
	(274, 85, 40344, 'bKash Charge', 1, 0, 'E', 1, 1, 10, NULL, NULL, NULL, '2026-02-14 09:47:03', '2026-02-14 09:47:03'),
	(277, 7, 1010168, 'Aira', 1, 0, 'A', 1, 0, NULL, NULL, NULL, NULL, '2026-03-03 22:43:38', '2026-03-03 22:43:38'),
	(278, 7, 1010169, 'Mitul', 1, 0, 'A', 1, 0, NULL, NULL, NULL, NULL, '2026-03-03 22:57:35', '2026-03-03 22:59:46'),
	(279, 7, 1010170, 'Admin', 1, 0, 'A', 1, 0, NULL, NULL, NULL, NULL, '2026-03-03 23:04:39', '2026-03-03 23:04:39'),
	(280, 7, 1010171, 'warid', 1, 0, 'A', 1, 0, NULL, NULL, NULL, NULL, '2026-03-04 00:34:21', '2026-03-04 00:34:42'),
	(281, 7, 1010172, 'Wali', 1, 0, 'A', 1, 0, 10, NULL, NULL, NULL, '2026-03-13 21:53:58', '2026-03-13 21:53:58');

-- Dumping structure for table airas_mart.collections
DROP TABLE IF EXISTS `collections`;
CREATE TABLE IF NOT EXISTS `collections` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint unsigned NOT NULL,
  `coa_id` bigint unsigned DEFAULT NULL,
  `sales_id` bigint unsigned DEFAULT NULL,
  `sales_return_id` bigint unsigned DEFAULT NULL,
  `payment_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `payment_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `collection_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `collections_payment_no_unique` (`payment_no`),
  KEY `collections_client_id_foreign` (`client_id`),
  KEY `collections_coa_id_foreign` (`coa_id`),
  KEY `collections_sales_id_foreign` (`sales_id`),
  KEY `collections_sales_return_id_foreign` (`sales_return_id`),
  KEY `collections_created_by_foreign` (`created_by`),
  KEY `collections_updated_by_foreign` (`updated_by`),
  KEY `collections_deleted_by_foreign` (`deleted_by`),
  CONSTRAINT `collections_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `collections_coa_id_foreign` FOREIGN KEY (`coa_id`) REFERENCES `coas` (`id`) ON DELETE SET NULL,
  CONSTRAINT `collections_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `collections_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `collections_sales_id_foreign` FOREIGN KEY (`sales_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE,
  CONSTRAINT `collections_sales_return_id_foreign` FOREIGN KEY (`sales_return_id`) REFERENCES `sales_returns` (`id`) ON DELETE CASCADE,
  CONSTRAINT `collections_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.collections: ~0 rows (approximately)
DELETE FROM `collections`;

-- Dumping structure for table airas_mart.collection_lists
DROP TABLE IF EXISTS `collection_lists`;
CREATE TABLE IF NOT EXISTS `collection_lists` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `collection_id` bigint unsigned NOT NULL,
  `sales_id` bigint unsigned NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `collection_lists_collection_id_foreign` (`collection_id`),
  KEY `collection_lists_sales_id_foreign` (`sales_id`),
  CONSTRAINT `collection_lists_collection_id_foreign` FOREIGN KEY (`collection_id`) REFERENCES `collections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `collection_lists_sales_id_foreign` FOREIGN KEY (`sales_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.collection_lists: ~0 rows (approximately)
DELETE FROM `collection_lists`;

-- Dumping structure for table airas_mart.expenses
DROP TABLE IF EXISTS `expenses`;
CREATE TABLE IF NOT EXISTS `expenses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `coa_id` bigint unsigned NOT NULL,
  `transaction_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `remarks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `document` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(16,2) NOT NULL DEFAULT '0.00',
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `expenses_transaction_no_unique` (`transaction_no`),
  KEY `expenses_coa_id_foreign` (`coa_id`),
  KEY `expenses_created_by_foreign` (`created_by`),
  KEY `expenses_updated_by_foreign` (`updated_by`),
  KEY `expenses_deleted_by_foreign` (`deleted_by`),
  CONSTRAINT `expenses_coa_id_foreign` FOREIGN KEY (`coa_id`) REFERENCES `coas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `expenses_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `expenses_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `expenses_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.expenses: ~0 rows (approximately)
DELETE FROM `expenses`;

-- Dumping structure for table airas_mart.expense_items
DROP TABLE IF EXISTS `expense_items`;
CREATE TABLE IF NOT EXISTS `expense_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `expense_id` bigint unsigned NOT NULL,
  `coa_id` bigint unsigned NOT NULL,
  `amount` decimal(16,2) NOT NULL DEFAULT '0.00',
  `is_distributed` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `expense_items_expense_id_foreign` (`expense_id`),
  KEY `expense_items_coa_id_foreign` (`coa_id`),
  CONSTRAINT `expense_items_coa_id_foreign` FOREIGN KEY (`coa_id`) REFERENCES `coas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `expense_items_expense_id_foreign` FOREIGN KEY (`expense_id`) REFERENCES `expenses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.expense_items: ~0 rows (approximately)
DELETE FROM `expense_items`;

-- Dumping structure for table airas_mart.failed_jobs
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.failed_jobs: ~0 rows (approximately)
DELETE FROM `failed_jobs`;

-- Dumping structure for table airas_mart.home_sections
DROP TABLE IF EXISTS `home_sections`;
CREATE TABLE IF NOT EXISTS `home_sections` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('Category Product','Trending Product','New Product','Featured Category','Category Carousel','Popular Writter','Banner','Brand') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` bigint unsigned DEFAULT NULL,
  `serial` int NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `home_sections_category_id_foreign` (`category_id`),
  CONSTRAINT `home_sections_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.home_sections: ~0 rows (approximately)
DELETE FROM `home_sections`;

-- Dumping structure for table airas_mart.home_section_categories
DROP TABLE IF EXISTS `home_section_categories`;
CREATE TABLE IF NOT EXISTS `home_section_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `home_section_id` bigint unsigned NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `home_section_categories_home_section_id_foreign` (`home_section_id`),
  KEY `home_section_categories_category_id_foreign` (`category_id`),
  CONSTRAINT `home_section_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `home_section_categories_home_section_id_foreign` FOREIGN KEY (`home_section_id`) REFERENCES `home_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.home_section_categories: ~0 rows (approximately)
DELETE FROM `home_section_categories`;

-- Dumping structure for table airas_mart.investors
DROP TABLE IF EXISTS `investors`;
CREATE TABLE IF NOT EXISTS `investors` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `coa_id` bigint unsigned DEFAULT NULL,
  `profit_head` bigint unsigned DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `nid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `document` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bkash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rocket` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nagad` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profit_percentage` int NOT NULL DEFAULT '40',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `investors_user_id_foreign` (`user_id`),
  KEY `investors_coa_id_foreign` (`coa_id`),
  KEY `investors_profit_head_foreign` (`profit_head`),
  KEY `investors_created_by_foreign` (`created_by`),
  KEY `investors_updated_by_foreign` (`updated_by`),
  KEY `investors_deleted_by_foreign` (`deleted_by`),
  CONSTRAINT `investors_coa_id_foreign` FOREIGN KEY (`coa_id`) REFERENCES `coas` (`id`) ON DELETE SET NULL,
  CONSTRAINT `investors_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `investors_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `investors_profit_head_foreign` FOREIGN KEY (`profit_head`) REFERENCES `coas` (`id`) ON DELETE SET NULL,
  CONSTRAINT `investors_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `investors_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.investors: ~16 rows (approximately)
DELETE FROM `investors`;
INSERT INTO `investors` (`id`, `user_id`, `coa_id`, `profit_head`, `name`, `image`, `email`, `phone`, `address`, `nid`, `document`, `bkash`, `rocket`, `nagad`, `bank`, `branch`, `account_name`, `account_no`, `profit_percentage`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(3, 14, 70, 71, 'Faysal Ovi', NULL, NULL, '01819809095', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 40, 1, NULL, NULL, NULL, NULL, '2025-07-26 05:54:59', '2025-07-26 05:54:59'),
	(4, 15, 72, 73, 'SK Turag', NULL, NULL, '01611869202', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 40, 1, NULL, NULL, NULL, NULL, '2025-07-26 05:56:27', '2025-07-26 05:56:27'),
	(5, 16, 74, 75, 'Ibrahim Kholil', NULL, NULL, '01716552438', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 40, 1, NULL, NULL, NULL, NULL, '2025-08-03 06:26:44', '2025-08-03 06:26:44'),
	(6, 17, 77, 78, 'Rana Ibrahim', NULL, NULL, '01891794391', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 40, 1, NULL, NULL, NULL, NULL, '2025-08-04 00:29:56', '2025-08-04 00:29:56'),
	(7, 18, 79, 80, 'Kartik Biswas', NULL, NULL, '01717363833', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 40, 1, NULL, NULL, NULL, NULL, '2025-08-13 02:44:17', '2025-08-13 02:44:17'),
	(8, 19, 83, 84, 'Mamunur Rashid', NULL, NULL, '01916304877', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 40, 1, NULL, NULL, NULL, NULL, '2025-08-31 22:36:09', '2025-08-31 22:36:09'),
	(9, 20, 96, 97, 'Abdullah Faysal', NULL, NULL, '01920622566', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 40, 1, NULL, NULL, NULL, NULL, '2025-09-08 03:55:39', '2025-09-08 03:55:39'),
	(10, 21, 195, 196, 'Mehedi Khan', NULL, NULL, '01911592580', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 40, 1, 10, NULL, NULL, NULL, '2025-11-22 22:29:00', '2025-11-22 22:29:00'),
	(11, 22, 197, 198, 'Al Emran', NULL, NULL, '01836599470', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 40, 1, 10, NULL, NULL, NULL, '2025-11-22 23:09:01', '2025-11-22 23:09:01'),
	(12, 23, 199, 200, 'Subal Mahato Rahul', NULL, NULL, '01737064119', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 40, 1, 10, NULL, NULL, NULL, '2025-11-22 23:10:18', '2025-11-22 23:10:18'),
	(13, 24, 201, 202, 'মুফতি মাওলানা আব্দুল্লাহ', NULL, NULL, '966504858615', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 40, 1, 10, NULL, NULL, NULL, '2025-11-22 23:11:49', '2025-11-22 23:11:49'),
	(14, 25, 203, 204, 'Islam Zahirul', NULL, NULL, '6590671541', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 40, 1, 10, NULL, NULL, NULL, '2025-11-23 00:05:32', '2025-11-23 00:05:32'),
	(15, 26, 207, 208, 'Abeda Sultana', NULL, NULL, '01732232337', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 40, 1, 10, NULL, NULL, NULL, '2025-11-24 00:39:55', '2025-11-24 00:39:55'),
	(16, 27, 225, 226, 'Ahmedul Haq', NULL, NULL, '01711075195', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 40, 1, 10, NULL, NULL, NULL, '2025-11-25 23:04:21', '2025-11-25 23:04:21'),
	(17, 29, 256, 257, 'Ashfaque Rahman', NULL, NULL, '01625496989', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 40, 1, NULL, NULL, NULL, NULL, '2026-01-01 01:45:27', '2026-01-01 01:45:27'),
	(18, 30, 258, 259, 'Md. Zakir Hossain suny', NULL, NULL, '01715138858', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 40, 1, NULL, NULL, NULL, NULL, '2026-01-08 00:50:14', '2026-01-08 00:50:14');

-- Dumping structure for table airas_mart.invests
DROP TABLE IF EXISTS `invests`;
CREATE TABLE IF NOT EXISTS `invests` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `investor_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `invest_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `qty` int NOT NULL,
  `amount` decimal(16,0) NOT NULL,
  `deposit_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bkash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rocket` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nagad` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  `sattled` tinyint(1) NOT NULL DEFAULT '0',
  `coa_id` bigint unsigned NOT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `invests_invest_no_unique` (`invest_no`),
  KEY `invests_investor_id_foreign` (`investor_id`),
  KEY `invests_product_id_foreign` (`product_id`),
  KEY `invests_coa_id_foreign` (`coa_id`),
  KEY `invests_created_by_foreign` (`created_by`),
  KEY `invests_updated_by_foreign` (`updated_by`),
  KEY `invests_deleted_by_foreign` (`deleted_by`),
  CONSTRAINT `invests_coa_id_foreign` FOREIGN KEY (`coa_id`) REFERENCES `coas` (`id`),
  CONSTRAINT `invests_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `invests_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `invests_investor_id_foreign` FOREIGN KEY (`investor_id`) REFERENCES `investors` (`id`) ON DELETE CASCADE,
  CONSTRAINT `invests_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `invests_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.invests: ~31 rows (approximately)
DELETE FROM `invests`;
INSERT INTO `invests` (`id`, `investor_id`, `product_id`, `invest_no`, `date`, `qty`, `amount`, `deposit_type`, `bkash`, `rocket`, `nagad`, `bank_account`, `remarks`, `approved`, `sattled`, `coa_id`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(12, 8, 16, 'I2509003', '2025-07-25', 3, 90000, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 13, NULL, 10, NULL, NULL, '2025-08-31 22:36:57', '2025-11-22 23:30:48'),
	(17, 9, 4, 'I2509008', '2025-09-06', 3, 90000, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 13, NULL, NULL, NULL, NULL, '2025-09-08 03:57:40', '2025-12-23 22:41:04'),
	(19, 4, 16, 'I2510001', '2025-10-13', 1, 30000, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 13, 10, 10, NULL, NULL, '2025-10-13 00:08:05', '2025-12-30 00:16:55'),
	(23, 9, 4, 'I2511002', '2025-11-11', 3, 90000, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 13, 10, 10, NULL, NULL, '2025-11-11 06:45:17', '2025-12-23 22:41:04'),
	(29, 13, 16, 'I2511008', '2025-11-22', 3, 90000, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 13, 10, NULL, NULL, NULL, '2025-11-22 23:12:17', '2025-11-22 23:12:17'),
	(32, 16, 17, 'I2511010', '2025-11-25', 1, 30000, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 13, 10, NULL, NULL, NULL, '2025-11-25 23:06:14', '2025-11-25 23:06:14'),
	(33, 14, 17, 'I2511011', '2025-11-25', 1, 30000, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 13, 10, NULL, NULL, NULL, '2025-11-26 00:36:59', '2025-11-26 00:36:59'),
	(34, 14, 17, 'I2511012', '2025-11-27', 2, 60000, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 13, NULL, NULL, NULL, NULL, '2025-11-26 22:32:35', '2025-11-26 22:32:35'),
	(37, 8, 17, 'I2512003', '2025-12-21', 1, 30000, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 13, 10, NULL, NULL, NULL, '2025-12-22 01:41:57', '2025-12-22 01:41:57'),
	(38, 17, 17, 'I2601001', '2026-01-01', 2, 60000, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 14, NULL, NULL, NULL, NULL, '2026-01-01 01:45:47', '2026-01-01 03:16:36'),
	(39, 18, 17, 'I2601002', '2026-01-05', 5, 150000, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 98, NULL, NULL, NULL, NULL, '2026-01-08 00:50:43', '2026-01-11 08:54:14'),
	(40, 9, 18, 'I2601003', '2026-01-15', 3, 90000, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 13, NULL, NULL, NULL, NULL, '2026-01-19 01:31:09', '2026-01-19 01:31:09'),
	(41, 9, 18, 'I2601004', '2026-01-31', 3, 90000, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 14, NULL, NULL, NULL, NULL, '2026-01-31 05:27:12', '2026-01-31 05:27:12');

-- Dumping structure for table airas_mart.invest_sattlements
DROP TABLE IF EXISTS `invest_sattlements`;
CREATE TABLE IF NOT EXISTS `invest_sattlements` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `investor_id` bigint unsigned NOT NULL,
  `coa_id` bigint unsigned NOT NULL,
  `sattlement_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `invest_qty` decimal(16,0) NOT NULL,
  `invest_amount` decimal(16,0) NOT NULL,
  `payment` decimal(16,0) NOT NULL,
  `remarks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `invest_sattlements_sattlement_no_unique` (`sattlement_no`),
  KEY `invest_sattlements_investor_id_foreign` (`investor_id`),
  KEY `invest_sattlements_coa_id_foreign` (`coa_id`),
  KEY `invest_sattlements_created_by_foreign` (`created_by`),
  KEY `invest_sattlements_updated_by_foreign` (`updated_by`),
  KEY `invest_sattlements_deleted_by_foreign` (`deleted_by`),
  CONSTRAINT `invest_sattlements_coa_id_foreign` FOREIGN KEY (`coa_id`) REFERENCES `coas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `invest_sattlements_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `invest_sattlements_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `invest_sattlements_investor_id_foreign` FOREIGN KEY (`investor_id`) REFERENCES `investors` (`id`) ON DELETE CASCADE,
  CONSTRAINT `invest_sattlements_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.invest_sattlements: ~9 rows (approximately)
DELETE FROM `invest_sattlements`;
INSERT INTO `invest_sattlements` (`id`, `investor_id`, `coa_id`, `sattlement_no`, `date`, `invest_qty`, `invest_amount`, `payment`, `remarks`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(9, 8, 13, 'IS2511004', '2025-11-24', 6, 180000, 180000, NULL, 10, NULL, NULL, NULL, '2025-11-24 21:45:08', '2025-11-24 21:45:08'),
	(12, 9, 13, 'IS2512002', '2025-12-24', 6, 180000, 180000, NULL, 10, NULL, NULL, NULL, '2025-12-23 22:41:04', '2025-12-23 22:41:04'),
	(16, 4, 13, 'IS2512003', '2025-11-23', 1, 30000, 30000, NULL, 10, NULL, NULL, NULL, '2025-12-30 00:33:41', '2025-12-30 00:33:41'),
	(17, 3, 13, 'IS2512004', '2025-11-23', 1, 30000, 30000, NULL, 10, NULL, NULL, NULL, '2025-12-30 00:34:32', '2025-12-30 00:34:32'),
	(18, 5, 13, 'IS2512005', '2025-12-15', 1, 30000, 30000, NULL, 10, NULL, NULL, NULL, '2025-12-30 00:36:19', '2025-12-30 00:36:19'),
	(19, 6, 13, 'IS2512006', '2025-12-29', 1, 30000, 30000, NULL, 10, NULL, NULL, NULL, '2025-12-30 00:36:43', '2025-12-30 00:36:43'),
	(20, 8, 13, 'IS2512007', '2025-12-29', 5, 150000, 150000, NULL, 10, NULL, NULL, NULL, '2025-12-30 00:37:52', '2025-12-30 00:37:52'),
	(21, 15, 13, 'IS2512008', '2025-12-29', 1, 30000, 30000, NULL, 10, NULL, NULL, NULL, '2025-12-30 00:38:20', '2025-12-30 00:38:20'),
	(22, 7, 13, 'IS2512009', '2025-12-30', 2, 60000, 60000, NULL, 10, NULL, NULL, NULL, '2025-12-30 08:22:08', '2025-12-30 08:22:08');

-- Dumping structure for table airas_mart.invest_sattlement_lists
DROP TABLE IF EXISTS `invest_sattlement_lists`;
CREATE TABLE IF NOT EXISTS `invest_sattlement_lists` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `invest_sattlement_id` bigint unsigned NOT NULL,
  `investor_id` bigint unsigned NOT NULL,
  `invest_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `invest_qty` decimal(16,0) NOT NULL,
  `invest_amount` decimal(16,0) NOT NULL,
  `payment` decimal(16,0) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invest_sattlement_lists_invest_sattlement_id_foreign` (`invest_sattlement_id`),
  KEY `invest_sattlement_lists_investor_id_foreign` (`investor_id`),
  KEY `invest_sattlement_lists_invest_id_foreign` (`invest_id`),
  KEY `invest_sattlement_lists_product_id_foreign` (`product_id`),
  CONSTRAINT `invest_sattlement_lists_invest_id_foreign` FOREIGN KEY (`invest_id`) REFERENCES `invests` (`id`) ON DELETE CASCADE,
  CONSTRAINT `invest_sattlement_lists_invest_sattlement_id_foreign` FOREIGN KEY (`invest_sattlement_id`) REFERENCES `invest_sattlements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `invest_sattlement_lists_investor_id_foreign` FOREIGN KEY (`investor_id`) REFERENCES `investors` (`id`) ON DELETE CASCADE,
  CONSTRAINT `invest_sattlement_lists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.invest_sattlement_lists: ~11 rows (approximately)
DELETE FROM `invest_sattlement_lists`;
INSERT INTO `invest_sattlement_lists` (`id`, `invest_sattlement_id`, `investor_id`, `invest_id`, `product_id`, `invest_qty`, `invest_amount`, `payment`, `created_at`, `updated_at`) VALUES
	(15, 12, 9, 17, 4, 3, 90000, 90000, '2025-12-23 22:41:04', '2025-12-23 22:41:04'),
	(16, 12, 9, 23, 4, 3, 90000, 90000, '2025-12-23 22:41:04', '2025-12-23 22:41:04');

-- Dumping structure for table airas_mart.jobs
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.jobs: ~0 rows (approximately)
DELETE FROM `jobs`;

-- Dumping structure for table airas_mart.job_batches
DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.job_batches: ~0 rows (approximately)
DELETE FROM `job_batches`;

-- Dumping structure for table airas_mart.menus
DROP TABLE IF EXISTS `menus`;
CREATE TABLE IF NOT EXISTS `menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'footer',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `category_id` int DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `menus_created_by_foreign` (`created_by`),
  KEY `menus_updated_by_foreign` (`updated_by`),
  KEY `menus_deleted_by_foreign` (`deleted_by`),
  CONSTRAINT `menus_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `menus_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `menus_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.menus: ~21 rows (approximately)
DELETE FROM `menus`;
INSERT INTO `menus` (`id`, `name`, `position`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`, `url`, `category_id`) VALUES
	(1, 'ঘরে বসে আয় করুন', 'header_top', 1, NULL, NULL, NULL, NULL, '2026-01-20 05:19:24', '2026-01-21 02:30:12', '#', 1),
	(2, 'রকমারি কুইজ', 'header_top', 1, NULL, NULL, NULL, NULL, '2026-01-21 00:52:21', '2026-01-21 02:28:49', '#', 1),
	(3, 'রকমারি উদ্যোক্তা', 'header_top', 1, NULL, NULL, NULL, NULL, '2026-01-21 00:53:29', '2026-01-21 02:29:44', '#', 1),
	(4, 'গল্পের বই', 'header', 1, NULL, NULL, NULL, NULL, '2026-01-21 00:54:37', '2026-01-25 04:35:18', '#', 2),
	(5, 'উপন্যাস', 'header', 1, NULL, NULL, NULL, NULL, '2026-01-21 00:59:44', '2026-01-21 01:00:00', NULL, 1),
	(6, 'কবিতা', 'header', 1, NULL, NULL, NULL, NULL, '2026-01-21 01:01:13', '2026-01-21 01:01:13', NULL, 1),
	(7, 'কার্টুন গল্পের বইয়ের সকল বই', 'mega_menu', 1, NULL, NULL, NULL, NULL, '2026-01-21 01:01:51', '2026-01-21 01:01:51', NULL, 1),
	(8, 'ইসলামিক গল্পের  বইয়ের সকল বই', 'mega_menu', 1, NULL, NULL, NULL, NULL, '2026-01-21 01:02:08', '2026-01-21 01:02:08', NULL, 1),
	(9, 'গাড়িয়াল', 'mega_menu', 1, NULL, NULL, NULL, NULL, '2026-01-21 01:02:22', '2026-01-25 06:17:55', '#', 7),
	(10, 'রবীন্দ্র সঙ্গিত   ', 'mega_menu', 1, NULL, NULL, NULL, NULL, '2026-01-21 01:02:36', '2026-01-21 01:02:36', NULL, 1),
	(11, 'নজ্রুল সঙ্গিত  সকল বই ', 'mega_menu', 1, NULL, NULL, NULL, NULL, '2026-01-21 01:02:51', '2026-01-21 01:02:51', NULL, 1),
	(12, 'সত্যের সন্ধানে', 'mega_menu', 1, NULL, NULL, NULL, NULL, '2026-01-21 01:03:10', '2026-01-21 01:03:10', NULL, 1),
	(13, 'একাডেমিক বই', 'header', 1, NULL, NULL, NULL, NULL, '2026-01-21 01:03:37', '2026-01-21 23:45:52', '#', 4),
	(14, 'আমার সময় ', 'footer', 1, NULL, NULL, NULL, NULL, '2026-01-21 01:07:17', '2026-01-21 01:07:17', NULL, 1),
	(15, 'চিরকুট ', 'footer', 1, NULL, NULL, NULL, NULL, '2026-01-21 01:07:29', '2026-01-21 01:07:29', NULL, 1),
	(16, 'হৃদয়য়ের  গহিনে', 'footer', 1, NULL, NULL, NULL, NULL, '2026-01-21 01:07:42', '2026-01-21 01:07:42', NULL, 1),
	(17, 'আমার সপথ', 'footer_col2', 1, NULL, NULL, NULL, NULL, '2026-01-21 01:08:07', '2026-01-21 01:08:07', NULL, 1),
	(18, 'আলোড়ন  ', 'footer_col2', 1, NULL, NULL, NULL, NULL, '2026-01-21 01:08:23', '2026-01-21 01:08:23', NULL, 1),
	(19, 'বিড়ম্বনা', 'footer_col2', 1, NULL, NULL, NULL, NULL, '2026-01-21 01:08:40', '2026-01-21 01:08:40', NULL, 1),
	(20, 'অর্ডার ট্র্যাক করুন', 'header_top', 1, NULL, NULL, NULL, NULL, '2026-01-21 02:27:20', '2026-01-21 02:27:20', '#', 1),
	(21, 'বই ডোনেশন', 'header_top', 1, NULL, NULL, NULL, NULL, '2026-01-21 02:30:46', '2026-01-21 02:30:46', '#', 1);

-- Dumping structure for table airas_mart.menu_items
DROP TABLE IF EXISTS `menu_items`;
CREATE TABLE IF NOT EXISTS `menu_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `menu_id` bigint unsigned NOT NULL,
  `parent_id` bigint unsigned DEFAULT NULL,
  `type` enum('external','internal') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `serial` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  KEY `menu_items_parent_id_foreign` (`parent_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE,
  CONSTRAINT `menu_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `menu_items` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.menu_items: ~9 rows (approximately)
DELETE FROM `menu_items`;
INSERT INTO `menu_items` (`id`, `name`, `menu_id`, `parent_id`, `type`, `link`, `serial`, `created_at`, `updated_at`) VALUES
	(3, 'আরও অনেক মেনু এখানে হবে', 8, NULL, 'internal', 'adadd', 1, '2026-01-21 01:04:22', '2026-01-21 01:04:22'),
	(5, 'সাব মেনু  যোগ করুন', 8, NULL, 'internal', 'sada', 2, '2026-01-21 01:04:54', '2026-01-21 01:04:54'),
	(6, 'সাব মেনু  যোগ করুন', 8, NULL, 'internal', 'sds', 3, '2026-01-21 01:05:14', '2026-01-21 01:05:14'),
	(7, 'সাব মেনু  যোগ করুন', 8, NULL, 'internal', 'sda', 4, '2026-01-21 01:05:26', '2026-01-21 01:05:26'),
	(8, 'সাব মেনু  যোগ করুন', 8, NULL, 'internal', 'asda', 5, '2026-01-21 01:05:37', '2026-01-21 01:05:37'),
	(9, 'সাব মেনু  যোগ করুন', 8, NULL, 'internal', 'asda', 6, '2026-01-21 01:05:39', '2026-01-21 01:05:39'),
	(11, 'সাব মেনু  যোগ করুন', 8, NULL, 'internal', 'dasdsa', 8, '2026-01-21 01:05:52', '2026-01-21 01:05:52'),
	(12, 'সাব মেনু  যোগ করুন', 8, NULL, 'internal', 'sa', 9, '2026-01-21 01:06:17', '2026-01-21 01:06:17'),
	(13, 'সাব মেনু  যোগ করুন', 11, NULL, 'internal', '44', 1, '2026-01-21 01:53:45', '2026-01-21 01:53:45');

-- Dumping structure for table airas_mart.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.migrations: ~40 rows (approximately)
DELETE FROM `migrations`;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '0001_01_01_000000_create_users_table', 1),
	(2, '0001_01_01_000001_create_cache_table', 1),
	(3, '0001_01_01_000002_create_jobs_table', 1),
	(4, '2025_05_07_083259_create_permission_tables', 1),
	(5, '2025_05_07_083431_create_admin_menus_table', 1),
	(6, '2025_05_07_083444_create_admin_menu_actions_table', 1),
	(7, '2025_05_07_084137_create_admin_settings_table', 1),
	(8, '2025_05_07_084409_create_settings_table', 1),
	(9, '2025_08_19_172447_create_categories_table', 1),
	(10, '2025_08_21_172430_create_uoms_table', 1),
	(11, '2025_08_22_152908_create_stores_table', 1),
	(12, '2025_08_22_160106_create_vendors_table', 1),
	(13, '2025_08_23_114403_create_attributes_table', 1),
	(14, '2025_08_23_114500_create_attribute_values_table', 1),
	(15, '2025_08_23_122158_create_brands_table', 1),
	(16, '2025_08_23_141243_create_authors_table', 1),
	(17, '2025_08_23_151243_create_publications_table', 1),
	(18, '2025_08_23_171640_create_products_table', 1),
	(19, '2025_08_23_171642_create_product_categories_table', 1),
	(20, '2025_08_23_171740_create_product_vendors_table', 1),
	(21, '2025_08_23_171750_create_product_authors_table', 1),
	(22, '2025_08_23_171840_create_product_tags_table', 1),
	(23, '2025_08_23_172142_create_product_images_table', 1),
	(24, '2025_08_23_172227_create_product_variants_table', 1),
	(25, '2025_08_23_172246_create_product_variant_values_table', 1),
	(26, '2025_09_02_162530_create_purchase_orders_table', 1),
	(27, '2025_09_02_172432_create_purchase_order_items_table', 1),
	(28, '2025_09_02_173851_create_purchase_receipts_table', 1),
	(29, '2025_09_02_173857_create_purchase_receipt_items_table', 1),
	(30, '2025_09_02_174309_create_stocks_table', 1),
	(31, '2025_09_02_174319_create_stock_movements_table', 1),
	(32, '2025_09_07_094949_create_sliders_table', 1),
	(33, '2025_09_07_115753_create_home_sections_table', 1),
	(34, '2025_09_10_045646_create_home_section_categories_table', 1),
	(35, '2025_10_16_010234_create_menus_table', 2),
	(36, '2025_10_16_010239_create_menu_items_table', 2),
	(37, '2026_01_27_111709_create_wishlists_table', 3),
	(40, '2026_01_28_060922_create_orders_table', 4),
	(41, '2026_01_28_060938_create_order_items_table', 4),
	(42, '2026_02_01_061140_create_reviews_table', 5);

-- Dumping structure for table airas_mart.model_has_permissions
DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.model_has_permissions: ~0 rows (approximately)
DELETE FROM `model_has_permissions`;

-- Dumping structure for table airas_mart.model_has_roles
DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.model_has_roles: ~0 rows (approximately)
DELETE FROM `model_has_roles`;
INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
	(1, 'App\\Models\\User', 1),
	(2, 'App\\Models\\User', 2),
	(3, 'App\\Models\\User', 11),
	(4, 'App\\Models\\User', 14);

-- Dumping structure for table airas_mart.orders
DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `order_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `discount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `tax` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total` decimal(10,2) NOT NULL,
  `payment_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_order_number_unique` (`order_number`),
  KEY `orders_user_id_foreign` (`user_id`),
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.orders: ~0 rows (approximately)
DELETE FROM `orders`;
INSERT INTO `orders` (`id`, `user_id`, `order_number`, `subtotal`, `discount`, `tax`, `total`, `payment_method`, `status`, `created_at`, `updated_at`) VALUES
	(1, NULL, 'ORD-1772611138', 1163.00, 116.30, 58.15, 1104.85, 'cod', 'pending', '2026-03-04 01:58:58', '2026-03-04 01:58:58'),
	(2, 10, 'ORD-1773460472', 946.00, 94.60, 47.30, 898.70, 'cod', 'processing', '2026-03-13 21:54:32', '2026-03-13 21:56:06');

-- Dumping structure for table airas_mart.order_items
DROP TABLE IF EXISTS `order_items`;
CREATE TABLE IF NOT EXISTS `order_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `product_variant_id` bigint unsigned DEFAULT NULL,
  `qty` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_order_id_foreign` (`order_id`),
  KEY `order_items_product_id_foreign` (`product_id`),
  KEY `order_items_product_variant_id_foreign` (`product_variant_id`),
  CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_product_variant_id_foreign` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.order_items: ~2 rows (approximately)
DELETE FROM `order_items`;
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `product_variant_id`, `qty`, `price`, `total`, `created_at`, `updated_at`) VALUES
	(3, 2, 111, NULL, 1, 149.00, 149.00, '2026-03-13 21:54:32', '2026-03-13 21:54:32'),
	(4, 2, 112, NULL, 1, 149.00, 149.00, '2026-03-13 21:54:32', '2026-03-13 21:54:32'),
	(5, 2, 110, NULL, 1, 149.00, 149.00, '2026-03-13 21:54:32', '2026-03-13 21:54:32'),
	(6, 2, 109, NULL, 1, 499.00, 499.00, '2026-03-13 21:54:32', '2026-03-13 21:54:32');

-- Dumping structure for table airas_mart.password_reset_tokens
DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.password_reset_tokens: ~0 rows (approximately)
DELETE FROM `password_reset_tokens`;

-- Dumping structure for table airas_mart.payments
DROP TABLE IF EXISTS `payments`;
CREATE TABLE IF NOT EXISTS `payments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `investor_id` bigint unsigned NOT NULL,
  `coa_id` bigint unsigned DEFAULT NULL,
  `payment_type` enum('Advance','Payment','Adjust') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Advance',
  `payment_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `amount` decimal(16,0) NOT NULL,
  `remarks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `payments_payment_no_unique` (`payment_no`),
  KEY `payments_investor_id_foreign` (`investor_id`),
  KEY `payments_coa_id_foreign` (`coa_id`),
  KEY `payments_created_by_foreign` (`created_by`),
  KEY `payments_updated_by_foreign` (`updated_by`),
  KEY `payments_deleted_by_foreign` (`deleted_by`),
  CONSTRAINT `payments_coa_id_foreign` FOREIGN KEY (`coa_id`) REFERENCES `coas` (`id`) ON DELETE SET NULL,
  CONSTRAINT `payments_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `payments_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `payments_investor_id_foreign` FOREIGN KEY (`investor_id`) REFERENCES `investors` (`id`) ON DELETE CASCADE,
  CONSTRAINT `payments_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.payments: ~0 rows (approximately)
DELETE FROM `payments`;

-- Dumping structure for table airas_mart.payment_lists
DROP TABLE IF EXISTS `payment_lists`;
CREATE TABLE IF NOT EXISTS `payment_lists` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `payment_id` bigint unsigned NOT NULL,
  `distribution_list_id` bigint unsigned NOT NULL,
  `invest_id` bigint unsigned NOT NULL,
  `investor_id` bigint unsigned NOT NULL,
  `amount` decimal(16,0) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_lists_payment_id_foreign` (`payment_id`),
  KEY `payment_lists_distribution_list_id_foreign` (`distribution_list_id`),
  KEY `payment_lists_invest_id_foreign` (`invest_id`),
  KEY `payment_lists_investor_id_foreign` (`investor_id`),
  CONSTRAINT `payment_lists_distribution_list_id_foreign` FOREIGN KEY (`distribution_list_id`) REFERENCES `profit_distribution_lists` (`id`) ON DELETE CASCADE,
  CONSTRAINT `payment_lists_invest_id_foreign` FOREIGN KEY (`invest_id`) REFERENCES `invests` (`id`) ON DELETE CASCADE,
  CONSTRAINT `payment_lists_investor_id_foreign` FOREIGN KEY (`investor_id`) REFERENCES `investors` (`id`) ON DELETE CASCADE,
  CONSTRAINT `payment_lists_payment_id_foreign` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.payment_lists: ~0 rows (approximately)
DELETE FROM `payment_lists`;

-- Dumping structure for table airas_mart.permissions
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.permissions: ~101 rows (approximately)
DELETE FROM `permissions`;
INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
	(1, 'Dashboard', 'web', '2026-01-19 05:33:09', '2026-01-19 05:33:09'),
	(2, 'User & Role Manage', 'web', '2026-01-19 05:34:47', '2026-02-25 23:25:47'),
	(3, 'Roles', 'web', '2026-01-19 05:35:46', '2026-01-19 05:35:46'),
	(4, 'Users', 'web', '2026-01-19 05:36:43', '2026-01-19 05:36:43'),
	(6, 'Admin Settings', 'web', '2026-01-19 05:37:50', '2026-01-19 05:37:50'),
	(14, 'admin.role.create', 'web', '2026-01-19 23:59:11', '2026-01-19 23:59:11'),
	(18, 'admin.role.edit', 'web', '2026-01-20 03:24:24', '2026-01-20 03:24:24'),
	(19, 'admin.role.destroy', 'web', '2026-01-20 03:25:16', '2026-01-20 03:29:11'),
	(20, 'admin.role-permission.edit', 'web', '2026-01-20 03:31:59', '2026-01-20 03:31:59'),
	(21, 'Product Management', 'web', '2026-01-20 03:47:59', '2026-03-05 20:11:29'),
	(22, 'Category', 'web', '2026-01-20 03:49:56', '2026-01-20 03:49:56'),
	(23, 'admin.product.create', 'web', '2026-01-20 03:51:53', '2026-01-20 03:51:53'),
	(24, 'admin.product.edit', 'web', '2026-01-20 03:52:09', '2026-01-20 03:52:09'),
	(25, 'admin.product.destroy', 'web', '2026-01-20 03:52:34', '2026-01-20 03:52:34'),
	(26, 'admin.product.index', 'web', '2026-01-20 03:56:07', '2026-03-05 20:44:33'),
	(27, 'UOM', 'web', '2026-01-20 04:04:00', '2026-01-20 04:04:00'),
	(28, 'Brand', 'web', '2026-01-20 04:04:36', '2026-01-20 04:04:36'),
	(29, 'admin.uom.create', 'web', '2026-01-20 04:06:48', '2026-01-20 04:06:48'),
	(31, 'admin.brand.create', 'web', '2026-01-20 04:09:27', '2026-01-20 04:09:27'),
	(32, 'Vendor', 'web', '2026-01-20 04:12:04', '2026-01-20 04:12:04'),
	(33, 'admin.vendor.create', 'web', '2026-01-20 04:12:41', '2026-01-20 04:12:41'),
	(34, 'Attribute', 'web', '2026-01-20 04:19:04', '2026-01-20 04:19:04'),
	(35, 'admin.attribute.create', 'web', '2026-01-20 04:21:01', '2026-01-20 04:21:01'),
	(36, 'publication', 'web', '2026-01-20 04:22:54', '2026-01-20 04:22:54'),
	(37, 'admin.publication.create', 'web', '2026-01-20 04:23:43', '2026-01-20 04:23:43'),
	(38, 'admin.product.show', 'web', '2026-01-20 04:59:33', '2026-01-20 04:59:33'),
	(39, 'User Menu', 'web', '2026-01-20 05:21:16', '2026-01-20 05:21:16'),
	(40, 'Main Menu', 'web', '2026-01-20 05:22:04', '2026-01-20 05:22:04'),
	(41, 'admin.menu.create', 'web', '2026-01-20 05:23:01', '2026-01-20 05:23:01'),
	(44, 'admin.menu-item.index', 'web', '2026-01-20 05:33:58', '2026-01-20 05:33:58'),
	(45, 'admin.settings.index', 'web', '2026-01-20 06:07:05', '2026-02-25 23:24:47'),
	(46, 'admin.menu.edit', 'web', '2026-01-21 00:48:49', '2026-01-21 00:48:49'),
	(47, 'Author', 'web', '2026-01-22 04:29:15', '2026-01-22 04:29:15'),
	(48, 'admin.author.create', 'web', '2026-01-22 04:30:36', '2026-01-22 04:30:36'),
	(49, 'admin.author.edit', 'web', '2026-01-22 04:30:52', '2026-01-22 04:30:52'),
	(50, 'admin.author.destroy', 'web', '2026-01-22 04:31:06', '2026-01-22 04:31:06'),
	(51, 'admin.author.show', 'web', '2026-01-22 04:31:22', '2026-01-22 04:31:22'),
	(52, 'admin.publication.edit', 'web', '2026-01-22 04:33:21', '2026-01-22 04:33:21'),
	(53, 'admin.publication.show', 'web', '2026-01-22 04:33:41', '2026-01-22 04:33:41'),
	(54, 'admin.menu.destroy', 'web', '2026-01-28 23:15:50', '2026-01-28 23:15:50'),
	(55, 'Orders Management', 'web', '2026-01-31 22:22:32', '2026-01-31 22:22:32'),
	(56, 'admin.orders.index', 'web', '2026-01-31 22:25:06', '2026-01-31 22:28:50'),
	(57, 'Slider', 'web', '2026-02-02 04:09:16', '2026-02-02 04:09:16'),
	(58, 'admin.slider.edit', 'web', '2026-02-02 04:09:53', '2026-02-02 04:09:53'),
	(59, 'Business Setup', 'web', '2026-02-25 23:12:24', '2026-02-25 23:12:24'),
	(60, 'Website Setup', 'web', '2026-02-25 23:23:51', '2026-02-25 23:23:51'),
	(61, 'Inventory', 'web', '2026-02-26 01:33:52', '2026-02-26 01:33:52'),
	(62, 'Production', 'web', '2026-02-26 01:35:08', '2026-02-26 01:35:08'),
	(63, 'admin.production.create', 'web', '2026-02-26 01:35:53', '2026-02-26 01:35:53'),
	(64, 'admin.production.edit', 'web', '2026-02-26 01:36:39', '2026-02-26 01:36:39'),
	(65, 'Stores', 'web', '2026-02-26 01:49:40', '2026-02-26 01:49:40'),
	(66, 'admin.store.create', 'web', '2026-02-26 01:50:44', '2026-02-26 01:50:44'),
	(67, 'admin.store.edit', 'web', '2026-02-26 01:51:03', '2026-02-26 01:51:03'),
	(68, 'Stock', 'web', '2026-02-26 02:01:06', '2026-02-26 02:01:06'),
	(69, 'Investor Panel', 'web', '2026-03-01 21:58:22', '2026-03-01 21:58:22'),
	(70, 'Investor 1', 'web', '2026-03-01 22:00:26', '2026-03-01 22:00:26'),
	(71, 'Invest Process', 'web', '2026-03-01 22:04:26', '2026-03-01 22:04:26'),
	(72, 'Profit Distribution', 'web', '2026-03-01 22:06:32', '2026-03-01 22:06:32'),
	(73, 'Investor Payment', 'web', '2026-03-01 22:08:13', '2026-03-01 22:08:13'),
	(74, 'Invest Settlements', 'web', '2026-03-01 22:10:04', '2026-03-01 22:10:04'),
	(75, 'Investor Statement', 'web', '2026-03-01 22:15:11', '2026-03-01 22:15:11'),
	(76, 'admin.investor.create', 'web', '2026-03-01 22:17:06', '2026-03-01 22:17:06'),
	(78, 'admin.invest.create', 'web', '2026-03-01 22:20:32', '2026-03-01 22:20:32'),
	(79, 'admin.investor.edit', 'web', '2026-03-01 22:21:50', '2026-03-01 22:21:50'),
	(80, 'admin.profit-distribution.create', 'web', '2026-03-01 22:22:35', '2026-03-01 22:22:35'),
	(81, 'admin.profit-distribution.show', 'web', '2026-03-01 22:24:39', '2026-03-01 22:24:39'),
	(82, 'admin.investor-payment.create', 'web', '2026-03-01 22:25:41', '2026-03-01 22:25:41'),
	(83, 'admin.investor-payment.edit', 'web', '2026-03-01 22:26:02', '2026-03-01 22:26:02'),
	(84, 'admin.invest-sattlement.create', 'web', '2026-03-01 22:26:57', '2026-03-01 22:26:57'),
	(85, 'admin.invest-sattlement.show', 'web', '2026-03-01 22:27:09', '2026-03-01 22:27:09'),
	(86, 'Sales Management', 'web', '2026-03-01 22:34:26', '2026-03-01 22:34:26'),
	(87, 'Clients', 'web', '2026-03-01 22:42:47', '2026-03-01 22:42:47'),
	(88, 'admin.client.create', 'web', '2026-03-01 22:43:16', '2026-03-01 22:43:16'),
	(89, 'admin.client.edit', 'web', '2026-03-01 22:43:27', '2026-03-01 22:43:27'),
	(90, 'Sales 1', 'web', '2026-03-01 22:45:09', '2026-03-01 22:45:09'),
	(91, 'admin.sales.create', 'web', '2026-03-01 22:46:57', '2026-03-01 22:46:57'),
	(92, 'admin.sales.show', 'web', '2026-03-01 22:47:20', '2026-03-01 22:47:20'),
	(93, 'Collections', 'web', '2026-03-01 22:50:23', '2026-03-01 22:50:23'),
	(94, 'admin.collection.create', 'web', '2026-03-01 22:51:54', '2026-03-01 22:51:54'),
	(95, 'admin.collection.show', 'web', '2026-03-01 22:52:07', '2026-03-01 22:52:07'),
	(96, 'Reports', 'web', '2026-03-01 22:57:48', '2026-03-01 22:57:48'),
	(97, 'Sales Report', 'web', '2026-03-01 23:55:22', '2026-03-01 23:55:22'),
	(98, 'Collection Report', 'web', '2026-03-01 23:57:00', '2026-03-01 23:57:00'),
	(99, 'Sales Return Report', 'web', '2026-03-02 00:03:47', '2026-03-02 00:03:47'),
	(100, 'Expenses', 'web', '2026-03-02 00:16:46', '2026-03-02 00:16:46'),
	(102, 'admin.expense.create', 'web', '2026-03-02 00:20:19', '2026-03-02 00:20:19'),
	(103, 'admin.expense.show', 'web', '2026-03-02 00:21:24', '2026-03-02 00:21:24'),
	(104, 'Income Statement', 'web', '2026-03-02 00:29:11', '2026-03-02 00:29:11'),
	(105, 'Admin Menu', 'web', '2026-03-02 00:35:14', '2026-03-02 00:35:14'),
	(106, 'admin.admin-menu.create', 'web', '2026-03-02 00:51:22', '2026-03-02 00:51:22'),
	(107, 'admin.admin-menu.edit', 'web', '2026-03-02 00:52:36', '2026-03-02 00:52:36'),
	(108, 'admin.admin-menu-action.index', 'web', '2026-03-02 00:56:38', '2026-03-02 00:56:38'),
	(109, 'admin.admin-menu-action.create', 'web', '2026-03-02 00:57:37', '2026-03-02 00:57:37'),
	(110, 'admin.admin-menu-action.edit', 'web', '2026-03-02 00:58:54', '2026-03-02 00:58:54'),
	(111, 'admin.admin-menu-action.destroy', 'web', '2026-03-02 00:59:45', '2026-03-02 00:59:45'),
	(112, 'admin.admin-menu.destroy', 'web', '2026-03-02 01:00:30', '2026-03-02 01:00:30'),
	(113, 'Purchase Manage', 'web', '2026-03-02 02:34:09', '2026-03-02 02:39:06'),
	(114, 'Purchase Order', 'web', '2026-03-02 02:38:30', '2026-03-02 02:38:30'),
	(115, 'admin.purchase-order.create', 'web', '2026-03-02 02:39:57', '2026-03-02 02:39:57'),
	(116, 'admin.purchase-order.show', 'web', '2026-03-02 02:40:17', '2026-03-03 00:06:41'),
	(117, 'Purchase Create', 'web', '2026-03-02 23:47:16', '2026-03-02 23:47:16'),
	(118, 'admin.vendor.edit', 'web', '2026-03-06 21:50:54', '2026-03-06 21:50:54'),
	(119, 'admin.brand.edit', 'web', '2026-03-06 21:55:05', '2026-03-06 21:55:05'),
	(120, 'admin.slider.create', 'web', '2026-03-07 02:57:41', '2026-03-07 02:59:03');

-- Dumping structure for table airas_mart.productions
DROP TABLE IF EXISTS `productions`;
CREATE TABLE IF NOT EXISTS `productions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `store_id` bigint unsigned NOT NULL,
  `production_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `total_qty` decimal(16,0) NOT NULL,
  `remarks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_approved` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `productions_production_no_unique` (`production_no`),
  KEY `productions_store_id_foreign` (`store_id`),
  KEY `productions_created_by_foreign` (`created_by`),
  KEY `productions_updated_by_foreign` (`updated_by`),
  KEY `productions_deleted_by_foreign` (`deleted_by`),
  CONSTRAINT `productions_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `productions_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `productions_store_id_foreign` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`) ON DELETE CASCADE,
  CONSTRAINT `productions_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.productions: ~0 rows (approximately)
DELETE FROM `productions`;

-- Dumping structure for table airas_mart.production_lists
DROP TABLE IF EXISTS `production_lists`;
CREATE TABLE IF NOT EXISTS `production_lists` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `production_id` bigint unsigned NOT NULL,
  `store_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `product_edition_id` bigint unsigned DEFAULT NULL,
  `qty` decimal(16,0) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `production_lists_production_id_foreign` (`production_id`),
  KEY `production_lists_store_id_foreign` (`store_id`),
  KEY `production_lists_product_id_foreign` (`product_id`),
  KEY `production_lists_product_edition_id_foreign` (`product_edition_id`),
  CONSTRAINT `production_lists_product_edition_id_foreign` FOREIGN KEY (`product_edition_id`) REFERENCES `product_editions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `production_lists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `production_lists_production_id_foreign` FOREIGN KEY (`production_id`) REFERENCES `productions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `production_lists_store_id_foreign` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.production_lists: ~0 rows (approximately)
DELETE FROM `production_lists`;

-- Dumping structure for table airas_mart.products
DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint unsigned DEFAULT NULL,
  `uom_id` bigint unsigned DEFAULT NULL,
  `brand_id` bigint unsigned DEFAULT NULL,
  `publication_id` bigint unsigned DEFAULT NULL,
  `product_type` enum('book','other') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'other',
  `barcode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumbnail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `purchase_price` decimal(16,2) NOT NULL DEFAULT '0.00',
  `regular_price` decimal(16,2) NOT NULL DEFAULT '0.00',
  `sale_price` decimal(16,2) NOT NULL DEFAULT '0.00',
  `discount` decimal(16,2) NOT NULL DEFAULT '0.00',
  `discount_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'amount',
  `discount_start_date` date DEFAULT NULL,
  `discount_end_date` date DEFAULT NULL,
  `sku` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_barcode` tinyint(1) NOT NULL DEFAULT '0',
  `favorite` tinyint(1) NOT NULL DEFAULT '0',
  `trending` tinyint(1) NOT NULL DEFAULT '0',
  `new_arrival` tinyint(1) NOT NULL DEFAULT '0',
  `best_seller` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_slug_unique` (`slug`),
  UNIQUE KEY `products_barcode_unique` (`barcode`),
  KEY `products_category_id_foreign` (`category_id`),
  KEY `products_uom_id_foreign` (`uom_id`),
  KEY `products_brand_id_foreign` (`brand_id`),
  KEY `products_publication_id_foreign` (`publication_id`),
  KEY `products_created_by_foreign` (`created_by`),
  KEY `products_updated_by_foreign` (`updated_by`),
  KEY `products_deleted_by_foreign` (`deleted_by`),
  CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_publication_id_foreign` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_uom_id_foreign` FOREIGN KEY (`uom_id`) REFERENCES `uoms` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.products: ~72 rows (approximately)
DELETE FROM `products`;
INSERT INTO `products` (`id`, `name`, `code`, `slug`, `category_id`, `uom_id`, `brand_id`, `publication_id`, `product_type`, `barcode`, `file`, `thumbnail`, `short_description`, `description`, `purchase_price`, `regular_price`, `sale_price`, `discount`, `discount_type`, `discount_start_date`, `discount_end_date`, `sku`, `meta_title`, `meta_description`, `meta_image`, `custom_barcode`, `favorite`, `trending`, `new_arrival`, `best_seller`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(40, 'Round Mirror 001', 'COD2026030740', 'round-mirror-001', 8, 1, 1, 1, 'other', 'MIR001', NULL, 'storage/media/product/2026-03-07-N69114ivP080yqiqoAiRwTY8I54E2dcTEBx0wYRb.webp', NULL, NULL, 0.00, 0.00, 0.00, 0.00, 'amount', NULL, NULL, NULL, 'Round Mirror 001', '', 'storage/media/product/2026-03-07-N69114ivP080yqiqoAiRwTY8I54E2dcTEBx0wYRb.webp', 1, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-06 21:56:45', '2026-03-06 21:56:45'),
	(41, 'Round Mirror 002', 'COD2026030741', 'round-mirror-002', 8, 1, 1, 1, 'other', 'MIRR2', NULL, 'storage/media/product/2026-03-07-I0h9fdywpHqcuig1RiB2gSNEzyLcuHxxs3Hwri45.webp', NULL, NULL, 0.00, 0.00, 0.00, 0.00, 'amount', NULL, NULL, NULL, 'Round Mirror 002', '', 'storage/media/product/2026-03-07-I0h9fdywpHqcuig1RiB2gSNEzyLcuHxxs3Hwri45.webp', 1, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-06 22:22:58', '2026-03-06 22:22:58'),
	(42, 'Round Mirror 003', 'COD2026030742', 'round-mirror-003', 8, 1, 1, 1, 'other', 'eeeee', NULL, 'storage/media/product/2026-03-07-5Xpj1w0YLOck2naRmF486KRtfefG29lxqMBsHlL4.webp', NULL, NULL, 0.00, 0.00, 0.00, 0.00, 'amount', NULL, NULL, NULL, 'Round Mirror 003', '', 'storage/media/product/2026-03-07-5Xpj1w0YLOck2naRmF486KRtfefG29lxqMBsHlL4.webp', 1, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-06 22:38:03', '2026-03-06 22:38:03'),
	(43, 'Round Mirror 004', 'COD2026030743', 'round-mirror-004', 8, 1, 1, 1, 'other', '4rff', NULL, 'storage/media/product/2026-03-07-wa1bnAb8WlLuPTkHnuRcpF5Cx3blxmIuZ1fiL5TN.webp', NULL, NULL, 0.00, 0.00, 0.00, 0.00, 'amount', NULL, NULL, NULL, 'Round Mirror 004', '', 'storage/media/product/2026-03-07-wa1bnAb8WlLuPTkHnuRcpF5Cx3blxmIuZ1fiL5TN.webp', 1, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-06 22:39:25', '2026-03-06 22:39:25'),
	(44, 'Round Mirror 005', 'COD2026030744', 'round-mirror-005', 8, 1, 1, 1, 'other', 'tttt', NULL, 'storage/media/product/2026-03-07-eX8wxERLvw4nhjwqgdmCSU2s6wtf6f1NHgYFfoht.webp', NULL, NULL, 0.00, 0.00, 0.00, 0.00, 'amount', NULL, NULL, NULL, 'Round Mirror 005', '', 'storage/media/product/2026-03-07-eX8wxERLvw4nhjwqgdmCSU2s6wtf6f1NHgYFfoht.webp', 1, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-06 22:39:50', '2026-03-06 22:39:50'),
	(45, 'Round Mirror 006', 'COD2026030745', 'round-mirror-006', 8, 1, 1, 1, 'other', '124910240374', NULL, 'storage/media/product/2026-03-07-DOYCgdVKOVbN1VDRK4NHVf2CA0TY3gNO9Vi42590.webp', NULL, NULL, 0.00, 0.00, 0.00, 0.00, 'amount', NULL, NULL, NULL, 'Round Mirror 006', '', 'storage/media/product/2026-03-07-DOYCgdVKOVbN1VDRK4NHVf2CA0TY3gNO9Vi42590.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-06 22:40:12', '2026-03-06 22:40:12'),
	(46, 'Round Mirror 007', 'COD2026030746', 'round-mirror-007', 8, 1, 1, 1, 'other', '330239335144', NULL, 'storage/media/product/2026-03-07-Jdie4Vg5lq1onynf8rDRU6cpSykGgiiYDaKYhjzV.webp', NULL, NULL, 0.00, 0.00, 0.00, 0.00, 'amount', NULL, NULL, NULL, 'Round Mirror 007', '', 'storage/media/product/2026-03-07-Jdie4Vg5lq1onynf8rDRU6cpSykGgiiYDaKYhjzV.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-06 22:41:33', '2026-03-06 22:41:33'),
	(47, 'Round Mirror 008', 'COD2026030747', 'round-mirror-008', 8, 1, 1, 1, 'other', '405260457577', NULL, 'storage/media/product/2026-03-07-VQWqLAfiCl9WoSo1nOpFPQJ20XfX9kkZ4Cegj2oe.webp', NULL, NULL, 0.00, 0.00, 0.00, 0.00, 'amount', NULL, NULL, NULL, 'Round Mirror 008', '', 'storage/media/product/2026-03-07-VQWqLAfiCl9WoSo1nOpFPQJ20XfX9kkZ4Cegj2oe.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-06 22:42:03', '2026-03-06 22:42:03'),
	(48, 'Round Mirror 009', 'COD2026030748', 'round-mirror-009', 8, 1, 1, 1, 'other', '837631719198', NULL, 'storage/media/product/2026-03-07-6iDXfUNlrG7WMDwNqDOqF0dyZZVQ1AqOOMCfyHT2.webp', NULL, NULL, 0.00, 0.00, 0.00, 0.00, 'amount', NULL, NULL, NULL, 'Round Mirror 009', '', 'storage/media/product/2026-03-07-6iDXfUNlrG7WMDwNqDOqF0dyZZVQ1AqOOMCfyHT2.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-06 22:42:40', '2026-03-06 22:42:40'),
	(49, 'Round Mirror 010', 'COD2026030749', 'round-mirror-010', 8, 1, 1, 1, 'other', '560116157867', NULL, 'storage/media/product/2026-03-07-H02dGP4OSBuzHG1WvYsQrgMLhq47BtKRBfyAdhlQ.webp', NULL, NULL, 0.00, 0.00, 0.00, 0.00, 'amount', NULL, NULL, NULL, 'Round Mirror 010', '', 'storage/media/product/2026-03-07-H02dGP4OSBuzHG1WvYsQrgMLhq47BtKRBfyAdhlQ.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-06 22:43:20', '2026-03-06 22:43:20'),
	(50, 'Round Mirror 011', 'COD2026030750', 'round-mirror-011', 8, 1, 1, 1, 'other', '407947099943', NULL, 'storage/media/product/2026-03-07-YonSvxiCCnD2lERYv1JXKIcipTZpS4Qrw8UwYP8N.webp', NULL, NULL, 0.00, 0.00, 0.00, 0.00, 'amount', NULL, NULL, NULL, 'Round Mirror 011', '', 'storage/media/product/2026-03-07-YonSvxiCCnD2lERYv1JXKIcipTZpS4Qrw8UwYP8N.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-06 22:43:47', '2026-03-06 22:43:47'),
	(51, 'Round Mirror 012', 'COD2026030751', 'round-mirror-012', 8, 1, 1, 1, 'other', '343293224580', NULL, 'storage/media/product/2026-03-07-xmKqJpsjxCWWb1sJKlTwxV8Nq2SJjfcw7btXPs7e.webp', NULL, NULL, 0.00, 0.00, 0.00, 0.00, 'amount', NULL, NULL, NULL, 'Round Mirror 012', '', 'storage/media/product/2026-03-07-xmKqJpsjxCWWb1sJKlTwxV8Nq2SJjfcw7btXPs7e.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-06 22:44:12', '2026-03-06 22:44:12'),
	(52, 'Rectangle Mirror 001', 'COD2026030752', 'rectangle-mirror-001', 77, 1, 1, 1, 'other', '637432170248', NULL, 'storage/media/product/2026-03-07-Qdt8dZpN6yBl6sP1j4tGXDh0SatmH65EkROuuRht.webp', NULL, NULL, 0.00, 0.00, 0.00, 0.00, 'amount', NULL, NULL, NULL, 'Rectangle Mirror 001', '', 'storage/media/product/2026-03-07-Qdt8dZpN6yBl6sP1j4tGXDh0SatmH65EkROuuRht.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-06 22:45:51', '2026-03-06 22:45:51'),
	(53, 'Rectangle Mirror 002', 'COD2026030753', 'rectangle-mirror-002', 77, 1, 1, 1, 'other', '152002484181', NULL, 'storage/media/product/2026-03-07-mxgUgHVzKpB4U7wu22RRyyf2Pm8XU2GqV7VEYbga.webp', NULL, NULL, 0.00, 0.00, 0.00, 0.00, 'amount', NULL, NULL, NULL, 'Rectangle Mirror 002', '', 'storage/media/product/2026-03-07-mxgUgHVzKpB4U7wu22RRyyf2Pm8XU2GqV7VEYbga.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-06 22:46:24', '2026-03-06 22:46:24'),
	(54, 'Rectangle Mirror 003', 'COD2026030754', 'rectangle-mirror-003', 77, 1, 1, 1, 'other', '125320943493', NULL, 'storage/media/product/2026-03-07-VanuZlIhnQVjnkrNKI6BieaUJD2syBmJ8WzSrKX7.webp', NULL, NULL, 0.00, 0.00, 0.00, 0.00, 'amount', NULL, NULL, NULL, 'Rectangle Mirror 003', '', 'storage/media/product/2026-03-07-VanuZlIhnQVjnkrNKI6BieaUJD2syBmJ8WzSrKX7.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-06 22:46:57', '2026-03-06 22:46:57'),
	(55, 'Rectangle Mirror 004', 'COD2026030755', 'rectangle-mirror-004', 77, 1, 1, 1, 'other', '645463129289', NULL, 'storage/media/product/2026-03-07-zVfsyGTIo64UtRBNDUw9TpYCQYsCzS2BCcJMnCOP.webp', NULL, NULL, 0.00, 0.00, 0.00, 0.00, 'amount', NULL, NULL, NULL, 'Rectangle Mirror 004', '', 'storage/media/product/2026-03-07-zVfsyGTIo64UtRBNDUw9TpYCQYsCzS2BCcJMnCOP.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-06 22:47:21', '2026-03-06 22:47:21'),
	(56, 'Rectangle Mirror 005', 'COD2026030756', 'rectangle-mirror-005', 77, 1, 1, 1, 'other', '688921523130', NULL, 'storage/media/product/2026-03-07-VZOfX0NEoUOGOkF6qlPBVZ0tD8XsmEPL5QaHZJT4.webp', NULL, NULL, 0.00, 0.00, 0.00, 0.00, 'amount', NULL, NULL, NULL, 'Rectangle Mirror 005', '', 'storage/media/product/2026-03-07-VZOfX0NEoUOGOkF6qlPBVZ0tD8XsmEPL5QaHZJT4.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-06 22:47:39', '2026-03-06 22:47:39'),
	(57, 'Rectangle Mirror 006', 'COD2026030757', 'rectangle-mirror-006', 77, 1, 1, 1, 'other', '928511864887', NULL, 'storage/media/product/2026-03-07-AHNUsjQ6ywfZZxB4xOQ2fzOGWKHUqFJKO78TymQk.webp', NULL, NULL, 0.00, 0.00, 0.00, 0.00, 'amount', NULL, NULL, NULL, 'Rectangle Mirror 006', '', 'storage/media/product/2026-03-07-AHNUsjQ6ywfZZxB4xOQ2fzOGWKHUqFJKO78TymQk.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-06 22:48:02', '2026-03-06 22:48:02'),
	(58, 'Oval Mirror 001', 'COD2026030758', 'oval-mirror-001', 9, 1, 1, 1, 'other', '296244684215', NULL, 'storage/media/product/2026-03-07-NtZwP2jbJvk2pLXH57TB6P7KXiiDciFYFOFq6ulm.webp', NULL, NULL, 0.00, 0.00, 0.00, 0.00, 'amount', NULL, NULL, NULL, 'Oval Mirror 001', '', 'storage/media/product/2026-03-07-NtZwP2jbJvk2pLXH57TB6P7KXiiDciFYFOFq6ulm.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-06 22:49:09', '2026-03-06 22:49:09'),
	(59, 'Oval Mirror 002', 'COD2026030759', 'oval-mirror-002', 9, 1, 1, 1, 'other', '827326039328', NULL, 'storage/media/product/2026-03-07-c0Gsw0Z7BOUMmN33mX6G9GumGgHw64keg0R5gswZ.webp', NULL, NULL, 0.00, 0.00, 0.00, 0.00, 'amount', NULL, NULL, NULL, 'Oval Mirror 002', '', 'storage/media/product/2026-03-07-c0Gsw0Z7BOUMmN33mX6G9GumGgHw64keg0R5gswZ.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-06 22:49:37', '2026-03-06 22:49:37'),
	(60, 'Oval Mirror 003', 'COD2026030760', 'oval-mirror-003', 9, 1, 1, 1, 'other', '179018422153', NULL, 'storage/media/product/2026-03-07-ISzevIPP5y8C5eCOkjxDRS3LMDA8IR2kTKnCFmeO.webp', NULL, NULL, 0.00, 0.00, 0.00, 0.00, 'amount', NULL, NULL, NULL, 'Oval Mirror 003', '', 'storage/media/product/2026-03-07-ISzevIPP5y8C5eCOkjxDRS3LMDA8IR2kTKnCFmeO.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-06 22:49:54', '2026-03-06 22:49:54'),
	(61, 'Oval Mirror 004', 'COD2026030761', 'oval-mirror-004', 9, 1, 1, 1, 'other', '305623538015', NULL, 'storage/media/product/2026-03-07-RMGOV3F9BXI1vvxd29vgd8Jy3E2GpYEL3MyZ2WHY.webp', NULL, NULL, 0.00, 0.00, 0.00, 0.00, 'amount', NULL, NULL, NULL, 'Oval Mirror 004', '', 'storage/media/product/2026-03-07-RMGOV3F9BXI1vvxd29vgd8Jy3E2GpYEL3MyZ2WHY.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-06 22:50:31', '2026-03-06 22:50:31'),
	(62, 'Oval Mirror 005', 'COD2026030762', 'oval-mirror-005', 9, 1, 1, 1, 'other', '723007985924', NULL, 'storage/media/product/2026-03-07-Z56J4wJlTcm7NQcndY5Qun5CihCJVfRHObGGTVJD.webp', NULL, NULL, 0.00, 0.00, 0.00, 0.00, 'amount', NULL, NULL, NULL, 'Oval Mirror 005', '', 'storage/media/product/2026-03-07-Z56J4wJlTcm7NQcndY5Qun5CihCJVfRHObGGTVJD.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-06 22:51:14', '2026-03-06 22:51:14'),
	(63, 'Oval Mirror 006', 'COD2026030763', 'oval-mirror-006', 9, 1, 1, 1, 'other', '357487119787', NULL, 'storage/media/product/2026-03-07-NrPqttzgk15u83iYYHSapzxInA0Yt2a1sxQvVWwd.webp', NULL, NULL, 0.00, 0.00, 0.00, 0.00, 'amount', NULL, NULL, NULL, 'Oval Mirror 006', '', 'storage/media/product/2026-03-07-NrPqttzgk15u83iYYHSapzxInA0Yt2a1sxQvVWwd.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-06 22:51:53', '2026-03-06 22:51:53'),
	(64, 'Oval Mirror 007', 'COD2026030764', 'oval-mirror-007', 9, 1, 1, 1, 'other', '374644014993', NULL, 'storage/media/product/2026-03-07-aWqt22cc2b3WZhJJADH0ZtL4nnIF2AUltjKG5iOt.webp', NULL, NULL, 0.00, 0.00, 0.00, 0.00, 'amount', NULL, NULL, NULL, 'Oval Mirror 007', '', 'storage/media/product/2026-03-07-aWqt22cc2b3WZhJJADH0ZtL4nnIF2AUltjKG5iOt.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-07 02:18:07', '2026-03-07 02:18:07'),
	(65, 'Oval Mirror 008', 'COD2026030765', 'oval-mirror-008', 9, 1, 1, 1, 'other', '174945602848', NULL, 'storage/media/product/2026-03-07-PMlTfyplOOr7hjWTd461A48zQve99ccJGKlIGmug.webp', NULL, NULL, 0.00, 0.00, 0.00, 0.00, 'amount', NULL, NULL, NULL, 'Oval Mirror 008', '', 'storage/media/product/2026-03-07-PMlTfyplOOr7hjWTd461A48zQve99ccJGKlIGmug.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-07 02:18:48', '2026-03-07 02:18:48'),
	(66, 'Oval Mirror 009', 'COD2026030766', 'oval-mirror-009', 9, 1, 1, 1, 'other', '837658680533', NULL, 'storage/media/product/2026-03-07-ipHyLhIOopan5rg1A23qFfab8TYdadMK6mGM5ccf.webp', NULL, NULL, 0.00, 0.00, 0.00, 0.00, 'amount', NULL, NULL, NULL, 'Oval Mirror 009', '', 'storage/media/product/2026-03-07-ipHyLhIOopan5rg1A23qFfab8TYdadMK6mGM5ccf.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-07 02:19:26', '2026-03-07 02:19:26'),
	(67, 'Oval Mirror 010', 'COD2026030767', 'oval-mirror-010', 9, 1, 1, 1, 'other', '719602971676', NULL, 'storage/media/product/2026-03-07-b1Nk68IzrdpBSVMvFhix2qsg9rVgCiuMyicy3LRv.webp', NULL, NULL, 0.00, 0.00, 0.00, 0.00, 'amount', NULL, NULL, NULL, 'Oval Mirror 010', '', 'storage/media/product/2026-03-07-b1Nk68IzrdpBSVMvFhix2qsg9rVgCiuMyicy3LRv.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-07 02:20:00', '2026-03-07 02:20:00'),
	(68, 'Oval Mirror 011', 'COD2026030768', 'oval-mirror-011', 9, 1, 1, 1, 'other', '915468605479', NULL, 'storage/media/product/2026-03-07-oUdNteb5f0kJs6LyaJ84dsQxJKjWO16Z0FZsqzZH.webp', NULL, NULL, 0.00, 0.00, 0.00, 0.00, 'amount', NULL, NULL, NULL, 'Oval Mirror 011', '', 'storage/media/product/2026-03-07-oUdNteb5f0kJs6LyaJ84dsQxJKjWO16Z0FZsqzZH.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-07 02:20:18', '2026-03-07 02:20:18'),
	(69, 'Oval Mirror 012', 'COD2026030769', 'oval-mirror-012', 9, 1, 1, 1, 'other', '594812471411', NULL, 'storage/media/product/2026-03-07-jDeCy3jBEViRJMzN6Klxa3kHqbUk31Pmz9EPxTOo.webp', NULL, NULL, 0.00, 0.00, 0.00, 0.00, 'amount', NULL, NULL, NULL, 'Oval Mirror 012', '', 'storage/media/product/2026-03-07-jDeCy3jBEViRJMzN6Klxa3kHqbUk31Pmz9EPxTOo.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-07 02:20:46', '2026-03-07 02:20:46'),
	(70, 'Others Mirror 001', 'COD2026030770', 'others-mirror-001', 78, 1, 1, 1, 'other', '721871853037', NULL, 'storage/media/product/2026-03-07-YcIZtX6pYtES2fB42yOIB88pNGvZ4kfetsErJOKF.webp', NULL, NULL, 0.00, 0.00, 0.00, 0.00, 'amount', NULL, NULL, NULL, 'Others Mirror 001', '', 'storage/media/product/2026-03-07-YcIZtX6pYtES2fB42yOIB88pNGvZ4kfetsErJOKF.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-07 02:22:08', '2026-03-07 02:22:08'),
	(71, 'Others Mirror 002', 'COD2026030771', 'others-mirror-002', 78, 1, 1, 1, 'other', '298417096773', NULL, 'storage/media/product/2026-03-07-a4qwotEtbEA2ANSXzSDyyuFwgrCu1sZutnxSTi1G.webp', NULL, NULL, 0.00, 0.00, 0.00, 0.00, 'amount', NULL, NULL, NULL, 'Others Mirror 002', '', 'storage/media/product/2026-03-07-a4qwotEtbEA2ANSXzSDyyuFwgrCu1sZutnxSTi1G.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-07 02:22:27', '2026-03-07 02:22:27'),
	(72, 'Others Mirror 003', 'COD2026030772', 'others-mirror-003', 78, 1, 1, 1, 'other', '308530839847', NULL, 'storage/media/product/2026-03-07-y1lOc7aBm5c2jEcBX8huv2Ab5x2f6jdYBtpsejRl.webp', NULL, NULL, 0.00, 0.00, 0.00, 0.00, 'amount', NULL, NULL, NULL, 'Others Mirror 003', '', 'storage/media/product/2026-03-07-y1lOc7aBm5c2jEcBX8huv2Ab5x2f6jdYBtpsejRl.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-07 02:22:44', '2026-03-07 02:22:44'),
	(73, 'Others Mirror 004', 'COD2026030773', 'others-mirror-004', 78, 1, 1, 1, 'other', '548391302310', NULL, 'storage/media/product/2026-03-07-XhytPyJPdEgHcwZyXy3KPi2e8lK1z6iWq0nVZqeJ.webp', NULL, NULL, 0.00, 0.00, 0.00, 0.00, 'amount', NULL, NULL, NULL, 'Others Mirror 004', '', 'storage/media/product/2026-03-07-XhytPyJPdEgHcwZyXy3KPi2e8lK1z6iWq0nVZqeJ.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-07 02:23:06', '2026-03-07 02:23:06'),
	(74, 'Others Mirror 005', 'COD2026030774', 'others-mirror-005', 78, 1, 1, 1, 'other', '688470090040', NULL, 'storage/media/product/2026-03-07-HQa7LzrQT1Ykb5mlqQdcAZLHBBnJXhWubbflX2c0.webp', NULL, NULL, 0.00, 0.00, 0.00, 0.00, 'amount', NULL, NULL, NULL, 'Others Mirror 005', '', 'storage/media/product/2026-03-07-HQa7LzrQT1Ykb5mlqQdcAZLHBBnJXhWubbflX2c0.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-07 02:23:25', '2026-03-07 02:23:25'),
	(75, 'Others Mirror 006', 'COD2026030775', 'others-mirror-006', 78, 1, 1, 1, 'other', '943598908455', NULL, 'storage/media/product/2026-03-07-uZfbBD8l6MRdeXasfoVAXZvEiJFSq5hVXlp6vrx3.webp', NULL, NULL, 0.00, 0.00, 0.00, 0.00, 'amount', NULL, NULL, NULL, 'Others Mirror 006', '', 'storage/media/product/2026-03-07-uZfbBD8l6MRdeXasfoVAXZvEiJFSq5hVXlp6vrx3.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-07 02:23:45', '2026-03-07 02:23:45'),
	(76, 'Others Mirror 007', 'COD2026030776', 'others-mirror-007', 78, 1, 1, 1, 'other', '107159775211', NULL, 'storage/media/product/2026-03-07-SgcjSPq6wO1umdQ9liAgA7T8xGUh1SKdDOeS8BZ1.webp', NULL, NULL, 0.00, 0.00, 0.00, 0.00, 'amount', NULL, NULL, NULL, 'Others Mirror 007', '', 'storage/media/product/2026-03-07-SgcjSPq6wO1umdQ9liAgA7T8xGUh1SKdDOeS8BZ1.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-07 02:24:51', '2026-03-07 02:24:51'),
	(77, 'Oval Mirror 013', 'COD2026030777', 'oval-mirror-013', 9, 1, 1, 1, 'other', '155899849128', NULL, 'storage/media/product/2026-03-07-NjAQCHMcDV7N2vfDvYjT8oJGgrnvNQPF76sgRTV8.webp', NULL, NULL, 0.00, 0.00, 0.00, 0.00, 'amount', NULL, NULL, NULL, 'Oval Mirror 013', '', 'storage/media/product/2026-03-07-NjAQCHMcDV7N2vfDvYjT8oJGgrnvNQPF76sgRTV8.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, '2026-03-07 02:26:54', '2026-03-07 02:26:16', '2026-03-07 02:26:54'),
	(78, 'Sada Atar Ruti 10 Pcs', 'COD2026030778', 'sada-atar-ruti-10-pcs', 79, 1, 3, 1, 'other', '158430198066', NULL, 'storage/media/product/2026-03-07-26WQbyxZ5ITtZRlvGw1WBtY5XtqqD7g6SEBJt74V.webp', NULL, NULL, 70.00, 80.00, 80.00, 0.00, 'amount', NULL, NULL, NULL, 'Sada Atar Ruti 10 Pcs', '', 'storage/media/product/2026-03-07-26WQbyxZ5ITtZRlvGw1WBtY5XtqqD7g6SEBJt74V.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-07 02:45:27', '2026-03-07 02:45:27'),
	(79, 'Lal Ata Ruti 10 pcs', 'COD2026030779', 'lal-ata-ruti-10-pcs', 79, 1, 3, 1, 'other', '241846773705', NULL, 'storage/media/product/2026-03-07-3ROHrsYzxvGo9OVWLJXyaXBc9fdmDFYx1YwkvnGf.webp', NULL, NULL, 100.00, 120.00, 120.00, 0.00, 'amount', NULL, NULL, NULL, 'Lal Ata Ruti 10 pcs', '', 'storage/media/product/2026-03-07-3ROHrsYzxvGo9OVWLJXyaXBc9fdmDFYx1YwkvnGf.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-07 02:50:07', '2026-03-07 02:50:07'),
	(80, 'Chicken Mini Spring Roll (KG/Per)', 'COD2026030780', 'chicken-mini-spring-roll-kgper', 80, 1, 3, 1, 'other', '142343003334', NULL, 'storage/media/product/2026-03-07-iKAd8vjrMEOT5zF6iK2xjZHCgc9AePqsOg4Dj576.webp', NULL, NULL, 600.00, 670.00, 670.00, 0.00, 'amount', NULL, NULL, NULL, 'Chicken Mini Spring Roll (KG/Per)', '', 'storage/media/product/2026-03-07-iKAd8vjrMEOT5zF6iK2xjZHCgc9AePqsOg4Dj576.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-07 03:11:18', '2026-03-07 03:35:47'),
	(81, 'Veg. Mini Spring Roll (KG/Per)', 'COD2026030781', 'veg-mini-spring-roll-kgper', 81, 1, 3, 1, 'other', '416771656830', NULL, 'storage/media/product/2026-03-07-cx8lLVrxkFsOcqLztyPe3lNuOOhT6BkbMEScYDh9.webp', NULL, NULL, 500.00, 510.00, 510.00, 0.00, 'amount', NULL, NULL, NULL, 'Vegetable Mini Spring Roll (KG/Per)', '', 'storage/media/product/2026-03-07-cx8lLVrxkFsOcqLztyPe3lNuOOhT6BkbMEScYDh9.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-07 03:13:13', '2026-03-07 03:35:11'),
	(82, 'Chicken Mini Samosa (KG/Per)', 'COD2026030782', 'chicken-mini-samosa-kgper', 80, 1, 3, 1, 'other', '878133834129', NULL, 'storage/media/product/2026-03-07-Jvq2ygQRWq5Hnz4euSCFwESvQnE616uaBPWVRQA9.webp', NULL, NULL, 600.00, 670.00, 670.00, 0.00, 'amount', NULL, NULL, NULL, 'Chicken Mini Samosa (KG/Per)', '', 'storage/media/product/2026-03-07-Jvq2ygQRWq5Hnz4euSCFwESvQnE616uaBPWVRQA9.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-07 03:22:13', '2026-03-07 03:35:34'),
	(83, 'Veg. Mini Samosa (KG/Per)', 'COD2026030783', 'veg-mini-samosa-kgper', 81, 1, 3, 1, 'other', '587356971203', NULL, 'storage/media/product/2026-03-07-ifnNMvEyKrHnWVGhAYlv2UmJf346kjOu58Qq6fY3.webp', NULL, NULL, 490.00, 510.00, 510.00, 0.00, 'amount', NULL, NULL, NULL, 'Veg. Mini Samosa (KG/Per)', '', 'storage/media/product/2026-03-07-ifnNMvEyKrHnWVGhAYlv2UmJf346kjOu58Qq6fY3.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-07 03:23:37', '2026-03-07 03:34:56'),
	(84, 'Kolija Mini Singara (KG/Per)', 'COD2026030784', 'kolija-mini-singara-kgper', 79, 1, 3, 1, 'other', '250261895546', NULL, 'storage/media/product/2026-03-07-HvrEVzhYQ8LhrnEKf5WPMzqo5k6OvpkBDq997ro8.webp', NULL, NULL, 350.00, 390.00, 390.00, 0.00, 'amount', NULL, NULL, NULL, 'Kolija Mini Singara', '', 'storage/media/product/2026-03-07-HvrEVzhYQ8LhrnEKf5WPMzqo5k6OvpkBDq997ro8.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-07 03:29:50', '2026-03-07 03:31:13'),
	(85, 'Veg. Mini Singara (KG/Per)', 'COD2026030785', 'veg-mini-singara-kgper', 81, 1, 3, 1, 'other', '492286970428', NULL, 'storage/media/product/2026-03-07-mPCziucBw4n4AM9zFtZbTDjiQ6cgEiGKbZVgIGwp.webp', NULL, NULL, 300.00, 360.00, 360.00, 0.00, 'amount', NULL, NULL, NULL, 'Veg. Mini Singara (KG/Per)', '', 'storage/media/product/2026-03-07-mPCziucBw4n4AM9zFtZbTDjiQ6cgEiGKbZVgIGwp.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-07 03:30:44', '2026-03-07 03:34:31'),
	(86, 'Chicken Drum Stick', 'COD2026030786', 'chicken-drum-stick', 80, 1, 3, 1, 'other', '272660632403', NULL, 'storage/media/product/2026-03-07-lmz8DXsBC3fz1Wzi5zMUoQKD56IowmXSl5PNSq8i.webp', NULL, NULL, 600.00, 640.00, 640.00, 0.00, 'amount', NULL, NULL, NULL, 'Chicken Drum Stick', '', 'storage/media/product/2026-03-07-lmz8DXsBC3fz1Wzi5zMUoQKD56IowmXSl5PNSq8i.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-07 03:39:30', '2026-03-07 03:39:30'),
	(87, 'Dal Puri (KG/Per)', 'COD2026030787', 'dal-puri-kgper', 79, 1, 3, 1, 'other', '575882214117', NULL, 'storage/media/product/2026-03-07-pOD9J8lDEclyR68jhvkGXBIijCg9oGqfESE66Fg8.webp', NULL, NULL, 280.00, 310.00, 310.00, 0.00, 'amount', NULL, NULL, NULL, 'Dal Puri (KG/Per)', '', 'storage/media/product/2026-03-07-pOD9J8lDEclyR68jhvkGXBIijCg9oGqfESE66Fg8.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-07 03:42:11', '2026-03-07 03:42:11'),
	(88, 'Aloo Puri (KG/Per)', 'COD2026030788', 'aloo-puri-kgper', 79, 1, 3, 1, 'other', '746308949248', NULL, 'storage/media/product/2026-03-07-UXKApzA9Rmw0oSdS7uGW47Xr06M03573dinjrgqK.webp', NULL, NULL, 300.00, 340.00, 340.00, 0.00, 'amount', NULL, NULL, NULL, 'Aloo Puri (KG/Per)', '', 'storage/media/product/2026-03-07-UXKApzA9Rmw0oSdS7uGW47Xr06M03573dinjrgqK.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-07 03:44:26', '2026-03-07 03:44:26'),
	(89, 'Beef Shami Kabab (KG/Per)', 'COD2026030789', 'beef-shami-kabab-kgper', 79, 1, 3, 1, 'other', '579482355670', NULL, 'storage/media/product/2026-03-07-nn4YdtuQNxTZOz0bQvEB5YObYAequU7yIEHwpaAq.webp', NULL, NULL, 750.00, 790.00, 790.00, 0.00, 'amount', NULL, NULL, NULL, 'Beef Shami Kabab (KG/Per)', '', 'storage/media/product/2026-03-07-nn4YdtuQNxTZOz0bQvEB5YObYAequU7yIEHwpaAq.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-07 03:47:57', '2026-03-07 03:47:57'),
	(90, 'Chicken Shami Kabab (KG/Per)', 'COD2026030790', 'chicken-shami-kabab-kgper', 80, 1, 3, 1, 'other', '521965042979', NULL, 'storage/media/product/2026-03-07-JWRvObhYbmy2uskbYjfUDu9FehXWQHxZzRa807Oh.webp', NULL, NULL, 450.00, 490.00, 490.00, 0.00, 'amount', NULL, NULL, NULL, 'CHicken SHami  Kabab (KG/Per)', '', 'storage/media/product/2026-03-07-JWRvObhYbmy2uskbYjfUDu9FehXWQHxZzRa807Oh.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-07 03:49:24', '2026-03-07 03:50:00'),
	(91, 'Onthon (KG/Per)', 'COD2026030791', 'onthon-kgper', 79, 1, 3, 1, 'other', '423514446564', NULL, 'storage/media/product/2026-03-07-LEgvS4O6fIkuqkxmqJlGNemQYS3vIAHgh3esZdhL.webp', NULL, NULL, 220.00, 270.00, 270.00, 0.00, 'amount', NULL, NULL, NULL, 'Onthon (KG/Per)', '', 'storage/media/product/2026-03-07-LEgvS4O6fIkuqkxmqJlGNemQYS3vIAHgh3esZdhL.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-07 03:52:32', '2026-03-07 04:02:07'),
	(92, 'Chicken Ball (KG/Per)', 'COD2026030792', 'chicken-ball-kgper', 80, 1, 3, 1, 'other', '569197987185', NULL, 'storage/media/product/2026-03-07-ydPOw7Lw0eVh1aCAEfoiv9VmT9d4SRY96MTRwEjP.webp', NULL, NULL, 380.00, 410.00, 410.00, 0.00, 'amount', NULL, NULL, NULL, 'Chicken Ball (KG/Per)', '', 'storage/media/product/2026-03-07-ydPOw7Lw0eVh1aCAEfoiv9VmT9d4SRY96MTRwEjP.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-07 03:55:13', '2026-03-07 03:55:13'),
	(93, 'Chickens Sausage (KG/Per)', 'COD2026030793', 'chickens-sausage-kgper', 80, 1, 3, 1, 'other', '828661964330', NULL, 'storage/media/product/2026-03-07-jHfiypS0SSJH8MsLcdo1NfIwmhzT45LjfJ4cmJR0.webp', NULL, NULL, 450.00, 490.00, 490.00, 0.00, 'amount', NULL, NULL, NULL, 'Chickens Sausage (KG/Per)', '', 'storage/media/product/2026-03-07-jHfiypS0SSJH8MsLcdo1NfIwmhzT45LjfJ4cmJR0.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-07 03:57:42', '2026-03-07 03:57:42'),
	(94, 'Porota 20Pcs (KG/Per)', 'COD2026030794', 'porota-20pcs-kgper', 79, 1, 3, 1, 'other', '323530730767', NULL, 'storage/media/product/2026-03-07-RB1Yg3xqk7Yg3CV1ayC4YUhcJhU23EkdcEPxT2mP.webp', NULL, NULL, 200.00, 260.00, 260.00, 0.00, 'amount', NULL, NULL, NULL, 'Porota 20Pcs (KG/Per)', '', 'storage/media/product/2026-03-07-RB1Yg3xqk7Yg3CV1ayC4YUhcJhU23EkdcEPxT2mP.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-07 04:00:26', '2026-03-07 04:00:26'),
	(95, 'Frence Fry (Local) (KG/Per)', 'COD2026030795', 'frence-fry-local-kgper', 81, 1, 3, 1, 'other', '971066103544', NULL, 'storage/media/product/2026-03-07-hteoJSGr4dICofKbD4D8rBzf7U6AOjUhoqwzv9AC.webp', NULL, NULL, 250.00, 290.00, 290.00, 0.00, 'amount', NULL, NULL, NULL, 'Frence Fry (Local) (KG/Per)', '', 'storage/media/product/2026-03-07-hteoJSGr4dICofKbD4D8rBzf7U6AOjUhoqwzv9AC.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-07 04:15:03', '2026-03-07 04:15:03'),
	(96, 'Chicken Nuggets (KG/Per)', 'COD2026030796', 'chicken-nuggets-kgper', 80, 1, 3, 1, 'other', '456278231857', NULL, 'storage/media/product/2026-03-07-zvUF2r4dTiu5NXgIeVI1A9LKJ1JlfYUo80vV1llE.webp', NULL, NULL, 550.00, 590.00, 590.00, 0.00, 'amount', NULL, NULL, NULL, 'Chicken Nuggets (KG/Per)', '', 'storage/media/product/2026-03-07-zvUF2r4dTiu5NXgIeVI1A9LKJ1JlfYUo80vV1llE.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-07 04:19:24', '2026-03-07 04:19:24'),
	(97, 'Chicken Momo (KG/Per)', 'COD2026030797', 'chicken-momo-kgper', 80, 1, 3, 1, 'other', '842225462090', NULL, 'storage/media/product/2026-03-07-QHJY0q0hZ6tTalUPggzu036xlthhH5jHWKsLJDiz.webp', NULL, NULL, 600.00, 670.00, 670.00, 0.00, 'amount', NULL, NULL, NULL, 'Chicken Momo (KG/Per)', '', 'storage/media/product/2026-03-07-QHJY0q0hZ6tTalUPggzu036xlthhH5jHWKsLJDiz.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-07 04:22:30', '2026-03-07 04:22:30'),
	(98, 'Mozzarella Cheese (KG/Per)', 'COD2026030798', 'mozzarella-cheese-kgper', 81, 1, 3, 1, 'other', '970102572268', NULL, 'storage/media/product/2026-03-07-Es5fLipDRu0k8p0zIrSlPh8fanO87QmJ1zJjMlna.webp', NULL, NULL, 700.00, 770.00, 770.00, 0.00, 'amount', NULL, NULL, NULL, 'Mozzarella Cheese (KG/Per)', '', 'storage/media/product/2026-03-07-Es5fLipDRu0k8p0zIrSlPh8fanO87QmJ1zJjMlna.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-07 04:25:49', '2026-03-07 04:25:49'),
	(99, 'A4 size envelope (Brown) - 50 Pcs', 'COD2026031399', 'a4-size-envelope-brown-50-pcs', 62, 1, 2, 1, 'other', '339349899461', NULL, 'storage/media/product/2026-03-13-1Hx7DFolSiiK8SMDb796b3HU6xxCbCBLEY3VR3xu.webp', NULL, '<ul><li style="padding-left: 15px; position: relative; font-size: 14px; line-height: 18px; list-style: none; word-break: break-word; break-inside: avoid;">Brown envelope</li><li style="padding-left: 15px; position: relative; font-size: 14px; line-height: 18px; list-style: none; word-break: break-word; break-inside: avoid;">80 gsm</li><li style="padding-left: 15px; position: relative; font-size: 14px; line-height: 18px; list-style: none; word-break: break-word; break-inside: avoid;">Linner paper</li><li style="padding-left: 15px; position: relative; font-size: 14px; line-height: 18px; list-style: none; word-break: break-word; break-inside: avoid;">Best quality</li><li style="padding-left: 15px; position: relative; font-size: 14px; line-height: 18px; list-style: none; word-break: break-word; break-inside: avoid;">Good Products</li></ul>', 200.00, 250.00, 250.00, 0.00, 'amount', NULL, NULL, NULL, 'A4 size envelope (Brown) - 50 Pcs', 'Brown envelope80 gsmLinner paperBest qualityGood Products', 'storage/media/product/2026-03-13-1Hx7DFolSiiK8SMDb796b3HU6xxCbCBLEY3VR3xu.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-13 05:38:14', '2026-03-13 05:38:14'),
	(100, 'Envelope Best Quality 80 GSM Size (12"x 9.5") 25pcs', 'COD20260313100', 'envelope-best-quality-80-gsm-size-12x-95-25pcs', 62, 1, 2, 1, 'other', '470714447804', NULL, 'storage/media/product/2026-03-13-1DyeoBFDqQQJQGhOwNWlJik6LBL1eB46RIaGLiVB.webp', NULL, '<p style="margin-bottom: 0px; padding-left: 15px; line-height: 18px; position: relative; font-size: 14px; list-style: none; word-break: break-word; break-inside: avoid; font-family: Roboto, -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, Helvetica, sans-serif;">Product details of Envelope Best Quality 80 GSM Size (12"x 9.5") 25pcs</p><ul style="overflow: hidden; font-family: Roboto, -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, Helvetica, sans-serif; font-size: 12px;"><li style="padding-left: 15px; position: relative; font-size: 14px; line-height: 18px; list-style: none; word-break: break-word; break-inside: avoid;">Product Type: Envelope 80 GSM Best Quality</li><li style="padding-left: 15px; position: relative; font-size: 14px; line-height: 18px; list-style: none; word-break: break-word; break-inside: avoid;">Size: A4 (12" x 9.5")</li><li style="padding-left: 15px; position: relative; font-size: 14px; line-height: 18px; list-style: none; word-break: break-word; break-inside: avoid;">Color: White (Same as Photo)</li><li style="padding-left: 15px; position: relative; font-size: 14px; line-height: 18px; list-style: none; word-break: break-word; break-inside: avoid;">Quantity: 25 pcs</li></ul>', 180.00, 195.00, 195.00, 0.00, 'amount', NULL, NULL, NULL, 'Envelope Best Quality 80 GSM Size (12"x 9.5") 25pcs', 'Product details of Envelope Best Quality 80 GSM Size (12"x 9.5") 25pcsProduct Type: Envelope 80 GSM Best QualitySize: A4 (12" x 9.5")Color: White (Same as Photo)Quantity: 25 pcs', 'storage/media/product/2026-03-13-1DyeoBFDqQQJQGhOwNWlJik6LBL1eB46RIaGLiVB.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-13 05:43:16', '2026-03-13 05:43:16'),
	(101, 'Premium Brown Envelope (50 Pieces)', 'COD20260313101', 'premium-brown-envelope-50-pieces', 62, 1, 2, 1, 'other', '528296485056', NULL, 'storage/media/product/2026-03-13-6DX06SMTc8ulXl96oICUIlp5XH4sCjPewgNLR67T.webp', NULL, '<div class="html-content pdp-product-highlights" style="padding-top: 11px; padding-bottom: 16px; word-break: break-word; border-bottom-width: 1px; border-bottom-color: rgb(239, 240, 245); overflow: hidden; font-family: Roboto, -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, Helvetica, sans-serif; font-size: 12px;"><p data-spm-anchor-id="a2a0e.pdp_revamp.product_detail.i1.58f448b5NXI1NY" style="margin-bottom: 0px; padding-left: 15px; line-height: 18px; position: relative; font-size: 14px; list-style: none; word-break: break-word; break-inside: avoid;">Premium brown envelopes, pack of 50.<br>• Ideal for stationery and craft projects.<br>• High-quality paper material.<br>• Perfect for sending letters, invitations, and cards.</p></div><div class="html-content detail-content" style="margin-top: 16px; padding-bottom: 16px; word-break: break-word; position: relative; height: auto; line-height: 1.3; border-bottom-width: 1px; border-bottom-color: rgb(239, 240, 245); white-space-collapse: break-spaces; font-family: Roboto, -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, Helvetica, sans-serif; font-size: 12px;"><p style="margin-bottom: 0px; line-height: unset; font-size: 14px;">This is a pack of 50 premium brown envelopes, perfect for all your mailing needs. Made from high-quality materials, these envelopes are durable and reliable, ensuring that your important documents and letters arrive safely at their destination. The classic brown color gives them a professional and sophisticated look, making them ideal for both personal and business use. Whether you\'re sending invitations, letters, or important documents, these envelopes are the perfect choice.</p></div>', 80.00, 90.00, 90.00, 0.00, 'amount', NULL, NULL, NULL, 'Premium Brown Envelope (50 Pieces)', 'Premium brown envelopes, pack of 50.• Ideal for stationery and craft projects.• High-quality paper material.• Perfect for sending letters, invitations, and cards.This is a pack of 50 premium brown envelopes, perfect for all your mailing needs. Made from high-quality materials, these envelopes are durable and reliable, ensuring that your important documents and letters arrive safely at their destination. The classic brown color gives them a professional and sophisticated look, making them ideal for both personal and business use. Whether you\'re sending invitations, letters, or important documents, these envelopes are the perfect choice.', 'storage/media/product/2026-03-13-6DX06SMTc8ulXl96oICUIlp5XH4sCjPewgNLR67T.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-13 05:50:00', '2026-03-13 05:50:00'),
	(102, 'White Envelope (10"x4.5") - 50 pcs - 70gsm paper', 'COD20260313102', 'white-envelope-10x45-50-pcs-70gsm-paper', 62, 1, 2, 1, 'other', '169827951645', NULL, 'storage/media/product/2026-03-13-EbtIh2kKXJQ9GeCBvsNoiHXDuCqF6fuznClQLtfg.webp', NULL, NULL, 90.00, 100.00, 100.00, 0.00, 'amount', NULL, NULL, NULL, 'White Envelope (10"x4.5") - 50 pcs - 70gsm paper', '', 'storage/media/product/2026-03-13-EbtIh2kKXJQ9GeCBvsNoiHXDuCqF6fuznClQLtfg.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-13 05:54:04', '2026-03-13 05:54:04'),
	(103, '50 Pack Large Cash Envelopes 3.5 x 6.5 inch,Money Envelopes for Cash,Cash Envelopes For Savings plan,Cash Env', 'COD20260313103', '50-pack-large-cash-envelopes-35-x-65-inchmoney-envelopes-for-cashcash-envelopes-for-savings-plancash-env', 62, 1, 2, 1, 'other', '214059004955', NULL, 'storage/media/product/2026-03-13-kxo6vwNWYmR6MOyWRaoqO3ZXITyH0ZZUKbwCIgXj.webp', NULL, '<ul style="margin-left: 10px; list-style-type: disc; font-family: Roboto, -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, Helvetica, sans-serif; font-size: 12px; white-space-collapse: break-spaces;"><li><div style="line-height: 1.7;">Superior quality:Made of 120gsm high quality paper.It is stronger and \r\nmore durable than other envelopes so it could protect the items of \r\nenvelopes well. </div></li></ul><p style="margin-bottom: 0px; line-height: 1.7; font-size: 14px; font-family: Roboto, -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space-collapse: break-spaces;"><span style="display: block;"></span></p><ul style="margin-left: 10px; list-style-type: disc; font-family: Roboto, -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, Helvetica, sans-serif; font-size: 12px; white-space-collapse: break-spaces;"><li><div style="line-height: 1.7;">Perfect size for bills:3.5 x 6.5 Inches.It could hold your bills easily without folding. </div></li></ul><p style="margin-bottom: 0px; line-height: 1.7; font-size: 14px; font-family: Roboto, -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space-collapse: break-spaces;"><span style="display: block;"></span></p><ul style="margin-left: 10px; list-style-type: disc; font-family: Roboto, -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, Helvetica, sans-serif; font-size: 12px; white-space-collapse: break-spaces;"><li><div style="line-height: 1.7;">Multipurpose:Suitable for personal finance and savings plans.And storeseeds,coins,tickets,gift cards,bills,small items,etc. </div></li></ul><p style="margin-bottom: 0px; line-height: 1.7; font-size: 14px; font-family: Roboto, -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space-collapse: break-spaces;"><span style="display: block;"></span></p><ul style="margin-left: 10px; list-style-type: disc; font-family: Roboto, -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, Helvetica, sans-serif; font-size: 12px; white-space-collapse: break-spaces;"><li><div style="line-height: 1.7;">Easy to Seal:No need to seal with water,just peel and press. </div></li></ul><p style="margin-bottom: 0px; line-height: 1.7; font-size: 14px; font-family: Roboto, -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space-collapse: break-spaces;"><span style="display: block;"></span></p><ul style="margin-left: 10px; list-style-type: disc; font-family: Roboto, -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, Helvetica, sans-serif; font-size: 12px; white-space-collapse: break-spaces;"><li><div style="line-height: 1.7;">DIY for Your Own:Print,draw or write down something you like on the envelope</div></li></ul>', 90.00, 100.00, 100.00, 0.00, 'amount', NULL, NULL, NULL, '50 Pack Large Cash Envelopes 3.5 x 6.5 inch,Money Envelopes for Cash,Cash Envelopes For Savings plan,Cash Env', 'Superior quality:Made of 120gsm high quality paper.It is stronger and \r\nmore durable than other envelopes so it could protect the items of \r\nenvelopes well. Perfect size for bills:3.5 x 6.5 Inches.It could hold your bills easily without folding. Multipurpose:Suitable for personal finance and savings plans.And storeseeds,coins,tickets,gift cards,bills,small items,etc. Easy to Seal:No need to seal with water,just peel and press. DIY for Your Own:Print,draw or write down something you like on the envelope', 'storage/media/product/2026-03-13-kxo6vwNWYmR6MOyWRaoqO3ZXITyH0ZZUKbwCIgXj.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-13 06:00:18', '2026-03-13 06:00:18'),
	(104, 'Unstitched Three Piece', 'COD20260313104', 'unstitched-three-piece', 3, 1, 2, 1, 'other', '914155479668', NULL, 'storage/media/product/2026-03-13-Nwz9ygwJrJWR0YNmO6T4g9rjpmRwcVrO2YzXSDle.webp', NULL, '<p><span style="color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px; white-space-collapse: preserve; font-weight: bolder;">Beautiful Unstitched Three Piece</span><span style="color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px; white-space-collapse: preserve;">\r\n\r\n» Material: Pure Cotton\r\n» Allover Digital Print\r\n» 80 Plus Body Fabric</span></p>', 1500.00, 1599.00, 1599.00, 0.00, 'amount', NULL, NULL, NULL, 'Unstitched Three Piece', 'Beautiful Unstitched Three Piece\r\n\r\n» Material: Pure Cotton\r\n» Allover Digital Print\r\n» 80 Plus Body Fabric', 'storage/media/product/2026-03-13-Nwz9ygwJrJWR0YNmO6T4g9rjpmRwcVrO2YzXSDle.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-13 06:42:53', '2026-03-13 06:44:08'),
	(105, 'Floral Cotton Unstitched Three Piece', 'COD20260313105', 'floral-cotton-unstitched-three-piece', 3, 1, 2, 2, 'other', '200960312998', NULL, 'storage/media/product/2026-03-13-FUoMe321DFpNVVUppKEQ7IFP7sXTBilsjF2EBF4r.webp', NULL, '<p data-start="279" data-end="658" style="color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;">Refresh your style with this&nbsp;<span data-start="308" data-end="348" style="font-weight: bolder;">Floral Cotton Unstitched Three Piece</span>, designed for comfort and effortless elegance. Made from&nbsp;<span data-start="406" data-end="440" style="font-weight: bolder;">soft, breathable cotton fabric</span>, this set features an&nbsp;<span data-start="463" data-end="492" style="font-weight: bolder;">eye-catching floral print</span>&nbsp;that suits every season. The&nbsp;<span data-start="522" data-end="553" style="font-weight: bolder;">free-size unstitched design</span>&nbsp;allows easy tailoring for a perfect fit, making it ideal for daily wear, casual outings, and office use.</p><p style="color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;"></p><p data-start="660" data-end="805" style="color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;"><span data-start="660" data-end="671" style="font-weight: bolder;">Fabric:</span>&nbsp;Soft &amp; Breathable Cotton<br data-start="696" data-end="699"><span data-start="699" data-end="710" style="font-weight: bolder;">Design:</span>&nbsp;Floral Print<br data-start="723" data-end="726"><span data-start="726" data-end="735" style="font-weight: bolder;">Size:</span>&nbsp;Free Size<br data-start="745" data-end="748"><span data-start="748" data-end="759" style="font-weight: bolder;">Season:</span>&nbsp;All-Season Wear</p>', 1499.00, 1499.00, 1499.00, 0.00, 'amount', NULL, NULL, NULL, 'Floral Cotton Unstitched Three Piece', 'Refresh your style with this&nbsp;Floral Cotton Unstitched Three Piece, designed for comfort and effortless elegance. Made from&nbsp;soft, breathable cotton fabric, this set features an&nbsp;eye-catching floral print&nbsp;that suits every season. The&nbsp;free-size unstitched design&nbsp;allows easy tailoring for a perfect fit, making it ideal for daily wear, casual outings, and office use.Fabric:&nbsp;Soft &amp; Breathable CottonDesign:&nbsp;Floral PrintSize:&nbsp;Free SizeSeason:&nbsp;All-Season Wear', 'storage/media/product/2026-03-13-FUoMe321DFpNVVUppKEQ7IFP7sXTBilsjF2EBF4r.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-13 06:55:18', '2026-03-13 06:55:18'),
	(106, 'Pure Cotton Unstitched Three Piece', 'COD20260313106', 'pure-cotton-unstitched-three-piece', 3, 1, 2, 1, 'other', '443073298164', NULL, 'storage/media/product/2026-03-13-ifyqVwhOnoc5vFoKwREwC0q6lhOKa6XwM2bKpVoj.webp', NULL, '<p data-start="329" data-end="649" style="color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;"><span data-start="376" data-end="422" style="font-weight: bolder;">Premium Pure Cotton Unstitched Three Piece</span>&nbsp;set, designed for comfort, elegance, and custom tailoring. The set combines vibrant all‑over digital prints with exquisite stone work, delivering a luxurious look that’s perfect for daily wear, gifting, or special occasions.</p><p data-start="651" data-end="866" style="color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;">Made from&nbsp;<span data-start="661" data-end="688" style="font-weight: bolder;">soft, breathable cotton</span>, the generous&nbsp;<span data-start="703" data-end="722" style="font-weight: bolder;">80+ body fabric</span>&nbsp;gives you freedom to stitch the outfit exactly to your preferred fit and style—whether you choose salwar kameez, A‑line, or another silhouette.</p><h4 data-start="868" data-end="890" style="font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; color: rgb(33, 37, 41);">Why it stands out</h4><ul data-start="891" data-end="1458" style="margin-bottom: 1rem; color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;"><li data-start="891" data-end="988"><p data-start="893" data-end="988"><span data-start="893" data-end="912" style="font-weight: bolder;">Premium fabric:</span>&nbsp;100% pure cotton for all‑day comfort and airflow, ideal for warm weather.</p></li><li data-start="989" data-end="1099"><p data-start="991" data-end="1099"><span data-start="991" data-end="1015" style="font-weight: bolder;">Eye‑catching design:</span>&nbsp;rich digital prints plus beautiful stone embellishments create a high‑end finish.</p></li><li data-start="1100" data-end="1211"><p data-start="1102" data-end="1211"><span data-start="1102" data-end="1123" style="font-weight: bolder;">Custom tailoring:</span>&nbsp;unstitched, with plenty of fabric to tailor the fit precisely to your size and taste.</p></li><li data-start="1212" data-end="1345"><p data-start="1214" data-end="1345"><span data-start="1214" data-end="1232" style="font-weight: bolder;">Versatile use:</span>&nbsp;great for casual daily wear, office looks, or festive events where you want something special yet comfortable.</p></li><li data-start="1346" data-end="1458"><p data-start="1348" data-end="1458"><span data-start="1348" data-end="1363" style="font-weight: bolder;">Value pick:</span>&nbsp;boutique feel without a steep price, making it smart for personal use or as a thoughtful gift.</p></li></ul><h4 data-start="1460" data-end="1482" style="font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; color: rgb(33, 37, 41);">Product details</h4><ul data-start="1483" data-end="1786" style="margin-bottom: 1rem; color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;"><li data-start="1483" data-end="1537"><p data-start="1485" data-end="1537"><span data-start="1485" data-end="1496" style="font-weight: bolder;">Design:</span>&nbsp;All‑over digital print with stone work</p></li><li data-start="1538" data-end="1573"><p data-start="1540" data-end="1573"><span data-start="1540" data-end="1551" style="font-weight: bolder;">Fabric:</span>&nbsp;Premium pure cotton</p></li><li data-start="1574" data-end="1622"><p data-start="1576" data-end="1622"><span data-start="1576" data-end="1592" style="font-weight: bolder;">Fabric size:</span>&nbsp;80+ body fabric, unstitched</p></li></ul>', 1400.00, 1499.00, 1499.00, 0.00, 'amount', NULL, NULL, NULL, 'Pure Cotton Unstitched Three Piece', 'Premium Pure Cotton Unstitched Three Piece&nbsp;set, designed for comfort, elegance, and custom tailoring. The set combines vibrant all‑over digital prints with exquisite stone work, delivering a luxurious look that’s perfect for daily wear, gifting, or special occasions.Made from&nbsp;soft, breathable cotton, the generous&nbsp;80+ body fabric&nbsp;gives you freedom to stitch the outfit exactly to your preferred fit and style—whether you choose salwar kameez, A‑line, or another silhouette.Why it stands outPremium fabric:&nbsp;100% pure cotton for all‑day comfort and airflow, ideal for warm weather.Eye‑catching design:&nbsp;rich digital prints plus beautiful stone embellishments create a high‑end finish.Custom tailoring:&nbsp;unstitched, with plenty of fabric to tailor the fit precisely to your size and taste.Versatile use:&nbsp;great for casual daily wear, office looks, or festive events where you want something special yet comfortable.Value pick:&nbsp;boutique feel without a steep price, making it smart for personal use or as a thoughtful gift.Product detailsDesign:&nbsp;All‑over digital print with stone workFabric:&nbsp;Premium pure cottonFabric size:&nbsp;80+ body fabric, unstitched', 'storage/media/product/2026-03-13-ifyqVwhOnoc5vFoKwREwC0q6lhOKa6XwM2bKpVoj.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-13 07:23:37', '2026-03-13 07:23:37'),
	(107, 'Premium Midi Gown for Women', 'COD20260313107', 'premium-midi-gown-for-women', 3, 1, 2, 1, 'other', '517788944853', NULL, 'storage/media/product/2026-03-13-XTImhRZE1ftMhMgJbNBwdOYvwZEOGKovv5Ujkyi9.webp', NULL, '<p data-start="241" data-end="510" style="color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;">Your style with this&nbsp;<span data-start="270" data-end="294" style="font-weight: bolder;">Attachable Midi Gown</span>, crafted for modern women who love elegance and comfort. The&nbsp;<span data-start="356" data-end="404" style="font-weight: bolder;">upper part is made from soft Malai Georgette</span>, while the&nbsp;<span data-start="416" data-end="467" style="font-weight: bolder;">lower part features premium Dubai Cherry fabric</span>, creating a graceful and stylish contrast.</p><p data-start="512" data-end="777" style="color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;">This gown comes with an&nbsp;<span data-start="536" data-end="569" style="font-weight: bolder;">attached upper and lower part</span>, ensuring easy wear and a perfect fit. Designed to flatter&nbsp;<span data-start="629" data-end="649" style="font-weight: bolder;">body sizes 34–48</span>, with a flowing&nbsp;<span data-start="666" data-end="692" style="font-weight: bolder;">length of 47–48 inches</span>, it is ideal for parties, family gatherings, festive occasions, or casual outings.</p><p style="color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;"></p><p data-start="779" data-end="984" style="color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 16px;"><span data-start="779" data-end="790" style="font-weight: bolder;">Fabric:</span>&nbsp;Upper – Malai Georgette | Lower – Dubai Cherry<br data-start="837" data-end="840"><span data-start="840" data-end="851" style="font-weight: bolder;">Design:</span>&nbsp;Upper &amp; Lower Part Attached<br data-start="879" data-end="882"><span data-start="882" data-end="896" style="font-weight: bolder;">Body Size:</span>&nbsp;34–48<br data-start="902" data-end="905"><span data-start="905" data-end="916" style="font-weight: bolder;">Length:</span>&nbsp;47–48 Inch</p>', 1580.00, 1580.00, 1580.00, 0.00, 'amount', NULL, NULL, NULL, 'Premium Midi Gown for Women', 'Your style with this&nbsp;Attachable Midi Gown, crafted for modern women who love elegance and comfort. The&nbsp;upper part is made from soft Malai Georgette, while the&nbsp;lower part features premium Dubai Cherry fabric, creating a graceful and stylish contrast.This gown comes with an&nbsp;attached upper and lower part, ensuring easy wear and a perfect fit. Designed to flatter&nbsp;body sizes 34–48, with a flowing&nbsp;length of 47–48 inches, it is ideal for parties, family gatherings, festive occasions, or casual outings.Fabric:&nbsp;Upper – Malai Georgette | Lower – Dubai CherryDesign:&nbsp;Upper &amp; Lower Part AttachedBody Size:&nbsp;34–48Length:&nbsp;47–48 Inch', 'storage/media/product/2026-03-13-XTImhRZE1ftMhMgJbNBwdOYvwZEOGKovv5Ujkyi9.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-13 07:36:06', '2026-03-13 07:36:06'),
	(108, 'Pure Cotton Unstitched Three Piece (Jam)', 'COD20260313108', 'pure-cotton-unstitched-three-piece-jam', 3, 1, 2, 1, 'other', '345976407288', NULL, 'storage/media/product/2026-03-13-gEAGloc7MeZvbbC7L80XhhkzE5jClCsmJRjIH7Vk.webp', NULL, '<p data-start="329" data-end="649" style="color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol"; font-size: 16px;"><span data-start="376" data-end="422" style="font-weight: bolder;">Premium Pure Cotton Unstitched Three Piece</span> set, designed for comfort, elegance, and custom tailoring. The set combines vibrant all‑over digital prints with exquisite stone work, delivering a luxurious look that’s perfect for daily wear, gifting, or special occasions.</p><p data-start="651" data-end="866" style="color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol"; font-size: 16px;">Made from <span data-start="661" data-end="688" style="font-weight: bolder;">soft, breathable cotton</span>, the generous <span data-start="703" data-end="722" style="font-weight: bolder;">80+ body fabric</span> gives you freedom to stitch the outfit exactly to your preferred fit and style—whether you choose salwar kameez, A‑line, or another silhouette.</p><h4 data-start="868" data-end="890" style="font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol"; color: rgb(33, 37, 41);">Why it stands out</h4><ul data-start="891" data-end="1458" style="margin-bottom: 1rem; color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol"; font-size: 16px;"><li data-start="891" data-end="988"><p data-start="893" data-end="988"><span data-start="893" data-end="912" style="font-weight: bolder;">Premium fabric:</span> 100% pure cotton for all‑day comfort and airflow, ideal for warm weather.</p></li><li data-start="989" data-end="1099"><p data-start="991" data-end="1099"><span data-start="991" data-end="1015" style="font-weight: bolder;">Eye‑catching design:</span> rich digital prints plus beautiful stone embellishments create a high‑end finish.</p></li><li data-start="1100" data-end="1211"><p data-start="1102" data-end="1211"><span data-start="1102" data-end="1123" style="font-weight: bolder;">Custom tailoring:</span> unstitched, with plenty of fabric to tailor the fit precisely to your size and taste.</p></li><li data-start="1212" data-end="1345"><p data-start="1214" data-end="1345"><span data-start="1214" data-end="1232" style="font-weight: bolder;">Versatile use:</span> great for casual daily wear, office looks, or festive events where you want something special yet comfortable.</p></li><li data-start="1346" data-end="1458"><p data-start="1348" data-end="1458"><span data-start="1348" data-end="1363" style="font-weight: bolder;">Value pick:</span> boutique feel without a steep price, making it smart for personal use or as a thoughtful gift.</p></li></ul><h4 data-start="1460" data-end="1482" style="font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol"; color: rgb(33, 37, 41);">Product details</h4><ul data-start="1483" data-end="1786" style="margin-bottom: 1rem; color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol"; font-size: 16px;"><li data-start="1483" data-end="1537"><p data-start="1485" data-end="1537"><span data-start="1485" data-end="1496" style="font-weight: bolder;">Design:</span> All‑over digital print with stone work</p></li><li data-start="1538" data-end="1573"><p data-start="1540" data-end="1573"><span data-start="1540" data-end="1551" style="font-weight: bolder;">Fabric:</span> Premium pure cotton</p></li><li data-start="1574" data-end="1622"><p data-start="1576" data-end="1622"><span data-start="1576" data-end="1592" style="font-weight: bolder;">Fabric size:</span> 80+ body fabric, unstitched</p></li></ul>', 1499.00, 1499.00, 1499.00, 0.00, 'amount', NULL, NULL, NULL, 'Pure Cotton Unstitched Three Piece (Jam)', 'Premium Pure Cotton Unstitched Three Piece&nbsp;set, designed for comfort, elegance, and custom tailoring. The set combines vibrant all‑over digital prints with exquisite stone work, delivering a luxurious look that’s perfect for daily wear, gifting, or special occasions.Made from&nbsp;soft, breathable cotton, the generous&nbsp;80+ body fabric&nbsp;gives you freedom to stitch the outfit exactly to your preferred fit and style—whether you choose salwar kameez, A‑line, or another silhouette.Why it stands outPremium fabric:&nbsp;100% pure cotton for all‑day comfort and airflow, ideal for warm weather.Eye‑catching design:&nbsp;rich digital prints plus beautiful stone embellishments create a high‑end finish.Custom tailoring:&nbsp;unstitched, with plenty of fabric to tailor the fit precisely to your size and taste.Versatile use:&nbsp;great for casual daily wear, office looks, or festive events where you want something special yet comfortable.Value pick:&nbsp;boutique feel without a steep price, making it smart for personal use or as a thoughtful gift.Product detailsDesign:&nbsp;All‑over digital print with stone workFabric:&nbsp;Premium pure cottonFabric size:&nbsp;80+ body fabric, unstitched', 'storage/media/product/2026-03-13-gEAGloc7MeZvbbC7L80XhhkzE5jClCsmJRjIH7Vk.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-13 07:39:10', '2026-03-13 07:40:27'),
	(109, 'T-Shirt Exclusive 1pcs', 'COD20260313109', 't-shirt-exclusive-1pcs', 2, 1, 2, 1, 'other', '365111106586', NULL, 'storage/media/product/2026-03-13-IOnkatBbxCMZsWtAOpiWmX1myeGlugjzMHqfTXVD.webp', NULL, '<p>T-Shirt Exclusive<br>High Super Quality</p>', 499.00, 499.00, 499.00, 0.00, 'amount', NULL, NULL, NULL, 'T-Shirt Exclusive', 'T-Shirt ExclusiveHigh Super Quality', 'storage/media/product/2026-03-13-IOnkatBbxCMZsWtAOpiWmX1myeGlugjzMHqfTXVD.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-13 07:43:58', '2026-03-13 07:44:37'),
	(110, 'Ai-Classic Style', 'COD20260313110', 'ai-classic-style', 2, 1, 2, 1, 'other', '126107559276', NULL, 'storage/media/product/2026-03-13-0haZODxpbLe2g9mx8ItZXCyKYSJ1wwbfzh9jboM7.webp', '<p>Ai-Classic Style</p>', NULL, 149.00, 149.00, 149.00, 0.00, 'amount', NULL, NULL, NULL, 'Ai-Classic Style', '', 'storage/media/product/2026-03-13-0haZODxpbLe2g9mx8ItZXCyKYSJ1wwbfzh9jboM7.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-13 07:47:01', '2026-03-13 07:47:01'),
	(111, 'Be Yourself Future', 'COD20260313111', 'be-yourself-future', 2, 1, 2, 1, 'other', '642399480904', NULL, 'storage/media/product/2026-03-13-T1MobyARMUy62mojtlijiucQiUelcODMJz752jqc.webp', '<p>Be Yourself Future</p>', '<p>Be Yourself Future</p><p>Cheapest Price</p><p>Hot weather best perfect&nbsp;</p>', 149.00, 149.00, 149.00, 0.00, 'amount', NULL, NULL, NULL, 'Be Yourself Future', 'Be Yourself FutureCheapest PriceHot weather best perfect&nbsp;', 'storage/media/product/2026-03-13-T1MobyARMUy62mojtlijiucQiUelcODMJz752jqc.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-13 07:49:56', '2026-03-13 07:49:56'),
	(112, 'Be Yourself Future (Jam Color)', 'COD20260313112', 'be-yourself-future-jam-color', 2, 1, 2, 1, 'other', '493915424286', NULL, 'storage/media/product/2026-03-14-JF4Py2iGMt1ITH5CfKVEbYxtFzGDFs2SkGd533uO.webp', '<p><span style="color: rgb(63, 66, 84); font-family: "math"; font-size: 14px;">Be Yourself Future</span></p>', '<p style="margin-bottom: 0px; color: rgb(63, 66, 84); font-family: "math"; font-size: 14px;">Be Yourself Future</p><p style="margin-bottom: 0px; color: rgb(63, 66, 84); font-family: "math"; font-size: 14px;">Cheapest Price</p><p style="margin-bottom: 0px; color: rgb(63, 66, 84); font-family: "math"; font-size: 14px;">Hot weather best perfect </p>', 149.00, 149.00, 149.00, 0.00, 'amount', NULL, NULL, NULL, 'Be Yourself Future (Jam Color)', 'Be Yourself FutureCheapest PriceHot weather best perfect&nbsp;', 'storage/media/product/2026-03-14-JF4Py2iGMt1ITH5CfKVEbYxtFzGDFs2SkGd533uO.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-13 07:52:20', '2026-03-13 20:36:45'),
	(113, 'Victory Performance Yellow', 'COD20260314113', 'victory-performance-yellow', 2, 1, 2, 1, 'other', '739955850105', NULL, 'storage/media/product/2026-03-14-kK69Qud4lXBBNjtoKCu6oKyKLbFm9C2JxV7zePPl.webp', NULL, '<p math";="" font-size:="" 14px;"="" style="margin-bottom: 0px; color: rgb(63, 66, 84); font-family: &quot;math&quot;; font-size: 14px;">Be Yourself Future</p><p math";="" font-size:="" 14px;"="" style="margin-bottom: 0px; color: rgb(63, 66, 84); font-family: &quot;math&quot;; font-size: 14px;">Cheapest Price</p><p math";="" font-size:="" 14px;"="" style="margin-bottom: 0px; color: rgb(63, 66, 84); font-family: &quot;math&quot;; font-size: 14px;">Hot weather best perfect&nbsp;</p>', 80.00, 139.00, 139.00, 0.00, 'amount', NULL, NULL, NULL, 'Victory Performance Yellow', 'Be Yourself FutureCheapest PriceHot weather best perfect&nbsp;', 'storage/media/product/2026-03-14-kK69Qud4lXBBNjtoKCu6oKyKLbFm9C2JxV7zePPl.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-13 22:02:31', '2026-03-13 22:02:31'),
	(114, 'Feather White', 'COD20260314114', 'feather-white', 2, 1, 2, 1, 'other', '767794542822', NULL, 'storage/media/product/2026-03-14-iZBmx2tvDeGLzqWb40JV0omO3J1gO2wlQOFlFGwe.webp', NULL, '<p style="margin-bottom: 0px; color: rgb(63, 66, 84); font-family: &quot;math&quot;; font-size: 14px;">Feather White<br>Cheapest Price</p><p style="margin-bottom: 0px; color: rgb(63, 66, 84); font-family: &quot;math&quot;; font-size: 14px;">Hot weather best perfect&nbsp;</p>', 139.00, 139.00, 139.00, 0.00, 'amount', NULL, NULL, NULL, 'Feather White', 'Feather WhiteCheapest PriceHot weather best perfect&nbsp;', 'storage/media/product/2026-03-14-iZBmx2tvDeGLzqWb40JV0omO3J1gO2wlQOFlFGwe.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-13 22:19:06', '2026-03-13 22:19:06'),
	(115, 'Xerley UK', 'COD20260314115', 'xerley-uk', 2, 1, 2, 1, 'other', '785544318456', NULL, 'storage/media/product/2026-03-14-QTDkjF1shaMVegZ6wrqinW9Gc4XRuoLBJ5QlGrLp.webp', NULL, '<p>Xerley UK<br></p><p math";="" font-size:="" 14px;"="" style="margin-bottom: 0px; color: rgb(63, 66, 84); font-family: &quot;math&quot;; font-size: 14px;">Cheapest Price</p><p math";="" font-size:="" 14px;"="" style="margin-bottom: 0px; color: rgb(63, 66, 84); font-family: &quot;math&quot;; font-size: 14px;">Hot weather best perfect&nbsp;</p>', 90.00, 149.00, 149.00, 0.00, 'amount', NULL, NULL, NULL, 'Xerley UK', 'Xerley UKCheapest PriceHot weather best perfect&nbsp;', 'storage/media/product/2026-03-14-QTDkjF1shaMVegZ6wrqinW9Gc4XRuoLBJ5QlGrLp.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-13 22:21:54', '2026-03-13 22:21:54'),
	(116, 'Sports Navy Blue', 'COD20260314116', 'sports-navy-blue', 2, 1, 2, 1, 'other', '667757032470', NULL, 'storage/media/product/2026-03-14-HcpgzzgFpM49jCPMRj2AuRDoen3EHznTc3Tk5c18.webp', NULL, '<p math";="" font-size:="" 14px;"="" style="margin-bottom: 0px;"><font color="#3f4254" face="math"><span style="font-size: 14px;">Sports Navy Blue</span></font></p><p math";="" font-size:="" 14px;"="" style="margin-bottom: 0px; color: rgb(63, 66, 84); font-family: &quot;math&quot;; font-size: 14px;">Cheapest Price</p><p math";="" font-size:="" 14px;"="" style="margin-bottom: 0px; color: rgb(63, 66, 84); font-family: &quot;math&quot;; font-size: 14px;">Hot weather best perfect&nbsp;</p>', 90.00, 149.00, 149.00, 0.00, 'amount', NULL, NULL, NULL, 'Sports Navy Blue', 'Sports Navy BlueCheapest PriceHot weather best perfect&nbsp;', 'storage/media/product/2026-03-14-HcpgzzgFpM49jCPMRj2AuRDoen3EHznTc3Tk5c18.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-13 22:23:21', '2026-03-13 22:23:21'),
	(117, 'Humble Navy Blue', 'COD20260314117', 'humble-navy-blue', 2, 1, 2, 1, 'other', '378754137862', NULL, 'storage/media/product/2026-03-14-Fc5MNG6WG22BKHZ4q38Aw7c1vX02UCtpT2Zu31Gm.webp', NULL, '<p>Humble Navy Blue</p><p math";="" font-size:="" 14px;"="" style="margin-bottom: 0px; color: rgb(63, 66, 84); font-family: &quot;math&quot;; font-size: 14px;">Cheapest Price</p><p math";="" font-size:="" 14px;"="" style="margin-bottom: 0px; color: rgb(63, 66, 84); font-family: &quot;math&quot;; font-size: 14px;">Hot weather best perfect&nbsp;</p>', 90.00, 149.00, 149.00, 0.00, 'amount', NULL, NULL, NULL, 'Humble Navy Blue', 'Humble Navy BlueCheapest PriceHot weather best perfect&nbsp;', 'storage/media/product/2026-03-14-Fc5MNG6WG22BKHZ4q38Aw7c1vX02UCtpT2Zu31Gm.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-13 22:24:42', '2026-03-13 22:24:42'),
	(118, 'Puma Black', 'COD20260314118', 'puma-black', 2, 1, 2, 1, 'other', '624582095407', NULL, 'storage/media/product/2026-03-14-Hs1og42UvOY2xacXXvEI7Ajxp03xNgdeeNUnahX4.webp', NULL, '<p>Puma Black</p><p math";="" font-size:="" 14px;"="" style="margin-bottom: 0px; color: rgb(63, 66, 84); font-family: "math"; font-size: 14px;">Cheapest Price</p><p math";="" font-size:="" 14px;"="" style="margin-bottom: 0px; color: rgb(63, 66, 84); font-family: "math"; font-size: 14px;">Hot weather best perfect </p>', 90.00, 149.00, 149.00, 0.00, 'amount', NULL, NULL, NULL, 'Puma Black', 'Puma BlackCheapest PriceHot weather best perfect&nbsp;', 'storage/media/product/2026-03-14-Hs1og42UvOY2xacXXvEI7Ajxp03xNgdeeNUnahX4.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-13 22:26:09', '2026-03-13 22:26:22'),
	(119, 'Xerley UK Navy Blue', 'COD20260314119', 'xerley-uk-navy-blue', 2, 1, 2, 1, 'other', '479762214217', NULL, 'storage/media/product/2026-03-14-MIadTt1tblJoYxPz0ZMQqv4lpt9CZiBoxwpijHgz.webp', NULL, '<p>Xerley UK Navy Blue</p><p math";="" font-size:="" 14px;"="" style="margin-bottom: 0px; color: rgb(63, 66, 84); font-family: &quot;math&quot;; font-size: 14px;">Cheapest Price</p><p math";="" font-size:="" 14px;"="" style="margin-bottom: 0px; color: rgb(63, 66, 84); font-family: &quot;math&quot;; font-size: 14px;">Hot weather best perfect&nbsp;</p>', 90.00, 149.00, 149.00, 0.00, 'amount', NULL, NULL, NULL, 'Xerley UK Navy Blue', 'Xerley UK Navy BlueCheapest PriceHot weather best perfect&nbsp;', 'storage/media/product/2026-03-14-MIadTt1tblJoYxPz0ZMQqv4lpt9CZiBoxwpijHgz.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-13 22:28:40', '2026-03-13 22:28:40'),
	(120, 'Hilfiger', 'COD20260314120', 'hilfiger', 2, 1, 2, 1, 'other', '154743747476', NULL, 'storage/media/product/2026-03-14-ZMWVt3xrb6eGHnF5oSbAXjT7sXWORKHW3zyNQGVu.webp', NULL, '<p>Hilfiger</p><p math";="" font-size:="" 14px;"="" style="margin-bottom: 0px; color: rgb(63, 66, 84); font-family: &quot;math&quot;; font-size: 14px;">Cheapest Price</p><p math";="" font-size:="" 14px;"="" style="margin-bottom: 0px; color: rgb(63, 66, 84); font-family: &quot;math&quot;; font-size: 14px;">Hot weather best perfect&nbsp;</p>', 90.00, 149.00, 149.00, 0.00, 'amount', NULL, NULL, NULL, 'Hilfiger', 'HilfigerCheapest PriceHot weather best perfect&nbsp;', 'storage/media/product/2026-03-14-ZMWVt3xrb6eGHnF5oSbAXjT7sXWORKHW3zyNQGVu.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-13 22:29:56', '2026-03-13 22:29:56'),
	(121, 'Under Armour', 'COD20260314121', 'under-armour', 2, 1, 2, 1, 'other', '324657898397', NULL, 'storage/media/product/2026-03-14-nKtAkadpJy5i5bDRHmNzoz2oFajepPHK3LnHPTGn.webp', NULL, '<p>Under Armour</p><p math";="" font-size:="" 14px;"="" style="margin-bottom: 0px; color: rgb(63, 66, 84); font-family: &quot;math&quot;; font-size: 14px;">Cheapest Price</p><p math";="" font-size:="" 14px;"="" style="margin-bottom: 0px; color: rgb(63, 66, 84); font-family: &quot;math&quot;; font-size: 14px;">Hot weather best perfect&nbsp;</p>', 90.00, 149.00, 149.00, 0.00, 'amount', NULL, NULL, NULL, 'Under Armour', 'Under ArmourCheapest PriceHot weather best perfect&nbsp;', 'storage/media/product/2026-03-14-nKtAkadpJy5i5bDRHmNzoz2oFajepPHK3LnHPTGn.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-13 22:31:10', '2026-03-13 22:31:10'),
	(122, 'Harmani', 'COD20260314122', 'harmani', 2, 1, 2, 1, 'other', '259504007281', NULL, 'storage/media/product/2026-03-14-e39oxbXeiZEy8UPWq476EDT1dE8VMllzKKNTdlEY.webp', NULL, '<p math";="" font-size:="" 14px;"="" style="margin-bottom: 0px;"><font color="#3f4254" face="math"><span style="font-size: 14px;">Harmani</span></font></p><p math";="" font-size:="" 14px;"="" style="margin-bottom: 0px; color: rgb(63, 66, 84); font-family: &quot;math&quot;; font-size: 14px;">Cheapest Price</p><p math";="" font-size:="" 14px;"="" style="margin-bottom: 0px; color: rgb(63, 66, 84); font-family: &quot;math&quot;; font-size: 14px;">Hot weather best perfect&nbsp;</p>', 90.00, 149.00, 149.00, 0.00, 'amount', NULL, NULL, NULL, 'Harmani', 'HarmaniCheapest PriceHot weather best perfect&nbsp;', 'storage/media/product/2026-03-14-e39oxbXeiZEy8UPWq476EDT1dE8VMllzKKNTdlEY.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-13 22:32:25', '2026-03-13 22:32:25'),
	(123, 'Evisu Women T-Shirt', 'COD20260314123', 'evisu-women-t-shirt', 6, 1, 2, 1, 'other', '114280812275', NULL, 'storage/media/product/2026-03-14-hPKU2sF1ea6W3zL9KjpOzVzg1g9EQPnQDTrC13Gl.webp', NULL, NULL, 90.00, 149.00, 149.00, 0.00, 'amount', NULL, NULL, NULL, 'Evisu Women T-Shirt', '', 'storage/media/product/2026-03-14-hPKU2sF1ea6W3zL9KjpOzVzg1g9EQPnQDTrC13Gl.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-13 22:35:07', '2026-03-13 22:35:07'),
	(124, 'Victory Performance Women Yellow', 'COD20260314124', 'victory-performance-women-yellow', 6, 1, 2, 1, 'other', '996554799341', NULL, 'storage/media/product/2026-03-14-YLHLJusHJ3LPCuwcMueRwiBuDVtEl5Qn6S3WlYlJ.webp', NULL, NULL, 80.00, 139.00, 139.00, 0.00, 'amount', NULL, NULL, NULL, 'Victory Performance Women Yellow', '', 'storage/media/product/2026-03-14-YLHLJusHJ3LPCuwcMueRwiBuDVtEl5Qn6S3WlYlJ.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-13 22:37:07', '2026-03-13 22:37:07'),
	(125, 'Victory Performance Women White', 'COD20260314125', 'victory-performance-women-white', 6, 1, 2, 1, 'other', '175966497276', NULL, 'storage/media/product/2026-03-14-YtBzUIHz12Nt1bspjPnmckPYj2UsVTCprrHUPiYz.webp', NULL, NULL, 80.00, 139.00, 139.00, 0.00, 'amount', NULL, NULL, NULL, 'Victory Performance Women White', '', 'storage/media/product/2026-03-14-YtBzUIHz12Nt1bspjPnmckPYj2UsVTCprrHUPiYz.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-13 22:38:07', '2026-03-13 22:38:07'),
	(126, 'T-Shirt Dash folding', 'COD20260314126', 't-shirt-dash-folding', 6, 1, 2, 1, 'other', '415396346128', NULL, 'storage/media/product/2026-03-14-RvZwL0D9OdIYOxKWxPGicTMJaGDMTdG9hZkToDhj.webp', NULL, NULL, 380.00, 499.00, 499.00, 0.00, 'amount', NULL, NULL, NULL, 'T-Shirt Dash folding', '', 'storage/media/product/2026-03-14-RvZwL0D9OdIYOxKWxPGicTMJaGDMTdG9hZkToDhj.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-13 22:39:55', '2026-03-13 22:39:55'),
	(127, 'Comfort Black Check Casual Shirt', 'COD20260314127', 'comfort-black-check-casual-shirt-1', 10, 1, 2, 1, 'other', '623958496744', NULL, 'storage/media/product/2026-03-14-lWxIgLaNtbBydTnrdL2Z6ilIQQm7tuWvwrSIkUvq.webp', '<p>Stylish and comfortable black check shirt made with soft breathable fabric. </p>', '<p>Stylish and comfortable black check shirt made with soft breathable fabric. Perfect for casual wear, office, or daily use. Designed for a modern look with long-lasting comfort.</p>', 240.00, 350.00, 350.00, 0.00, 'amount', NULL, NULL, NULL, 'Comfort Black Check Casual Shirt for Men', 'Stylish and comfortable black check shirt made with soft breathable fabric. Perfect for casual wear, office, or daily use. Designed for a modern look with long-lasting comfort.', 'storage/media/product/2026-03-14-lWxIgLaNtbBydTnrdL2Z6ilIQQm7tuWvwrSIkUvq.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-13 22:43:33', '2026-03-13 22:52:49'),
	(128, 'Comfort Black Check Casual Shirt', 'COD20260314128', 'comfort-black-check-casual-shirt', 10, 1, 2, 1, 'other', '258170422299', NULL, 'storage/media/product/2026-03-14-1hDII2trRP8Sygrfvn6dvBAtFOV2vEu898wg9iss.webp', '<p>Stylish and comfortable black check shirt made with soft breathable fabric.&nbsp;</p>', '<p>Stylish and comfortable black check shirt made with soft breathable fabric. Perfect for casual wear, office, or daily use. Designed for a modern look with long-lasting comfort.</p>', 280.00, 350.00, 350.00, 0.00, 'amount', NULL, NULL, NULL, 'Comfort Black Check Casual Shirt', 'Stylish and comfortable black check shirt made with soft breathable fabric. Perfect for casual wear, office, or daily use. Designed for a modern look with long-lasting comfort.', 'storage/media/product/2026-03-14-1hDII2trRP8Sygrfvn6dvBAtFOV2vEu898wg9iss.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-13 22:45:57', '2026-03-13 22:52:28'),
	(129, 'Navy Blue Check Casual Shirt', 'COD20260314129', 'navy-blue-check-casual-shirt', 10, 1, 2, 1, 'other', '291913353833', NULL, 'storage/media/product/2026-03-14-mQl8zLyI5mTy8MedqRMkQQ3izV4J9fOa6uiZuw7y.webp', '<p><span style="color: rgb(63, 66, 84); font-family: " math";="" font-size:="" 14px;"="">Stylish and comfortable black check shirt made with soft breathable fabric.&nbsp;</span></p>', '<p><span style="color: rgb(63, 66, 84); font-family: "math"; font-size: 14px;">Stylish and comfortable black check shirt made with soft breathable fabric. Perfect for casual wear, office, or daily use. Designed for a modern look with long-lasting comfort.</span></p>', 150.00, 300.00, 300.00, 0.00, 'amount', NULL, NULL, NULL, 'Navy Blue Check Casual Shirt', 'Stylish and comfortable black check shirt made with soft breathable fabric. Perfect for casual wear, office, or daily use. Designed for a modern look with long-lasting comfort.', 'storage/media/product/2026-03-14-mQl8zLyI5mTy8MedqRMkQQ3izV4J9fOa6uiZuw7y.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-13 22:47:15', '2026-03-13 22:51:50'),
	(130, 'Whit and Black Check Shirt', 'COD20260314130', 'whit-and-black-check-shirt', 10, 1, 2, 1, 'other', '994103777714', NULL, 'storage/media/product/2026-03-14-oSH9JXp1Jnh77DSTMFGp2SCbsBxvjMS7YsH4JXnb.webp', '<p><span style="color: rgb(63, 66, 84); font-family: " math";="" font-size:="" 14px;"="">Stylish and comfortable black check shirt made with soft breathable fabric.&nbsp;</span></p>', '<p><span style="color: rgb(63, 66, 84); font-family: " math";="" font-size:="" 14px;"="">Stylish and comfortable black check shirt made with soft breathable fabric. Perfect for casual wear, office, or daily use. Designed for a modern look with long-lasting comfort.</span></p>', 280.00, 350.00, 350.00, 0.00, 'amount', NULL, NULL, NULL, 'Whit and Black Check Shirt', 'Stylish and comfortable black check shirt made with soft breathable fabric. Perfect for casual wear, office, or daily use. Designed for a modern look with long-lasting comfort.', 'storage/media/product/2026-03-14-oSH9JXp1Jnh77DSTMFGp2SCbsBxvjMS7YsH4JXnb.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-13 22:49:14', '2026-03-13 22:51:39'),
	(131, 'White and Light Check Shirt', 'COD20260314131', 'white-and-light-check-shirt', 10, 1, 2, 1, 'other', '115452626333', NULL, 'storage/media/product/2026-03-14-nqBv3MDzcyZ472HoYHnNuSbcsijoesCCLXInUPjZ.webp', '<p><span style="color: rgb(63, 66, 84); font-family: " math";="" font-size:="" 14px;"="">Stylish and comfortable black check shirt made with soft breathable fabric.&nbsp;</span></p>', '<p><span style="color: rgb(63, 66, 84); font-family: "math"; font-size: 14px;">Stylish and comfortable black check shirt made with soft breathable fabric. Perfect for casual wear, office, or daily use. Designed for a modern look with long-lasting comfort.</span></p>', 280.00, 350.00, 350.00, 0.00, 'amount', NULL, NULL, NULL, 'White and Light Check Shirt', 'Stylish and comfortable black check shirt made with soft breathable fabric. Perfect for casual wear, office, or daily use. Designed for a modern look with long-lasting comfort.', 'storage/media/product/2026-03-14-nqBv3MDzcyZ472HoYHnNuSbcsijoesCCLXInUPjZ.webp', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-13 22:50:28', '2026-03-13 22:51:22'),
	(132, 'Aluminum Food Box 450ml (25pcs)', 'COD20260314132', 'aluminum-food-box-450ml-25pcs', 87, 1, 2, 1, 'other', '494799106859', NULL, 'storage/media/product/2026-03-14-v0GKKhQT1PaEMjepkRiYcIilKIKV431dyyV9EyZU.webp', NULL, NULL, 125.00, 175.00, 175.00, 0.00, 'amount', NULL, NULL, NULL, 'Aluminum Food Box 450ml (25pcs)', '', 'storage/media/product/2026-03-14-v0GKKhQT1PaEMjepkRiYcIilKIKV431dyyV9EyZU.webp', 0, 0, 0, 0, 0, 1, 1, NULL, NULL, NULL, '2026-03-14 07:40:35', '2026-03-14 07:40:35'),
	(133, 'Aluminum Food Box 650ml (25pcs)', 'COD20260314133', 'aluminum-food-box-650ml-25pcs', 87, 1, 2, 1, 'other', '829928040536', NULL, 'storage/media/product/2026-03-14-Zc6UKH7yc1jPMK9Q06Qw2mdbjd6Thj13ok4QCiVf.webp', NULL, NULL, 200.00, 250.00, 250.00, 0.00, 'amount', NULL, NULL, NULL, 'Aluminum Food Box 650ml', '', 'storage/media/product/2026-03-14-Zc6UKH7yc1jPMK9Q06Qw2mdbjd6Thj13ok4QCiVf.webp', 0, 0, 0, 0, 0, 1, 1, 1, NULL, NULL, '2026-03-14 07:42:26', '2026-03-14 07:42:51'),
	(134, 'Aluminum Food Box 750ml (25pcs)', 'COD20260314134', 'aluminum-food-box-750ml-25pcs', 87, 1, 2, 1, 'other', '522975156076', NULL, 'storage/media/product/2026-03-14-VQ50NA7jkW5hQmuPIKv8flHAOoRBll0guq8rYFsJ.webp', NULL, NULL, 325.00, 324.97, 324.97, 0.00, 'amount', NULL, NULL, NULL, 'Aluminum Food Box 750ml (25pcs)', '', 'storage/media/product/2026-03-14-VQ50NA7jkW5hQmuPIKv8flHAOoRBll0guq8rYFsJ.webp', 0, 0, 0, 0, 0, 1, 1, NULL, NULL, NULL, '2026-03-14 07:43:52', '2026-03-14 07:43:52'),
	(135, 'Aluminum Food Box 450ml (50pcs)', 'COD20260314135', 'aluminum-food-box-450ml-50pcs', 87, 1, 2, 1, 'other', '314211096827', NULL, 'storage/media/product/2026-03-14-mhu3LAN4Pl0cPGUIJKNvEhlp0OI93LbVnm7wXjlL.webp', NULL, NULL, 300.00, 350.00, 350.00, 0.00, 'amount', NULL, NULL, NULL, 'Aluminum Food Box 450ml (50pcs)', '', 'storage/media/product/2026-03-14-mhu3LAN4Pl0cPGUIJKNvEhlp0OI93LbVnm7wXjlL.webp', 0, 0, 0, 0, 0, 1, 1, NULL, NULL, NULL, '2026-03-14 07:47:06', '2026-03-14 07:47:06'),
	(136, 'Aluminum Food Box 650ml (50pcs)', 'COD20260314136', 'aluminum-food-box-650ml-50pcs', 87, 1, 2, 1, 'other', '306597224010', NULL, 'storage/media/product/2026-03-14-8nco3cIObQhEoKe8TarjiLzx0LInLM2hj0OZ7ZG3.webp', NULL, NULL, 400.00, 500.00, 500.00, 0.00, 'amount', NULL, NULL, NULL, 'Aluminum Food Box 650ml (50pcs)', '', 'storage/media/product/2026-03-14-8nco3cIObQhEoKe8TarjiLzx0LInLM2hj0OZ7ZG3.webp', 0, 0, 0, 0, 0, 1, 1, NULL, NULL, NULL, '2026-03-14 07:48:01', '2026-03-14 07:48:01'),
	(137, 'Plastic Bati 250ml (25pcs)', 'COD20260314137', 'plastic-bati-250ml-25pcs', 88, 1, 2, 1, 'other', '570502338776', NULL, 'storage/media/product/2026-03-14-NjaxfAmeUJ6gm0jolGZaIzCNweY6VbzOQ62kWNZW.webp', NULL, NULL, 100.00, 175.00, 175.00, 0.00, 'amount', NULL, NULL, NULL, 'Plastic Bati 250ml (25pcs)', '', 'storage/media/product/2026-03-14-NjaxfAmeUJ6gm0jolGZaIzCNweY6VbzOQ62kWNZW.webp', 0, 0, 0, 0, 0, 1, 1, NULL, NULL, NULL, '2026-03-14 07:51:24', '2026-03-14 07:51:24'),
	(138, 'Plastic Bati (Water color) (25pcs)', 'COD20260314138', 'plastic-bati-water-color-25pcs', 88, 1, 2, 1, 'other', '652701497523', NULL, 'storage/media/product/2026-03-14-k4s4xK9FSTB9AXMHXvKeHDpZOF3NQOy5uKQQ9lX3.webp', NULL, NULL, 100.00, 185.00, 185.00, 0.00, 'amount', NULL, NULL, NULL, 'Plastic Bati (Water color) (25pcs)', '', 'storage/media/product/2026-03-14-k4s4xK9FSTB9AXMHXvKeHDpZOF3NQOy5uKQQ9lX3.webp', 0, 0, 0, 0, 0, 1, 1, NULL, NULL, NULL, '2026-03-14 07:53:41', '2026-03-14 07:53:41'),
	(139, 'Plastic Bati 100ml (25pcs)', 'COD20260314139', 'plastic-bati-100ml-25pcs', 88, 1, 2, 1, 'other', '590256357355', NULL, 'storage/media/product/2026-03-14-C37xSZrKGElmjX2eiyQahZFe4jCYB5zQtRVgYGBT.webp', NULL, NULL, 70.00, 100.00, 100.00, 0.00, 'amount', NULL, NULL, NULL, 'Plastic Bati 100ml (25pcs)', '', 'storage/media/product/2026-03-14-C37xSZrKGElmjX2eiyQahZFe4jCYB5zQtRVgYGBT.webp', 0, 0, 0, 0, 0, 1, 1, NULL, NULL, NULL, '2026-03-14 07:55:27', '2026-03-14 07:55:27'),
	(140, 'Plastic Bati (White color) (50pcs)', 'COD20260314140', 'plastic-bati-white-color-50pcs', 88, 1, 2, 1, 'other', '816480349701', NULL, 'storage/media/product/2026-03-14-DPb9H6U7kTS9y0I7BsUhwKvnI34ghB6EQ8uratto.webp', NULL, NULL, 300.00, 350.00, 350.00, 0.00, 'amount', NULL, NULL, NULL, 'Plastic Bati (Water color) (50pcs)', '', 'storage/media/product/2026-03-14-DPb9H6U7kTS9y0I7BsUhwKvnI34ghB6EQ8uratto.webp', 0, 0, 0, 0, 0, 1, 1, 1, NULL, NULL, '2026-03-14 07:57:01', '2026-03-14 07:59:02'),
	(141, 'Plastic Bati (Water color) (50pcs)', 'COD20260314141', 'plastic-bati-water-color-50pcs', 88, 1, 2, 1, 'other', '821962311127', NULL, 'storage/media/product/2026-03-14-6M31sk937nIGBgAbIMuikc86gUPZSB2eOGJaOqZ3.webp', NULL, NULL, 750.00, 780.00, 780.00, 0.00, 'amount', NULL, NULL, NULL, 'Plastic Bati (Water color) (50pcs)', '', 'storage/media/product/2026-03-14-6M31sk937nIGBgAbIMuikc86gUPZSB2eOGJaOqZ3.webp', 0, 0, 0, 0, 0, 1, 1, NULL, NULL, NULL, '2026-03-14 07:59:49', '2026-03-14 07:59:49'),
	(142, 'Plastics Bag Parcel (100pcs) 13x14 Size', 'COD20260314142', 'plastics-bag-parcel-100pcs-13x14-size', 89, 1, 2, 1, 'other', '431535988138', NULL, 'storage/media/product/2026-03-14-ancYLtzffV45BpvCCduhwYU3mlkDEV8SOabhL9Cp.webp', NULL, NULL, 300.00, 500.00, 500.00, 0.00, 'amount', NULL, NULL, NULL, 'Plastics Bag Parcel (100pcs) 13X14 Size', '', 'storage/media/product/2026-03-14-ancYLtzffV45BpvCCduhwYU3mlkDEV8SOabhL9Cp.webp', 0, 0, 0, 0, 0, 1, 1, 1, NULL, NULL, '2026-03-14 08:05:04', '2026-03-14 08:05:40'),
	(143, 'Parcel Bag 50pcs (14x16 Size)', 'COD20260314143', 'parcel-bag-50pcs-14x16-size', 89, 1, 2, 1, 'other', '607038806626', NULL, 'storage/media/product/2026-03-14-gf9nUIa35xHFwjkjikYt3iAgXz0hi1IWfZp8h0fv.webp', NULL, NULL, 250.00, 400.00, 400.00, 0.00, 'amount', NULL, NULL, NULL, 'Parcel Bag 50pcs (14x16 Size)', '', 'storage/media/product/2026-03-14-gf9nUIa35xHFwjkjikYt3iAgXz0hi1IWfZp8h0fv.webp', 0, 0, 0, 0, 0, 1, 1, NULL, NULL, NULL, '2026-03-14 08:10:09', '2026-03-14 08:10:09'),
	(144, 'Zipper Bag 100pcs', 'COD20260314144', 'zipper-bag-100pcs', 89, 1, 2, 1, 'other', '766179749135', NULL, 'storage/media/product/2026-03-14-kKcoal9wCWA1ibYHpSxhaWLMh00Y85TgTHrkgXVu.webp', NULL, NULL, 350.00, 450.00, 450.00, 0.00, 'amount', NULL, NULL, NULL, 'Zipper Bag 100pcs', '', 'storage/media/product/2026-03-14-kKcoal9wCWA1ibYHpSxhaWLMh00Y85TgTHrkgXVu.webp', 0, 0, 0, 0, 0, 1, 1, NULL, NULL, NULL, '2026-03-14 08:11:37', '2026-03-14 08:11:37'),
	(145, 'Food Parcel Bag 100pcs (1kg size) small', 'COD20260314145', 'food-parcel-bag-100pcs-1kg-size-small', 89, 1, 2, 1, 'other', '933995529241', NULL, 'storage/media/product/2026-03-14-Z590o3557oN2Glera4XEUNqctF9uMGhrU5AQuwne.webp', NULL, NULL, 170.00, 250.00, 250.00, 0.00, 'amount', NULL, NULL, NULL, 'Food Parcel Bag 10pcs (1kg size) small', '', 'storage/media/product/2026-03-14-Z590o3557oN2Glera4XEUNqctF9uMGhrU5AQuwne.webp', 0, 0, 0, 0, 0, 1, 1, 1, NULL, NULL, '2026-03-14 08:15:20', '2026-03-14 08:15:37'),
	(146, 'Food Parcel Bag 100pcs (Medium size)', 'COD20260314146', 'food-parcel-bag-100pcs-medium-size', 89, 1, 2, 1, 'other', '561469847182', NULL, 'storage/media/product/2026-03-14-LBYY0rnGHeraAyPCEVtDwhoa5P3Cw0Ksju5CD0SE.webp', NULL, NULL, 300.00, 400.00, 400.00, 0.00, 'amount', NULL, NULL, NULL, 'Food Parcel Bag 100pcs (Medium size)', '', 'storage/media/product/2026-03-14-LBYY0rnGHeraAyPCEVtDwhoa5P3Cw0Ksju5CD0SE.webp', 0, 0, 0, 0, 0, 1, 1, NULL, NULL, NULL, '2026-03-14 08:16:52', '2026-03-14 08:16:52'),
	(147, 'Food Parcel Bag 50pcs (Big size)', 'COD20260314147', 'food-parcel-bag-50pcs-big-size', 89, 1, 2, 1, 'other', '921777505107', NULL, 'storage/media/product/2026-03-14-6bIK4mHH2GXmBCnDiEgDlTvhD3FgmabRGBuiK7V7.webp', NULL, NULL, 250.00, 370.00, 370.00, 0.00, 'amount', NULL, NULL, NULL, 'Food Parcel Bag 50pcs (Big size)', '', 'storage/media/product/2026-03-14-6bIK4mHH2GXmBCnDiEgDlTvhD3FgmabRGBuiK7V7.webp', 0, 0, 0, 0, 0, 1, 1, 1, NULL, NULL, '2026-03-14 08:18:02', '2026-03-14 08:18:39');

-- Dumping structure for table airas_mart.product_authors
DROP TABLE IF EXISTS `product_authors`;
CREATE TABLE IF NOT EXISTS `product_authors` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `author_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_authors_product_id_foreign` (`product_id`),
  KEY `product_authors_author_id_foreign` (`author_id`),
  CONSTRAINT `product_authors_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_authors_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.product_authors: ~67 rows (approximately)
DELETE FROM `product_authors`;
INSERT INTO `product_authors` (`id`, `product_id`, `author_id`, `created_at`, `updated_at`) VALUES
	(21, 40, 2, '2026-03-06 21:56:46', '2026-03-06 21:56:46'),
	(22, 41, 1, '2026-03-06 22:22:58', '2026-03-06 22:22:58'),
	(23, 42, 2, '2026-03-06 22:38:03', '2026-03-06 22:38:03'),
	(24, 43, 2, '2026-03-06 22:39:25', '2026-03-06 22:39:25'),
	(25, 44, 2, '2026-03-06 22:39:50', '2026-03-06 22:39:50'),
	(26, 45, 2, '2026-03-06 22:40:12', '2026-03-06 22:40:12'),
	(27, 46, 2, '2026-03-06 22:41:33', '2026-03-06 22:41:33'),
	(28, 47, 2, '2026-03-06 22:42:03', '2026-03-06 22:42:03'),
	(29, 48, 2, '2026-03-06 22:42:40', '2026-03-06 22:42:40'),
	(30, 49, 2, '2026-03-06 22:43:20', '2026-03-06 22:43:20'),
	(31, 50, 2, '2026-03-06 22:43:47', '2026-03-06 22:43:47'),
	(32, 51, 2, '2026-03-06 22:44:12', '2026-03-06 22:44:12'),
	(33, 52, 2, '2026-03-06 22:45:52', '2026-03-06 22:45:52'),
	(34, 53, 2, '2026-03-06 22:46:24', '2026-03-06 22:46:24'),
	(35, 54, 2, '2026-03-06 22:46:57', '2026-03-06 22:46:57'),
	(36, 55, 2, '2026-03-06 22:47:21', '2026-03-06 22:47:21'),
	(37, 56, 2, '2026-03-06 22:47:39', '2026-03-06 22:47:39'),
	(38, 57, 2, '2026-03-06 22:48:02', '2026-03-06 22:48:02'),
	(39, 58, 2, '2026-03-06 22:49:09', '2026-03-06 22:49:09'),
	(40, 59, 2, '2026-03-06 22:49:37', '2026-03-06 22:49:37'),
	(41, 60, 2, '2026-03-06 22:49:54', '2026-03-06 22:49:54'),
	(42, 61, 2, '2026-03-06 22:50:31', '2026-03-06 22:50:31'),
	(43, 62, 2, '2026-03-06 22:51:14', '2026-03-06 22:51:14'),
	(44, 63, 2, '2026-03-06 22:51:53', '2026-03-06 22:51:53'),
	(45, 64, 2, '2026-03-07 02:18:07', '2026-03-07 02:18:07'),
	(46, 65, 2, '2026-03-07 02:18:48', '2026-03-07 02:18:48'),
	(47, 66, 2, '2026-03-07 02:19:26', '2026-03-07 02:19:26'),
	(48, 67, 2, '2026-03-07 02:20:00', '2026-03-07 02:20:00'),
	(49, 68, 2, '2026-03-07 02:20:18', '2026-03-07 02:20:18'),
	(50, 69, 2, '2026-03-07 02:20:46', '2026-03-07 02:20:46'),
	(51, 70, 2, '2026-03-07 02:22:08', '2026-03-07 02:22:08'),
	(52, 71, 2, '2026-03-07 02:22:27', '2026-03-07 02:22:27'),
	(53, 72, 2, '2026-03-07 02:22:44', '2026-03-07 02:22:44'),
	(54, 73, 2, '2026-03-07 02:23:06', '2026-03-07 02:23:06'),
	(55, 74, 2, '2026-03-07 02:23:25', '2026-03-07 02:23:25'),
	(56, 75, 2, '2026-03-07 02:23:45', '2026-03-07 02:23:45'),
	(57, 76, 2, '2026-03-07 02:24:51', '2026-03-07 02:24:51'),
	(58, 77, 2, '2026-03-07 02:26:16', '2026-03-07 02:26:16'),
	(59, 78, 2, '2026-03-07 02:45:27', '2026-03-07 02:45:27'),
	(60, 79, 2, '2026-03-07 02:50:07', '2026-03-07 02:50:07'),
	(61, 80, 2, '2026-03-07 03:11:18', '2026-03-07 03:11:18'),
	(62, 81, 2, '2026-03-07 03:13:13', '2026-03-07 03:13:13'),
	(63, 82, 2, '2026-03-07 03:22:13', '2026-03-07 03:22:13'),
	(64, 83, 2, '2026-03-07 03:23:37', '2026-03-07 03:23:37'),
	(65, 84, 2, '2026-03-07 03:29:50', '2026-03-07 03:29:50'),
	(66, 85, 2, '2026-03-07 03:30:44', '2026-03-07 03:30:44'),
	(67, 86, 2, '2026-03-07 03:39:30', '2026-03-07 03:39:30'),
	(68, 87, 2, '2026-03-07 03:42:11', '2026-03-07 03:42:11'),
	(69, 88, 2, '2026-03-07 03:44:26', '2026-03-07 03:44:26'),
	(70, 89, 2, '2026-03-07 03:47:57', '2026-03-07 03:47:57'),
	(71, 90, 2, '2026-03-07 03:49:24', '2026-03-07 03:49:24'),
	(72, 91, 2, '2026-03-07 03:52:32', '2026-03-07 03:52:32'),
	(73, 92, 2, '2026-03-07 03:55:13', '2026-03-07 03:55:13'),
	(74, 93, 2, '2026-03-07 03:57:42', '2026-03-07 03:57:42'),
	(75, 94, 2, '2026-03-07 04:00:26', '2026-03-07 04:00:26'),
	(76, 95, 2, '2026-03-07 04:15:03', '2026-03-07 04:15:03'),
	(77, 96, 2, '2026-03-07 04:19:24', '2026-03-07 04:19:24'),
	(78, 97, 2, '2026-03-07 04:22:30', '2026-03-07 04:22:30'),
	(79, 98, 2, '2026-03-07 04:25:49', '2026-03-07 04:25:49'),
	(80, 99, 2, '2026-03-13 05:38:14', '2026-03-13 05:38:14'),
	(81, 100, 2, '2026-03-13 05:43:16', '2026-03-13 05:43:16'),
	(82, 101, 2, '2026-03-13 05:50:00', '2026-03-13 05:50:00'),
	(83, 102, 2, '2026-03-13 05:54:04', '2026-03-13 05:54:04'),
	(84, 103, 2, '2026-03-13 06:00:18', '2026-03-13 06:00:18'),
	(85, 104, 2, '2026-03-13 06:42:55', '2026-03-13 06:42:55'),
	(86, 105, 2, '2026-03-13 06:55:18', '2026-03-13 06:55:18'),
	(87, 106, 2, '2026-03-13 07:23:40', '2026-03-13 07:23:40'),
	(88, 107, 2, '2026-03-13 07:36:06', '2026-03-13 07:36:06'),
	(89, 108, 2, '2026-03-13 07:39:10', '2026-03-13 07:39:10'),
	(90, 109, 2, '2026-03-13 07:43:58', '2026-03-13 07:43:58'),
	(91, 110, 2, '2026-03-13 07:47:04', '2026-03-13 07:47:04'),
	(92, 111, 2, '2026-03-13 07:49:58', '2026-03-13 07:49:58'),
	(93, 112, 2, '2026-03-13 07:52:22', '2026-03-13 07:52:22'),
	(94, 113, 2, '2026-03-13 22:02:33', '2026-03-13 22:02:33'),
	(95, 114, 2, '2026-03-13 22:19:09', '2026-03-13 22:19:09'),
	(96, 115, 2, '2026-03-13 22:21:57', '2026-03-13 22:21:57'),
	(97, 116, 2, '2026-03-13 22:23:23', '2026-03-13 22:23:23'),
	(98, 117, 2, '2026-03-13 22:24:45', '2026-03-13 22:24:45'),
	(99, 118, 2, '2026-03-13 22:26:11', '2026-03-13 22:26:11'),
	(100, 119, 2, '2026-03-13 22:28:42', '2026-03-13 22:28:42'),
	(101, 120, 2, '2026-03-13 22:29:59', '2026-03-13 22:29:59'),
	(102, 121, 2, '2026-03-13 22:31:12', '2026-03-13 22:31:12'),
	(103, 122, 2, '2026-03-13 22:32:27', '2026-03-13 22:32:27'),
	(104, 123, 2, '2026-03-13 22:35:09', '2026-03-13 22:35:09'),
	(105, 124, 2, '2026-03-13 22:37:09', '2026-03-13 22:37:09'),
	(106, 125, 2, '2026-03-13 22:38:10', '2026-03-13 22:38:10'),
	(107, 126, 2, '2026-03-13 22:39:55', '2026-03-13 22:39:55'),
	(108, 127, 2, '2026-03-13 22:43:35', '2026-03-13 22:43:35'),
	(109, 128, 2, '2026-03-13 22:45:59', '2026-03-13 22:45:59'),
	(110, 129, 2, '2026-03-13 22:47:15', '2026-03-13 22:47:15'),
	(111, 130, 2, '2026-03-13 22:49:17', '2026-03-13 22:49:17'),
	(112, 131, 2, '2026-03-13 22:50:31', '2026-03-13 22:50:31'),
	(113, 132, 2, '2026-03-14 07:40:35', '2026-03-14 07:40:35'),
	(114, 133, 2, '2026-03-14 07:42:26', '2026-03-14 07:42:26'),
	(115, 134, 2, '2026-03-14 07:43:52', '2026-03-14 07:43:52'),
	(116, 135, 2, '2026-03-14 07:47:06', '2026-03-14 07:47:06'),
	(117, 136, 2, '2026-03-14 07:48:01', '2026-03-14 07:48:01'),
	(118, 137, 2, '2026-03-14 07:51:27', '2026-03-14 07:51:27'),
	(119, 138, 2, '2026-03-14 07:53:43', '2026-03-14 07:53:43'),
	(120, 139, 2, '2026-03-14 07:55:29', '2026-03-14 07:55:29'),
	(121, 140, 2, '2026-03-14 07:57:04', '2026-03-14 07:57:04'),
	(122, 141, 2, '2026-03-14 07:59:52', '2026-03-14 07:59:52'),
	(123, 142, 2, '2026-03-14 08:05:04', '2026-03-14 08:05:04'),
	(124, 143, 2, '2026-03-14 08:10:09', '2026-03-14 08:10:09'),
	(125, 144, 2, '2026-03-14 08:11:39', '2026-03-14 08:11:39'),
	(126, 145, 2, '2026-03-14 08:15:20', '2026-03-14 08:15:20'),
	(127, 146, 2, '2026-03-14 08:16:52', '2026-03-14 08:16:52'),
	(128, 147, 2, '2026-03-14 08:18:02', '2026-03-14 08:18:02');

-- Dumping structure for table airas_mart.product_categories
DROP TABLE IF EXISTS `product_categories`;
CREATE TABLE IF NOT EXISTS `product_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_categories_product_id_foreign` (`product_id`),
  KEY `product_categories_category_id_foreign` (`category_id`),
  CONSTRAINT `product_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_categories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.product_categories: ~0 rows (approximately)
DELETE FROM `product_categories`;

-- Dumping structure for table airas_mart.product_editions
DROP TABLE IF EXISTS `product_editions`;
CREATE TABLE IF NOT EXISTS `product_editions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_editions_product_id_foreign` (`product_id`),
  CONSTRAINT `product_editions_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.product_editions: ~67 rows (approximately)
DELETE FROM `product_editions`;
INSERT INTO `product_editions` (`id`, `product_id`, `name`, `status`, `created_at`, `updated_at`) VALUES
	(16, 40, 'First Edition', 1, '2026-03-06 21:56:46', '2026-03-06 21:56:46'),
	(17, 41, 'First Edition', 1, '2026-03-06 22:22:58', '2026-03-06 22:22:58'),
	(18, 42, 'First Edition', 1, '2026-03-06 22:38:03', '2026-03-06 22:38:03'),
	(19, 43, 'First Edition', 1, '2026-03-06 22:39:25', '2026-03-06 22:39:25'),
	(20, 44, 'First Edition', 1, '2026-03-06 22:39:50', '2026-03-06 22:39:50'),
	(21, 45, 'First Edition', 1, '2026-03-06 22:40:12', '2026-03-06 22:40:12'),
	(22, 46, 'First Edition', 1, '2026-03-06 22:41:33', '2026-03-06 22:41:33'),
	(23, 47, 'First Edition', 1, '2026-03-06 22:42:03', '2026-03-06 22:42:03'),
	(24, 48, 'First Edition', 1, '2026-03-06 22:42:40', '2026-03-06 22:42:40'),
	(25, 49, 'First Edition', 1, '2026-03-06 22:43:20', '2026-03-06 22:43:20'),
	(26, 50, 'First Edition', 1, '2026-03-06 22:43:47', '2026-03-06 22:43:47'),
	(27, 51, 'First Edition', 1, '2026-03-06 22:44:12', '2026-03-06 22:44:12'),
	(28, 52, 'First Edition', 1, '2026-03-06 22:45:52', '2026-03-06 22:45:52'),
	(29, 53, 'First Edition', 1, '2026-03-06 22:46:24', '2026-03-06 22:46:24'),
	(30, 54, 'First Edition', 1, '2026-03-06 22:46:57', '2026-03-06 22:46:57'),
	(31, 55, 'First Edition', 1, '2026-03-06 22:47:21', '2026-03-06 22:47:21'),
	(32, 56, 'First Edition', 1, '2026-03-06 22:47:39', '2026-03-06 22:47:39'),
	(33, 57, 'First Edition', 1, '2026-03-06 22:48:02', '2026-03-06 22:48:02'),
	(34, 58, 'First Edition', 1, '2026-03-06 22:49:09', '2026-03-06 22:49:09'),
	(35, 59, 'First Edition', 1, '2026-03-06 22:49:37', '2026-03-06 22:49:37'),
	(36, 60, 'First Edition', 1, '2026-03-06 22:49:54', '2026-03-06 22:49:54'),
	(37, 61, 'First Edition', 1, '2026-03-06 22:50:31', '2026-03-06 22:50:31'),
	(38, 62, 'First Edition', 1, '2026-03-06 22:51:14', '2026-03-06 22:51:14'),
	(39, 63, 'First Edition', 1, '2026-03-06 22:51:53', '2026-03-06 22:51:53'),
	(40, 64, 'First Edition', 1, '2026-03-07 02:18:07', '2026-03-07 02:18:07'),
	(41, 65, 'First Edition', 1, '2026-03-07 02:18:48', '2026-03-07 02:18:48'),
	(42, 66, 'First Edition', 1, '2026-03-07 02:19:26', '2026-03-07 02:19:26'),
	(43, 67, 'First Edition', 1, '2026-03-07 02:20:00', '2026-03-07 02:20:00'),
	(44, 68, 'First Edition', 1, '2026-03-07 02:20:18', '2026-03-07 02:20:18'),
	(45, 69, 'First Edition', 1, '2026-03-07 02:20:46', '2026-03-07 02:20:46'),
	(46, 70, 'First Edition', 1, '2026-03-07 02:22:08', '2026-03-07 02:22:08'),
	(47, 71, 'First Edition', 1, '2026-03-07 02:22:27', '2026-03-07 02:22:27'),
	(48, 72, 'First Edition', 1, '2026-03-07 02:22:44', '2026-03-07 02:22:44'),
	(49, 73, 'First Edition', 1, '2026-03-07 02:23:06', '2026-03-07 02:23:06'),
	(50, 74, 'First Edition', 1, '2026-03-07 02:23:25', '2026-03-07 02:23:25'),
	(51, 75, 'First Edition', 1, '2026-03-07 02:23:45', '2026-03-07 02:23:45'),
	(52, 76, 'First Edition', 1, '2026-03-07 02:24:51', '2026-03-07 02:24:51'),
	(53, 77, 'First Edition', 1, '2026-03-07 02:26:16', '2026-03-07 02:26:16'),
	(54, 78, 'First Edition', 1, '2026-03-07 02:45:27', '2026-03-07 02:45:27'),
	(55, 79, 'First Edition', 1, '2026-03-07 02:50:07', '2026-03-07 02:50:07'),
	(56, 80, 'First Edition', 1, '2026-03-07 03:11:18', '2026-03-07 03:11:18'),
	(57, 81, 'First Edition', 1, '2026-03-07 03:13:13', '2026-03-07 03:13:13'),
	(58, 82, 'First Edition', 1, '2026-03-07 03:22:13', '2026-03-07 03:22:13'),
	(59, 83, 'First Edition', 1, '2026-03-07 03:23:37', '2026-03-07 03:23:37'),
	(60, 84, 'First Edition', 1, '2026-03-07 03:29:50', '2026-03-07 03:29:50'),
	(61, 85, 'First Edition', 1, '2026-03-07 03:30:44', '2026-03-07 03:30:44'),
	(62, 86, 'First Edition', 1, '2026-03-07 03:39:30', '2026-03-07 03:39:30'),
	(63, 87, 'First Edition', 1, '2026-03-07 03:42:11', '2026-03-07 03:42:11'),
	(64, 88, 'First Edition', 1, '2026-03-07 03:44:26', '2026-03-07 03:44:26'),
	(65, 89, 'First Edition', 1, '2026-03-07 03:47:57', '2026-03-07 03:47:57'),
	(66, 90, 'First Edition', 1, '2026-03-07 03:49:24', '2026-03-07 03:49:24'),
	(67, 91, 'First Edition', 1, '2026-03-07 03:52:32', '2026-03-07 03:52:32'),
	(68, 92, 'First Edition', 1, '2026-03-07 03:55:13', '2026-03-07 03:55:13'),
	(69, 93, 'First Edition', 1, '2026-03-07 03:57:42', '2026-03-07 03:57:42'),
	(70, 94, 'First Edition', 1, '2026-03-07 04:00:26', '2026-03-07 04:00:26'),
	(71, 95, 'First Edition', 1, '2026-03-07 04:15:03', '2026-03-07 04:15:03'),
	(72, 96, 'First Edition', 1, '2026-03-07 04:19:24', '2026-03-07 04:19:24'),
	(73, 97, 'First Edition', 1, '2026-03-07 04:22:30', '2026-03-07 04:22:30'),
	(74, 98, 'First Edition', 1, '2026-03-07 04:25:49', '2026-03-07 04:25:49'),
	(75, 99, 'First Edition', 1, '2026-03-13 05:38:14', '2026-03-13 05:38:14'),
	(76, 100, 'First Edition', 1, '2026-03-13 05:43:16', '2026-03-13 05:43:16'),
	(77, 101, 'First Edition', 1, '2026-03-13 05:50:00', '2026-03-13 05:50:00'),
	(78, 102, 'First Edition', 1, '2026-03-13 05:54:04', '2026-03-13 05:54:04'),
	(79, 103, 'First Edition', 1, '2026-03-13 06:00:18', '2026-03-13 06:00:18'),
	(80, 104, 'First Edition', 1, '2026-03-13 06:42:55', '2026-03-13 06:42:55'),
	(81, 105, 'First Edition', 1, '2026-03-13 06:55:18', '2026-03-13 06:55:18'),
	(82, 106, 'First Edition', 1, '2026-03-13 07:23:40', '2026-03-13 07:23:40'),
	(83, 107, 'First Edition', 1, '2026-03-13 07:36:06', '2026-03-13 07:36:06'),
	(84, 108, 'First Edition', 1, '2026-03-13 07:39:10', '2026-03-13 07:39:10'),
	(85, 109, 'First Edition', 1, '2026-03-13 07:43:58', '2026-03-13 07:43:58'),
	(86, 110, 'First Edition', 1, '2026-03-13 07:47:04', '2026-03-13 07:47:04'),
	(87, 111, 'First Edition', 1, '2026-03-13 07:49:58', '2026-03-13 07:49:58'),
	(88, 112, 'First Edition', 1, '2026-03-13 07:52:22', '2026-03-13 07:52:22'),
	(89, 113, 'First Edition', 1, '2026-03-13 22:02:33', '2026-03-13 22:02:33'),
	(90, 114, 'First Edition', 1, '2026-03-13 22:19:09', '2026-03-13 22:19:09'),
	(91, 115, 'First Edition', 1, '2026-03-13 22:21:57', '2026-03-13 22:21:57'),
	(92, 116, 'First Edition', 1, '2026-03-13 22:23:23', '2026-03-13 22:23:23'),
	(93, 117, 'First Edition', 1, '2026-03-13 22:24:45', '2026-03-13 22:24:45'),
	(94, 118, 'First Edition', 1, '2026-03-13 22:26:11', '2026-03-13 22:26:11'),
	(95, 119, 'First Edition', 1, '2026-03-13 22:28:42', '2026-03-13 22:28:42'),
	(96, 120, 'First Edition', 1, '2026-03-13 22:29:59', '2026-03-13 22:29:59'),
	(97, 121, 'First Edition', 1, '2026-03-13 22:31:12', '2026-03-13 22:31:12'),
	(98, 122, 'First Edition', 1, '2026-03-13 22:32:27', '2026-03-13 22:32:27'),
	(99, 123, 'First Edition', 1, '2026-03-13 22:35:09', '2026-03-13 22:35:09'),
	(100, 124, 'First Edition', 1, '2026-03-13 22:37:09', '2026-03-13 22:37:09'),
	(101, 125, 'First Edition', 1, '2026-03-13 22:38:10', '2026-03-13 22:38:10'),
	(102, 126, 'First Edition', 1, '2026-03-13 22:39:55', '2026-03-13 22:39:55'),
	(103, 127, 'First Edition', 1, '2026-03-13 22:43:35', '2026-03-13 22:43:35'),
	(104, 128, 'First Edition', 1, '2026-03-13 22:45:59', '2026-03-13 22:45:59'),
	(105, 129, 'First Edition', 1, '2026-03-13 22:47:15', '2026-03-13 22:47:15'),
	(106, 130, 'First Edition', 1, '2026-03-13 22:49:17', '2026-03-13 22:49:17'),
	(107, 131, 'First Edition', 1, '2026-03-13 22:50:31', '2026-03-13 22:50:31'),
	(108, 132, 'First Edition', 1, '2026-03-14 07:40:35', '2026-03-14 07:40:35'),
	(109, 133, 'First Edition', 1, '2026-03-14 07:42:26', '2026-03-14 07:42:26'),
	(110, 134, 'First Edition', 1, '2026-03-14 07:43:52', '2026-03-14 07:43:52'),
	(111, 135, 'First Edition', 1, '2026-03-14 07:47:06', '2026-03-14 07:47:06'),
	(112, 136, 'First Edition', 1, '2026-03-14 07:48:01', '2026-03-14 07:48:01'),
	(113, 137, 'First Edition', 1, '2026-03-14 07:51:27', '2026-03-14 07:51:27'),
	(114, 138, 'First Edition', 1, '2026-03-14 07:53:43', '2026-03-14 07:53:43'),
	(115, 139, 'First Edition', 1, '2026-03-14 07:55:29', '2026-03-14 07:55:29'),
	(116, 140, 'First Edition', 1, '2026-03-14 07:57:04', '2026-03-14 07:57:04'),
	(117, 141, 'First Edition', 1, '2026-03-14 07:59:52', '2026-03-14 07:59:52'),
	(118, 142, 'First Edition', 1, '2026-03-14 08:05:04', '2026-03-14 08:05:04'),
	(119, 143, 'First Edition', 1, '2026-03-14 08:10:09', '2026-03-14 08:10:09'),
	(120, 144, 'First Edition', 1, '2026-03-14 08:11:39', '2026-03-14 08:11:39'),
	(121, 145, 'First Edition', 1, '2026-03-14 08:15:20', '2026-03-14 08:15:20'),
	(122, 146, 'First Edition', 1, '2026-03-14 08:16:52', '2026-03-14 08:16:52'),
	(123, 147, 'First Edition', 1, '2026-03-14 08:18:02', '2026-03-14 08:18:02');

-- Dumping structure for table airas_mart.product_images
DROP TABLE IF EXISTS `product_images`;
CREATE TABLE IF NOT EXISTS `product_images` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_images_product_id_foreign` (`product_id`),
  CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.product_images: ~17 rows (approximately)
DELETE FROM `product_images`;
INSERT INTO `product_images` (`id`, `product_id`, `image`, `created_at`, `updated_at`) VALUES
	(38, 104, 'storage/media/product/2026-03-13-Vcjhb1rOPerHLtobgnOzFz6wnftYP7VU7okZynzu.webp', '2026-03-13 06:42:54', '2026-03-13 06:42:54'),
	(39, 104, 'storage/media/product/2026-03-13-cn3c0oyGR9Y28amqA8F4delUAXpqFQxrhd6y6WCl.webp', '2026-03-13 06:42:54', '2026-03-13 06:42:54'),
	(40, 104, 'storage/media/product/2026-03-13-aUGdcJcmxvITzhGZZJDQ3KDnAJ0cSdDb6Ha47jGx.webp', '2026-03-13 06:42:55', '2026-03-13 06:42:55'),
	(41, 106, 'storage/media/product/2026-03-13-mxa5LBreC3h0SS8rVuCaQ3n9aP2n5zfia6fAqDw1.webp', '2026-03-13 07:23:38', '2026-03-13 07:23:38'),
	(42, 106, 'storage/media/product/2026-03-13-Hs3fOHKdXVU17hIfJEG50Cy0zLw0DCM9ZQ1SdAC1.webp', '2026-03-13 07:23:39', '2026-03-13 07:23:39'),
	(43, 106, 'storage/media/product/2026-03-13-heyVA1S9D6RlAqfNXAjkZ2yC1NxTJplEZSoJPytJ.webp', '2026-03-13 07:23:39', '2026-03-13 07:23:39'),
	(44, 110, 'storage/media/product/2026-03-13-bpFXkZ42XE3P3XYtF10Bp8uGbFAHyBnN89e2NBMg.webp', '2026-03-13 07:47:02', '2026-03-13 07:47:02'),
	(45, 110, 'storage/media/product/2026-03-13-VWcWxXX3so2dLK2jhb4XUmS9lKumMK3QSAyxYx7g.webp', '2026-03-13 07:47:03', '2026-03-13 07:47:03'),
	(46, 110, 'storage/media/product/2026-03-13-U745z0GaPguGmJZ4nSnyEJK8iQ6kwsRZG42KTC4A.webp', '2026-03-13 07:47:04', '2026-03-13 07:47:04'),
	(47, 110, 'storage/media/product/2026-03-13-9vpOyNqNfcZ43fcBwSCnJ6YMiSE32kOybSgKzc9B.webp', '2026-03-13 07:47:04', '2026-03-13 07:47:04'),
	(48, 111, 'storage/media/product/2026-03-13-KKoZkpYlOpETraAnYk1MpHtnYfwO1T8o2bvja9ab.webp', '2026-03-13 07:49:56', '2026-03-13 07:49:56'),
	(49, 111, 'storage/media/product/2026-03-13-S7fCZdtChQWqwDyzVtb0axaCF9PBCR3JiWLP2aTh.webp', '2026-03-13 07:49:57', '2026-03-13 07:49:57'),
	(50, 111, 'storage/media/product/2026-03-13-8zxfwrwUMG4TqWqeZepIogaCAInJA3kkxmiGAiA8.webp', '2026-03-13 07:49:58', '2026-03-13 07:49:58'),
	(51, 111, 'storage/media/product/2026-03-13-ja1Hd7c4l4cEq0u9yleUCfsWjY4IYhM3jSVdVNr8.webp', '2026-03-13 07:49:58', '2026-03-13 07:49:58'),
	(52, 112, 'storage/media/product/2026-03-13-LS9cY9LuF5yPZYd1cMEcGMF0GVYScs5gbnwNkgsX.webp', '2026-03-13 07:52:20', '2026-03-13 07:52:20'),
	(53, 112, 'storage/media/product/2026-03-13-hyK4x64416IdsGm6C5xFlncAdniwFfBfStS4T7PT.webp', '2026-03-13 07:52:21', '2026-03-13 07:52:21'),
	(54, 112, 'storage/media/product/2026-03-13-oGAiDd9La0hMdE1hg9KP0VB0caf3qsIs9ZBQgkKY.webp', '2026-03-13 07:52:22', '2026-03-13 07:52:22'),
	(55, 113, 'storage/media/product/2026-03-14-waSQRwuPKIpdKDvc83LIrafJy8swr0yHXrLYZO0r.webp', '2026-03-13 22:02:32', '2026-03-13 22:02:32'),
	(56, 113, 'storage/media/product/2026-03-14-t3NcUYsDJBQ1vnoWRJNrf1S5TGBNR5VzDeOgiZUw.webp', '2026-03-13 22:02:32', '2026-03-13 22:02:32'),
	(57, 113, 'storage/media/product/2026-03-14-RCIlnz0n5PapD4hXSacD4sKTparGY9EBMmy7WpsS.webp', '2026-03-13 22:02:33', '2026-03-13 22:02:33'),
	(58, 113, 'storage/media/product/2026-03-14-bcwtbUN3Z7CvgAAzQ5mRvPlWFXEWEfdvjWjsoQ58.webp', '2026-03-13 22:02:33', '2026-03-13 22:02:33'),
	(59, 114, 'storage/media/product/2026-03-14-XXAzJ7ssyp1sbx740uwQWwW6EvXe0obQppDDbnHA.webp', '2026-03-13 22:19:07', '2026-03-13 22:19:07'),
	(60, 114, 'storage/media/product/2026-03-14-DphKUYOwH3b4tLmwZwrDzgIqcNjvWxwHXVtTXP1r.webp', '2026-03-13 22:19:07', '2026-03-13 22:19:07'),
	(61, 114, 'storage/media/product/2026-03-14-3qLh3Hu7Dm9YD33YnFSu85VAEnfuVbBopLkzW1GM.webp', '2026-03-13 22:19:08', '2026-03-13 22:19:08'),
	(62, 114, 'storage/media/product/2026-03-14-XvGzWphKogH5OWPbvW3h6s4C58WFYvmZd876jSpa.webp', '2026-03-13 22:19:09', '2026-03-13 22:19:09'),
	(63, 115, 'storage/media/product/2026-03-14-YcdHv9BfcIq8xLpnXWLDdh0b6WTZDMkHHand15Rw.webp', '2026-03-13 22:21:54', '2026-03-13 22:21:54'),
	(64, 115, 'storage/media/product/2026-03-14-BDnsXYaS1xvAGXtDasFzCxCEtlBwx0Raj8uB59Us.webp', '2026-03-13 22:21:55', '2026-03-13 22:21:55'),
	(65, 115, 'storage/media/product/2026-03-14-KcYdpLVs1NZSs7G0rOw8gh494OQ5h89Ov47H5vfs.webp', '2026-03-13 22:21:56', '2026-03-13 22:21:56'),
	(66, 115, 'storage/media/product/2026-03-14-2IZEE7iea17Rkt4R5ZyLiVCCzJ6ldatv2006ljyk.webp', '2026-03-13 22:21:57', '2026-03-13 22:21:57'),
	(67, 116, 'storage/media/product/2026-03-14-SE2BuaTYKPwu7GNZ97ZcGKWxEdYaWoCDMthuIC4W.webp', '2026-03-13 22:23:22', '2026-03-13 22:23:22'),
	(68, 116, 'storage/media/product/2026-03-14-gHIqLo0FL5hO4FVacmw8abMD8l5ApIEtdB7haZ61.webp', '2026-03-13 22:23:22', '2026-03-13 22:23:22'),
	(69, 116, 'storage/media/product/2026-03-14-7Vmj5dKRZbKu8ecfBp24wqZBAz3ly1ikGAwhyWqa.webp', '2026-03-13 22:23:23', '2026-03-13 22:23:23'),
	(70, 116, 'storage/media/product/2026-03-14-U7syRV6PNPT1wZDLEhnO0eeOBBu9pAyG5bOQYCMX.webp', '2026-03-13 22:23:23', '2026-03-13 22:23:23'),
	(71, 117, 'storage/media/product/2026-03-14-aPcodXEHgD2K3gLaZ8sPYx9Vm28jtqj1cAefIRaO.webp', '2026-03-13 22:24:43', '2026-03-13 22:24:43'),
	(72, 117, 'storage/media/product/2026-03-14-7h0ZsGjmiY7T8Dwg1jA7pffLwj9DcvMMkFgaB3Hq.webp', '2026-03-13 22:24:44', '2026-03-13 22:24:44'),
	(73, 117, 'storage/media/product/2026-03-14-Pdw8FXSn28O2c11PlaSZ3CHdheyDKJ4GFmI0ko1J.webp', '2026-03-13 22:24:44', '2026-03-13 22:24:44'),
	(74, 117, 'storage/media/product/2026-03-14-2dhbSZIjkySvE3DZaQlsHqbGtPyb2Lnu0yhHeZ2d.webp', '2026-03-13 22:24:45', '2026-03-13 22:24:45'),
	(75, 118, 'storage/media/product/2026-03-14-LFn1AhDCCvKoynFU2NxhRQqtFV3Hx1gmdKPtJPC9.webp', '2026-03-13 22:26:10', '2026-03-13 22:26:10'),
	(76, 118, 'storage/media/product/2026-03-14-EB0LqHbroc0HZlr8NcPrb5kADKLD4OZ4TsOgk2zb.webp', '2026-03-13 22:26:10', '2026-03-13 22:26:10'),
	(77, 118, 'storage/media/product/2026-03-14-FFnK3z7PSbfXTy7eOLs8HhKRCPHuQcbqIHDvTGWC.webp', '2026-03-13 22:26:11', '2026-03-13 22:26:11'),
	(78, 119, 'storage/media/product/2026-03-14-XSSEIwbq8i21ALT4bbG6cmV2734pPf5AjLsQOctF.webp', '2026-03-13 22:28:41', '2026-03-13 22:28:41'),
	(79, 119, 'storage/media/product/2026-03-14-rSftWoJ7Bjmf6rRgMDY8PZybXmIODUu0SWuvoj7d.webp', '2026-03-13 22:28:41', '2026-03-13 22:28:41'),
	(80, 119, 'storage/media/product/2026-03-14-D9XzGNdYe7tFiWYVlIYgYRGRzyAEbAmkqXZbKJW6.webp', '2026-03-13 22:28:42', '2026-03-13 22:28:42'),
	(81, 119, 'storage/media/product/2026-03-14-5TxjI51f8FJXCyjRgWiRPQaWyZzTQpf94qfuoCzY.webp', '2026-03-13 22:28:42', '2026-03-13 22:28:42'),
	(82, 120, 'storage/media/product/2026-03-14-TQGTSvu06XqsSRdV06vrIiajaaUT2MvMl1AtfLeK.webp', '2026-03-13 22:29:57', '2026-03-13 22:29:57'),
	(83, 120, 'storage/media/product/2026-03-14-SdeN6XsOslOfW31r6K25aikdJFsOp6BabNe1F16Y.webp', '2026-03-13 22:29:57', '2026-03-13 22:29:57'),
	(84, 120, 'storage/media/product/2026-03-14-RvvFkzIzMQWuCOE0onvt8PwdRg2JJTBLnGikiRGe.webp', '2026-03-13 22:29:58', '2026-03-13 22:29:58'),
	(85, 120, 'storage/media/product/2026-03-14-hOlZL8Pr0XvR9hFc5GEVDmvoUQfpX8janho5Qbrh.webp', '2026-03-13 22:29:59', '2026-03-13 22:29:59'),
	(86, 121, 'storage/media/product/2026-03-14-ueEg58Ik4Ro45gIDNJxn8prXrOtVBFUMJYw7IyQ7.webp', '2026-03-13 22:31:11', '2026-03-13 22:31:11'),
	(87, 121, 'storage/media/product/2026-03-14-ZNT1IBHBzegutVU3mPKYI63L2txhv5rvk21TK5AG.webp', '2026-03-13 22:31:11', '2026-03-13 22:31:11'),
	(88, 121, 'storage/media/product/2026-03-14-xQ4PjzKkq38vSvELQGxP18BTpN4PsxzzSKboak9c.webp', '2026-03-13 22:31:12', '2026-03-13 22:31:12'),
	(89, 121, 'storage/media/product/2026-03-14-kVG53QDf9LIM9dkBMKtYpgfIpn41lDicJ7RIvSB6.webp', '2026-03-13 22:31:12', '2026-03-13 22:31:12'),
	(90, 122, 'storage/media/product/2026-03-14-wj3LEGkWEyGW92jqOv5kzrwQ134kG2tAO4ZsPy4O.webp', '2026-03-13 22:32:25', '2026-03-13 22:32:25'),
	(91, 122, 'storage/media/product/2026-03-14-Xpn2a2raOpCJovyEyPvDXudfGHEsjTIUb5ncds7A.webp', '2026-03-13 22:32:26', '2026-03-13 22:32:26'),
	(92, 122, 'storage/media/product/2026-03-14-nXdy5Xl0U98oUUmHDjRDJERRYvrZ9EvjWdEHbe7V.webp', '2026-03-13 22:32:27', '2026-03-13 22:32:27'),
	(93, 122, 'storage/media/product/2026-03-14-Dwxq50fOuFTUTsmi8jtBEphykR33p8rolUaLYuNa.webp', '2026-03-13 22:32:27', '2026-03-13 22:32:27'),
	(94, 123, 'storage/media/product/2026-03-14-TmCFQ3rLdY9bjsqfAzmtSxLk8sgqY8OLd37WPKMD.webp', '2026-03-13 22:35:07', '2026-03-13 22:35:07'),
	(95, 123, 'storage/media/product/2026-03-14-kfdc9WdrmBiSETE62OZtU8Got1fBuKllxwC6nhKG.webp', '2026-03-13 22:35:08', '2026-03-13 22:35:08'),
	(96, 123, 'storage/media/product/2026-03-14-r2dDE7Edq4ObaGhvwFom0Jx5hQL0shm1ZS27vNJe.webp', '2026-03-13 22:35:08', '2026-03-13 22:35:08'),
	(97, 123, 'storage/media/product/2026-03-14-CTC2BKrx8CmzUj9Yabr4Bt9hYujuSc3nGJEDHgjd.webp', '2026-03-13 22:35:09', '2026-03-13 22:35:09'),
	(98, 124, 'storage/media/product/2026-03-14-GK1V7FauUiSrjeyfrWk1OZ0NzWpSEnxhF1ois0qz.webp', '2026-03-13 22:37:07', '2026-03-13 22:37:07'),
	(99, 124, 'storage/media/product/2026-03-14-MgWDfszvG3VFTPWEtGZkLqbGDiupOulWFTPKylRu.webp', '2026-03-13 22:37:08', '2026-03-13 22:37:08'),
	(100, 124, 'storage/media/product/2026-03-14-EmgX81hgeultfb0M7DJtKbSDlWgz9RFGzceObwDC.webp', '2026-03-13 22:37:09', '2026-03-13 22:37:09'),
	(101, 124, 'storage/media/product/2026-03-14-X0UdIPpwRkZQw5F8DRANlkQsxCZ4VBCxWKguLY7t.webp', '2026-03-13 22:37:09', '2026-03-13 22:37:09'),
	(102, 125, 'storage/media/product/2026-03-14-iK7k8QSxbFBGJ1FiW3P33B9YPd2w3RKw7RzW7GPt.webp', '2026-03-13 22:38:07', '2026-03-13 22:38:07'),
	(103, 125, 'storage/media/product/2026-03-14-uMBvLC8PeSsnNv12Ueu6tvZp8WDYYQuh220kLdl4.webp', '2026-03-13 22:38:08', '2026-03-13 22:38:08'),
	(104, 125, 'storage/media/product/2026-03-14-Igd983rFyQsWesrd7DIWeEhOr6t5ekKDKM1x7U5O.webp', '2026-03-13 22:38:09', '2026-03-13 22:38:09'),
	(105, 125, 'storage/media/product/2026-03-14-zUFw7rzdtug2UAmjtv5GIK1vTPxNRWDzc8mwQlOG.webp', '2026-03-13 22:38:10', '2026-03-13 22:38:10'),
	(106, 127, 'storage/media/product/2026-03-14-QUam1bh9hPKgdG5HpXoqvNnkiMQBGo7YW3lUrMUO.webp', '2026-03-13 22:43:34', '2026-03-13 22:43:34'),
	(107, 127, 'storage/media/product/2026-03-14-IYjg4I1iNZ5eGtQZwF4vv8cD0bHO4zVR9RslhgpB.webp', '2026-03-13 22:43:35', '2026-03-13 22:43:35'),
	(108, 127, 'storage/media/product/2026-03-14-myggtONzExqYIGlW84gz7A3RhyG65rC84yUHThUX.webp', '2026-03-13 22:43:35', '2026-03-13 22:43:35'),
	(109, 128, 'storage/media/product/2026-03-14-ZpSu2UWv2q3t9iSTmvrjTjzO9L4wkIQV4hGn6V0V.webp', '2026-03-13 22:45:57', '2026-03-13 22:45:57'),
	(110, 128, 'storage/media/product/2026-03-14-58ieygJG7QRM0pBNnTpoSxKTvPBb1szFdp3j8CZw.webp', '2026-03-13 22:45:58', '2026-03-13 22:45:58'),
	(111, 128, 'storage/media/product/2026-03-14-aF24nuCtxYKxUqrBVmPRaYzlFKuzi9pgOevvPXuR.webp', '2026-03-13 22:45:59', '2026-03-13 22:45:59'),
	(112, 128, 'storage/media/product/2026-03-14-TVdV9DGUWqJwcY6aQAPZ4z45RmOkY3ativXZfr80.webp', '2026-03-13 22:45:59', '2026-03-13 22:45:59'),
	(113, 129, 'storage/media/product/2026-03-14-2ZumumEBbdtJbdvCocu9AdB0PzQelsTwoRogKn92.webp', '2026-03-13 22:47:59', '2026-03-13 22:47:59'),
	(114, 129, 'storage/media/product/2026-03-14-TiSj2r2zXd9duvwWOiqDPgKODKPOn59b2eDvM2nW.webp', '2026-03-13 22:47:59', '2026-03-13 22:47:59'),
	(115, 129, 'storage/media/product/2026-03-14-dxKMy0TzUQSsAu7qbzdVkD62W1YGsbwincAH0sFT.webp', '2026-03-13 22:48:00', '2026-03-13 22:48:00'),
	(116, 129, 'storage/media/product/2026-03-14-Fb9E0Epp8iTUhmDlzF8BDHODVtBqPq7D7x3QVpQI.webp', '2026-03-13 22:48:01', '2026-03-13 22:48:01'),
	(117, 130, 'storage/media/product/2026-03-14-74CchGBU5NafF7VQDSX0zPOZkVdPlEcSNslaU6IE.webp', '2026-03-13 22:49:15', '2026-03-13 22:49:15'),
	(118, 130, 'storage/media/product/2026-03-14-uP7wx1cNmEM5pReFz0MoYkQz4eedoiApDzHhAVsH.webp', '2026-03-13 22:49:16', '2026-03-13 22:49:16'),
	(119, 130, 'storage/media/product/2026-03-14-IEKSzScnkYJaK1r8ixvmmlqpzHOCnqk3iEYGDtIl.webp', '2026-03-13 22:49:17', '2026-03-13 22:49:17'),
	(120, 130, 'storage/media/product/2026-03-14-POSIeGYWUjrdUGgsSrn7bsYL2YZi8qlNJVYQwA13.webp', '2026-03-13 22:49:17', '2026-03-13 22:49:17'),
	(121, 131, 'storage/media/product/2026-03-14-b96Qi3y2Ehj5HnEOlOSciHT8KwBEPXiJQ9EO7Qgr.webp', '2026-03-13 22:50:29', '2026-03-13 22:50:29'),
	(122, 131, 'storage/media/product/2026-03-14-N2ZrMTMS54izGXNM4Z7X1toMIjzWQTAWyOz0SKAm.webp', '2026-03-13 22:50:29', '2026-03-13 22:50:29'),
	(123, 131, 'storage/media/product/2026-03-14-6GJHhpAt2V7Db9ZTvSnUOjZEsVhQKM1xfxfQFZmI.webp', '2026-03-13 22:50:30', '2026-03-13 22:50:30'),
	(124, 131, 'storage/media/product/2026-03-14-5PYSyKwARBYjTu7KOT3ruWbnPK8lCJmov3hC8q4f.webp', '2026-03-13 22:50:31', '2026-03-13 22:50:31'),
	(125, 137, 'storage/media/product/2026-03-14-oXAAYvRJ2MZdvqTRODMAq9ZQo7FZoftoD79T69po.webp', '2026-03-14 07:51:24', '2026-03-14 07:51:24'),
	(126, 137, 'storage/media/product/2026-03-14-TplpiEBVM8lDg3MzKAiLJtiEm6mDO7EclUX9z46w.webp', '2026-03-14 07:51:25', '2026-03-14 07:51:25'),
	(127, 137, 'storage/media/product/2026-03-14-NvraeYKkbuasnzc6lrQfE7iqpeunXhKiUJy35HiN.webp', '2026-03-14 07:51:25', '2026-03-14 07:51:25'),
	(128, 137, 'storage/media/product/2026-03-14-XUtmRWM4qUZC7P7U9x2jSl35xLQaf1YFYePdOWys.webp', '2026-03-14 07:51:26', '2026-03-14 07:51:26'),
	(129, 137, 'storage/media/product/2026-03-14-39zUN8ZwI05xAOYRaALAyouw5V4l2uh44qybVUMo.webp', '2026-03-14 07:51:27', '2026-03-14 07:51:27'),
	(130, 138, 'storage/media/product/2026-03-14-UdVKqQIzFTjR7WJaKrM1GoaGQ4w5lzQOVWWQxSx9.webp', '2026-03-14 07:53:41', '2026-03-14 07:53:41'),
	(131, 138, 'storage/media/product/2026-03-14-0dZPB3APivIbVgHLIEinwzQHjZkSXAxRfZZzCS1R.webp', '2026-03-14 07:53:42', '2026-03-14 07:53:42'),
	(132, 138, 'storage/media/product/2026-03-14-snLKB2frDHMsMZlzG28FftvbCtCDd13XnyBCmUE9.webp', '2026-03-14 07:53:43', '2026-03-14 07:53:43'),
	(133, 139, 'storage/media/product/2026-03-14-n405B6l7gfAuCvUEUu77W5suMqrXckT0Y2oVQhtZ.webp', '2026-03-14 07:55:28', '2026-03-14 07:55:28'),
	(134, 139, 'storage/media/product/2026-03-14-Bkb4MvAIaKJRdZFItaQRPvovDOo06eSvKUjzj4cs.webp', '2026-03-14 07:55:28', '2026-03-14 07:55:28'),
	(135, 139, 'storage/media/product/2026-03-14-Ma72eT5L86crfboJUAC0vEGh5kvC2MYOD3zyXHBN.webp', '2026-03-14 07:55:29', '2026-03-14 07:55:29'),
	(136, 140, 'storage/media/product/2026-03-14-VhGtCHbPcPp1nuF0B5sPUjlS7gImHzeRY87VHGVB.webp', '2026-03-14 07:57:02', '2026-03-14 07:57:02'),
	(137, 140, 'storage/media/product/2026-03-14-GdHL9V8Wi7dGBIkBjpkbpBzDTWzQvb1276N9UeEM.webp', '2026-03-14 07:57:02', '2026-03-14 07:57:02'),
	(138, 140, 'storage/media/product/2026-03-14-ECgZR8RUkh0WNpsacKAMkmCSoafn99qg2FnxrxWn.webp', '2026-03-14 07:57:03', '2026-03-14 07:57:03'),
	(139, 140, 'storage/media/product/2026-03-14-EXnniU9wv9v3FBOG99WJToql9w5xhUmqeBvWzlP0.webp', '2026-03-14 07:57:04', '2026-03-14 07:57:04'),
	(140, 140, 'storage/media/product/2026-03-14-KjkNTUcyt5XqorolvNXIxnoBh7rHMt83sWU59cWL.webp', '2026-03-14 07:57:04', '2026-03-14 07:57:04'),
	(141, 141, 'storage/media/product/2026-03-14-b7UStGYRxhi3PyeZiBu5AlBhgxMDPl1bq7OGr6bZ.webp', '2026-03-14 07:59:49', '2026-03-14 07:59:49'),
	(142, 141, 'storage/media/product/2026-03-14-AD8XqKEtNB1x6I1IkRABGT42aZjUeGWzMKWTt90L.webp', '2026-03-14 07:59:50', '2026-03-14 07:59:50'),
	(143, 141, 'storage/media/product/2026-03-14-WK8VBejGLvPo3D5SoQVqcb4IIXx9b6y5FJmaF4dM.webp', '2026-03-14 07:59:51', '2026-03-14 07:59:51'),
	(144, 141, 'storage/media/product/2026-03-14-9Tp28MS1WhDQNCWp5O2AGwLW7XzbL5NLMylm9YML.webp', '2026-03-14 07:59:51', '2026-03-14 07:59:51'),
	(145, 141, 'storage/media/product/2026-03-14-akwa2jfKWXzLFbUqtzkdIfn10QQLZemoRBz24xUe.webp', '2026-03-14 07:59:52', '2026-03-14 07:59:52'),
	(146, 144, 'storage/media/product/2026-03-14-IWoy0nFq6ozAVnPO0UpEYPPGz7aMFaBuY65wCNJ3.webp', '2026-03-14 08:11:38', '2026-03-14 08:11:38'),
	(147, 144, 'storage/media/product/2026-03-14-Ts2i8BQ2lrhwYnbzkknfeN90EDyw141xMUJBQeVX.webp', '2026-03-14 08:11:39', '2026-03-14 08:11:39');

-- Dumping structure for table airas_mart.product_tags
DROP TABLE IF EXISTS `product_tags`;
CREATE TABLE IF NOT EXISTS `product_tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_tags_product_id_foreign` (`product_id`),
  CONSTRAINT `product_tags_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.product_tags: ~0 rows (approximately)
DELETE FROM `product_tags`;

-- Dumping structure for table airas_mart.product_variants
DROP TABLE IF EXISTS `product_variants`;
CREATE TABLE IF NOT EXISTS `product_variants` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `variant` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_price` decimal(16,2) NOT NULL DEFAULT '0.00',
  `regular_price` decimal(16,2) NOT NULL DEFAULT '0.00',
  `sale_price` decimal(16,2) NOT NULL DEFAULT '0.00',
  `discount` decimal(16,2) NOT NULL DEFAULT '0.00',
  `discount_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'amount',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stock` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_variants_product_id_foreign` (`product_id`),
  CONSTRAINT `product_variants_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.product_variants: ~0 rows (approximately)
DELETE FROM `product_variants`;

-- Dumping structure for table airas_mart.product_variant_values
DROP TABLE IF EXISTS `product_variant_values`;
CREATE TABLE IF NOT EXISTS `product_variant_values` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `product_variant_id` bigint unsigned NOT NULL,
  `attribute_id` bigint unsigned NOT NULL,
  `attribute_value_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_variant_values_product_variant_id_attribute_id_unique` (`product_variant_id`,`attribute_id`),
  KEY `product_variant_values_product_id_foreign` (`product_id`),
  KEY `product_variant_values_attribute_id_foreign` (`attribute_id`),
  KEY `product_variant_values_attribute_value_id_foreign` (`attribute_value_id`),
  CONSTRAINT `product_variant_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_variant_values_attribute_value_id_foreign` FOREIGN KEY (`attribute_value_id`) REFERENCES `attribute_values` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_variant_values_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_variant_values_product_variant_id_foreign` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.product_variant_values: ~0 rows (approximately)
DELETE FROM `product_variant_values`;

-- Dumping structure for table airas_mart.product_vendors
DROP TABLE IF EXISTS `product_vendors`;
CREATE TABLE IF NOT EXISTS `product_vendors` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `vendor_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_vendors_product_id_foreign` (`product_id`),
  KEY `product_vendors_vendor_id_foreign` (`vendor_id`),
  CONSTRAINT `product_vendors_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_vendors_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.product_vendors: ~67 rows (approximately)
DELETE FROM `product_vendors`;
INSERT INTO `product_vendors` (`id`, `product_id`, `vendor_id`, `created_at`, `updated_at`) VALUES
	(24, 40, 1, '2026-03-06 21:56:46', '2026-03-06 21:56:46'),
	(25, 41, 1, '2026-03-06 22:22:58', '2026-03-06 22:22:58'),
	(26, 42, 1, '2026-03-06 22:38:03', '2026-03-06 22:38:03'),
	(27, 43, 1, '2026-03-06 22:39:25', '2026-03-06 22:39:25'),
	(28, 44, 1, '2026-03-06 22:39:50', '2026-03-06 22:39:50'),
	(29, 45, 1, '2026-03-06 22:40:12', '2026-03-06 22:40:12'),
	(30, 46, 1, '2026-03-06 22:41:33', '2026-03-06 22:41:33'),
	(31, 47, 1, '2026-03-06 22:42:03', '2026-03-06 22:42:03'),
	(32, 48, 1, '2026-03-06 22:42:40', '2026-03-06 22:42:40'),
	(33, 49, 1, '2026-03-06 22:43:20', '2026-03-06 22:43:20'),
	(34, 50, 1, '2026-03-06 22:43:47', '2026-03-06 22:43:47'),
	(35, 51, 1, '2026-03-06 22:44:12', '2026-03-06 22:44:12'),
	(36, 52, 1, '2026-03-06 22:45:52', '2026-03-06 22:45:52'),
	(37, 53, 1, '2026-03-06 22:46:24', '2026-03-06 22:46:24'),
	(38, 54, 1, '2026-03-06 22:46:57', '2026-03-06 22:46:57'),
	(39, 55, 1, '2026-03-06 22:47:21', '2026-03-06 22:47:21'),
	(40, 56, 1, '2026-03-06 22:47:39', '2026-03-06 22:47:39'),
	(41, 57, 1, '2026-03-06 22:48:02', '2026-03-06 22:48:02'),
	(42, 58, 1, '2026-03-06 22:49:09', '2026-03-06 22:49:09'),
	(43, 59, 1, '2026-03-06 22:49:37', '2026-03-06 22:49:37'),
	(44, 60, 1, '2026-03-06 22:49:54', '2026-03-06 22:49:54'),
	(45, 61, 1, '2026-03-06 22:50:31', '2026-03-06 22:50:31'),
	(46, 62, 1, '2026-03-06 22:51:14', '2026-03-06 22:51:14'),
	(47, 63, 1, '2026-03-06 22:51:53', '2026-03-06 22:51:53'),
	(48, 64, 1, '2026-03-07 02:18:07', '2026-03-07 02:18:07'),
	(49, 65, 1, '2026-03-07 02:18:48', '2026-03-07 02:18:48'),
	(50, 66, 1, '2026-03-07 02:19:26', '2026-03-07 02:19:26'),
	(51, 67, 1, '2026-03-07 02:20:00', '2026-03-07 02:20:00'),
	(52, 68, 1, '2026-03-07 02:20:18', '2026-03-07 02:20:18'),
	(53, 69, 1, '2026-03-07 02:20:46', '2026-03-07 02:20:46'),
	(54, 70, 1, '2026-03-07 02:22:08', '2026-03-07 02:22:08'),
	(55, 71, 1, '2026-03-07 02:22:27', '2026-03-07 02:22:27'),
	(56, 72, 1, '2026-03-07 02:22:44', '2026-03-07 02:22:44'),
	(57, 73, 1, '2026-03-07 02:23:06', '2026-03-07 02:23:06'),
	(58, 74, 1, '2026-03-07 02:23:25', '2026-03-07 02:23:25'),
	(59, 75, 1, '2026-03-07 02:23:45', '2026-03-07 02:23:45'),
	(60, 76, 1, '2026-03-07 02:24:51', '2026-03-07 02:24:51'),
	(61, 77, 1, '2026-03-07 02:26:16', '2026-03-07 02:26:16'),
	(62, 78, 2, '2026-03-07 02:45:27', '2026-03-07 02:45:27'),
	(63, 79, 2, '2026-03-07 02:50:07', '2026-03-07 02:50:07'),
	(64, 80, 2, '2026-03-07 03:11:18', '2026-03-07 03:11:18'),
	(65, 81, 2, '2026-03-07 03:13:13', '2026-03-07 03:13:13'),
	(66, 82, 2, '2026-03-07 03:22:13', '2026-03-07 03:22:13'),
	(67, 83, 2, '2026-03-07 03:23:37', '2026-03-07 03:23:37'),
	(68, 84, 2, '2026-03-07 03:29:50', '2026-03-07 03:29:50'),
	(69, 85, 2, '2026-03-07 03:30:44', '2026-03-07 03:30:44'),
	(70, 86, 2, '2026-03-07 03:39:30', '2026-03-07 03:39:30'),
	(71, 87, 2, '2026-03-07 03:42:11', '2026-03-07 03:42:11'),
	(72, 88, 2, '2026-03-07 03:44:26', '2026-03-07 03:44:26'),
	(73, 89, 2, '2026-03-07 03:47:57', '2026-03-07 03:47:57'),
	(74, 90, 2, '2026-03-07 03:49:24', '2026-03-07 03:49:24'),
	(75, 91, 2, '2026-03-07 03:52:32', '2026-03-07 03:52:32'),
	(76, 92, 2, '2026-03-07 03:55:13', '2026-03-07 03:55:13'),
	(77, 93, 2, '2026-03-07 03:57:42', '2026-03-07 03:57:42'),
	(78, 94, 2, '2026-03-07 04:00:26', '2026-03-07 04:00:26'),
	(79, 95, 2, '2026-03-07 04:15:03', '2026-03-07 04:15:03'),
	(80, 96, 2, '2026-03-07 04:19:24', '2026-03-07 04:19:24'),
	(81, 97, 2, '2026-03-07 04:22:30', '2026-03-07 04:22:30'),
	(82, 98, 2, '2026-03-07 04:25:49', '2026-03-07 04:25:49'),
	(83, 99, 3, '2026-03-13 05:38:14', '2026-03-13 05:38:14'),
	(84, 100, 3, '2026-03-13 05:43:16', '2026-03-13 05:43:16'),
	(85, 101, 3, '2026-03-13 05:50:00', '2026-03-13 05:50:00'),
	(86, 102, 3, '2026-03-13 05:54:04', '2026-03-13 05:54:04'),
	(87, 103, 3, '2026-03-13 06:00:18', '2026-03-13 06:00:18'),
	(88, 104, 3, '2026-03-13 06:42:55', '2026-03-13 06:42:55'),
	(89, 105, 3, '2026-03-13 06:55:18', '2026-03-13 06:55:18'),
	(90, 106, 3, '2026-03-13 07:23:40', '2026-03-13 07:23:40'),
	(91, 107, 3, '2026-03-13 07:36:06', '2026-03-13 07:36:06'),
	(92, 108, 3, '2026-03-13 07:39:10', '2026-03-13 07:39:10'),
	(93, 109, 3, '2026-03-13 07:43:58', '2026-03-13 07:43:58'),
	(94, 110, 3, '2026-03-13 07:47:04', '2026-03-13 07:47:04'),
	(95, 111, 3, '2026-03-13 07:49:58', '2026-03-13 07:49:58'),
	(96, 112, 3, '2026-03-13 07:52:22', '2026-03-13 07:52:22'),
	(97, 113, 3, '2026-03-13 22:02:33', '2026-03-13 22:02:33'),
	(98, 114, 3, '2026-03-13 22:19:09', '2026-03-13 22:19:09'),
	(99, 115, 3, '2026-03-13 22:21:57', '2026-03-13 22:21:57'),
	(100, 116, 3, '2026-03-13 22:23:23', '2026-03-13 22:23:23'),
	(101, 117, 3, '2026-03-13 22:24:45', '2026-03-13 22:24:45'),
	(102, 118, 3, '2026-03-13 22:26:11', '2026-03-13 22:26:11'),
	(103, 119, 3, '2026-03-13 22:28:42', '2026-03-13 22:28:42'),
	(104, 120, 3, '2026-03-13 22:29:59', '2026-03-13 22:29:59'),
	(105, 121, 3, '2026-03-13 22:31:12', '2026-03-13 22:31:12'),
	(106, 122, 3, '2026-03-13 22:32:27', '2026-03-13 22:32:27'),
	(107, 123, 3, '2026-03-13 22:35:09', '2026-03-13 22:35:09'),
	(108, 124, 3, '2026-03-13 22:37:09', '2026-03-13 22:37:09'),
	(109, 125, 3, '2026-03-13 22:38:10', '2026-03-13 22:38:10'),
	(110, 126, 3, '2026-03-13 22:39:55', '2026-03-13 22:39:55'),
	(111, 127, 3, '2026-03-13 22:43:35', '2026-03-13 22:43:35'),
	(112, 128, 3, '2026-03-13 22:45:59', '2026-03-13 22:45:59'),
	(113, 129, 3, '2026-03-13 22:47:15', '2026-03-13 22:47:15'),
	(114, 130, 3, '2026-03-13 22:49:17', '2026-03-13 22:49:17'),
	(115, 131, 3, '2026-03-13 22:50:31', '2026-03-13 22:50:31'),
	(116, 132, 3, '2026-03-14 07:40:35', '2026-03-14 07:40:35'),
	(117, 133, 3, '2026-03-14 07:42:26', '2026-03-14 07:42:26'),
	(118, 134, 3, '2026-03-14 07:43:52', '2026-03-14 07:43:52'),
	(119, 135, 3, '2026-03-14 07:47:06', '2026-03-14 07:47:06'),
	(120, 136, 3, '2026-03-14 07:48:01', '2026-03-14 07:48:01'),
	(121, 137, 3, '2026-03-14 07:51:27', '2026-03-14 07:51:27'),
	(122, 138, 3, '2026-03-14 07:53:43', '2026-03-14 07:53:43'),
	(123, 139, 3, '2026-03-14 07:55:29', '2026-03-14 07:55:29'),
	(124, 140, 3, '2026-03-14 07:57:04', '2026-03-14 07:57:04'),
	(125, 141, 3, '2026-03-14 07:59:52', '2026-03-14 07:59:52'),
	(126, 142, 3, '2026-03-14 08:05:04', '2026-03-14 08:05:04'),
	(127, 143, 3, '2026-03-14 08:10:09', '2026-03-14 08:10:09'),
	(128, 144, 3, '2026-03-14 08:11:39', '2026-03-14 08:11:39'),
	(129, 145, 3, '2026-03-14 08:15:20', '2026-03-14 08:15:20'),
	(130, 146, 3, '2026-03-14 08:16:52', '2026-03-14 08:16:52'),
	(131, 147, 3, '2026-03-14 08:18:02', '2026-03-14 08:18:02');

-- Dumping structure for table airas_mart.profit_distributions
DROP TABLE IF EXISTS `profit_distributions`;
CREATE TABLE IF NOT EXISTS `profit_distributions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `serial_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` int NOT NULL,
  `month` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `product_id` bigint unsigned DEFAULT NULL,
  `invest_qty` decimal(16,0) NOT NULL,
  `production_qty` int NOT NULL,
  `sales_qty` int NOT NULL,
  `sales_amount` decimal(12,0) NOT NULL,
  `invest_amount` decimal(16,0) NOT NULL,
  `profit_amount` decimal(16,0) NOT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `profit_distributions_serial_no_unique` (`serial_no`),
  KEY `profit_distributions_created_by_foreign` (`created_by`),
  KEY `profit_distributions_updated_by_foreign` (`updated_by`),
  KEY `profit_distributions_deleted_by_foreign` (`deleted_by`),
  CONSTRAINT `profit_distributions_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `profit_distributions_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `profit_distributions_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.profit_distributions: ~4 rows (approximately)
DELETE FROM `profit_distributions`;
INSERT INTO `profit_distributions` (`id`, `serial_no`, `year`, `month`, `date`, `product_id`, `invest_qty`, `production_qty`, `sales_qty`, `sales_amount`, `invest_amount`, `profit_amount`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(14, 'PD2511001', 2025, 'November', '2025-11-26', 12, 6, 1013, 842, 185328, 180000, 37890, 10, NULL, NULL, NULL, '2025-11-26 01:17:55', '2025-11-26 01:17:55'),
	(15, 'PD2512001', 2025, 'December', '2025-12-24', 4, 6, 1107, 897, 186638, 180000, 40365, 10, NULL, NULL, NULL, '2025-12-23 22:40:41', '2025-12-23 22:40:41'),
	(19, 'PD2512002', 2025, 'December', '2025-12-29', 3, 6, 987, 878, 203580, 180000, 39510, 10, NULL, NULL, NULL, '2025-12-29 23:51:54', '2025-12-29 23:51:54'),
	(20, 'PD2512003', 2025, 'December', '2025-12-30', 2, 6, 1100, 751, 144115, 180000, 33795, 10, NULL, NULL, NULL, '2025-12-29 23:54:16', '2025-12-29 23:54:16');

-- Dumping structure for table airas_mart.profit_distribution_lists
DROP TABLE IF EXISTS `profit_distribution_lists`;
CREATE TABLE IF NOT EXISTS `profit_distribution_lists` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `profit_distribution_id` bigint unsigned NOT NULL,
  `invest_id` bigint unsigned NOT NULL,
  `investor_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `profit_per_sale` decimal(16,0) NOT NULL,
  `sales_qty` decimal(16,0) DEFAULT NULL,
  `invest_qty` decimal(16,0) NOT NULL,
  `invest_amount` decimal(16,0) NOT NULL,
  `amount` decimal(16,0) NOT NULL,
  `paid_amount` decimal(16,0) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `profit_distribution_lists_profit_distribution_id_foreign` (`profit_distribution_id`),
  KEY `profit_distribution_lists_invest_id_foreign` (`invest_id`),
  KEY `profit_distribution_lists_investor_id_foreign` (`investor_id`),
  KEY `profit_distribution_lists_product_id_foreign` (`product_id`),
  CONSTRAINT `profit_distribution_lists_invest_id_foreign` FOREIGN KEY (`invest_id`) REFERENCES `invests` (`id`) ON DELETE CASCADE,
  CONSTRAINT `profit_distribution_lists_investor_id_foreign` FOREIGN KEY (`investor_id`) REFERENCES `investors` (`id`) ON DELETE CASCADE,
  CONSTRAINT `profit_distribution_lists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `profit_distribution_lists_profit_distribution_id_foreign` FOREIGN KEY (`profit_distribution_id`) REFERENCES `profit_distributions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.profit_distribution_lists: ~11 rows (approximately)
DELETE FROM `profit_distribution_lists`;
INSERT INTO `profit_distribution_lists` (`id`, `profit_distribution_id`, `invest_id`, `investor_id`, `product_id`, `profit_per_sale`, `sales_qty`, `invest_qty`, `invest_amount`, `amount`, `paid_amount`, `created_at`, `updated_at`) VALUES
	(19, 15, 17, 9, 4, 45, 897, 3, 90000, 20184, 20184, '2025-12-23 22:40:41', '2025-12-23 22:42:14'),
	(20, 15, 23, 9, 4, 45, 897, 3, 90000, 20184, 20184, '2025-12-23 22:40:41', '2025-12-23 22:42:14');

-- Dumping structure for table airas_mart.publications
DROP TABLE IF EXISTS `publications`;
CREATE TABLE IF NOT EXISTS `publications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `publications_slug_unique` (`slug`),
  KEY `publications_created_by_foreign` (`created_by`),
  KEY `publications_updated_by_foreign` (`updated_by`),
  KEY `publications_deleted_by_foreign` (`deleted_by`),
  CONSTRAINT `publications_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `publications_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `publications_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.publications: ~2 rows (approximately)
DELETE FROM `publications`;
INSERT INTO `publications` (`id`, `name`, `slug`, `image`, `cover_image`, `description`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 'Airas Mart', 'airas-mart-1', 'storage/publication/2026-01-20-YJsw5YKEToACrcjI64eyleHJWWOJZSSLJBeUZnQ2.webp', 'storage/publication/2026-01-20-OraaoflH2i5HqarTG3PsAVbb74Zym9w7RnmeCdlE.webp', 'Airas', 1, NULL, NULL, NULL, NULL, '2026-01-20 04:24:34', '2026-03-06 21:48:17'),
	(2, 'Airas Mart', 'airas-mart', 'storage/publication/2026-01-22-pLcGvcdwiBan700LNHOTiRx7VBAPn2zbYC4wZ3Rr.webp', 'storage/publication/2026-01-22-YkCGXyosBESKkHyUso3foqsYxmxFKj3WIpmWhQR2.webp', 'Airas', 1, NULL, NULL, NULL, NULL, '2026-01-22 04:34:10', '2026-03-06 21:48:02');

-- Dumping structure for table airas_mart.purchase_orders
DROP TABLE IF EXISTS `purchase_orders`;
CREATE TABLE IF NOT EXISTS `purchase_orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `po_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `store_id` bigint unsigned DEFAULT NULL,
  `vendor_id` bigint unsigned NOT NULL,
  `order_date` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `expected_date` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_amount` decimal(12,2) DEFAULT '0.00',
  `discount_amount` decimal(12,2) DEFAULT '0.00',
  `tax_amount` decimal(12,2) DEFAULT '0.00',
  `grand_total` decimal(12,2) DEFAULT '0.00',
  `payment_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_amount` double DEFAULT NULL,
  `due_amount` double DEFAULT NULL,
  `status` enum('draft','pending','approved','partially_received','received','cancelled') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'draft',
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `purchase_orders_po_number_unique` (`po_number`),
  KEY `purchase_orders_store_id_foreign` (`store_id`),
  KEY `purchase_orders_vendor_id_foreign` (`vendor_id`),
  KEY `purchase_orders_created_by_foreign` (`created_by`),
  KEY `purchase_orders_updated_by_foreign` (`updated_by`),
  KEY `purchase_orders_deleted_by_foreign` (`deleted_by`),
  CONSTRAINT `purchase_orders_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `purchase_orders_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `purchase_orders_store_id_foreign` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`) ON DELETE SET NULL,
  CONSTRAINT `purchase_orders_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `purchase_orders_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.purchase_orders: ~0 rows (approximately)
DELETE FROM `purchase_orders`;

-- Dumping structure for table airas_mart.purchase_order_items
DROP TABLE IF EXISTS `purchase_order_items`;
CREATE TABLE IF NOT EXISTS `purchase_order_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `purchase_order_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `product_variant_id` bigint unsigned DEFAULT NULL,
  `quantity` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
  `received_quantity` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
  `unit_price` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
  `discount_amount` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
  `tax_amount` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
  `total_amount` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_order_items_purchase_order_id_foreign` (`purchase_order_id`),
  KEY `purchase_order_items_product_id_foreign` (`product_id`),
  KEY `purchase_order_items_product_variant_id_foreign` (`product_variant_id`),
  KEY `purchase_order_items_created_by_foreign` (`created_by`),
  KEY `purchase_order_items_updated_by_foreign` (`updated_by`),
  KEY `purchase_order_items_deleted_by_foreign` (`deleted_by`),
  CONSTRAINT `purchase_order_items_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `purchase_order_items_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `purchase_order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `purchase_order_items_product_variant_id_foreign` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`) ON DELETE SET NULL,
  CONSTRAINT `purchase_order_items_purchase_order_id_foreign` FOREIGN KEY (`purchase_order_id`) REFERENCES `purchase_orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `purchase_order_items_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.purchase_order_items: ~0 rows (approximately)
DELETE FROM `purchase_order_items`;

-- Dumping structure for table airas_mart.purchase_receipts
DROP TABLE IF EXISTS `purchase_receipts`;
CREATE TABLE IF NOT EXISTS `purchase_receipts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `receipt_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `purchase_order_id` bigint unsigned DEFAULT NULL,
  `store_id` bigint unsigned NOT NULL,
  `receipt_date` date NOT NULL,
  `received_by` bigint unsigned DEFAULT NULL,
  `remarks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `purchase_receipts_receipt_number_unique` (`receipt_number`),
  KEY `purchase_receipts_purchase_order_id_foreign` (`purchase_order_id`),
  KEY `purchase_receipts_store_id_foreign` (`store_id`),
  KEY `purchase_receipts_received_by_foreign` (`received_by`),
  CONSTRAINT `purchase_receipts_purchase_order_id_foreign` FOREIGN KEY (`purchase_order_id`) REFERENCES `purchase_orders` (`id`) ON DELETE SET NULL,
  CONSTRAINT `purchase_receipts_received_by_foreign` FOREIGN KEY (`received_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `purchase_receipts_store_id_foreign` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.purchase_receipts: ~0 rows (approximately)
DELETE FROM `purchase_receipts`;

-- Dumping structure for table airas_mart.purchase_receipt_items
DROP TABLE IF EXISTS `purchase_receipt_items`;
CREATE TABLE IF NOT EXISTS `purchase_receipt_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `purchase_receipt_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `product_variant_id` bigint unsigned NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `unit_cost` decimal(15,2) NOT NULL DEFAULT '0.00',
  `total_cost` decimal(15,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_receipt_items_purchase_receipt_id_foreign` (`purchase_receipt_id`),
  KEY `purchase_receipt_items_product_id_foreign` (`product_id`),
  KEY `purchase_receipt_items_product_variant_id_foreign` (`product_variant_id`),
  CONSTRAINT `purchase_receipt_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `purchase_receipt_items_product_variant_id_foreign` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE,
  CONSTRAINT `purchase_receipt_items_purchase_receipt_id_foreign` FOREIGN KEY (`purchase_receipt_id`) REFERENCES `purchase_receipts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.purchase_receipt_items: ~0 rows (approximately)
DELETE FROM `purchase_receipt_items`;

-- Dumping structure for table airas_mart.regions
DROP TABLE IF EXISTS `regions`;
CREATE TABLE IF NOT EXISTS `regions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `incharge` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `regions_code_unique` (`code`),
  KEY `regions_created_by_foreign` (`created_by`),
  KEY `regions_updated_by_foreign` (`updated_by`),
  KEY `regions_deleted_by_foreign` (`deleted_by`),
  CONSTRAINT `regions_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `regions_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `regions_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.regions: ~9 rows (approximately)
DELETE FROM `regions`;
INSERT INTO `regions` (`id`, `code`, `name`, `incharge`, `phone`, `email`, `address`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, NULL, 'Dhaka', NULL, NULL, NULL, NULL, 1, NULL, 10, NULL, NULL, '2025-07-22 03:18:28', '2025-10-26 00:13:07'),
	(2, NULL, 'Barishal', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-25 23:48:53', '2025-10-25 23:48:53'),
	(3, NULL, 'Khulna', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-25 23:49:05', '2025-10-25 23:49:05'),
	(4, NULL, 'Mymensingh', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-25 23:49:32', '2025-10-25 23:49:32'),
	(5, NULL, 'Rajshahi', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-25 23:49:47', '2025-10-25 23:49:47'),
	(6, NULL, 'Rangpur', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-25 23:50:31', '2025-10-25 23:50:31'),
	(7, NULL, 'Chattogram', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-25 23:50:52', '2025-10-25 23:50:52'),
	(8, NULL, 'Sylhet', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-25 23:51:18', '2025-10-25 23:51:18'),
	(9, NULL, 'Region-1', NULL, NULL, NULL, NULL, 0, 10, NULL, NULL, NULL, '2025-10-26 00:18:44', '2025-11-01 01:45:01');

-- Dumping structure for table airas_mart.reviews
DROP TABLE IF EXISTS `reviews`;
CREATE TABLE IF NOT EXISTS `reviews` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `rating` tinyint NOT NULL,
  `review` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reviews_user_id_product_id_unique` (`user_id`,`product_id`),
  KEY `reviews_product_id_foreign` (`product_id`),
  CONSTRAINT `reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.reviews: ~0 rows (approximately)
DELETE FROM `reviews`;

-- Dumping structure for table airas_mart.roles
DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.roles: ~2 rows (approximately)
DELETE FROM `roles`;
INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
	(1, 'Software Admin', 'web', '2026-03-14 00:13:01', '2026-03-14 00:13:01'),
	(2, 'System Admin', 'web', '2026-03-14 00:13:01', '2026-03-14 00:13:01');

-- Dumping structure for table airas_mart.role_has_permissions
DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.role_has_permissions: ~101 rows (approximately)
DELETE FROM `role_has_permissions`;
INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1),
	(6, 1),
	(14, 1),
	(18, 1),
	(19, 1),
	(20, 1),
	(21, 1),
	(22, 1),
	(23, 1),
	(24, 1),
	(25, 1),
	(26, 1),
	(27, 1),
	(28, 1),
	(29, 1),
	(31, 1),
	(32, 1),
	(33, 1),
	(34, 1),
	(35, 1),
	(36, 1),
	(37, 1),
	(38, 1),
	(39, 1),
	(40, 1),
	(41, 1),
	(44, 1),
	(45, 1),
	(46, 1),
	(47, 1),
	(48, 1),
	(49, 1),
	(50, 1),
	(51, 1),
	(52, 1),
	(53, 1),
	(54, 1),
	(55, 1),
	(56, 1),
	(57, 1),
	(58, 1),
	(59, 1),
	(60, 1),
	(61, 1),
	(62, 1),
	(63, 1),
	(64, 1),
	(65, 1),
	(66, 1),
	(67, 1),
	(68, 1),
	(69, 1),
	(70, 1),
	(71, 1),
	(72, 1),
	(73, 1),
	(74, 1),
	(75, 1),
	(76, 1),
	(78, 1),
	(79, 1),
	(80, 1),
	(81, 1),
	(82, 1),
	(83, 1),
	(84, 1),
	(85, 1),
	(86, 1),
	(87, 1),
	(88, 1),
	(89, 1),
	(90, 1),
	(91, 1),
	(92, 1),
	(93, 1),
	(94, 1),
	(95, 1),
	(96, 1),
	(97, 1),
	(98, 1),
	(99, 1),
	(100, 1),
	(102, 1),
	(103, 1),
	(104, 1),
	(105, 1),
	(106, 1),
	(107, 1),
	(108, 1),
	(109, 1),
	(110, 1),
	(111, 1),
	(112, 1),
	(113, 1),
	(114, 1),
	(115, 1),
	(116, 1),
	(117, 1),
	(1, 2),
	(21, 2),
	(23, 2),
	(24, 2),
	(26, 2),
	(38, 2);

-- Dumping structure for table airas_mart.sales
DROP TABLE IF EXISTS `sales`;
CREATE TABLE IF NOT EXISTS `sales` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint unsigned NOT NULL,
  `store_id` bigint unsigned DEFAULT NULL,
  `sales_officer_id` bigint unsigned DEFAULT NULL,
  `coa_id` bigint unsigned DEFAULT NULL,
  `sale_type` enum('Credit','Cash') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Credit',
  `invoice` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `discount` decimal(16,2) NOT NULL DEFAULT '0.00',
  `net_amount` decimal(16,2) NOT NULL,
  `paid` decimal(16,2) NOT NULL DEFAULT '0.00',
  `return_amount` decimal(16,2) NOT NULL DEFAULT '0.00',
  `return_paid` decimal(16,2) NOT NULL DEFAULT '0.00',
  `remarks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sales_invoice_unique` (`invoice`),
  KEY `sales_client_id_foreign` (`client_id`),
  KEY `sales_store_id_foreign` (`store_id`),
  KEY `sales_sales_officer_id_foreign` (`sales_officer_id`),
  KEY `sales_coa_id_foreign` (`coa_id`),
  KEY `sales_created_by_foreign` (`created_by`),
  KEY `sales_updated_by_foreign` (`updated_by`),
  KEY `sales_deleted_by_foreign` (`deleted_by`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.sales: ~0 rows (approximately)
DELETE FROM `sales`;
INSERT INTO `sales` (`id`, `client_id`, `store_id`, `sales_officer_id`, `coa_id`, `sale_type`, `invoice`, `date`, `amount`, `discount`, `net_amount`, `paid`, `return_amount`, `return_paid`, `remarks`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(3, 72, 1, 6, 281, 'Credit', 'CS2603001', '2026-03-14', 946.00, 94.60, 898.70, 0.00, 0.00, 0.00, 'Online Order', 1, NULL, NULL, NULL, '2026-03-13 21:56:05', '2026-03-13 21:56:05');

-- Dumping structure for table airas_mart.sales_lists
DROP TABLE IF EXISTS `sales_lists`;
CREATE TABLE IF NOT EXISTS `sales_lists` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `sales_id` bigint unsigned NOT NULL,
  `client_id` bigint unsigned NOT NULL,
  `store_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `product_edition_id` bigint unsigned DEFAULT NULL,
  `price` decimal(16,2) NOT NULL,
  `commission` decimal(16,2) NOT NULL DEFAULT '0.00',
  `commission_amount` decimal(16,2) NOT NULL DEFAULT '0.00',
  `rate` decimal(16,2) NOT NULL,
  `qty` decimal(16,2) NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `discount` decimal(16,2) NOT NULL DEFAULT '0.00',
  `net_amount` decimal(16,2) NOT NULL DEFAULT '0.00',
  `return_qty` decimal(16,2) NOT NULL DEFAULT '0.00',
  `return_amount` decimal(16,2) NOT NULL DEFAULT '0.00',
  `distributed` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sales_lists_sales_id_foreign` (`sales_id`),
  KEY `sales_lists_client_id_foreign` (`client_id`),
  KEY `sales_lists_store_id_foreign` (`store_id`),
  KEY `sales_lists_product_id_foreign` (`product_id`),
  KEY `sales_lists_product_edition_id_foreign` (`product_edition_id`),
  CONSTRAINT `sales_lists_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sales_lists_product_edition_id_foreign` FOREIGN KEY (`product_edition_id`) REFERENCES `product_editions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `sales_lists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sales_lists_sales_id_foreign` FOREIGN KEY (`sales_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sales_lists_store_id_foreign` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.sales_lists: ~0 rows (approximately)
DELETE FROM `sales_lists`;
INSERT INTO `sales_lists` (`id`, `sales_id`, `client_id`, `store_id`, `product_id`, `product_edition_id`, `price`, `commission`, `commission_amount`, `rate`, `qty`, `amount`, `discount`, `net_amount`, `return_qty`, `return_amount`, `distributed`, `created_at`, `updated_at`) VALUES
	(3, 3, 72, 1, 111, 87, 149.00, 0.00, 0.00, 149.00, 1.00, 149.00, 94.60, 54.40, 0.00, 0.00, 0, '2026-03-13 21:56:06', '2026-03-13 21:56:06'),
	(4, 3, 72, 1, 112, 88, 149.00, 0.00, 0.00, 149.00, 1.00, 149.00, 94.60, 54.40, 0.00, 0.00, 0, '2026-03-13 21:56:06', '2026-03-13 21:56:06'),
	(5, 3, 72, 1, 110, 86, 149.00, 0.00, 0.00, 149.00, 1.00, 149.00, 94.60, 54.40, 0.00, 0.00, 0, '2026-03-13 21:56:06', '2026-03-13 21:56:06'),
	(6, 3, 72, 1, 109, 85, 499.00, 0.00, 0.00, 499.00, 1.00, 499.00, 94.60, 404.40, 0.00, 0.00, 0, '2026-03-13 21:56:06', '2026-03-13 21:56:06');

-- Dumping structure for table airas_mart.sales_officers
DROP TABLE IF EXISTS `sales_officers`;
CREATE TABLE IF NOT EXISTS `sales_officers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sales_officers_code_unique` (`code`),
  KEY `sales_officers_created_by_foreign` (`created_by`),
  KEY `sales_officers_updated_by_foreign` (`updated_by`),
  KEY `sales_officers_deleted_by_foreign` (`deleted_by`),
  CONSTRAINT `sales_officers_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `sales_officers_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `sales_officers_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.sales_officers: ~5 rows (approximately)
DELETE FROM `sales_officers`;
INSERT INTO `sales_officers` (`id`, `code`, `name`, `phone`, `email`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(2, NULL, 'Tso Mostafa', NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-02 01:54:45', '2025-11-02 01:54:45'),
	(3, NULL, 'Tso Anamul', NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-02 01:55:01', '2025-11-02 01:55:01'),
	(4, NULL, 'Ali Ahmed Bahar', NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-02 01:55:30', '2025-11-02 01:55:30'),
	(5, NULL, 'Tso Rasel', NULL, NULL, 1, 10, 10, NULL, NULL, '2025-12-21 22:00:16', '2025-12-21 22:01:37'),
	(6, NULL, 'Online', '0000000000', 'online@gmail.com', 1, NULL, NULL, NULL, NULL, '2026-03-03 23:26:22', '2026-03-03 23:26:22');

-- Dumping structure for table airas_mart.sales_returns
DROP TABLE IF EXISTS `sales_returns`;
CREATE TABLE IF NOT EXISTS `sales_returns` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint unsigned NOT NULL,
  `store_id` bigint unsigned NOT NULL,
  `return_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sales_returns_return_no_unique` (`return_no`),
  KEY `sales_returns_client_id_foreign` (`client_id`),
  KEY `sales_returns_store_id_foreign` (`store_id`),
  KEY `sales_returns_created_by_foreign` (`created_by`),
  KEY `sales_returns_updated_by_foreign` (`updated_by`),
  KEY `sales_returns_deleted_by_foreign` (`deleted_by`),
  CONSTRAINT `sales_returns_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sales_returns_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `sales_returns_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `sales_returns_store_id_foreign` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sales_returns_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.sales_returns: ~0 rows (approximately)
DELETE FROM `sales_returns`;

-- Dumping structure for table airas_mart.sales_return_lists
DROP TABLE IF EXISTS `sales_return_lists`;
CREATE TABLE IF NOT EXISTS `sales_return_lists` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `sales_return_id` bigint unsigned NOT NULL,
  `client_id` bigint unsigned NOT NULL,
  `store_id` bigint unsigned NOT NULL,
  `sales_id` bigint unsigned NOT NULL,
  `sales_list_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `product_edition_id` bigint unsigned DEFAULT NULL,
  `rate` decimal(16,2) NOT NULL,
  `qty` decimal(16,2) NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sales_return_lists_sales_return_id_foreign` (`sales_return_id`),
  KEY `sales_return_lists_client_id_foreign` (`client_id`),
  KEY `sales_return_lists_store_id_foreign` (`store_id`),
  KEY `sales_return_lists_sales_id_foreign` (`sales_id`),
  KEY `sales_return_lists_sales_list_id_foreign` (`sales_list_id`),
  KEY `sales_return_lists_product_id_foreign` (`product_id`),
  KEY `sales_return_lists_product_edition_id_foreign` (`product_edition_id`),
  CONSTRAINT `sales_return_lists_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sales_return_lists_product_edition_id_foreign` FOREIGN KEY (`product_edition_id`) REFERENCES `product_editions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `sales_return_lists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sales_return_lists_sales_id_foreign` FOREIGN KEY (`sales_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sales_return_lists_sales_list_id_foreign` FOREIGN KEY (`sales_list_id`) REFERENCES `sales_lists` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sales_return_lists_sales_return_id_foreign` FOREIGN KEY (`sales_return_id`) REFERENCES `sales_returns` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sales_return_lists_store_id_foreign` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.sales_return_lists: ~0 rows (approximately)
DELETE FROM `sales_return_lists`;

-- Dumping structure for table airas_mart.sales_return_payments
DROP TABLE IF EXISTS `sales_return_payments`;
CREATE TABLE IF NOT EXISTS `sales_return_payments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `sales_return_id` bigint unsigned NOT NULL,
  `sales_id` bigint unsigned NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sales_return_payments_sales_return_id_foreign` (`sales_return_id`),
  KEY `sales_return_payments_sales_id_foreign` (`sales_id`),
  CONSTRAINT `sales_return_payments_sales_id_foreign` FOREIGN KEY (`sales_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sales_return_payments_sales_return_id_foreign` FOREIGN KEY (`sales_return_id`) REFERENCES `sales_returns` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.sales_return_payments: ~0 rows (approximately)
DELETE FROM `sales_return_payments`;

-- Dumping structure for table airas_mart.sessions
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.sessions: ~2 rows (approximately)
DELETE FROM `sessions`;
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('04jFGy9HTgnBJxBJi270ESpHtVRf6QnuK4c3H2F1', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiUjFDbjkxMFk4bGh2M05INEJBS3ZrSXk2enc0cXg5bzExNmF3TW90RCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1773495603),
	('b3vJvN6j2Nh4itnBNz87eVnRDVMNyYE1gL1BBS9n', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiUzVFUFZMVkNRbUxESmFHbGoxcVhJa2hjUVhZNUFUdFNDa3RYTDFuZCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1773463188),
	('fuzLsQLHOwqHccOkRXAbMjw7rm6oPEdmgW6lN9hE', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiVEdFN3BXakhUV2VzSGxHODIxRlM3b2xDaW1PdDdOcGJZSDVXUFI1ZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czozOiJ1cmwiO2E6MDp7fX0=', 1773469791),
	('JdsnalFRgsDGuNeRkhhQTaoxOmCmn73n2RpzwXtU', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoibXBGNzJyaDJwdTY4YW50cTB4eGRoQWM5NmFWZFhVU0xQanZpV2N2YiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly9haXJhcy1tYXJ0LnRlc3QvYWRtaW4vZGFzaGJvYXJkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6Mjt9', 1773468906),
	('QT3a769Nzf5hWidEHhn7PHiHW2SnvqhwdDaUWbrh', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiVmg2VEhpOUVsUFlPT3dDS09OVmdobG5lUzZVQVlidXdKVENMUjgzSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHA6Ly9haXJhcy1tYXJ0LnRlc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1773497979),
	('yFdlKOZCe2hDDTqjhs1nnULuE1OpKzQB7aMTjgIH', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiVXljbHBIYWNaSXkyR0Jjdjg4OTlBRW14QUtFQjltamxvV25uOEpmciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9kYXNoYm9hcmQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyO30=', 1773469779);

-- Dumping structure for table airas_mart.settings
DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `app_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primary_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondary_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primary_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondary_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `office_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `tax` double DEFAULT '0',
  `discount` double DEFAULT '0',
  `discount_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'percent' COMMENT '''percent'',''amount''',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `banner_one` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner_one_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner_one_status` tinyint(1) NOT NULL DEFAULT '1',
  `banner_two` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner_two_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner_two_status` tinyint(1) NOT NULL DEFAULT '1',
  `page_heading_bg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keyword` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `google_map` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `favicon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `placeholder` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_page` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whatsapp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pinterest` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_api_url` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `sms_api_key` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `sms_api_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `bkash_status` tinyint(1) NOT NULL DEFAULT '1',
  `nagad_status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.settings: ~1 rows (approximately)
DELETE FROM `settings`;
INSERT INTO `settings` (`id`, `app_name`, `title`, `primary_phone`, `secondary_phone`, `primary_email`, `secondary_email`, `office_time`, `address`, `tax`, `discount`, `discount_type`, `description`, `banner_one`, `banner_one_link`, `banner_one_status`, `banner_two`, `banner_two_link`, `banner_two_status`, `page_heading_bg`, `meta_title`, `meta_keyword`, `meta_description`, `meta_image`, `google_map`, `favicon`, `logo`, `footer_logo`, `placeholder`, `facebook_page`, `facebook_group`, `youtube`, `twitter`, `linkedin`, `google`, `whatsapp`, `instagram`, `pinterest`, `sms_api_url`, `sms_api_key`, `sms_api_id`, `bkash_status`, `nagad_status`, `created_at`, `updated_at`) VALUES
	(1, 'Airas Mart', 'Airas Mart', '01575020231', '01921588567', 'airasmart@gmail.com', 'airasmart@gmail.com', NULL, 'Aftabnager, Dhaka-1212', 5, 10, 'percent', 'Airas Mart is a powerful ecommerce and business management platform designed to manage products, inventory, sales, invoices, and customers easily. Grow your business smarter with Airas Mart.', 'storage/settings/2026-02-02-GF8iNzEQw10DQX3hGgXKvIxe4fI7GR7kjt8TCcXZ.webp', NULL, 1, NULL, NULL, 1, 'storage/settings/2026-03-05-DHPM2HmYJbirfQOGsu7yU2QQ89SoKBwq9aWUUSqx.webp', 'Airas Mart - Smart Ecommerce & All type of products Platform', 'Airas Mart, ecommerce platform Bangladesh, POS system, inventory management, online shop software, business management system, Airas Mart marketplace', 'Airas Mart is a powerful ecommerce and business management platform designed to manage products, inventory, sales, invoices, and customers easily. Grow your business smarter with Airas Mart. Airas Mart is providing clothes, mirror, fashion, sanitary, electric, frozen, cosmetics, stationary all type of bazar available in airas mart.', 'storage/settings/2026-03-06-uc06vyJ7hNXavOxMImBhLXYhvHSdnlfiEcKy5WfV.webp', NULL, 'storage/settings/2026-03-06-xp6fyp8MVYCOeE25Q9Rzo6aILj82LnVHEP8ZlnWE.webp', 'storage/settings/2026-03-05-zmOvdKU1zs4usjxOSGnIFslrdr4a8WRmO1MfSuaV.webp', NULL, 'storage/settings/2026-03-05-BxHdxGw4nmuC6malwJayZgOZQjoumO5OAAM26JKf.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, '2026-01-19 05:10:51', '2026-03-06 01:22:21');

-- Dumping structure for table airas_mart.sliders
DROP TABLE IF EXISTS `sliders`;
CREATE TABLE IF NOT EXISTS `sliders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sliders_created_by_foreign` (`created_by`),
  KEY `sliders_updated_by_foreign` (`updated_by`),
  KEY `sliders_deleted_by_foreign` (`deleted_by`),
  CONSTRAINT `sliders_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `sliders_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `sliders_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.sliders: ~2 rows (approximately)
DELETE FROM `sliders`;
INSERT INTO `sliders` (`id`, `image`, `mobile_image`, `link`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 'storage/slider/2026-03-06-8uyY1p3uAfVHuf5O1wqcg7CDcbEgkSwBbxdknHaE.webp', 'storage/slider/2026-03-06-uMzdgwdhYdf88tUtLMmcacCDV1A185P4U5WWNhDN.webp', '#', 1, NULL, NULL, NULL, NULL, '2026-01-20 00:28:37', '2026-03-05 22:06:02'),
	(2, 'storage/slider/2026-03-06-vm2WUGAaOBrUs9J4KUZEHNLr598bxo6WAOoRSHyX.webp', 'storage/slider/2026-03-06-zl0bAtcMHw74iOTVohla45ddUK9eAZtmArdks5yZ.webp', '#', 1, NULL, NULL, NULL, NULL, '2026-01-20 00:39:06', '2026-03-05 22:16:10');

-- Dumping structure for table airas_mart.stocks
DROP TABLE IF EXISTS `stocks`;
CREATE TABLE IF NOT EXISTS `stocks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `store_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `product_variant_id` bigint unsigned NOT NULL,
  `quantity` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `stocks_store_id_product_variant_id_unique` (`store_id`,`product_variant_id`),
  KEY `stocks_product_id_foreign` (`product_id`),
  KEY `stocks_product_variant_id_foreign` (`product_variant_id`),
  CONSTRAINT `stocks_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `stocks_product_variant_id_foreign` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE,
  CONSTRAINT `stocks_store_id_foreign` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.stocks: ~0 rows (approximately)
DELETE FROM `stocks`;

-- Dumping structure for table airas_mart.stock_movements
DROP TABLE IF EXISTS `stock_movements`;
CREATE TABLE IF NOT EXISTS `stock_movements` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `store_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `product_variant_id` bigint unsigned NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `type` enum('purchase_receipt','sales','transfer_out','transfer_in','adjustment') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_movements_store_id_foreign` (`store_id`),
  KEY `stock_movements_product_id_foreign` (`product_id`),
  KEY `stock_movements_product_variant_id_foreign` (`product_variant_id`),
  KEY `stock_movements_reference_type_reference_id_index` (`reference_type`,`reference_id`),
  CONSTRAINT `stock_movements_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `stock_movements_product_variant_id_foreign` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE,
  CONSTRAINT `stock_movements_store_id_foreign` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.stock_movements: ~0 rows (approximately)
DELETE FROM `stock_movements`;

-- Dumping structure for table airas_mart.stores
DROP TABLE IF EXISTS `stores`;
CREATE TABLE IF NOT EXISTS `stores` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `remarks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `stores_code_unique` (`code`),
  KEY `stores_created_by_foreign` (`created_by`),
  KEY `stores_updated_by_foreign` (`updated_by`),
  KEY `stores_deleted_by_foreign` (`deleted_by`),
  CONSTRAINT `stores_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `stores_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `stores_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.stores: ~0 rows (approximately)
DELETE FROM `stores`;
INSERT INTO `stores` (`id`, `code`, `type`, `name`, `address`, `remarks`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, NULL, 'Product Stock,Damage Stock', 'Book Store1', NULL, NULL, 1, NULL, NULL, NULL, NULL, '2025-07-22 03:19:10', '2026-02-26 01:51:37');

-- Dumping structure for table airas_mart.territories
DROP TABLE IF EXISTS `territories`;
CREATE TABLE IF NOT EXISTS `territories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `region_id` bigint unsigned NOT NULL,
  `area_id` bigint unsigned NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `incharge` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `territories_code_unique` (`code`),
  KEY `territories_region_id_foreign` (`region_id`),
  KEY `territories_area_id_foreign` (`area_id`),
  KEY `territories_created_by_foreign` (`created_by`),
  KEY `territories_updated_by_foreign` (`updated_by`),
  KEY `territories_deleted_by_foreign` (`deleted_by`),
  CONSTRAINT `territories_area_id_foreign` FOREIGN KEY (`area_id`) REFERENCES `areas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `territories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `territories_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `territories_region_id_foreign` FOREIGN KEY (`region_id`) REFERENCES `regions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `territories_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.territories: ~54 rows (approximately)
DELETE FROM `territories`;
INSERT INTO `territories` (`id`, `region_id`, `area_id`, `code`, `name`, `incharge`, `phone`, `email`, `address`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 9, 14, NULL, 'Territory 1', NULL, NULL, NULL, NULL, 1, NULL, 10, NULL, NULL, '2025-07-22 03:18:54', '2025-10-26 00:19:55'),
	(2, 5, 15, NULL, 'Territory-1', NULL, NULL, NULL, NULL, 1, 10, 10, NULL, NULL, '2025-10-26 00:31:40', '2025-10-26 00:32:46'),
	(3, 7, 18, NULL, 'Area-1', NULL, NULL, NULL, NULL, 1, 10, NULL, 10, '2025-10-26 01:14:11', '2025-10-26 01:13:55', '2025-10-26 01:14:11'),
	(4, 7, 16, NULL, 'Territory-1', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-26 01:16:06', '2025-10-26 01:16:06'),
	(5, 6, 45, NULL, 'পঞ্চগড়', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-31 22:43:40', '2025-10-31 22:43:40'),
	(6, 6, 45, NULL, 'পঞ্চগড়', NULL, NULL, NULL, NULL, 1, 10, NULL, 10, '2025-10-31 22:46:12', '2025-10-31 22:43:41', '2025-10-31 22:46:12'),
	(7, 6, 8, NULL, 'গাইবান্ধা', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-31 22:52:14', '2025-10-31 22:52:14'),
	(8, 6, 44, NULL, 'রংপুর', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-31 23:59:02', '2025-10-31 23:59:02'),
	(9, 5, 3, NULL, 'বগুড়া', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-31 23:59:48', '2025-10-31 23:59:48'),
	(10, 5, 42, NULL, 'রাজশাহী', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 00:00:04', '2025-11-01 00:00:04'),
	(11, 5, 41, NULL, 'পাবনা', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 00:19:37', '2025-11-01 00:19:37'),
	(12, 5, 40, NULL, 'সিরাজগঞ্জ', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 00:20:38', '2025-11-01 00:20:38'),
	(13, 8, 39, NULL, 'সুনামগঞ্জ', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 00:21:55', '2025-11-01 00:21:55'),
	(14, 8, 38, NULL, 'মৌলভীবাজার', NULL, NULL, NULL, NULL, 1, 10, 10, NULL, NULL, '2025-11-01 00:24:39', '2025-11-01 00:25:02'),
	(15, 8, 37, NULL, 'হবিগঞ্জ', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 00:25:22', '2025-11-01 00:25:22'),
	(16, 8, 36, NULL, 'সিলেট', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 00:25:51', '2025-11-01 00:25:51'),
	(17, 7, 35, NULL, 'চাঁদপুর', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 00:26:10', '2025-11-01 00:26:10'),
	(18, 7, 34, NULL, 'ফেনী', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 00:26:45', '2025-11-01 00:26:45'),
	(19, 7, 32, NULL, 'কুমিল্লা', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 00:26:59', '2025-11-01 00:26:59'),
	(20, 7, 33, NULL, 'চট্টগ্রাম', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 00:27:40', '2025-11-01 00:27:40'),
	(21, 4, 31, NULL, 'ময়মনসিংহ', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 00:27:58', '2025-11-01 00:27:58'),
	(22, 4, 30, NULL, 'টাঙ্গাইল', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 00:28:16', '2025-11-01 00:28:16'),
	(23, 4, 29, NULL, 'নেত্রকোনা', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 00:28:31', '2025-11-01 00:28:31'),
	(24, 4, 28, NULL, 'জামালপুর', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 00:28:53', '2025-11-01 00:28:53'),
	(25, 3, 27, NULL, 'নোয়াপাড়া, খুলনা', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 00:32:05', '2025-11-01 00:32:05'),
	(26, 3, 26, NULL, 'যশোর', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 00:32:33', '2025-11-01 00:32:33'),
	(27, 2, 25, NULL, 'বরগুনা', NULL, NULL, NULL, NULL, 1, 10, NULL, 10, '2025-11-01 01:03:36', '2025-11-01 00:33:35', '2025-11-01 01:03:36'),
	(28, 2, 24, NULL, 'পিরোজপুর', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 00:34:00', '2025-11-01 00:34:00'),
	(29, 1, 22, NULL, 'নরসিংদী মাধবদী', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 00:34:26', '2025-11-01 00:34:26'),
	(30, 1, 21, NULL, 'মুন্সীগঞ্জ', NULL, NULL, NULL, NULL, 1, 10, 10, NULL, NULL, '2025-11-01 00:35:27', '2025-11-01 01:20:48'),
	(31, 1, 21, NULL, 'মুন্সীগঞ্জ, নারায়ণগঞ্জ', NULL, NULL, NULL, NULL, 1, 10, NULL, 10, '2025-11-01 00:36:07', '2025-11-01 00:35:27', '2025-11-01 00:36:07'),
	(32, 1, 20, NULL, 'সাভার', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 00:35:44', '2025-11-01 00:35:44'),
	(33, 5, 13, NULL, 'ঈশ্বরদী', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 00:36:53', '2025-11-01 00:36:53'),
	(34, 5, 13, NULL, 'ঈশ্বরদী', NULL, NULL, NULL, NULL, 1, 10, NULL, 10, '2025-11-01 00:37:54', '2025-11-01 00:36:53', '2025-11-01 00:37:54'),
	(35, 5, 12, NULL, 'চাঁপাইনবাবগঞ্জ', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 00:38:33', '2025-11-01 00:38:33'),
	(36, 1, 11, NULL, 'নরসিংদী', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 00:41:07', '2025-11-01 00:41:07'),
	(37, 6, 10, NULL, 'লালমনিরহাট', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 00:56:07', '2025-11-01 00:56:07'),
	(38, 6, 9, NULL, 'দিনাজপুর', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 00:56:51', '2025-11-01 00:56:51'),
	(39, 3, 7, NULL, 'কুষ্টিয়া', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 00:57:35', '2025-11-01 00:57:35'),
	(40, 4, 6, NULL, 'শেরপুর', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 00:58:05', '2025-11-01 00:58:05'),
	(41, 5, 5, NULL, 'নওগাঁ', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 00:58:47', '2025-11-01 00:58:47'),
	(42, 5, 5, NULL, 'নওগাঁ', NULL, NULL, NULL, NULL, 1, 10, NULL, 10, '2025-11-01 00:59:41', '2025-11-01 00:58:47', '2025-11-01 00:59:41'),
	(43, 1, 11, NULL, 'নরসিংদী', NULL, NULL, NULL, NULL, 1, 10, NULL, 10, '2025-11-01 01:48:34', '2025-11-01 01:01:40', '2025-11-01 01:48:34'),
	(44, 1, 1, NULL, 'নীলক্ষেত', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 01:02:07', '2025-11-01 01:02:07'),
	(45, 2, 4, NULL, 'পটুয়াখালী', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 01:03:03', '2025-11-01 01:03:03'),
	(46, 2, 25, NULL, 'বরগুনা', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 01:03:25', '2025-11-01 01:03:25'),
	(47, 1, 23, NULL, 'মাওনা', NULL, NULL, NULL, NULL, 1, 10, 10, NULL, NULL, '2025-11-01 01:04:16', '2025-11-01 01:18:42'),
	(48, 2, 2, NULL, 'ভোলা', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 01:04:56', '2025-11-01 01:04:56'),
	(49, 1, 47, NULL, 'মালিবাগ', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 01:08:56', '2025-11-01 01:08:56'),
	(50, 2, 48, NULL, 'ঝালকাঠি', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 01:17:20', '2025-11-01 01:17:20'),
	(51, 1, 49, NULL, 'নারায়ণগঞ্জ', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 01:20:33', '2025-11-01 01:20:33'),
	(52, 3, 46, NULL, 'খুলনা', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-02 02:42:42', '2025-11-02 02:42:42'),
	(53, 2, 50, NULL, 'বরিশাল', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-02 03:06:03', '2025-11-02 03:06:03'),
	(54, 1, 51, NULL, 'ঢাকা দক্ষিণ', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2026-01-24 05:22:03', '2026-01-24 05:22:03');

-- Dumping structure for table airas_mart.uoms
DROP TABLE IF EXISTS `uoms`;
CREATE TABLE IF NOT EXISTS `uoms` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uoms_slug_unique` (`slug`),
  KEY `uoms_created_by_foreign` (`created_by`),
  KEY `uoms_updated_by_foreign` (`updated_by`),
  KEY `uoms_deleted_by_foreign` (`deleted_by`),
  CONSTRAINT `uoms_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `uoms_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `uoms_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.uoms: ~0 rows (approximately)
DELETE FROM `uoms`;
INSERT INTO `uoms` (`id`, `name`, `slug`, `description`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 'UNIT', 'unit', 'UNit des', 1, NULL, NULL, NULL, NULL, '2026-01-20 04:07:27', '2026-01-20 04:07:27');

-- Dumping structure for table airas_mart.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `role_status` int DEFAULT '0',
  `otp` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otp_expire` datetime DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_user_name_unique` (`user_name`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_created_by_foreign` (`created_by`),
  KEY `users_updated_by_foreign` (`updated_by`),
  KEY `users_deleted_by_foreign` (`deleted_by`),
  CONSTRAINT `users_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `users_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `users_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.users: ~1 rows (approximately)
DELETE FROM `users`;
INSERT INTO `users` (`id`, `name`, `user_name`, `email`, `phone`, `address`, `image`, `cover_image`, `status`, `email_verified_at`, `role_status`, `otp`, `otp_expire`, `password`, `remember_token`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 'Admin', 'admin', 'waliullahbiplob786@gmail.com', '01921588567', NULL, NULL, NULL, 1, NULL, 1, NULL, NULL, '$2y$12$3M45NVtjwFwxODg9bXFZlu8p0dmke0.vES8J3HtSaqa6h/w4h573y', NULL, NULL, NULL, NULL, NULL, '2026-03-14 00:13:01', '2026-03-14 00:13:01'),
	(2, 'System Admin', 'systemadmin', 'systemadmin@example.com', '01700000000', NULL, NULL, NULL, 1, NULL, 1, NULL, NULL, '$2y$12$a5Mzvwwk2rEl7di3v99a7ucpKFDbXylG3HJvUNVcdjceEjjbOgHpW', NULL, NULL, NULL, NULL, NULL, '2026-03-14 00:13:01', '2026-03-14 00:13:01');

-- Dumping structure for table airas_mart.vendors
DROP TABLE IF EXISTS `vendors`;
CREATE TABLE IF NOT EXISTS `vendors` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_person` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vendors_slug_unique` (`slug`),
  UNIQUE KEY `vendors_code_unique` (`code`),
  KEY `vendors_created_by_foreign` (`created_by`),
  KEY `vendors_updated_by_foreign` (`updated_by`),
  KEY `vendors_deleted_by_foreign` (`deleted_by`),
  CONSTRAINT `vendors_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `vendors_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `vendors_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.vendors: ~3 rows (approximately)
DELETE FROM `vendors`;
INSERT INTO `vendors` (`id`, `name`, `slug`, `code`, `contact_person`, `email`, `phone`, `address`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 'RELYON', 'relyon', 'CODE123', 'Shamim', 'waliullahbiplob786@gmail.com', '01575020231', 'Aftabnagar', 1, NULL, NULL, NULL, NULL, '2026-01-20 04:13:33', '2026-03-06 21:53:33'),
	(2, 'Frozen Foodi', 'frozen-foodi', 'code122', 'Frozen Foodi', 'waliullahbiplob786@gmail.com', '01575020231', 'Frozen Foodi', 1, NULL, NULL, NULL, NULL, '2026-03-07 02:35:59', '2026-03-07 02:35:59'),
	(3, 'Airas Mart', 'airas-mart', 'codeairas11', 'Airas Mart', 'waliullahbiplob786@gmail.com', '01575020231', 'Airas Mart', 1, NULL, NULL, NULL, NULL, '2026-03-07 02:36:24', '2026-03-07 02:36:24');

-- Dumping structure for table airas_mart.wishlists
DROP TABLE IF EXISTS `wishlists`;
CREATE TABLE IF NOT EXISTS `wishlists` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wishlists_user_id_product_id_unique` (`user_id`,`product_id`),
  KEY `wishlists_product_id_foreign` (`product_id`),
  CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table airas_mart.wishlists: ~0 rows (approximately)
DELETE FROM `wishlists`;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
