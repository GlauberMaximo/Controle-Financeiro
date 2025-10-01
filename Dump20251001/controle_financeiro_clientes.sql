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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `data_nascimento` date DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `cpf` (`cpf`),
  UNIQUE KEY `email` (`email`),
  KEY `idx_id_cliente` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Ana Souza','123.456.789-00','1990-02-15','ana.souza@example.com'),(2,'Bruno Lima','123.456.789-01','1985-07-23','bruno.lima@example.com'),(3,'Carla Ferreira','123.456.789-02','1992-11-30','carla.ferreira@example.com'),(4,'Daniel Costa','123.456.789-03','1988-01-12','daniel.costa@example.com'),(5,'Eduarda Martins','123.456.789-04','1995-05-09','eduarda.martins@example.com'),(6,'Felipe Gomes','123.456.789-05','1987-06-18','felipe.gomes@example.com'),(7,'Gabriela Rocha','123.456.789-06','1993-12-25','gabriela.rocha@example.com'),(8,'Henrique Alves','123.456.789-07','1991-04-05','henrique.alves@example.com'),(9,'Isabela Torres','123.456.789-08','1994-08-14','isabela.torres@example.com'),(10,'João Pereira','123.456.789-09','1989-03-22','joao.pereira@example.com'),(11,'Karen Ribeiro','123.456.789-10','1996-07-10','karen.ribeiro@example.com'),(12,'Lucas Fernandes','123.456.789-11','1990-09-28','lucas.fernandes@example.com'),(13,'Mariana Castro','123.456.789-12','1993-10-03','mariana.castro@example.com'),(14,'Nicolas Duarte','123.456.789-13','1992-02-17','nicolas.duarte@example.com'),(15,'Olivia Barros','123.456.789-14','1997-11-12','olivia.barros@example.com'),(16,'Paulo Henrique','123.456.789-15','1986-06-01','paulo.henrique@example.com'),(17,'Quésia Almeida','123.456.789-16','1998-05-18','quesia.almeida@example.com'),(18,'Rafael Moreira','123.456.789-17','1991-12-07','rafael.moreira@example.com'),(19,'Sabrina Nunes','123.456.789-18','1995-01-19','sabrina.nunes@example.com'),(20,'Thiago Carvalho','123.456.789-19','1987-04-11','thiago.carvalho@example.com'),(21,'Ursula Prado','123.456.789-20','1993-08-20','ursula.prado@example.com'),(22,'Victor Ramos','123.456.789-21','1994-09-15','victor.ramos@example.com'),(23,'Wesley Braga','123.456.789-22','1989-02-08','wesley.braga@example.com'),(24,'Xavier Pires','123.456.789-23','1990-06-27','xavier.pires@example.com'),(25,'Yasmin Oliveira','123.456.789-24','1996-11-04','yasmin.oliveira@example.com'),(26,'Zeca Azevedo','123.456.789-25','1992-12-01','zeca.azevedo@example.com'),(27,'Aline Silva','123.456.789-26','1991-05-07','aline.silva@example.com'),(28,'Breno Viana','123.456.789-27','1993-07-23','breno.viana@example.com'),(29,'Cecília Porto','123.456.789-28','1994-10-31','cecilia.porto@example.com'),(30,'Diego Mattos','123.456.789-29','1988-03-13','diego.mattos@example.com'),(31,'Elaine Correia','123.456.789-30','1997-01-29','elaine.correia@example.com'),(32,'Fábio Pinto','123.456.789-31','1990-08-16','fabio.pinto@example.com'),(33,'Giovana Santos','123.456.789-32','1995-09-05','giovana.santos@example.com'),(34,'Heitor Campos','123.456.789-33','1992-06-21','heitor.campos@example.com'),(35,'Ingrid Moura','123.456.789-34','1993-12-18','ingrid.moura@example.com'),(36,'Jonas Teixeira','123.456.789-35','1994-04-30','jonas.teixeira@example.com'),(37,'Karla Freitas','123.456.789-36','1991-07-27','karla.freitas@example.com'),(38,'Leandro Braga','123.456.789-37','1989-11-22','leandro.braga@example.com'),(39,'Marta Vidal','123.456.789-38','1996-10-12','marta.vidal@example.com'),(40,'Natália Figueira','123.456.789-39','1993-02-03','natalia.figueira@example.com');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
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
