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
-- Table structure for table `dimcliente`
--

DROP TABLE IF EXISTS `dimcliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dimcliente` (
  `ClienteKey` int(11) NOT NULL,
  `ID_Cliente_ERP` varchar(50) DEFAULT NULL,
  `NombreCliente` varchar(255) DEFAULT NULL,
  `Segmento` varchar(100) DEFAULT NULL,
  `Ciudad` varchar(100) DEFAULT NULL,
  `Region` varchar(100) DEFAULT NULL,
  `Canal` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ClienteKey`),
  KEY `Ciudad` (`Ciudad`),
  KEY `Segmento` (`Segmento`),
  CONSTRAINT `dimcliente_ibfk_1` FOREIGN KEY (`Ciudad`) REFERENCES `tb_ciudad` (`Ciudad`),
  CONSTRAINT `dimcliente_ibfk_2` FOREIGN KEY (`Segmento`) REFERENCES `tb_segmento` (`Segmento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dimcliente`
--

LOCK TABLES `dimcliente` WRITE;
/*!40000 ALTER TABLE `dimcliente` DISABLE KEYS */;
INSERT INTO `dimcliente` VALUES (1,'C001','Supermercado Central SA','Retail Grande','Madrid','Centro','Mayorista'),(2,'C002','Cadena Hoteles España','Hostelería','Barcelona','Cataluña','Corporativo'),(3,'C003','Distribuidora Norte SL','Mayorista','Bilbao','Norte','Mayorista'),(4,'C004','Panadería Industrial','Alimentación','Valencia','Levante','Directo'),(5,'C005','Pyme Comercio Local','Retail Mediano','Zaragoza','Aragón','Minorista'),(6,'C006','Tienda Barrio Sur','Retail Pequeño','Sevilla','Sur','Minorista'),(7,'C007','Restaurante Premium Gourmet','Premium','Madrid','Centro','Directo'),(8,'C008','Cliente Estándar Norte','Retail','Pamplona','Norte','Directo'),(9,'C009','Cliente Estándar Sur','Retail','Málaga','Sur','Minorista'),(10,'C010','Cliente Abandonado 2026','Retail','Málaga','Sur','Minorista'),(11,'C011','Nuevo Ecommerce Test','Ecommerce','Madrid','Centro','Online'),(12,'C012','Startup FoodTech','Startup','Barcelona','Cataluña','Online'),(13,'C013','Cliente Online Madrid','Ecommerce','Madrid','Centro','Online'),(14,'C014','Cliente Corporativo Levante','Corporativo','Valencia','Levante','Directo'),(15,'C015','Mayorista Levante SL','Mayorista','Alicante','Levante','Mayorista'),(16,'C016','Tienda Barrio Norte','Retail Pequeño','Burgos','Norte','Minorista'),(17,'C017','Supermercado Local Centro','Retail Mediano','Madrid','Centro','Minorista'),(18,'C018','Colmado Tradicional Sur','Retail Pequeño','Cádiz','Sur','Minorista'),(19,'C019','HiperMarket Norte','Retail Grande','Oviedo','Norte','Mayorista'),(20,'C020','Cash&Carry Levante','Mayorista','Castellón','Levante','Mayorista'),(21,'C021','Restaurante Mar y Tierra','Hostelería','Valencia','Levante','Directo'),(22,'C022','Hotel Costa Azul','Hostelería','Málaga','Sur','Corporativo'),(23,'C023','Catering Eventos Norte','Hostelería','Bilbao','Norte','Corporativo'),(24,'C024','Ecommerce Healthy Foods','Ecommerce','Barcelona','Cataluña','Online'),(25,'C025','Ecommerce Descuentos YA','Ecommerce','Madrid','Centro','Online'),(26,'C026','Grupo Residencias Senior','Corporativo','Murcia','Levante','Directo'),(27,'C027','Comedor Empresa Tech','Corporativo','Madrid','Centro','Directo'),(28,'C028','Tienda Mixta Centro','Retail Pequeño','Madrid','Centro','Minorista'),(29,'C029','Tienda Mixta Centro','Ecommerce','Madrid','Centro','Online'),(30,'C030','Autoservicio Pueblo','Retail Pequeño','Jaén','Sur','Minorista'),(31,'C031','Bazar Alimentación Centro','Retail Mediano','Madrid','Centro','Minorista');
/*!40000 ALTER TABLE `dimcliente` ENABLE KEYS */;
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
