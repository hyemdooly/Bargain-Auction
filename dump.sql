-- MySQL dump 10.13  Distrib 8.0.27, for macos11.6 (x86_64)
--
-- Host: localhost    Database: bargainAuction
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `upload_mem_id` int NOT NULL,
  `bid_mem_id` int DEFAULT NULL,
  `name` varchar(20) NOT NULL,
  `start_price` int NOT NULL,
  `current_price` int NOT NULL,
  `image` varchar(50) NOT NULL,
  `tracking_company` varchar(20) DEFAULT NULL,
  `end_date` timestamp NOT NULL,
  `upload_date` timestamp NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `status_end` tinyint(1) NOT NULL,
  `tracking_number` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `upload_id_FK` (`upload_mem_id`),
  KEY `bid_id_FK` (`bid_mem_id`),
  CONSTRAINT `bid_id_FK` FOREIGN KEY (`bid_mem_id`) REFERENCES `member` (`mid`),
  CONSTRAINT `upload_id_FK` FOREIGN KEY (`upload_mem_id`) REFERENCES `member` (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,1,2,'이케아 가방',6000,6000,'2021-12-12-02-57-21-by-1.jpg','대한통운','2021-12-11 15:57:22','2021-12-11 08:57:22','깨끗하게 썼어요~!',1,'2018112054122'),(2,1,2,'제이에스티나 지갑',10000,11000,'2021-12-12-05-32-12-by-1.jpeg',NULL,'2021-12-18 11:32:13','2021-12-11 11:32:13','선물받았는데 이미 사용하고 있는 지갑이 있어서 팝니다.\r\n깨끗해요!',0,NULL);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `mid` int NOT NULL AUTO_INCREMENT,
  `id` varchar(20) NOT NULL,
  `nickname` varchar(20) NOT NULL,
  `password` varchar(30) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `address_detail` varchar(50) DEFAULT NULL,
  `point` int NOT NULL,
  `expected_point` int NOT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'pv0223','hyemdooly','asdf','pv0223@naver.com','ê²½ê¸°ë ìí¥ì ìíë','112-2',0,0),(2,'hyemdooly','dooly','asdf','hyemdooly@gmail.com','ìì¸í¹ë³ì ì¤êµ¬','102-1',13000,0);
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

-- Dump completed on 2021-12-12 13:29:23
