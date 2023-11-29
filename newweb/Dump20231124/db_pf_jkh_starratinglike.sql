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
-- Table structure for table `starratinglike`
--

DROP TABLE IF EXISTS `starratinglike`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `starratinglike` (
  `sncno` int(11) NOT NULL,
  `id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`sncno`,`id`),
  KEY `sncno_idx` (`sncno`),
  KEY `id` (`id`),
  CONSTRAINT `id` FOREIGN KEY (`id`) REFERENCES `member` (`id`),
  CONSTRAINT `sncno` FOREIGN KEY (`sncno`) REFERENCES `starrating` (`sncno`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `starratinglike`
--

LOCK TABLES `starratinglike` WRITE;
/*!40000 ALTER TABLE `starratinglike` DISABLE KEYS */;
INSERT INTO `starratinglike` VALUES (22,'chamusik'),(23,'jeongkh1217'),(23,'pyeonggyeongjang'),(26,'pyeonggyeongjang'),(28,'pyeonggyeongjang'),(31,'pyeonggyeongjang'),(32,'jeongkh1217'),(35,'pyeonggyeongjang'),(36,'pyeonggyeongjang'),(88,'chamusik'),(88,'jeongkh1217'),(88,'pyeonggyeongjang'),(89,'jeongkh1217'),(89,'pyeonggyeongjang'),(174,'jeongkh1217'),(174,'pyeonggyeongjang'),(229,'chamusik'),(229,'forportfolioid'),(229,'jeongkh1217'),(230,'chamusik'),(230,'forportfolioid'),(230,'portfolioid'),(230,'pyeonggyeongjang'),(231,'chamusik'),(231,'pyeonggyeongjang'),(232,'chamusik'),(232,'pyeonggyeongjang'),(234,'chamusik'),(275,'chamusik'),(275,'forportfolioid');
/*!40000 ALTER TABLE `starratinglike` ENABLE KEYS */;
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
