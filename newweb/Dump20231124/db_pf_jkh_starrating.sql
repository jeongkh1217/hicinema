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
-- Table structure for table `starrating`
--

DROP TABLE IF EXISTS `starrating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `starrating` (
  `movieid` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `sncno` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `starrating` int(11) NOT NULL,
  `comment` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `writtendatetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `commentlike` int(11) DEFAULT '0',
  `page` int(11) DEFAULT NULL,
  `maxpage` int(11) DEFAULT NULL,
  `startpage` int(11) DEFAULT NULL,
  `endpage` int(11) DEFAULT NULL,
  `listcount` int(11) DEFAULT NULL,
  PRIMARY KEY (`sncno`),
  KEY `id` (`id`),
  KEY `movieid` (`movieid`),
  CONSTRAINT `starrating_ibfk_1` FOREIGN KEY (`movieid`) REFERENCES `movie` (`movieid`),
  CONSTRAINT `starrating_ibfk_2` FOREIGN KEY (`id`) REFERENCES `member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=307 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `starrating`
--

LOCK TABLES `starrating` WRITE;
/*!40000 ALTER TABLE `starrating` DISABLE KEYS */;
INSERT INTO `starrating` VALUES ('aaaae',21,'jeongkh1217',3,'발표용 한줄평입니다.','2023-09-30 23:43:20',0,NULL,NULL,NULL,NULL,NULL),('aaaaf',22,'jeongkh1217',4,'발표용 한줄평입니다.','2023-09-30 23:43:30',1,NULL,NULL,NULL,NULL,NULL),('aaaag',23,'jeongkh1217',1,'발표용 한줄평입니다.','2023-09-30 23:45:13',2,NULL,NULL,NULL,NULL,NULL),('aaaah',25,'jeongkh1217',2,'발표용 한줄평입니다.','2023-10-01 00:01:23',0,NULL,NULL,NULL,NULL,NULL),('aaaai',26,'jeongkh1217',3,'발표용 한줄평입니다.','2023-10-01 00:01:54',1,NULL,NULL,NULL,NULL,NULL),('aaaaj',27,'jeongkh1217',4,'발표용 한줄평입니다.','2023-10-01 00:01:54',0,NULL,NULL,NULL,NULL,NULL),('aaaak',28,'jeongkh1217',5,'발표용 한줄평입니다.','2023-10-01 00:01:54',1,NULL,NULL,NULL,NULL,NULL),('aaaal',29,'jeongkh1217',1,'발표용 한줄평입니다.','2023-10-01 00:03:39',0,NULL,NULL,NULL,NULL,NULL),('aaaam',30,'jeongkh1217',4,'발표용 한줄평입니다.','2023-10-01 00:03:39',0,NULL,NULL,NULL,NULL,NULL),('aaaan',31,'jeongkh1217',3,'발표용 한줄평입니다.','2023-10-01 00:03:39',1,NULL,NULL,NULL,NULL,NULL),('aaaao',32,'jeongkh1217',2,'발표용 한줄평입니다.','2023-10-01 00:03:53',1,NULL,NULL,NULL,NULL,NULL),('aaaap',33,'jeongkh1217',5,'발표용 한줄평입니다.','2023-10-01 00:05:28',0,NULL,NULL,NULL,NULL,NULL),('aaaaq',34,'jeongkh1217',4,'발표용 한줄평입니다.','2023-10-01 00:05:28',0,NULL,NULL,NULL,NULL,NULL),('aaaar',35,'jeongkh1217',3,'발표용 한줄평입니다.','2023-10-01 00:05:28',1,NULL,NULL,NULL,NULL,NULL),('aaaas',36,'jeongkh1217',5,'발표용 한줄평입니다.','2023-10-01 00:05:28',1,NULL,NULL,NULL,NULL,NULL),('aaaat',37,'jeongkh1217',2,'발표용 한줄평입니다.','2023-10-01 00:05:28',0,NULL,NULL,NULL,NULL,NULL),('aaaab',88,'jkh441217',2,'발표용 한줄평입니다.','2023-10-05 11:50:26',3,NULL,NULL,NULL,NULL,NULL),('aaaad',89,'jkh441217',5,'발표용 한줄평입니다.','2023-10-05 12:48:33',2,NULL,NULL,NULL,NULL,NULL),('aaaal',172,'chamusik',3,'발표용 한줄평입니다.','2023-10-06 16:19:56',0,NULL,NULL,NULL,NULL,NULL),('aaaah',173,'chamusik',4,'발표용 한줄평입니다.','2023-10-06 16:20:18',0,NULL,NULL,NULL,NULL,NULL),('aaaab',174,'jeongkh1217',4,'발표용 한줄평입니다.','2023-10-10 14:39:04',2,NULL,NULL,NULL,NULL,NULL),('aaaaa',229,'jeongkh1217',5,'발표용 한줄평입니다.','2023-10-11 17:19:10',3,NULL,NULL,NULL,NULL,NULL),('aaaaa',230,'pyeonggyeongjang',2,'발표용 한줄평입니다.','2023-10-12 14:43:14',4,NULL,NULL,NULL,NULL,NULL),('aaaab',231,'pyeonggyeongjang',3,'발표용 한줄평입니다.','2023-10-12 14:43:23',2,NULL,NULL,NULL,NULL,NULL),('aaaac',232,'pyeonggyeongjang',4,'발표용 한줄평입니다.','2023-10-12 14:45:21',2,NULL,NULL,NULL,NULL,NULL),('aaaak',233,'chamusik',4,'발표용 한줄평입니다.','2023-10-23 16:53:30',0,NULL,NULL,NULL,NULL,NULL),('aaaac',234,'jeongkh1217',4,'발표용 한줄평입니다.','2023-10-25 15:27:11',1,NULL,NULL,NULL,NULL,NULL),('aaaag',237,'chamusik',5,'발표용 한줄평입니다.','2023-10-26 18:20:24',0,NULL,NULL,NULL,NULL,NULL),('aaaar',256,'chamusik',5,'발표용 한줄평입니다.','2023-10-27 00:00:00',0,NULL,NULL,NULL,NULL,NULL),('aaaaa',274,'dominjun',5,'발표용 한줄평입니다.','2023-10-27 00:00:00',0,NULL,NULL,NULL,NULL,NULL),('aaaaa',275,'moondongeun',4,'발표용 한줄평입니다.','2023-10-12 14:43:14',2,NULL,NULL,NULL,NULL,NULL),('aaaaa',276,'yeodakyung',5,'발표용 한줄평입니다.','2023-10-12 14:43:14',0,NULL,NULL,NULL,NULL,NULL),('aaaaa',277,'seongdukseon',3,'발표용 한줄평입니다.','2023-10-12 14:43:14',0,NULL,NULL,NULL,NULL,NULL),('aaaaa',278,'maseokdo',2,'발표용 한줄평입니다.','2023-10-12 14:43:14',0,NULL,NULL,NULL,NULL,NULL),('aaaaa',279,'jieuntak',1,'발표용 한줄평입니다.','2023-10-12 14:43:14',0,NULL,NULL,NULL,NULL,NULL),('aaaaa',288,'kimduhan',4,'발표용 한줄평입니다.','2023-10-12 14:43:14',0,NULL,NULL,NULL,NULL,NULL),('aaaaa',289,'ahnsanggu',3,'발표용 한줄평입니다.','2023-10-12 14:43:14',0,NULL,NULL,NULL,NULL,NULL),('aaaaa',290,'ohdaesuu',5,'발표용 한줄평입니다.','2023-10-12 14:43:14',0,NULL,NULL,NULL,NULL,NULL),('aaaaa',291,'parkyeonjin',2,'발표용 한줄평입니다.','2023-10-12 14:43:14',0,NULL,NULL,NULL,NULL,NULL),('aaaac',292,'chamusik',4,'발표용 한줄평입니다.','2023-11-14 00:00:00',0,NULL,NULL,NULL,NULL,NULL),('aaaaf',294,'chamusik',4,'발표용 한줄평입니다.','2023-11-14 00:00:00',0,NULL,NULL,NULL,NULL,NULL),('aaaad',295,'jeongkhjeong',3,'발표용 한줄평입니다.','2023-11-16 00:00:00',0,NULL,NULL,NULL,NULL,NULL),('aaaai',296,'chamusik',5,'발표용 한줄평입니다.','2023-11-16 00:00:00',0,NULL,NULL,NULL,NULL,NULL),('aaaao',297,'chamusik',5,'발표용 한줄평입니다.','2023-11-16 00:00:00',0,NULL,NULL,NULL,NULL,NULL),('aaaap',298,'chamusik',2,'발표용 한줄평입니다.','2023-11-16 00:00:00',0,NULL,NULL,NULL,NULL,NULL),('aaaat',299,'chamusik',3,'발표용 한줄평입니다.','2023-11-16 00:00:00',0,NULL,NULL,NULL,NULL,NULL),('aaaaa',301,'portfolioid',2,'발표용 한줄평입니다.','2023-11-20 00:00:00',0,NULL,NULL,NULL,NULL,NULL),('aaaaa',303,'forportfolioid',5,'발표용 한줄평입니다.','2023-11-20 00:00:00',0,NULL,NULL,NULL,NULL,NULL),('aaaaf',304,'forportfolioid',5,'발표용 한줄평입니다.','2023-11-20 00:00:00',0,NULL,NULL,NULL,NULL,NULL),('aaaaa',306,'chamusik',5,'발표용 한줄평입니다.','2023-11-24 00:00:00',0,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `starrating` ENABLE KEYS */;
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
