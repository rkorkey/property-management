-- MySQL dump 10.13  Distrib 8.0.36, for macos14 (x86_64)
--
-- Host: localhost    Database: tcomplex_management
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `properties`
--

DROP TABLE IF EXISTS `properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `properties` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `area` double NOT NULL,
  `status` varchar(20) NOT NULL,
  `floor` int NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `description` text,
  `price` double NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  CONSTRAINT `properties_chk_2` CHECK ((`floor` between 1 and 15)),
  CONSTRAINT `properties_chk_3` CHECK ((`type` in (_utf8mb4'Văn phòng chia sẻ',_utf8mb4'Văn phòng trọn gói'))),
  CONSTRAINT `properties_chk_4` CHECK ((`price` > 1000000))
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `properties`
--

LOCK TABLES `properties` WRITE;
/*!40000 ALTER TABLE `properties` DISABLE KEYS */;
INSERT INTO `properties` VALUES (33,'MB002',150,'Hạ tầng',5,'Văn phòng chia sẻ','Không gian tiện nghi gần thang máy',3000000,'2024-02-01','2025-02-01'),(34,'MB003',200,'Đầy đủ',10,'Văn phòng trọn gói','Mặt bằng có đầy đủ trang thiết bị',5000000,'2024-03-01','2025-03-01'),(36,'MB005',250,'Đầy đủ',8,'Văn phòng trọn gói','Mặt bằng cao cấp với view đẹp',6000000,'2024-05-01','2025-05-01'),(37,'MB006',120,'Trống',6,'Văn phòng chia sẻ','Thiết kế tối ưu hóa không gian làm việc',2200000,'2024-06-01','2024-12-31'),(38,'MB007',300,'Hạ tầng',12,'Văn phòng trọn gói','Không gian lớn phù hợp với công ty quy mô vừa',8000000,'2024-07-01','2025-07-01'),(39,'MB008',180,'Đầy đủ',4,'Văn phòng trọn gói','Mặt bằng được trang bị hệ thống chiếu sáng hiện đại',4500000,'2024-08-01','2025-08-01'),(40,'MB009',110,'Trống',9,'Văn phòng chia sẻ','Khu vực yên tĩnh thích hợp làm văn phòng nghiên cứu',2400000,'2024-09-01','2025-03-01'),(41,'MB010',170,'Hạ tầng',7,'Văn phòng trọn gói','Mặt bằng nằm ở vị trí trung tâm tầng',4000000,'2024-10-01','2025-04-01');
/*!40000 ALTER TABLE `properties` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-16 11:34:30
