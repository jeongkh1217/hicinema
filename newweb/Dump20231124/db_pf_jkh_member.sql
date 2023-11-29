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
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `pw` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `birth` date NOT NULL,
  `cp` varchar(14) COLLATE utf8_unicode_ci NOT NULL,
  `sex` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `postcode` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `detailaddress` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `extraaddress` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `genre1` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `genre2` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `joindate` date NOT NULL,
  `point` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('ahnsanggu','dkstkdrn','안상구','2023-10-12','010-3333-3333','m','55555','서울 강남구 압구정로 321','ㄴ아ㅓㄹ',NULL,'naebu@na.b','범죄','스릴러','2023-10-12',0),('chamusik','ckantlrl','차무식','2023-10-06','010-1234-1234','m','04346','서울 용산구 이태원동 5-1','필리핀','','chamusik@aa.a','스릴러','코미디','2023-10-06',787),('dominjun','ehaoslwj','도민준','2023-10-24','010-1234-1234','m','06028','서울 강남구 압구정로10길 7','sadf',' (신사동)','aa@a.a','미스터리','멜로','2023-10-24',0),('forportfolioid','12341234','정건희','1992-12-17','010-3174-3284','m','06007','서울 강남구 압구정로 321','2동 303호',' (압구정동, 한양아파트)','jeongkh1217@naver.com','스릴러','코미디','2023-11-20',699),('jeongkh1217','wjdrjs12','정건희','1992-12-17','010-3174-3284','m','06007','서울 강남구 압구정로 321','2동',' (압구정동, 한양아파트)','jeongkh1217@naver.com','액션','스릴러','2023-09-18',0),('jeongkh921217','12341234','건희','2023-09-22','010-3174-3284','m','06007','서울 강남구 압구정로 321','22',' (압구정동, 한양아파트)','jeongkh1217@naver.com','범죄','코미디','2023-09-22',0),('jeongkhjeong','12341234','정건희','1992-12-17','010-3174-3284','m','06007','서울 강남구 압구정로 321','2동',' (압구정동, 한양아파트)','jeongkh1217@naver.com','스릴러','코미디','2023-11-16',588),('jieuntak','wldmsxkr','지은탁','2023-10-12','010-3333-3333','f','11111','서울 강남구 압구정로 321','ㅁㄴㅇㄹ',NULL,'ggabi@g.a','범죄','액션','2023-10-12',0),('jkh441217','12341234','건건','2023-10-05','010-3174-3284','m','06028','서울 강남구 압구정로 104','ㄴㅇㅁㄻㄴㅇ',' (신사동)','jeongkh1217@naver.com','SF','판타지','2023-10-05',0),('kimduhan','rlaengks','김두한','2023-10-12','010-3333-3333','m','55555','서울 종로구 2정목','안러ㅏㅏ',NULL,'duhan@d.h','액션','코미디','2023-10-12',0),('lebronjames','lebronjames','르브론','2023-11-14','010-2222-2222','m','52438','경남 남해군 이동면 용소리 1619','ㅁㄴㅇㄹ','','lebron@l.l','미스터리','코미디','2023-11-14',0),('maseokdo','akehdtjrl','마석도','2023-10-27','010-1234-1234','m','12180','경기 남양주시 화도읍 마석우리 265-10','마석','','aaaaa@a.a','범죄','SF','2023-10-27',0),('moondongeun','12341234','문동은','2023-10-10','010-1234-1234','m','06027','서울 강남구 신사동 527-4','234234','','jeongkh1217@naver.com','애니메이션','SF','2023-10-10',0),('null','null','null','1900-01-01','010-0000-0000','f','00000','0','0',NULL,'null@nu.ll','스릴러','범죄','2023-10-23',0),('ohdaesuu','dheotnek','오대수','2023-10-12','010-3333-3333','m','55555','서울 강남구 압구정로 321','아',NULL,'daesu@o.h','SF','판타지','2023-10-12',0),('parkyeonjin','qkrduswls','박연진','2023-10-12','010-3333-3333','f','55555','서울 강남구 압구정로 321','ㄴ아러',NULL,'glory@g.l','멜로','범죄','2023-10-12',0),('portfolioid','12341234','정건희','1992-12-17','010-3174-3284','m','06007','서울 강남구 압구정로 321','2동 303호',' (압구정동, 한양아파트)','jeongkh1217@naver.com','스릴러','멜로','2023-11-20',798),('portfolioid2','12341234','정건희','1992-12-17','010-3174-3284','m','06007','서울 강남구 압구정로 321','2동 303호',' (압구정동, 한양아파트)','jeongkh1217@naver.com','SF','코미디','2023-11-24',0),('portfolioid3','12341234','정건희','1992-12-17','010-3174-3284','m','06007','서울 강남구 압구정로 321','2동 306호',' (압구정동, 한양아파트)','jeongkh1217@naver.com','스릴러','애니메이션','2023-11-24',0),('pyeonggyeongjang','qwerqwer','평경장','2023-10-12','010-3838-3838','m','18614','경기 화성시 향남읍 상신리 610-75','ㅁㄴㅇㄹ','','tajja@t.j','액션','멜로','2023-10-12',0),('seongdukseon','tjdejrtjs','성덕선','2023-10-12','010-3333-3333','f','55555','서울 도봉구 쌍문로','아러ㅏ',NULL,'1988@1.9','애니메이션','코미디','2023-10-12',0),('stephcurry','stephcurry','커리','2023-11-14','010-3333-3333','m','52438','경남 남해군 이동면 용소리 1605','ㅁㄴㅇㄹ','','curry@cc.c','미스터리','공포','2023-11-14',0),('yeodakyung','duekruddl','여다경','2023-10-12','010-3333-3333','f','55555','서울 강남구 압구정로 321','ㅇㄹㄴ',NULL,'bubu@b.u','멜로','스릴러','2023-10-12',0);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
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
