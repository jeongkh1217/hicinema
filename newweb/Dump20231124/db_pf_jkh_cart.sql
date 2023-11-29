-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: db_pf_jkh
-- ------------------------------------------------------
-- Server version	5.7.43-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `itemid` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `purchased` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `purchaseid` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payby` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `paydate` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES ('jeongkhjeong','DR1',3,'Y','jeongkhjeong2023-11-16 09:59:57.122','card','2023-11-16 09:59:57'),('jeongkhjeong','CB2',3,'Y','jeongkhjeong2023-11-16 09:59:57.122','card','2023-11-16 09:59:57'),('portfolioid','CB3',5,'Y','Pportfolioid2023-11-20 09:41:42.826','card','2023-11-20 09:41:42'),('portfolioid','DR3',6,'Y','Pportfolioid2023-11-20 09:41:42.826','card','2023-11-20 09:41:42'),('forportfolioid','DR3',5,'Y','Pforportfolioid2023-11-20 10:20:54.487','card','2023-11-20 10:20:54'),('forportfolioid','DR4',5,'Y','Pforportfolioid2023-11-20 10:20:54.487','card','2023-11-20 10:20:54'),('chamusik','CB2',1,'Y','Pchamusik2023-11-20 15:39:01.602','account','2023-11-20 15:39:01'),('chamusik','DR1',7,'Y','Pchamusik2023-11-24 13:26:36.433','phone','2023-11-24 13:26:36'),('chamusik','DR3',4,'Y','Pchamusik2023-11-24 13:26:36.433','phone','2023-11-24 13:26:36');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-24 17:08:53
