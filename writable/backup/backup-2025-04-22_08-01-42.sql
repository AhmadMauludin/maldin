-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: maldin
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `attachment`
--

DROP TABLE IF EXISTS `attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attachment` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `idtugas` int(10) NOT NULL,
  `tipe` enum('teks','file','foto','link','maps','telp') NOT NULL,
  `file` text NOT NULL,
  `desk` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachment`
--

LOCK TABLES `attachment` WRITE;
/*!40000 ALTER TABLE `attachment` DISABLE KEYS */;
INSERT INTO `attachment` VALUES (10,7,'maps','avatar.png','-6.808240777100545, 107.88935713459824'),(13,7,'link','avatar.png','https://instagram.com/mmmaldin17'),(15,14,'foto','1744828255_1b4830635be4c61f8eed.jpeg',''),(16,16,'link','avatar.png','https://instagram.com/mmmaldin17'),(17,16,'maps','avatar.png','-6.808240777100545, 107.88935713459824'),(18,16,'foto','1744902396_1d07d5f3e68b164c9543.jpg',''),(19,15,'file','1744905575_250307e1c2f523eb580f.csv',''),(20,19,'link','avatar.png','buku panduan'),(21,18,'maps','avatar.png','-6.808240777100545, 107.88935713459824'),(22,20,'teks','avatar.png','hfhgfhgf');
/*!40000 ALTER TABLE `attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friendships`
--

DROP TABLE IF EXISTS `friendships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friendships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `friend_id` int(11) NOT NULL,
  `status` enum('pending','accepted','declined') DEFAULT 'pending',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friendships`
--

LOCK TABLES `friendships` WRITE;
/*!40000 ALTER TABLE `friendships` DISABLE KEYS */;
INSERT INTO `friendships` VALUES (19,8,3,'accepted');
/*!40000 ALTER TABLE `friendships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupname` varchar(100) NOT NULL,
  `createdby` int(11) DEFAULT NULL,
  `groupowner` int(11) DEFAULT NULL,
  `createddate` datetime DEFAULT current_timestamp(),
  `photo` varchar(255) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `createdby` (`createdby`),
  KEY `groupowner` (`groupowner`),
  CONSTRAINT `groups_ibfk_1` FOREIGN KEY (`createdby`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  CONSTRAINT `groups_ibfk_2` FOREIGN KEY (`groupowner`) REFERENCES `user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (8,'EVOS',8,8,'2025-04-16 09:32:55','1744795975_e577570f429cf8844396.png','SNgSJrOu','Roarrrr'),(10,'Grupku',3,3,'2025-04-18 06:20:51','1744957251_5c44a6d532b888688f18.jpg','bQGDEfsx','grup aku weh ini mah'),(12,'grupnisa',NULL,NULL,'2025-04-20 00:32:27',NULL,'oZtRTUPW','');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `idgroups` int(10) NOT NULL,
  `iduser` int(10) NOT NULL,
  `memberlevel` enum('admin','member','','') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_member_group` (`idgroups`),
  CONSTRAINT `fk_member_group` FOREIGN KEY (`idgroups`) REFERENCES `groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (9,8,8,'admin'),(12,8,9,'member'),(14,10,3,'admin'),(15,10,8,'member'),(18,12,11,'admin'),(19,12,3,'member');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shared`
--

DROP TABLE IF EXISTS `shared`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shared` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idtugas` int(11) NOT NULL,
  `sharedtype` enum('user','groups','private','') NOT NULL,
  `sharedto` int(11) NOT NULL,
  `sharedby` int(11) NOT NULL,
  `accepted` enum('shared','todo','ongoing','done','canceled') DEFAULT NULL,
  `shareddate` datetime DEFAULT NULL,
  `acceptdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idtugas` (`idtugas`),
  KEY `sharedto` (`sharedto`),
  KEY `sharedby` (`sharedby`),
  CONSTRAINT `shared_ibfk_1` FOREIGN KEY (`idtugas`) REFERENCES `tugas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `shared_ibfk_2` FOREIGN KEY (`sharedto`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `shared_ibfk_3` FOREIGN KEY (`sharedby`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shared`
--

LOCK TABLES `shared` WRITE;
/*!40000 ALTER TABLE `shared` DISABLE KEYS */;
INSERT INTO `shared` VALUES (65,21,'user',8,8,'todo','2025-04-20 14:46:03','2025-04-20 14:46:03'),(66,22,'user',3,3,'todo','2025-04-22 07:58:02','2025-04-22 07:58:02');
/*!40000 ALTER TABLE `shared` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tugas`
--

DROP TABLE IF EXISTS `tugas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tugas` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `iduser` int(10) NOT NULL,
  `tugas` text NOT NULL,
  `tanggal` date NOT NULL,
  `waktu` time NOT NULL,
  `status` enum('To do','Berjalan','Selesai','Batal') NOT NULL,
  `foto` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tugas`
--

LOCK TABLES `tugas` WRITE;
/*!40000 ALTER TABLE `tugas` DISABLE KEYS */;
INSERT INTO `tugas` VALUES (21,8,'Memandikan kucing','2025-04-21','21:45:00','Selesai','1745160363_43c8f4b1eb4a9b42cc85.jpg'),(22,3,'naon we','2025-04-22','14:57:00','To do','1745308682_df07764a2985f9dc69b5.png');
/*!40000 ALTER TABLE `tugas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `bagian` enum('pengadaan','penjualan','admin','user') NOT NULL,
  `password` varchar(255) NOT NULL,
  `foto` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2,'maldin','admin','$2y$10$FMQRdH0ecCbZZVWtN2n7/u1YZN/gr7X98Er4NG4sqDAWCXlZwmB6S','1745067743_63c2575deb6dcf5dcee6.png'),(3,'ahmad','user','$2y$10$XE9I2e3Pc16xlEXfAPdHaeEU8cTF8WJZWVd6tswChC8s9YNmu5EJS','1745059854_3644a820349127244d00.png'),(8,'saheela','user','$2y$10$Tb1uxDNRI7FUb.m/1TT0VOEpHa4biaxG6kDvnnkNkefFjbNt.rH8e','1745059732_0cd0ffd20b89e45cf4d5.png');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-22 15:01:43
