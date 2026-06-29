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
-- Table structure for table `fctoperaciones`
--

DROP TABLE IF EXISTS `fctoperaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fctoperaciones` (
  `OperacionKey` int(11) NOT NULL AUTO_INCREMENT,
  `FechaKey` int(8) NOT NULL,
  `SucursalKey` int(11) NOT NULL,
  `EmpleadoKey` int(11) NOT NULL,
  `ClienteKey` int(11) NOT NULL,
  `ProductoKey` int(11) NOT NULL,
  `CantidadUnidades` int(11) DEFAULT NULL,
  `StockInicial` int(11) DEFAULT NULL,
  `StockFinal` int(11) DEFAULT NULL,
  `Entradas` int(11) DEFAULT NULL,
  `Salidas` int(11) DEFAULT NULL,
  `TiempoPreparacionMin` int(11) DEFAULT NULL,
  `TiempoEntregaMin` int(11) DEFAULT NULL,
  `LeadTimeDias` int(11) DEFAULT NULL,
  `PedidoPerfecto` tinyint(1) DEFAULT NULL,
  `OnTimeDelivery` tinyint(1) DEFAULT NULL,
  `EstadoOperacion` varchar(50) DEFAULT NULL,
  `CosteOperacion` decimal(10,2) DEFAULT NULL,
  `CosteHoraEmpleado` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`OperacionKey`),
  KEY `idx_fecha` (`FechaKey`),
  KEY `idx_sucursal` (`SucursalKey`),
  KEY `idx_cliente` (`ClienteKey`),
  KEY `idx_producto` (`ProductoKey`),
  CONSTRAINT `fctoperaciones_ibfk_1` FOREIGN KEY (`FechaKey`) REFERENCES `dimcalendario` (`FechaKey`),
  CONSTRAINT `fctoperaciones_ibfk_2` FOREIGN KEY (`SucursalKey`) REFERENCES `dimsucursal` (`SucursalKey`),
  CONSTRAINT `fctoperaciones_ibfk_3` FOREIGN KEY (`ClienteKey`) REFERENCES `dimcliente` (`ClienteKey`),
  CONSTRAINT `fctoperaciones_ibfk_4` FOREIGN KEY (`ProductoKey`) REFERENCES `dimproducto` (`ProductoKey`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fctoperaciones`
--

LOCK TABLES `fctoperaciones` WRITE;
/*!40000 ALTER TABLE `fctoperaciones` DISABLE KEYS */;
INSERT INTO `fctoperaciones` VALUES (1,20260510,1,1,1,1,20,500,480,0,20,45,180,2,1,1,'Entregado',85.50,18.00),(2,20260108,1,2,1,2,15,300,285,0,15,35,120,2,1,1,'Entregado',60.00,18.00),(3,20260805,1,2,1,2,30,320,290,0,30,40,200,3,1,0,'Retrasado',72.00,18.00),(4,20260628,1,1,1,4,50,400,350,0,50,60,240,4,1,1,'Entregado',110.00,18.00),(5,20260202,2,3,2,1,10,150,140,0,10,25,90,1,1,1,'Entregado',22.10,15.00),(6,20260225,2,3,2,9,8,60,52,0,8,20,80,1,1,0,'Preparado',18.00,15.00),(7,20261218,2,4,2,3,20,200,180,0,20,35,210,3,1,1,'Entregado',40.00,16.50),(8,20260105,4,5,5,5,12,80,68,0,12,20,300,4,1,1,'Entregado',30.00,17.00),(9,20261015,2,3,6,1,5,100,95,0,5,15,60,1,1,1,'Entregado',12.50,15.00),(10,20260611,1,1,7,1,100,1000,900,0,100,90,300,4,1,1,'Entregado',180.00,18.00),(11,20260409,1,2,7,2,50,500,450,0,50,70,260,3,1,1,'Entregado',120.00,18.00),(12,20261107,1,2,7,3,80,600,520,0,80,80,360,5,1,0,'Retrasado',160.00,18.00),(13,20261215,3,6,8,4,10,70,60,0,10,30,180,3,1,1,'Entregado',18.40,12.00),(14,20260103,2,3,9,2,5,40,35,0,5,20,90,1,1,1,'Entregado',8.40,15.00),(15,20260406,4,5,10,9,6,60,54,0,6,25,210,3,1,0,'EnRuta',14.50,17.50),(16,20260110,1,1,1,1,40,520,480,0,40,50,200,3,1,1,'Entregado',90.00,18.00),(17,20260115,1,2,1,2,80,350,270,0,80,70,260,3,1,1,'Entregado',135.00,18.00),(18,20260205,1,2,1,17,60,220,160,0,60,55,240,4,1,1,'Entregado',115.00,18.00),(19,20260220,1,1,1,19,50,210,160,0,50,60,300,4,1,0,'Retrasado',130.00,18.00),(20,20260108,2,3,2,1,25,180,155,0,25,35,120,2,1,1,'Entregado',50.00,15.00),(21,20260212,2,3,2,21,30,140,110,0,30,40,150,2,1,1,'Entregado',65.00,15.00),(22,20260303,2,4,2,22,25,130,105,0,25,45,210,3,1,0,'Retrasado',70.00,16.50),(23,20260103,1,1,3,3,100,700,600,0,100,80,240,3,1,1,'Entregado',150.00,18.00),(24,20260118,1,1,3,4,150,900,750,0,150,90,300,4,1,1,'Entregado',210.00,18.00),(25,20260210,1,2,3,23,80,500,420,0,80,70,260,3,1,1,'Entregado',120.00,18.00),(26,20260225,1,2,3,24,90,480,390,0,90,75,300,4,1,0,'Retrasado',130.00,18.00),(27,20260305,1,1,3,20,60,350,290,0,60,65,280,4,1,1,'Entregado',110.00,18.00),(28,20260106,2,3,4,8,40,200,160,0,40,30,150,2,1,1,'Entregado',40.00,15.00),(29,20260120,2,3,4,9,60,260,200,0,60,35,170,2,1,1,'Entregado',55.00,15.00),(30,20260207,2,4,4,11,30,150,120,0,30,40,200,3,1,1,'Entregado',42.00,16.50),(31,20260221,2,4,4,12,25,140,115,0,25,45,220,3,1,0,'Retrasado',40.00,16.50),(32,20260302,2,3,4,15,20,100,80,0,20,30,180,3,1,1,'Entregado',32.00,15.00),(33,20260104,3,6,5,5,8,50,42,0,8,20,100,1,1,1,'VentaTienda',15.00,12.00),(34,20260119,3,6,5,6,12,70,58,0,12,25,110,2,1,1,'VentaTienda',18.00,12.00),(35,20260203,3,6,5,17,10,60,50,0,10,25,130,2,1,0,'Retrasado',16.00,12.00),(36,20260218,3,6,5,21,6,40,34,0,6,20,120,2,1,1,'VentaTienda',12.00,12.00),(37,20260111,4,5,6,7,24,120,96,0,24,35,240,3,1,1,'Entregado',35.00,17.00),(38,20260128,4,5,6,18,18,90,72,0,18,30,260,4,1,1,'Entregado',32.00,17.00),(39,20260214,4,5,6,13,10,70,60,0,10,25,270,4,1,0,'Retrasado',24.00,17.00),(40,20260301,4,5,6,16,12,80,68,0,12,28,250,3,1,1,'Entregado',28.00,17.00);
/*!40000 ALTER TABLE `fctoperaciones` ENABLE KEYS */;
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
