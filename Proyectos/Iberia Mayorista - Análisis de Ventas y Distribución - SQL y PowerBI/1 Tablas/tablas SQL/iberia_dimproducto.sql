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
-- Table structure for table `dimproducto`
--

DROP TABLE IF EXISTS `dimproducto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dimproducto` (
  `ProductoKey` int(11) NOT NULL,
  `SKU` varchar(50) DEFAULT NULL,
  `NombreProducto` varchar(255) DEFAULT NULL,
  `Categoria` varchar(100) DEFAULT NULL,
  `Subcategoria` varchar(100) DEFAULT NULL,
  `Marca` varchar(100) DEFAULT NULL,
  `PrecioLista` decimal(10,2) DEFAULT NULL,
  `UnidadMedida` varchar(20) DEFAULT NULL,
  `EstadoProducto` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ProductoKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dimproducto`
--

LOCK TABLES `dimproducto` WRITE;
/*!40000 ALTER TABLE `dimproducto` DISABLE KEYS */;
INSERT INTO `dimproducto` VALUES (1,'SKU001','Aceite Oliva Virgen Extra 5L','Alimentación','Aceites','La Española',285.00,'Litro','Activo'),(2,'SKU002','Harina Trigo Blanca 25Kg','Alimentación','Harinas','Harinas del Sur',199.00,'Kg','Activo'),(3,'SKU003','Azúcar Blanca 10Kg','Alimentación','Azúcares','Azucarera',995.00,'Kg','Activo'),(4,'SKU004','Arroz Redondo 5Kg','Alimentación','Cereales','SOS',745.00,'Kg','Activo'),(5,'SKU005','Tomate Natural Triturado 12x800g','Conservas','Tomate','Alcampo',1699.00,'Paquete','Activo'),(6,'SKU006','Garbanzos Cocidos 12x400g','Conservas','Legumbres','Alcampo',115.00,'Paquete','Activo'),(7,'SKU007','Atún en Aceite 24x160g','Conservas','Pescado','Calvo',299.00,'Paquete','Activo'),(8,'SKU008','Harina Repostería 5Kg','Alimentación','Harinas Especiales','Doves Farm',875.00,'Kg','Activo'),(9,'SKU009','Levadura Fresca 50g x20','Repostería','Levaduras','Levapan',125.00,'Paquete','Activo'),(10,'SKU010','Aceite Girasol 20L','Alimentación','Aceites','Koipe',228.00,'Litro','Activo'),(11,'SKU011','Mezcla Bizcocho 5Kg','Repostería','Mezclas','DovesFarm',1450.00,'Kg','Activo'),(12,'SKU012','Cobertura Chocolate 2Kg','Repostería','Coberturas','Nestlé',2190.00,'Kg','Activo'),(13,'SKU013','Crema Pastelera 1Kg','Repostería','Rellenos','PasteleraSA',1320.00,'Kg','Activo'),(14,'SKU014','Fondant Blanco 5Kg','Repostería','Fondant','Decora',2780.00,'Kg','Activo'),(15,'SKU015','Sprinkles Colores 1Kg','Repostería','Decoración','FunCakes',990.00,'Kg','Activo'),(16,'SKU016','Base Tartaleta 120 uds','Repostería','Bases','LaTahona',2450.00,'Paquete','Activo'),(17,'SKU017','Maíz Dulce 12x400g','Conservas','Vegetales','Bonduelle',1840.00,'Paquete','Activo'),(18,'SKU018','Mix Verduras 12x400g','Conservas','Vegetales','Bonduelle',1990.00,'Paquete','Activo'),(19,'SKU019','Atún al Natural 24x160g','Conservas','Pescado','Calvo',3150.00,'Paquete','Activo'),(20,'SKU020','Sardinas en Aceite 24x120g','Conservas','Pescado','Calvo',2280.00,'Paquete','Activo'),(21,'SKU021','Melocotón en Almíbar 12x820g','Conservas','Frutas','Hero',2690.00,'Paquete','Activo'),(22,'SKU022','Piña en Rodajas 12x560g','Conservas','Frutas','Dole',2430.00,'Paquete','Activo'),(23,'SKU023','Garbanzos Cocidos Eco 12x400g','Conservas','Legumbres','Alcampo Bio',1470.00,'Paquete','Activo'),(24,'SKU024','Harina Trigo Integral 25Kg','Alimentación','Harinas','Harinas del Sur',189.00,'Kg','Activo');
/*!40000 ALTER TABLE `dimproducto` ENABLE KEYS */;
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
