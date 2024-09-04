CREATE DATABASE  IF NOT EXISTS `justicia_para_todos` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `justicia_para_todos`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: justicia_para_todos
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rut` varchar(12) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `numeroCaso` varchar(50) NOT NULL,
  `descripcionCaso` text NOT NULL,
  `fechaInicioCaso` date NOT NULL,
  `estadoCaso` enum('activo','en proceso','cerrado') NOT NULL,
  `descripcionSentencia` text,
  `fechaCierreCaso` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rut` (`rut`,`numeroCaso`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'12345678-9','Juan','Pérez','Chile, 123, Calle Ejemplo, Depto 456, 12345','juan.perez@example.com','+56 9 1234 5678','001','Caso de demanda laboral contra la empresa XYZ.','2023-03-01','activo',NULL,NULL),(2,'98765432-1','María','González','Chile, 456, Avenida Siempre Viva, Casa 789, 67890','maria.gonzalez@example.com','+56 9 8765 4321','002','Divorcio con acuerdo mutuo.','2023-01-15','en proceso',NULL,NULL),(3,'11223344-5','Pedro','Ramírez','Chile, 789, Calle Principal, Depto 101, 54321','pedro.ramirez@example.com','+56 9 1122 3344','003','Caso de fraude financiero.','2023-02-10','cerrado','El acusado fue condenado a 5 años de prisión.','2023-06-30'),(4,'33445566-7','Ana','Martínez','Chile, 654, Calle Secundaria, Casa 202, 98765','ana.martinez@example.com','+56 9 3344 5566','004','Demanda por negligencia médica.','2023-04-20','activo',NULL,NULL),(5,'55667788-9','Carla','Rojas','Chile, 321, Calle Tercera, Depto 303, 65432','carla.rojas@example.com','+56 9 5566 7788','005','Custodia de menores.','2023-05-05','en proceso',NULL,NULL),(7,'18222-1','Camilo','Samson','Chile, 302, LORD COCHRANE, 1914, SANTIAGO','camilosamson@outlook.com','+56996961013','C-200-2024','Indemnización de perjuicios','2024-08-28','en proceso','',NULL),(9,'1033122-1','Juanito','Pérez','Chile, 420000, La Dehesa, 2005, 40300049','juanitoperez@gmail.com','+5699638493','C-29340-2022','Denuncia por Fraude al fisco','2023-12-29','cerrado','Condenado a 5 años de prisión','2024-09-03'),(10,'1222-3','Cliente prueba ','Iacc','Argentina, 560, La colonia, 30, 90039921','correo@lacolonia.cl','569 22349521','3000','Caso sobre deudas','2024-08-30','en proceso','',NULL);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-04  0:18:42
