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
-- Table structure for table `communityreply`
--

DROP TABLE IF EXISTS `communityreply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `communityreply` (
  `replyno` int(11) NOT NULL AUTO_INCREMENT,
  `postno` int(11) NOT NULL,
  `replyid` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `replypost` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `replywrittendate` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`replyno`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communityreply`
--

LOCK TABLES `communityreply` WRITE;
/*!40000 ALTER TABLE `communityreply` DISABLE KEYS */;
INSERT INTO `communityreply` VALUES (2,13,'chamusik','발표용 댓글입니다1','2023-11-23'),(3,13,'chamusik','발표용 댓글입니다2','2023-11-23'),(4,13,'chamusik','발표용 댓글입니다3','2023-11-23'),(5,13,'chamusik','발표용 댓글입니다4','2023-11-23'),(6,13,'chamusik','발표용 댓글입니다5','2023-11-23'),(7,13,'chamusik','발표용 댓글입니다6','2023-11-23'),(8,13,'chamusik','발표용 댓글입니다7','2023-11-23'),(9,13,'chamusik','발표용 댓글입니다8','2023-11-23'),(10,13,'chamusik','발표용 댓글입니다9','2023-11-23'),(11,13,'chamusik','발표용 댓글입니다10','2023-11-23'),(12,13,'chamusik','발표용 댓글입니다11','2023-11-23'),(13,13,'chamusik','발표용 댓글입니다12','2023-11-23'),(14,13,'chamusik','발표용 댓글입니다13','2023-11-23'),(15,13,'chamusik','발표용 댓글입니다14','2023-11-23'),(16,13,'chamusik','발표용 댓글입니다15','2023-11-23'),(17,13,'chamusik','발표용 댓글입니다16','2023-11-24'),(18,13,'chamusik','발표용 댓글입니다17','2023-11-24'),(19,13,'chamusik','발표용 댓글입니다18','2023-11-24'),(20,13,'chamusik','발표용 댓글입니다19','2023-11-24'),(21,13,'chamusik','발표용 댓글입니다20','2023-11-24'),(22,13,'chamusik','발표용 댓글입니다21','2023-11-24'),(23,13,'chamusik','발표용 댓글입니다22','2023-11-24'),(24,13,'chamusik','발표용 댓글입니다23','2023-11-24'),(25,13,'chamusik','발표용 댓글입니다24','2023-11-24'),(26,13,'chamusik','발표용 댓글입니다25','2023-11-24'),(27,13,'chamusik','발표용 댓글입니다26','2023-11-24'),(28,13,'chamusik','발표용 댓글입니다27','2023-11-24'),(29,13,'chamusik','발표용 댓글입니다28','2023-11-24'),(30,13,'chamusik','발표용 댓글입니다29','2023-11-24'),(31,13,'chamusik','발표용 댓글입니다30','2023-11-24'),(32,13,'chamusik','발표용 댓글입니다31','2023-11-24'),(33,13,'chamusik','발표용 댓글입니다32','2023-11-24'),(34,13,'chamusik','발표용 댓글입니다33','2023-11-24'),(35,14,'chamusik','발표용 댓글입니다34','2023-11-24'),(36,10,'chamusik','발표용 댓글입니다35','2023-11-24'),(37,11,'chamusik','발표용 댓글입니다36','2023-11-24'),(38,11,'chamusik','발표용 댓글입니다37','2023-11-24'),(39,6,'chamusik','발표용 댓글입니다38','2023-11-24'),(40,6,'chamusik','발표용 댓글입니다39','2023-11-24'),(41,9,'chamusik','발표용 댓글입니다40','2023-11-24'),(42,9,'chamusik','발표용 댓글입니다41','2023-11-24'),(43,9,'chamusik','발표용 댓글입니다42','2023-11-24'),(44,9,'chamusik','발표용 댓글입니다43','2023-11-24'),(45,12,'chamusik','발표용 댓글입니다44','2023-11-24'),(46,12,'chamusik','발표용 댓글입니다45','2023-11-24'),(47,9,'chamusik','발표용 댓글입니다46','2023-11-24'),(48,13,'chamusik','발표용 댓글입니다47','2023-11-24');
/*!40000 ALTER TABLE `communityreply` ENABLE KEYS */;
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
