-- MySQL dump 10.13  Distrib 8.0.20, for macos10.15 (x86_64)
--
-- Host: 127.0.0.1    Database: management_ticket
-- ------------------------------------------------------
-- Server version	5.7.30

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
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `detail` varchar(500) DEFAULT '',
  `contact_info` varchar(500) DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ticket_status` varchar(10) NOT NULL DEFAULT 'pending',
  `status` varchar(1) NOT NULL DEFAULT 'A',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` VALUES (1,'test','','','2021-02-13 13:54:38','2021-02-13 13:54:38','pending','A'),(2,'test2','','','2021-02-13 13:55:44','2021-02-13 13:55:44','pending','A'),(3,'ter','','','2021-02-13 13:56:09','2021-02-13 13:56:09','pending','A'),(4,'rrr','','','2021-02-13 14:12:36','2021-02-13 14:12:36','pending','A'),(5,'รายงาน','','','2021-02-13 14:14:08','2021-02-14 17:32:48','pending','A'),(6,'xyz1','pqr','kpnm@pqr.com','2021-02-15 15:15:39','2021-02-16 15:33:24','accepted','A'),(7,'dddd','','','2021-02-15 15:17:12','2021-02-15 15:17:12','pending','A'),(8,'หน้าติดตั้งอุปกรณ์','ไม่สามารถค้นหาได้','เบอร์ติดต่อกลับ 1221','2021-02-15 15:49:54','2021-02-15 15:49:54','pending','A'),(9,'หน้าติดตั้งอุปกรณ์','ไม่สามารถค้นหาได้','เบอร์ติดต่อกลับ 1221','2021-02-15 16:00:03','2021-02-15 16:00:03','pending','A'),(10,'xyz','pqr','xyz@pqr.com','2021-02-16 15:09:00','2021-02-16 15:09:00','pending','A'),(11,'xyz','pqr','xyz@pqr.com','2021-02-16 15:16:33','2021-02-16 15:16:33','pending','A'),(12,'xyz','pqr','xyz@pqr.com','2021-02-16 15:19:17','2021-02-16 15:19:17','pending','A'),(13,'xyz','pqr','xyz@pqr.com','2021-02-16 15:30:44','2021-02-16 15:30:44','pending','A'),(14,'xyz','pqr','xyz@pqr.com','2021-02-16 15:33:24','2021-02-16 15:33:24','pending','A'),(15,'xyz','pqr','xyz@pqr.com','2021-02-16 15:41:33','2021-02-16 15:41:33','pending','A'),(16,'xyz','pqr','xyz@pqr.com','2021-02-16 15:42:44','2021-02-16 15:42:44','pending','A'),(17,'xyz','pqr','xyz@pqr.com','2021-02-16 15:44:06','2021-02-16 15:44:06','pending','A'),(18,'xyz','pqr','xyz@pqr.com','2021-02-16 15:45:49','2021-02-16 15:45:49','pending','A'),(19,'xyz','pqr','xyz@pqr.com','2021-02-16 15:49:43','2021-02-16 15:49:43','pending','A'),(20,'xyz','pqr','xyz@pqr.com','2021-02-16 15:50:45','2021-02-16 15:50:45','pending','A');
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-16 23:16:01
