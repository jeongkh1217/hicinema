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
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `reservationid` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `theater` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `date` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `time` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `seat` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `payby` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `paydate` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES ('jeongkhjeong2023-11-16 10:01:02.165','jeongkhjeong','압구정3관','2023-11-16','12:20','seat23','card','2023-11-16 10:01:02'),('jeongkhjeong2023-11-16 10:01:02.165','jeongkhjeong','압구정3관','2023-11-16','12:20','seat22','card','2023-11-16 10:01:02'),('jeongkhjeong2023-11-16 10:01:02.165','jeongkhjeong','압구정3관','2023-11-16','12:20','seat24','card','2023-11-16 10:01:02'),('jeongkhjeong2023-11-16 13:04:17.174','jeongkhjeong','고속터미널4관','2023-11-18','16:10','seat35','account','2023-11-16 01:04:17'),('jeongkhjeong2023-11-16 13:04:17.174','jeongkhjeong','고속터미널4관','2023-11-18','16:10','seat40','account','2023-11-16 01:04:17'),('jeongkhjeong2023-11-16 13:04:17.174','jeongkhjeong','고속터미널4관','2023-11-18','16:10','seat45','account','2023-11-16 01:04:17'),('Rportfolioid2023-11-20 09:43:41.85','portfolioid','청담5관','2023-11-20','17:30','seat34','phone','2023-11-20 09:43:41'),('Rportfolioid2023-11-20 09:43:41.85','portfolioid','청담5관','2023-11-20','17:30','seat35','phone','2023-11-20 09:43:41'),('Rportfolioid2023-11-20 09:43:41.85','portfolioid','청담5관','2023-11-20','17:30','seat33','phone','2023-11-20 09:43:41'),('Rportfolioid2023-11-20 09:43:41.85','portfolioid','청담5관','2023-11-20','17:30','seat32','phone','2023-11-20 09:43:41'),('Rchamusik2023-11-20 14:41:18.822','chamusik','강남3관','2023-11-22','16:50','seat10','card','2023-11-20 14:41:18'),('Rchamusik2023-11-20 15:11:23.8','chamusik','고속터미널4관','2023-11-23','12:10','seat56','card','2023-11-20 15:11:23'),('Rchamusik2023-11-20 15:18:33.327','chamusik','강남5관','2023-11-22','17:10','seat5','card','2023-11-20 15:18:33'),('Rchamusik2023-11-20 15:22:44.201','chamusik','신사5관','2023-11-24','12:50','seat4','card','2023-11-20 15:22:44'),('Rchamusik2023-11-20 15:23:30.204','chamusik','강남5관','2023-11-21','13:10','seat55','card','2023-11-20 15:23:30'),('Rchamusik2023-11-20 15:34:51.669','chamusik','강남1관','2023-11-22','12:30','seat52','card','2023-11-20 15:34:51'),('Rchamusik2023-11-20 15:38:39.621','chamusik','압구정1관','2023-11-25','12:00','seat3','account','2023-11-20 15:38:39'),('Rchamusik2023-11-20 15:38:39.621','chamusik','압구정1관','2023-11-25','12:00','seat4','account','2023-11-20 15:38:39'),('Rchamusik2023-11-20 15:38:39.621','chamusik','압구정1관','2023-11-25','12:00','seat5','account','2023-11-20 15:38:39'),('Rchamusik2023-11-20 15:38:39.621','chamusik','압구정1관','2023-11-25','12:00','seat10','account','2023-11-20 15:38:39'),('Rchamusik2023-11-24 14:13:58.081','chamusik','고속터미널1관','2023-11-24','17:40','seat14','account','2023-11-24 14:13:58'),('Rchamusik2023-11-24 14:13:58.081','chamusik','고속터미널1관','2023-11-24','17:40','seat15','account','2023-11-24 14:13:58'),('Rchamusik2023-11-24 14:13:58.081','chamusik','고속터미널1관','2023-11-24','17:40','seat13','account','2023-11-24 14:13:58'),('Rchamusik2023-11-24 14:13:58.081','chamusik','고속터미널1관','2023-11-24','17:40','seat12','account','2023-11-24 14:13:58');
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-24 17:08:52
