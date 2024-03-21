-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for resto
CREATE DATABASE IF NOT EXISTS `resto` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `resto`;

-- Dumping structure for table resto.meja
CREATE TABLE IF NOT EXISTS `meja` (
  `idMeja` int NOT NULL AUTO_INCREMENT,
  `kodeMeja` int NOT NULL,
  `keterangan` text NOT NULL,
  `statusMeja` tinyint(1) NOT NULL,
  PRIMARY KEY (`idMeja`),
  UNIQUE KEY `kodeMeja` (`kodeMeja`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table resto.menu
CREATE TABLE IF NOT EXISTS `menu` (
  `idMenu` int NOT NULL AUTO_INCREMENT,
  `namaMenu` varchar(255) NOT NULL,
  `harga` int NOT NULL,
  PRIMARY KEY (`idMenu`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table resto.pelanggan
CREATE TABLE IF NOT EXISTS `pelanggan` (
  `idPelanggan` int NOT NULL,
  `namaPelanggan` varchar(255) NOT NULL,
  `jenisKelamin` tinyint(1) NOT NULL,
  `noHp` varchar(50) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  PRIMARY KEY (`idPelanggan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table resto.pesanan
CREATE TABLE IF NOT EXISTS `pesanan` (
  `idPesanan` int NOT NULL AUTO_INCREMENT,
  `idMenu` int NOT NULL,
  `idPelanggan` int NOT NULL,
  `jumlah` int NOT NULL,
  `idUser` int NOT NULL,
  `idMeja` int NOT NULL,
  PRIMARY KEY (`idPesanan`),
  KEY `idPelanggan` (`idPelanggan`),
  KEY `idUser` (`idUser`),
  KEY `idMenu` (`idMenu`),
  KEY `idMeja` (`idMeja`),
  CONSTRAINT `pesanan_ibfk_2` FOREIGN KEY (`idPelanggan`) REFERENCES `pelanggan` (`idPelanggan`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pesanan_ibfk_3` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pesanan_ibfk_4` FOREIGN KEY (`idMenu`) REFERENCES `menu` (`idMenu`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pesanan_ibfk_5` FOREIGN KEY (`idMeja`) REFERENCES `meja` (`idMeja`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table resto.transaksi
CREATE TABLE IF NOT EXISTS `transaksi` (
  `idTransaksi` int NOT NULL AUTO_INCREMENT,
  `idPesanan` int NOT NULL,
  `total` int NOT NULL,
  `bayar` int NOT NULL,
  PRIMARY KEY (`idTransaksi`),
  KEY `idPesanan` (`idPesanan`),
  CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`idPesanan`) REFERENCES `pesanan` (`idPesanan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table resto.user
CREATE TABLE IF NOT EXISTS `user` (
  `idUser` int NOT NULL,
  `namaUser` varchar(255) NOT NULL,
  `password` varchar(50) NOT NULL,
  `level` varchar(50) NOT NULL,
  PRIMARY KEY (`idUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
