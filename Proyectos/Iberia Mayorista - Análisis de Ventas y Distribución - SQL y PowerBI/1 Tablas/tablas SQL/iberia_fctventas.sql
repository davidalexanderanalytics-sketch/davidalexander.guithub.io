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
-- Table structure for table `fctventas`
--

DROP TABLE IF EXISTS `fctventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fctventas` (
  `VentaKey` int(11) NOT NULL AUTO_INCREMENT,
  `FechaKey` int(8) NOT NULL,
  `ClienteKey` int(11) NOT NULL,
  `ProductoKey` int(11) NOT NULL,
  `Unidades` int(11) DEFAULT NULL,
  `PrecioUnitario` decimal(10,2) DEFAULT NULL,
  `DescuentoPct` decimal(5,2) DEFAULT NULL,
  `CanalVenta` varchar(50) DEFAULT NULL,
  `MedioPago` varchar(50) DEFAULT NULL,
  `MontoBruto` decimal(12,2) GENERATED ALWAYS AS (`Unidades` * `PrecioUnitario`) VIRTUAL,
  `MontoNeto` decimal(12,2) GENERATED ALWAYS AS (`Unidades` * `PrecioUnitario` * (1 - ifnull(`DescuentoPct`,0) / 100)) VIRTUAL,
  PRIMARY KEY (`VentaKey`),
  KEY `idx_fecha` (`FechaKey`),
  KEY `idx_cliente` (`ClienteKey`),
  KEY `idx_producto` (`ProductoKey`),
  CONSTRAINT `fctventas_ibfk_1` FOREIGN KEY (`FechaKey`) REFERENCES `dimcalendario` (`FechaKey`),
  CONSTRAINT `fctventas_ibfk_2` FOREIGN KEY (`ClienteKey`) REFERENCES `dimcliente` (`ClienteKey`),
  CONSTRAINT `fctventas_ibfk_3` FOREIGN KEY (`ProductoKey`) REFERENCES `dimproducto` (`ProductoKey`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fctventas`
--

LOCK TABLES `fctventas` WRITE;
/*!40000 ALTER TABLE `fctventas` DISABLE KEYS */;
INSERT INTO `fctventas` (`VentaKey`, `FechaKey`, `ClienteKey`, `ProductoKey`, `Unidades`, `PrecioUnitario`, `DescuentoPct`, `CanalVenta`, `MedioPago`) VALUES (1,20260510,26,1,20,255.00,5.00,'Mayorista','Transferencia'),(2,20260108,1,2,15,189.00,3.00,'Mayorista','Transferencia'),(3,20260805,15,2,30,975.00,2.00,'Mayorista','Transferencia'),(4,20260628,24,4,50,725.00,4.00,'Mayorista','Transferencia'),(5,20260202,2,1,10,255.00,0.00,'Directo','Tarjeta'),(6,20260225,11,9,8,189.00,0.00,'Directo','Tarjeta'),(7,20261218,3,3,20,975.00,0.00,'Directo','Tarjeta'),(8,20260105,5,5,12,1599.00,10.00,'Online','PayPal'),(9,20261015,1,1,5,255.00,0.00,'Directo','Efectivo'),(10,20260611,5,1,100,245.00,8.00,'Mayorista','Transferencia'),(11,20260409,17,2,50,1800.00,5.00,'Mayorista','Transferencia'),(12,20261107,14,3,80,95.00,3.00,'Mayorista','Transferencia'),(13,20261215,8,4,10,725.00,0.00,'Minorista','Tarjeta'),(14,20260103,25,2,5,189.00,0.00,'Directo','Transferencia'),(15,20260406,10,9,6,1599.00,5.00,'Online','Tarjeta'),(16,20260110,23,1,40,2550.00,5.00,'Mayorista','Transferencia'),(17,20260115,14,2,80,1890.00,3.00,'Mayorista','Transferencia'),(18,20260205,31,17,60,1840.00,7.00,'Mayorista','Transferencia'),(19,20260220,10,19,50,3150.00,10.00,'Mayorista','Transferencia'),(20,20260108,2,1,25,2550.00,0.00,'Corporativo','Tarjeta'),(21,20260212,15,21,30,2690.00,0.00,'Corporativo','Tarjeta'),(22,20260303,2,22,25,2430.00,5.00,'Corporativo','Transferencia'),(23,20260103,21,3,100,995.00,2.00,'Mayorista','Transferencia'),(24,20260118,15,4,150,745.00,4.00,'Mayorista','Transferencia'),(25,20260210,26,23,80,1470.00,0.00,'Mayorista','Transferencia'),(26,20260225,28,24,90,1390.00,0.00,'Mayorista','Transferencia'),(27,20260305,6,20,60,2280.00,6.00,'Mayorista','Transferencia'),(28,20260106,30,8,40,875.00,0.00,'Directo','Tarjeta'),(29,20260120,12,9,60,1250.00,0.00,'Directo','Tarjeta'),(30,20260207,30,11,30,1450.00,0.00,'Directo','Transferencia'),(31,20260221,16,12,25,2190.00,5.00,'Directo','Transferencia'),(32,20260302,13,15,20,990.00,0.00,'Directo','Tarjeta'),(33,20260104,3,5,8,1599.00,10.00,'Minorista','Tarjeta'),(34,20260119,4,6,12,1150.00,0.00,'Minorista','Efectivo'),(35,20260203,29,17,10,1840.00,0.00,'Minorista','Tarjeta'),(36,20260218,11,21,6,2690.00,0.00,'Minorista','Tarjeta'),(37,20260111,6,7,24,2990.00,3.00,'Online','PayPal'),(38,20260128,24,18,18,1990.00,0.00,'Online','Tarjeta'),(39,20260214,20,13,10,1320.00,0.00,'Online','Tarjeta'),(40,20260301,19,16,12,2450.00,5.00,'Online','PayPal');
/*!40000 ALTER TABLE `fctventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-27 19:28:04
