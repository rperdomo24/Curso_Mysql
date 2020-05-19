-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: libreria_cf
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `autores`
--

DROP TABLE IF EXISTS `autores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autores` (
  `autor_id` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) NOT NULL,
  `apellido` varchar(25) NOT NULL,
  `seudonimo` varchar(50) DEFAULT NULL,
  `genero` enum('M','F') DEFAULT NULL,
  `fecha_nacimiento` date NOT NULL,
  `pais_origen` varchar(40) NOT NULL,
  `fecha_creacion` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`autor_id`),
  UNIQUE KEY `seudonimo` (`seudonimo`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autores`
--

LOCK TABLES `autores` WRITE;
/*!40000 ALTER TABLE `autores` DISABLE KEYS */;
INSERT INTO `autores` VALUES (1,'Roberto','Perdomo',NULL,'M','1994-12-15','El Salvador','2020-05-15 14:58:16'),(2,'Josue','Perdomo',NULL,'M','1996-06-15','El Salvador','2020-05-15 14:58:16'),(3,'Marco','Perdomo',NULL,'M','2004-05-15','El Salvador','2020-05-15 14:58:16'),(4,'Sarid','Perdomo',NULL,'F','2000-12-15','El Salvador','2020-05-15 14:58:16'),(5,'Abigail','Perdomo',NULL,'F','1994-12-15','El Salvador','2020-05-15 14:58:16'),(6,'Peggy','Perdomo',NULL,'F','1955-12-15','El Salvador','2020-05-15 14:58:16'),(7,'Cayetano','Fuentes','SPastor Cayetano','M','1994-12-15','El Salvador','2020-05-15 14:58:16');
/*!40000 ALTER TABLE `autores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libros`
--

DROP TABLE IF EXISTS `libros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libros` (
  `libro_id` int unsigned NOT NULL AUTO_INCREMENT,
  `autor_id` int unsigned NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  `paginas` int unsigned DEFAULT '0',
  `fecha_publicacion` date NOT NULL,
  `fecha_creacion` datetime DEFAULT CURRENT_TIMESTAMP,
  `ventas` int unsigned NOT NULL DEFAULT '0',
  `stock` int unsigned DEFAULT '10',
  PRIMARY KEY (`libro_id`),
  KEY `autor_id` (`autor_id`),
  CONSTRAINT `libros_ibfk_1` FOREIGN KEY (`autor_id`) REFERENCES `autores` (`autor_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libros`
--

LOCK TABLES `libros` WRITE;
/*!40000 ALTER TABLE `libros` DISABLE KEYS */;
INSERT INTO `libros` VALUES (1,6,'Mateo','libro santo',200,'2020-01-31','2020-05-15 14:58:16',0,9),(2,2,'Marcos','libro santo',200,'2010-02-01','2020-05-15 14:58:16',0,0),(3,3,'Lucas','libro santo',200,'2019-03-02','2020-05-15 14:58:16',0,9),(4,4,'Juan','libro santo',200,'2018-04-04','2020-05-15 14:58:16',0,10),(5,5,'Genesis','libro santo',200,'2017-05-05','2020-05-15 14:58:16',0,0),(6,1,'Exodo','libro santo',200,'2016-07-06','2020-05-15 14:58:16',0,10),(7,2,'Levitco','libro santo',200,'2015-09-02','2020-05-15 14:58:16',0,10),(8,3,'Deuteronomio compresinva','libro para primer ciclo',300,'2019-10-10','2020-05-15 14:58:16',0,10),(9,4,'Lenguaje','libro para primer ciclo',300,'2019-10-10','2020-05-15 14:58:16',0,10),(10,5,'sociales ','libro para primer ciclo',0,'2019-10-10','2020-05-15 14:58:16',0,10),(11,7,'sociales ','libro para primer ciclo',0,'2005-10-10','2020-05-15 14:58:16',0,10);
/*!40000 ALTER TABLE `libros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libros_usuarios`
--

DROP TABLE IF EXISTS `libros_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libros_usuarios` (
  `libro_id` int unsigned NOT NULL,
  `usuario_id` int unsigned NOT NULL,
  `fecha_creacion` datetime DEFAULT CURRENT_TIMESTAMP,
  KEY `libro_id` (`libro_id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `libros_usuarios_ibfk_1` FOREIGN KEY (`libro_id`) REFERENCES `libros` (`libro_id`),
  CONSTRAINT `libros_usuarios_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libros_usuarios`
--

LOCK TABLES `libros_usuarios` WRITE;
/*!40000 ALTER TABLE `libros_usuarios` DISABLE KEYS */;
INSERT INTO `libros_usuarios` VALUES (1,1,'2020-05-15 14:58:16'),(2,1,'2020-05-15 14:58:16'),(3,1,'2020-05-15 14:58:16'),(3,3,'2020-05-15 14:58:16'),(4,3,'2020-05-15 14:58:16'),(5,3,'2020-05-15 14:58:16'),(11,2,'2020-05-15 14:58:16'),(1,3,'2020-05-15 20:51:52'),(2,3,'2020-05-15 21:01:47'),(2,1,'2020-05-15 21:03:43'),(2,1,'2020-05-15 21:04:10'),(2,4,'2020-05-15 21:12:00'),(2,1,'2020-05-15 21:12:36'),(2,1,'2020-05-15 21:14:28'),(2,1,'2020-05-15 21:14:32'),(2,1,'2020-05-15 21:14:33'),(2,1,'2020-05-15 21:14:34'),(2,1,'2020-05-15 21:14:35'),(5,2,'2020-05-15 21:22:34'),(5,2,'2020-05-15 21:22:35'),(5,2,'2020-05-15 21:22:36'),(5,2,'2020-05-15 21:22:37'),(5,2,'2020-05-15 21:22:37'),(5,2,'2020-05-15 21:22:37'),(5,2,'2020-05-15 21:22:38'),(5,2,'2020-05-15 21:22:38'),(5,2,'2020-05-15 21:22:54'),(5,2,'2020-05-15 21:22:54'),(4,3,'2020-05-18 21:42:14'),(3,3,'2020-05-18 21:55:14');
/*!40000 ALTER TABLE `libros_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `usuario_id` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) NOT NULL,
  `apellidos` varchar(25) DEFAULT NULL,
  `username` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL,
  `fecha_creacion` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`usuario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Roberto','Perdomo','rperdomo','rperdomo32@gmail.com','2020-05-15 14:58:16'),(2,'codi','facilito','codifacilito','ayuda@codifacilito.com','2020-05-15 14:58:16'),(3,'Karen','Perdomo','kperdomo','kperdomo@gmail.com','2020-05-15 14:58:16'),(4,'sarid','perdomo','sperdomo','sperdomo@codifacilito.com','2020-05-15 14:58:16');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-18 22:31:55
