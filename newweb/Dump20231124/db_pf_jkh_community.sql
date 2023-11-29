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
-- Table structure for table `community`
--

DROP TABLE IF EXISTS `community`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `community` (
  `postno` int(11) NOT NULL AUTO_INCREMENT,
  `tab` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `posttitle` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `post` text COLLATE utf8_unicode_ci NOT NULL,
  `id` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `file1` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file2` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file3` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file4` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file5` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `writtendate` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `viewed` int(11) NOT NULL DEFAULT '0',
  `recommend` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`postno`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `community`
--

LOCK TABLES `community` WRITE;
/*!40000 ALTER TABLE `community` DISABLE KEYS */;
INSERT INTO `community` VALUES (1,'Free','자유게시판 첫번째 게시물!','발표용 게시물내용입니다1','chamusik',NULL,NULL,NULL,NULL,NULL,'2023-11-20',0,0),(2,'Review','발표용 게시물제목입니다2','발표용 게시물내용입니다2','chamusik',NULL,NULL,NULL,NULL,NULL,'2023-11-22',1,0),(3,'Free','발표용 게시물제목입니다3','발표용 게시물내용입니다3','chamusik','istockphoto-497056718-2048x2048.jpg',NULL,NULL,NULL,NULL,'2023-11-22',0,0),(4,'Review','발표용 게시물제목입니다4','발표용 게시물내용입니다4','chamusik','istockphoto-497056718-2048x2048.jpg',NULL,NULL,NULL,NULL,'2023-11-22',0,0),(5,'Free','발표용 게시물제목입니다5','발표용 게시물내용입니다5','chamusik','istockphoto-497056718-2048x2048.jpg',NULL,NULL,NULL,NULL,'2023-11-22',10,0),(6,'Free','발표용 게시물제목입니다6','발표용 게시물내용입니다6','chamusik',NULL,NULL,NULL,NULL,NULL,'2023-11-22',8,0),(9,'Review','발표용 게시물제목입니다7','발표용 게시물내용입니다7','chamusik',NULL,NULL,NULL,NULL,NULL,'2023-11-22',8,0),(10,'Free','발표용 게시물제목입니다8','발표용 게시물내용입니다8','chamusik',NULL,NULL,NULL,NULL,NULL,'2023-11-22',7,1),(11,'Free','발표용 게시물제목입니다9','발표용 게시물내용입니다9','chamusik',NULL,NULL,NULL,NULL,NULL,'2023-11-22',7,1),(12,'Free','발표용 게시물제목입니다10','발표용 게시물내용입니다10','chamusik','istockphoto-497056718-2048x2048.jpg',NULL,NULL,NULL,NULL,'2023-11-22',12,1),(13,'Free','발표용 게시물제목입니다11','발표용 게시물내용입니다11','chamusik','aaaaa.jpg','18.png','15.png','12.png',NULL,'2023-11-22',75,0),(14,'Free','검색용 게시물제목입니다12','검색용 게시물제목입니다12','moondongeun','aaaab.jpg',NULL,NULL,NULL,NULL,'2023-11-23',112,0);
/*!40000 ALTER TABLE `community` ENABLE KEYS */;
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
