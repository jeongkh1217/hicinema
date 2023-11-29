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
-- Table structure for table `theater`
--

DROP TABLE IF EXISTS `theater`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `theater` (
  `theaterid` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `movieid` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `theatername` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `movietime1` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `movietime2` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `movietime3` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `movietime4` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `totalseat` int(11) NOT NULL DEFAULT '100',
  PRIMARY KEY (`theaterid`),
  KEY `movieid` (`movieid`),
  CONSTRAINT `theater_ibfk_1` FOREIGN KEY (`movieid`) REFERENCES `movie` (`movieid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theater`
--

LOCK TABLES `theater` WRITE;
/*!40000 ALTER TABLE `theater` DISABLE KEYS */;
INSERT INTO `theater` VALUES ('AJ1','aaaab','압구정1관','08:00','12:00','16:00','20:00',100),('AJ2','aaaac','압구정2관','08:10','12:10','16:10','20:10',100),('AJ3','aaaad','압구정3관','08:20','12:20','16:20','20:20',100),('AJ4','aaaaj','압구정4관','08:30','12:30','16:30','20:30',100),('AJ5','aaaak','압구정5관','08:40','12:40','16:40','20:40',100),('CD1','aaaaj','청담1관','08:50','12:50','16:50','20:50',100),('CD2','aaaak','청담2관','09:00','13:00','17:00','21:00',100),('CD3','aaaal','청담3관','09:10','13:10','17:10','21:10',100),('CD4','aaaam','청담4관','09:20','13:20','17:20','21:20',100),('CD5','aaaaa','청담5관','09:30','13:30','17:30','21:30',100),('ET1','aaaaa','고속터미널1관','09:40','13:40','17:40','21:40',100),('ET2','aaaag','고속터미널2관','09:50','13:50','17:50','21:50',100),('ET3','aaaac','고속터미널3관','08:00','12:00','16:00','20:00',100),('ET4','aaaad','고속터미널4관','08:10','12:10','16:10','20:10',100),('ET5','aaaai','고속터미널5관','08:20','12:20','16:20','20:20',100),('GN1','aaaaa','강남1관','08:30','12:30','16:30','20:30',100),('GN2','aaaah','강남2관','08:40','12:40','16:40','20:40',100),('GN3','aaaac','강남3관','08:50','12:50','16:50','20:50',100),('GN4','aaaag','강남4관','09:00','13:00','17:00','21:00',100),('GN5','aaaae','강남5관','09:10','13:10','17:10','21:10',100),('NH1','aaaaj','논현1관','09:20','13:20','17:20','21:20',100),('NH2','aaaar','논현2관','09:30','13:30','17:30','21:30',100),('NH3','aaaat','논현3관','09:40','13:40','17:40','21:40',100),('NH4','aaaaq','논현4관','09:50','13:50','17:50','21:50',100),('NH5','aaaap','논현5관','08:00','12:00','16:00','20:00',100),('SS1','aaaal','신사1관','08:10','12:10','16:10','20:10',100),('SS2','aaaam','신사2관','08:20','12:20','16:20','20:20',100),('SS3','aaaan','신사3관','08:30','12:30','16:30','20:30',100),('SS4','aaaaf','신사4관','08:40','12:40','16:40','20:40',100),('SS5','aaaab','신사5관','08:50','12:50','16:50','20:50',100),('YS1','aaaac','역삼1관','09:00','13:00','17:00','21:00',100),('YS2','aaaam','역삼2관','09:10','13:10','17:10','21:10',100),('YS3','aaaao','역삼3관','09:20','13:20','17:20','21:20',100),('YS4','aaaad','역삼4관','09:30','13:30','17:30','21:30',100),('YS5','aaaaa','역삼5관','09:40','13:40','17:40','21:40',100);
/*!40000 ALTER TABLE `theater` ENABLE KEYS */;
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
