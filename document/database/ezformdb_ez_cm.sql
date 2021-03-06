-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: ezformdb
-- ------------------------------------------------------
-- Server version	5.7.34-log

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
-- Table structure for table `ez_cm`
--

DROP TABLE IF EXISTS `ez_cm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ez_cm` (
  `cm_bnum` int(11) NOT NULL,
  `cm_id` int(11) DEFAULT NULL,
  `cm_title` varchar(100) DEFAULT NULL,
  `cm_dname` varchar(100) DEFAULT NULL,
  `cm_name` varchar(100) DEFAULT NULL,
  `cm_regdate` timestamp NULL DEFAULT NULL,
  `cm_content` varchar(1000) DEFAULT NULL,
  `cm_hits` int(11) DEFAULT NULL,
  `cm_like` int(11) DEFAULT NULL,
  `cm_file` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`cm_bnum`),
  KEY `FK_ez_em_TO_ez_cm_1` (`cm_id`),
  CONSTRAINT `FK_ez_em_TO_ez_cm_1` FOREIGN KEY (`cm_id`) REFERENCES `ez_em` (`em_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ez_cm`
--

LOCK TABLES `ez_cm` WRITE;
/*!40000 ALTER TABLE `ez_cm` DISABLE KEYS */;
/*!40000 ALTER TABLE `ez_cm` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-03 14:00:03
