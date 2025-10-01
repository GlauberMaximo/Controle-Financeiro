-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: controle_financeiro
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `contas`
--

DROP TABLE IF EXISTS `contas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contas` (
  `id_conta` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int DEFAULT NULL,
  `numero_conta` varchar(20) NOT NULL,
  `saldo` decimal(10,2) NOT NULL,
  `data_abertura` date NOT NULL,
  `status` varchar(10) NOT NULL,
  PRIMARY KEY (`id_conta`),
  UNIQUE KEY `numero_conta` (`numero_conta`),
  KEY `fk_contas_id_cliente` (`id_cliente`),
  CONSTRAINT `fk_contas_id_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contas`
--

LOCK TABLES `contas` WRITE;
/*!40000 ALTER TABLE `contas` DISABLE KEYS */;
INSERT INTO `contas` VALUES (1,1,'0000001',3342.12,'2023-11-05','Ativa'),(2,2,'0000002',1522.23,'2024-08-11','Ativa'),(3,3,'0000003',3943.35,'2023-01-02','Ativa'),(4,4,'0000004',2023.53,'2023-05-11','Ativa'),(5,5,'0000005',3056.96,'2023-03-05','Ativa'),(6,6,'0000006',3370.50,'2023-02-02','Ativa'),(7,7,'0000007',5226.88,'2023-02-09','Ativa'),(8,8,'0000008',4976.26,'2024-04-11','Ativa'),(9,9,'0000009',3507.03,'2023-04-15','Ativa'),(10,10,'0000010',2847.23,'2023-07-13','Ativa'),(11,11,'0000011',3534.06,'2023-12-05','Ativa'),(12,12,'0000012',2522.03,'2024-05-11','Ativa'),(13,13,'0000013',2112.05,'2024-01-14','Ativa'),(14,14,'0000014',3430.60,'2023-11-20','Ativa'),(15,15,'0000015',2173.06,'2023-12-01','Ativa'),(16,16,'0000016',1412.74,'2024-03-20','Ativa'),(17,17,'0000017',3284.57,'2023-02-07','Ativa'),(18,18,'0000018',5692.19,'2023-11-01','Ativa'),(19,19,'0000019',4590.45,'2023-02-12','Ativa'),(20,20,'0000020',1988.75,'2024-04-11','Ativa'),(21,21,'0000021',2472.30,'2023-03-25','Ativa'),(22,22,'0000022',5075.00,'2024-01-29','Ativa'),(23,23,'0000023',5174.22,'2023-05-04','Ativa'),(24,24,'0000024',3635.16,'2023-01-10','Ativa'),(25,25,'0000025',3500.01,'2023-09-28','Ativa'),(26,26,'0000026',4783.75,'2023-09-15','Ativa'),(27,27,'0000027',5391.13,'2023-03-03','Ativa'),(28,28,'0000028',5377.76,'2023-02-12','Ativa'),(29,29,'0000029',4657.35,'2023-09-23','Ativa'),(30,30,'0000030',1089.69,'2024-04-02','Ativa'),(31,31,'0000031',4788.07,'2023-10-28','Ativa'),(32,32,'0000032',2166.16,'2024-02-02','Ativa'),(33,33,'0000033',4064.29,'2023-02-16','Ativa'),(34,34,'0000034',3726.16,'2023-10-25','Ativa'),(35,35,'0000035',5218.36,'2024-03-14','Ativa'),(36,36,'0000036',1613.51,'2023-09-10','Ativa'),(37,37,'0000037',4691.42,'2023-09-14','Ativa'),(38,38,'0000038',5615.44,'2023-07-19','Ativa'),(39,39,'0000039',5470.62,'2023-10-11','Ativa'),(40,40,'0000040',4402.84,'2024-08-14','Ativa');
/*!40000 ALTER TABLE `contas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-01 14:17:57
