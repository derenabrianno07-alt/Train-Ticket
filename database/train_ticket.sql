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


-- Dumping database structure for train_ticket
CREATE DATABASE IF NOT EXISTS `train_ticket` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `train_ticket`;

-- Dumping structure for table train_ticket.admin
CREATE TABLE IF NOT EXISTS `admin` (
  `id` varchar(10) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `PASSWORD` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table train_ticket.admin: ~2 rows (approximately)
INSERT INTO `admin` (`id`, `NAME`, `PASSWORD`) VALUES
	('A001', 'Yanti', 'admin123'),
	('A002', 'Burhan', 'burhan123');

-- Dumping structure for table train_ticket.booking
CREATE TABLE IF NOT EXISTS `booking` (
  `booking_code` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `booking_date` date NOT NULL,
  `status` varchar(20) NOT NULL,
  `additional_cost` int NOT NULL,
  `total_cost` int NOT NULL,
  `id_schedule` int NOT NULL,
  `id_admin` varchar(10) NOT NULL,
  PRIMARY KEY (`booking_code`),
  UNIQUE KEY `uq_booking_code` (`booking_code`),
  KEY `id_schedule` (`id_schedule`),
  KEY `id_admin` (`id_admin`),
  CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`id_schedule`) REFERENCES `schedule` (`id_schedule`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table train_ticket.booking: ~8 rows (approximately)
INSERT INTO `booking` (`booking_code`, `name`, `booking_date`, `status`, `additional_cost`, `total_cost`, `id_schedule`, `id_admin`) VALUES
	('BK-40BE1D', 'deren ', '2026-04-03', 'CONFIRMED', 4000, 12000, 8, 'A001'),
	('BK-4AD218', 'dibb2', '2026-04-03', 'CONFIRMED', 4000, 24000, 43, 'A001'),
	('BK-695E44', 'narson', '2025-12-22', 'CONFIRMED', 4000, 12000, 31, 'A002'),
	('BK-6BADF0', 'ibra', '2025-12-22', 'CONFIRMED', 2000, 8000, 1, 'A001'),
	('BK-6BB72F', 'deren ', '2026-03-21', 'CONFIRMED', 7000, 20000, 21, 'A002'),
	('BK-8CD033', 'dibbb', '2026-04-03', 'CONFIRMED', 4000, 12000, 8, 'A001'),
	('BK-C4B6D9', 'deren ', '2026-06-27', 'CONFIRMED', 2000, 15000, 10, 'A001'),
	('BK-F23FD9', 'narsonw', '2025-12-22', 'CONFIRMED', 2000, 20000, 6, 'A001');

-- Dumping structure for table train_ticket.schedule
CREATE TABLE IF NOT EXISTS `schedule` (
  `id_schedule` int NOT NULL AUTO_INCREMENT,
  `train_number` varchar(10) NOT NULL,
  `machinist` varchar(50) NOT NULL,
  `origin` enum('Tangerang') NOT NULL,
  `destination` varchar(50) NOT NULL,
  `departure_time` varchar(10) NOT NULL,
  `carriages` int NOT NULL,
  `class` enum('Economy','Business','Executive') NOT NULL,
  `price` int NOT NULL,
  `id_admin` varchar(10) NOT NULL,
  PRIMARY KEY (`id_schedule`),
  UNIQUE KEY `unique_schedule` (`train_number`,`departure_time`),
  UNIQUE KEY `unique_machinist_time` (`machinist`,`departure_time`),
  KEY `id_admin` (`id_admin`),
  CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table train_ticket.schedule: ~50 rows (approximately)
INSERT INTO `schedule` (`id_schedule`, `train_number`, `machinist`, `origin`, `destination`, `departure_time`, `carriages`, `class`, `price`, `id_admin`) VALUES
	(1, 'TRN-801', 'Ari', 'Tangerang', 'Jakarta', '06:00', 11, 'Economy', 6000, 'A001'),
	(2, 'TRN-802', 'Budi', 'Tangerang', 'Jakarta', '06:00', 13, 'Economy', 6000, 'A001'),
	(3, 'TRN-803', 'Cici', 'Tangerang', 'Jakarta', '06:00', 15, 'Economy', 6000, 'A001'),
	(4, 'TRN-804', 'Dedi', 'Tangerang', 'Bogor', '07:00', 12, 'Business', 15000, 'A001'),
	(5, 'TRN-805', 'Eko', 'Tangerang', 'Bogor', '07:00', 14, 'Business', 15000, 'A001'),
	(6, 'TRN-806', 'Fajar', 'Tangerang', 'Yogyakarta', '08:30', 13, 'Economy', 18000, 'A002'),
	(7, 'TRN-807', 'Gani', 'Tangerang', 'Yogyakarta', '08:30', 15, 'Business', 20000, 'A002'),
	(8, 'TRN-808', 'Hana', 'Tangerang', 'Jakarta', '10:00', 12, 'Business', 8000, 'A002'),
	(9, 'TRN-809', 'Irfan', 'Tangerang', 'Jakarta', '10:00', 14, 'Business', 8000, 'A002'),
	(10, 'TRN-810', 'Joko', 'Tangerang', 'Bogor', '11:30', 13, 'Economy', 13000, 'A002'),
	(11, 'TRN-811', 'Kiki', 'Tangerang', 'Bogor', '11:30', 11, 'Executive', 20000, 'A002'),
	(12, 'TRN-812', 'Luluk', 'Tangerang', 'Yogyakarta', '12:00', 11, 'Executive', 25000, 'A002'),
	(13, 'TRN-813', 'Maya', 'Tangerang', 'Yogyakarta', '12:00', 13, 'Executive', 25000, 'A002'),
	(14, 'TRN-814', 'Nana', 'Tangerang', 'Yogyakarta', '12:00', 15, 'Executive', 25000, 'A002'),
	(15, 'TRN-815', 'Oky', 'Tangerang', 'Jakarta', '13:30', 12, 'Economy', 6000, 'A002'),
	(16, 'TRN-816', 'Putra', 'Tangerang', 'Jakarta', '13:30', 14, 'Business', 8000, 'A002'),
	(17, 'TRN-817', 'Rani', 'Tangerang', 'Bogor', '14:15', 11, 'Economy', 13000, 'A002'),
	(18, 'TRN-818', 'Santi', 'Tangerang', 'Bogor', '14:15', 13, 'Business', 15000, 'A002'),
	(19, 'TRN-819', 'Tio', 'Tangerang', 'Yogyakarta', '15:00', 15, 'Economy', 18000, 'A002'),
	(20, 'TRN-820', 'Umar', 'Tangerang', 'Yogyakarta', '15:00', 12, 'Business', 20000, 'A002'),
	(21, 'TRN-821', 'Vina', 'Tangerang', 'Jakarta', '16:00', 11, 'Executive', 13000, 'A002'),
	(22, 'TRN-822', 'Wawan', 'Tangerang', 'Jakarta', '16:00', 15, 'Executive', 13000, 'A002'),
	(23, 'TRN-823', 'Xena', 'Tangerang', 'Bogor', '17:00', 14, 'Economy', 13000, 'A002'),
	(24, 'TRN-824', 'Yuda', 'Tangerang', 'Bogor', '17:00', 12, 'Business', 15000, 'A002'),
	(25, 'TRN-825', 'Zaki', 'Tangerang', 'Yogyakarta', '18:00', 11, 'Economy', 18000, 'A002'),
	(26, 'TRN-826', 'Amir', 'Tangerang', 'Yogyakarta', '18:00', 13, 'Executive', 25000, 'A002'),
	(27, 'TRN-827', 'Bunga', 'Tangerang', 'Jakarta', '19:00', 15, 'Economy', 6000, 'A002'),
	(28, 'TRN-828', 'Citra', 'Tangerang', 'Jakarta', '19:00', 12, 'Business', 8000, 'A002'),
	(29, 'TRN-829', 'Doni', 'Tangerang', 'Bogor', '19:30', 14, 'Executive', 20000, 'A002'),
	(30, 'TRN-830', 'Elsa', 'Tangerang', 'Bogor', '19:30', 11, 'Business', 15000, 'A002'),
	(31, 'TRN-831', 'Fani', 'Tangerang', 'Jakarta', '20:00', 11, 'Business', 8000, 'A002'),
	(32, 'TRN-832', 'Gilang', 'Tangerang', 'Jakarta', '20:00', 13, 'Business', 8000, 'A002'),
	(33, 'TRN-833', 'Hesti', 'Tangerang', 'Jakarta', '20:00', 15, 'Business', 8000, 'A002'),
	(34, 'TRN-834', 'Indra', 'Tangerang', 'Bogor', '21:00', 12, 'Economy', 13000, 'A002'),
	(35, 'TRN-835', 'Juna', 'Tangerang', 'Bogor', '21:00', 14, 'Business', 15000, 'A001'),
	(36, 'TRN-836', 'Karin', 'Tangerang', 'Yogyakarta', '21:30', 11, 'Executive', 25000, 'A001'),
	(37, 'TRN-837', 'Liem', 'Tangerang', 'Yogyakarta', '21:30', 13, 'Business', 20000, 'A001'),
	(38, 'TRN-838', 'Maman', 'Tangerang', 'Jakarta', '22:00', 15, 'Economy', 6000, 'A001'),
	(39, 'TRN-839', 'Nita', 'Tangerang', 'Jakarta', '22:00', 12, 'Business', 8000, 'A001'),
	(40, 'TRN-840', 'Owan', 'Tangerang', 'Bogor', '22:30', 14, 'Executive', 20000, 'A001'),
	(41, 'TRN-841', 'Puji', 'Tangerang', 'Bogor', '22:30', 11, 'Economy', 13000, 'A001'),
	(42, 'TRN-842', 'Qori', 'Tangerang', 'Yogyakarta', '23:00', 15, 'Economy', 18000, 'A001'),
	(43, 'TRN-843', 'Raka', 'Tangerang', 'Yogyakarta', '23:00', 13, 'Business', 20000, 'A001'),
	(44, 'TRN-844', 'Susi', 'Tangerang', 'Jakarta', '23:15', 12, 'Executive', 13000, 'A001'),
	(45, 'TRN-845', 'Tono', 'Tangerang', 'Jakarta', '23:15', 14, 'Business', 8000, 'A001'),
	(46, 'TRN-846', 'Uli', 'Tangerang', 'Bogor', '23:30', 11, 'Economy', 13000, 'A001'),
	(47, 'TRN-847', 'Vino', 'Tangerang', 'Bogor', '23:30', 15, 'Business', 15000, 'A001'),
	(48, 'TRN-848', 'Wina', 'Tangerang', 'Yogyakarta', '23:45', 13, 'Executive', 25000, 'A001'),
	(49, 'TRN-849', 'Yadi', 'Tangerang', 'Yogyakarta', '23:45', 12, 'Economy', 18000, 'A001'),
	(50, 'TRN-850', 'Zaza', 'Tangerang', 'Jakarta', '23:55', 14, 'Economy', 6000, 'A001'),
	(51, 'dsfds', 'dsfsfs', 'Tangerang', 'Jakarta', '08:00', 11, 'Economy', 6000, 'A001'),
	(53, 'TEST-123', 'yanto', 'Tangerang', 'Bogor', '23:00', 11, 'Economy', 13000, 'A001'),
	(54, '12', 'yanto', 'Tangerang', 'Jakarta', '12.00', 12, 'Economy', 6000, 'A001');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
