-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: 192.168.1.101    Database: iberia
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.11-MariaDB

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
-- Table structure for table `dimsucursal`
--

DROP TABLE IF EXISTS `dimsucursal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dimsucursal` (
  `SucursalKey` int(11) NOT NULL,
  `CodigoSucursal` varchar(20) DEFAULT NULL,
  `NombreSucursal` varchar(255) DEFAULT NULL,
  `Ciudad` varchar(100) DEFAULT NULL,
  `Region` varchar(100) DEFAULT NULL,
  `TipoSucursal` varchar(50) DEFAULT NULL,
  `Gerente` varchar(100) DEFAULT NULL,
  `CapacidadMaxima` int(11) DEFAULT NULL,
  `Estado` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`SucursalKey`),
  KEY `Ciudad` (`Ciudad`),
  CONSTRAINT `dimsucursal_ibfk_1` FOREIGN KEY (`Ciudad`) REFERENCES `tb_ciudad` (`Ciudad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dimsucursal`
--

LOCK TABLES `dimsucursal` WRITE;
/*!40000 ALTER TABLE `dimsucursal` DISABLE KEYS */;
INSERT INTO `dimsucursal` VALUES (1,'S001','Almacén Central Madrid','Madrid','Centro','Almacén Central','Ana López',50000,''),(2,'S002','Tienda Norte Barcelona','Barcelona','Cataluña','Tienda Física','Carlos Ruiz',5000,''),(3,'S003','DC Levante Valencia','Valencia','Levante','Distribution Center','María García',25000,''),(4,'S004','Planta Sur Sevilla','Sevilla','Sur','Planta Producción','Pedro Sánchez',15000,''),(5,'S005','Tienda Premium Madrid','Madrid','Centro','Tienda Premium','Laura Martínez',2000,''),(6,'S006','Almacén Norte Bilbao','Bilbao','Norte','Almacén Regional','Javier Gómez',12000,'');
/*!40000 ALTER TABLE `dimsucursal` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-27 19:28:03
