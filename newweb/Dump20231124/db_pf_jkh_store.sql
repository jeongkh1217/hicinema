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
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store` (
  `itemid` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `itemname` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `composition` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `origin` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `introduce` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `totalsales` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store`
--

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
INSERT INTO `store` VALUES ('CB1','A콤보',7500,'팝콘M+탄산음료M','옥수수:미국산','b','콤보',0),('CB2','B콤보',9500,'팝콘M(2)+탄산음료M(2)','옥수수:미국산','b','콤보',0),('CB3','C콤보',10000,'팝콘L+탄산음료L(2)','옥수수:미국산','b','콤보',0),('CB4','D콤보',15000,'팝콘L(2)+탄산음료L(2)','옥수수:미국산','b','콤보',0),('CB5','굿데이 콤보',18000,'일반 영화 관람권 1매 + A콤보','옥수수:미국산','a','콤보',0),('CB6','너랑나 콤보',34000,'일반 영화 관람권 2매+ B콤보','옥수수:미국산','a','콤보',0),('CB7','우리 콤보',60000,'일반 영화 관람권 4매+D콤보','옥수수:미국산','a','콤보',0),('DR1','탄산음료M',2500,'22oz','-','콜라,사이다,환타,제로 콜라,스프라이트 제로로 교환가능합니다','음료',0),('DR2','탄산음료L',3500,'40oz','-','콜라,사이다,환타,제로 콜라,스프라이트 제로로 교환가능합니다','음료',0),('DR3','아메리카노(HOT)',3500,'20oz','-','따뜻한 아메리카노, 여유를 갖고 영화관람하세요~','음료',0),('DR4','아메리카노(ICE)',4000,'20oz','-','현대인의 필수품 아아와 함께 영화관람 어떠세요?!','음료',0),('DR5','디카페인 콜드브루',4500,'20oz','-','a','음료',0),('DR6','핑크레몬에이드',5000,'20oz','-','a','음료',0),('DR7','에이드',5000,'20oz','-','a','음료',0),('SN1','팝콘M',6000,'팝콘50g','옥수수:미국산','치즈/어니언/카라멜/오리지널 원하는 맛으로 즐기세요~','스낵',0),('SN2','팝콘L',8000,'팝콘110g','옥수수:미국산','치즈/어니언/카라멜/오리지널 원하는 맛으로 더 많은 양을 즐기세요~','스낵',0),('SN3','칠리치즈나쵸',4900,'칠리치즈나쵸','나쵸:미국산','바삭바삭한 나쵸에 칠리치즈의 조합 , 여기가 멕시코인가요?','스낵',0),('SN4','땅콩버터오징어',4000,'오징어40g','오징어:국내산','영화보는 즐거움에 씹는 즐거움까지 더해보세요~','스낵',0),('SN5','플레인핫도그',4500,'핫도그170g','돼지고기:국내산','원하는 재료, 원하는 소스로 내가 생각하던 그맛!','스낵',0),('SN6','칠리치즈핫도그',5000,'핫도그170g','돼지고기:국내산','a','스낵',0),('SN7','맛밤',3500,'맛밤80g','국내산','a','스낵',0),('VO1','HiCinema 1만원권',9900,'HiCinema1만원','-','HiCinema 영화관람권으로 즐거운 영화관람하세요!','상품권',0),('VO2','HiCinema 5만원권',49000,'HiCinema5만원','-','HiCinema 영화관람권으로 즐거운 영화관람하세요!','상품권',0),('VO3','HiCinema 10만원권',97000,'HiCinema10만원','-','HiCinema 영화관람권으로 즐거운 영화관람하세요!','상품권',0),('VO4','HiCinema 50만원권',480000,'HiCinema50만원','-','HiCinema 영화관람권으로 즐거운 영화관람하세요!','상품권',0),('VO5','HiCinema 영화관람권',13000,'일반 영화 관람권',NULL,'HiCinema 영화관람권으로 즐거운 영화관람하세요!','상품권',0);
/*!40000 ALTER TABLE `store` ENABLE KEYS */;
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
