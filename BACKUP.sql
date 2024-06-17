-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: formulauno
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `bk_pilotos`
--

DROP TABLE IF EXISTS `bk_pilotos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bk_pilotos` (
  `id_piloto` int NOT NULL DEFAULT '0',
  `nombre` varchar(30) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `escud` int NOT NULL,
  `puntos` int NOT NULL,
  `F_cambio` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk_pilotos`
--

LOCK TABLES `bk_pilotos` WRITE;
/*!40000 ALTER TABLE `bk_pilotos` DISABLE KEYS */;
INSERT INTO `bk_pilotos` VALUES (1,'Lewis','Hamilton',1,27,NULL),(2,'Max','Verstappen',3,136,NULL),(3,'Fernando','Alonso',7,33,NULL),(4,'Sergio','Perez',3,103,NULL),(5,'George','Russell',1,37,NULL),(6,'Charles','Leclerc',2,98,NULL),(7,'Carlos','Sainz',2,83,NULL),(8,'Lando','Norris',4,83,NULL),(9,'Oscar','Piastri',4,41,NULL),(10,'Lance','Strol',7,9,NULL),(11,'Esteban','Ocon',10,1,NULL),(12,'Pierre','Gasly',10,0,NULL),(13,'Alexander','Albon',5,0,NULL),(14,'Logan','Sargeant',5,0,NULL),(15,'Yuki','Tsunoda',9,14,NULL),(16,'Daniel','Ricciardo',9,5,NULL),(17,'Valtteri','Bottas',12,0,NULL),(18,'Guanyu','Zhou',12,0,NULL),(19,'Kevin','Magnussen',11,1,NULL),(20,'Niko','Hulkenberg',11,6,NULL);
/*!40000 ALTER TABLE `bk_pilotos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carreras`
--

DROP TABLE IF EXISTS `carreras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carreras` (
  `Id_carrera` int NOT NULL AUTO_INCREMENT,
  `Circ` int NOT NULL,
  `Vueltas` int NOT NULL,
  `Fecha` date NOT NULL,
  PRIMARY KEY (`Id_carrera`),
  KEY `Circ` (`Circ`),
  CONSTRAINT `carreras_ibfk_1` FOREIGN KEY (`Circ`) REFERENCES `circuitos` (`Id_circuito`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carreras`
--

LOCK TABLES `carreras` WRITE;
/*!40000 ALTER TABLE `carreras` DISABLE KEYS */;
INSERT INTO `carreras` VALUES (1,6,57,'2024-03-02'),(2,2,50,'2024-03-09'),(3,3,58,'2024-03-24'),(4,15,53,'2024-04-07'),(5,8,56,'2024-04-21'),(6,18,57,'2024-05-05'),(7,9,63,'2024-05-19'),(8,19,78,'2024-05-26'),(9,7,70,'2024-06-09'),(10,10,66,'2024-06-23'),(11,4,71,'2024-06-30'),(12,12,52,'2024-07-07'),(13,13,70,'2024-07-21'),(14,11,44,'2024-07-28'),(15,20,72,'2024-08-25'),(16,14,53,'2024-09-01'),(17,5,51,'2024-09-15'),(20,17,71,'2024-10-27'),(21,22,71,'2024-11-03'),(22,16,50,'2024-11-23'),(23,21,57,'2024-12-01'),(24,1,58,'2024-12-08');
/*!40000 ALTER TABLE `carreras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `carrerascorridas`
--

DROP TABLE IF EXISTS `carrerascorridas`;
/*!50001 DROP VIEW IF EXISTS `carrerascorridas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `carrerascorridas` AS SELECT 
 1 AS `id_result`,
 1 AS `nombre`,
 1 AS `fecha`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `circuitos`
--

DROP TABLE IF EXISTS `circuitos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `circuitos` (
  `Id_circuito` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(30) NOT NULL,
  `Pais` varchar(20) NOT NULL,
  `Ciudad` varchar(20) NOT NULL,
  `Longitud` decimal(6,2) NOT NULL,
  PRIMARY KEY (`Id_circuito`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `circuitos`
--

LOCK TABLES `circuitos` WRITE;
/*!40000 ALTER TABLE `circuitos` DISABLE KEYS */;
INSERT INTO `circuitos` VALUES (1,'Yas Marina ','Abu Dhabi','Abu Dhabi',5282.00),(2,'Jeddah','Arabia Saudí','Jeddah',6174.00),(3,'Albert Park','Australia','Melbourne ',5278.00),(4,'Red Bull Ring','Austria','Spielberg',4318.00),(5,'Baku','Azerbaiyán','Bakú',6003.00),(6,'Sakhir','Bahréin','Sakhir',5412.00),(7,'Gilles Villeneuve','Canadá','Montreal',4361.00),(8,'Shanghai','China','Shanghái',5451.00),(9,'Emilia Romagna','Itala','Imola',4909.00),(10,'Circuit Barcelona Catalunya','España','Barcelona',4657.00),(11,'Spa-Francorchamps','Francia','Spa-Francorchamps',7004.00),(12,'Hungaroring','Hungría','Budapest',4381.00),(13,'Monza','Italia','Monza',5793.00),(14,'Suzuka','Japón','Suzuka',5807.00),(15,'Las Vegas','Estados Unidos','Las Vegas',6201.00),(16,'Autódromo Hermanos Rodríguez','México','Ciudad de México',4304.00),(17,'Hard Rock Stadium Circuit','Estados Unidos','Miami',5412.00),(18,'Montecarlo ','Mónaco','Montecarlo ',3337.00),(19,'Zandvoort','Países Bajos','Zandvoort',4259.00),(20,'Losail','Qatar','Losail',5419.00),(21,'Interlagos','Brasil','Sao Paulo',4309.00),(22,'Marina Bay','Singapur','Singapur',4940.00);
/*!40000 ALTER TABLE `circuitos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `circuitosfaltantes`
--

DROP TABLE IF EXISTS `circuitosfaltantes`;
/*!50001 DROP VIEW IF EXISTS `circuitosfaltantes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `circuitosfaltantes` AS SELECT 
 1 AS `id_circuito`,
 1 AS `nombre`,
 1 AS `pais`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `escuderias`
--

DROP TABLE IF EXISTS `escuderias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `escuderias` (
  `Id_esc` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(30) NOT NULL,
  `Pais` varchar(20) NOT NULL,
  `Fundacion` char(4) NOT NULL,
  `Camp_constr` int NOT NULL,
  `Puntos` int DEFAULT NULL,
  PRIMARY KEY (`Id_esc`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escuderias`
--

LOCK TABLES `escuderias` WRITE;
/*!40000 ALTER TABLE `escuderias` DISABLE KEYS */;
INSERT INTO `escuderias` VALUES (1,'Mercedes','Alemania','1954',8,NULL),(2,'Ferrari','Italia','1950',16,NULL),(3,'Red Bull','Austria','2005',4,NULL),(4,'McLaren','Reino Unido','1963',8,NULL),(5,'Williams','Reino Unido','1977',9,NULL),(6,'Renault','Francia','1977',2,NULL),(7,'Aston Martin','Reino Unido','1959',0,NULL),(8,'Alfa Romeo','Suiza','1910',0,NULL),(9,'AlphaTauri','Italia','2006',0,NULL),(10,'Alpine','Francia','2021',0,NULL),(11,'Haas','Estados Unidos','2016',0,NULL),(12,'Sauber','Suiza','1970',0,NULL),(13,'Force India','india','2007',0,NULL);
/*!40000 ALTER TABLE `escuderias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial_equipos`
--

DROP TABLE IF EXISTS `historial_equipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial_equipos` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Piloto` int NOT NULL,
  `Escuderia` int NOT NULL,
  `Temporada` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Piloto` (`Piloto`),
  KEY `Escuderia` (`Escuderia`),
  CONSTRAINT `historial_equipos_ibfk_1` FOREIGN KEY (`Piloto`) REFERENCES `pilotos` (`Id_piloto`),
  CONSTRAINT `historial_equipos_ibfk_2` FOREIGN KEY (`Escuderia`) REFERENCES `escuderias` (`Id_esc`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_equipos`
--

LOCK TABLES `historial_equipos` WRITE;
/*!40000 ALTER TABLE `historial_equipos` DISABLE KEYS */;
INSERT INTO `historial_equipos` VALUES (1,1,1,2024),(2,2,3,2024),(3,3,7,2024),(4,4,3,2024),(5,5,1,2024),(6,6,2,2024),(7,7,2,2024),(8,8,4,2024),(9,9,4,2024),(10,10,7,2024),(11,11,10,2024),(12,12,10,2024),(13,13,5,2024),(14,14,5,2024),(15,15,9,2024),(16,16,9,2024),(17,17,12,2024),(18,18,12,2024),(19,19,11,2024),(20,20,11,2024),(32,1,1,2020),(33,17,1,2020),(34,24,2,2020),(35,49,2,2020),(36,2,3,2020),(37,16,3,2020),(38,3,4,2020),(40,4,6,2020),(41,11,6,2020),(42,20,10,2020),(43,7,2,2020),(44,19,11,2020),(45,18,11,2020),(46,12,9,2020),(48,18,8,2020),(49,6,2,2020),(50,10,5,2020),(52,1,1,2021),(53,2,3,2021),(54,3,10,2021),(55,4,3,2021),(56,5,5,2021),(57,6,2,2021),(58,7,2,2021),(59,8,4,2021),(60,10,7,2021),(62,12,9,2021),(63,15,9,2021),(64,16,4,2021),(65,17,1,2021),(66,19,11,2021),(67,21,11,2021),(68,24,7,2021),(69,49,8,2021),(70,50,5,2021),(71,51,1,2021),(72,1,1,2019),(73,2,3,2019),(74,3,10,2019),(75,4,3,2019),(76,5,5,2019),(77,6,2,2019),(78,7,2,2019),(79,8,4,2019),(80,10,7,2019),(81,11,10,2019),(82,12,9,2019),(83,15,9,2019),(84,16,4,2019),(85,17,1,2019),(86,19,11,2019),(87,21,11,2019),(88,24,7,2019),(89,49,8,2019),(90,50,5,2019),(91,51,1,2019),(92,1,1,2018),(93,5,1,2018),(94,17,1,2018),(95,14,2,2018),(96,6,2,2018),(97,49,2,2018),(98,16,3,2018),(99,12,3,2018),(100,2,3,2018),(104,20,5,2018),(105,5,5,2018),(106,7,6,2018),(107,12,7,2018),(108,21,7,2018),(109,23,11,2018),(110,19,11,2018),(111,38,4,2018),(112,8,4,2018),(113,7,4,2018),(114,28,4,2018),(115,29,12,2018),(116,49,12,2018),(117,24,12,2018);
/*!40000 ALTER TABLE `historial_equipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incidencias`
--

DROP TABLE IF EXISTS `incidencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incidencias` (
  `Id_Incidencia` int NOT NULL AUTO_INCREMENT,
  `Tipo_inc` enum('BR','BA','P') NOT NULL,
  `Duracion` time(3) NOT NULL,
  `Carrera` int NOT NULL,
  `Piloto` int NOT NULL,
  PRIMARY KEY (`Id_Incidencia`),
  KEY `Piloto` (`Piloto`),
  KEY `Carrera` (`Carrera`),
  CONSTRAINT `incidencias_ibfk_1` FOREIGN KEY (`Piloto`) REFERENCES `pilotos` (`Id_piloto`),
  CONSTRAINT `incidencias_ibfk_2` FOREIGN KEY (`Carrera`) REFERENCES `carreras` (`Id_carrera`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incidencias`
--

LOCK TABLES `incidencias` WRITE;
/*!40000 ALTER TABLE `incidencias` DISABLE KEYS */;
INSERT INTO `incidencias` VALUES (1,'BR','00:01:20.000',1,5),(2,'P','00:00:05.000',5,18),(3,'P','00:00:01.000',4,3),(4,'P','00:00:03.000',1,9),(5,'BA','00:03:00.000',2,8);
/*!40000 ALTER TABLE `incidencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pilotos`
--

DROP TABLE IF EXISTS `pilotos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pilotos` (
  `Id_piloto` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(30) NOT NULL,
  `Apellidos` varchar(50) NOT NULL,
  `Pais` varchar(20) NOT NULL,
  `Red_Soc` varchar(30) DEFAULT NULL,
  `Fecha_Nac` date NOT NULL,
  `Escud` int NOT NULL,
  `Puntos` int NOT NULL,
  `TorneosGanados` int NOT NULL,
  `Estado` enum('1','0') NOT NULL,
  PRIMARY KEY (`Id_piloto`),
  KEY `Escud` (`Escud`),
  CONSTRAINT `pilotos_ibfk_1` FOREIGN KEY (`Escud`) REFERENCES `escuderias` (`Id_esc`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pilotos`
--

LOCK TABLES `pilotos` WRITE;
/*!40000 ALTER TABLE `pilotos` DISABLE KEYS */;
INSERT INTO `pilotos` VALUES (1,'Lewis','Hamilton','Reino Unido','@lewishamilton','1985-07-01',1,27,7,'1'),(2,'Max','Verstappen','Paises Bajos','@maxverstappen','1997-09-30',3,136,3,'1'),(3,'Fernando','Alonso','EspaÃ±a','@fernandoalo','1981-07-29',7,33,2,'1'),(4,'Sergio','Perez','Mexico','@schecoperez','1990-01-26',3,103,0,'1'),(5,'George','Russell','Reino Unido','@georgerussell63','1998-02-15',1,37,0,'1'),(6,'Charles','Leclerc','Monaco','@charles_leclerc','1997-10-16',2,98,0,'1'),(7,'Carlos','Sainz','EspaÃ±a','@carlossainz55','1994-09-01',2,83,0,'1'),(8,'Lando','Norris','Reino Unido','@landonorris','1999-11-13',4,83,0,'1'),(9,'Oscar','Piastri','Australia ','-','2001-06-04',4,41,0,'1'),(10,'Lance','Strol','Canada','@lance_stroll','1998-10-29',7,9,0,'1'),(11,'Esteban','Ocon','Francia','@estebanocon','1996-09-17',10,1,0,'1'),(12,'Pierre','Gasly','Francia','@pierregasly','1996-02-07',10,0,0,'1'),(13,'Alexander','Albon','Tailandia','@alex_albon','1996-07-03',5,0,0,'1'),(14,'Logan','Sargeant','Estados Unidos ','@logansargeant','2000-12-31',5,0,0,'1'),(15,'Yuki','Tsunoda','Japon','@yukitsunoda07','2000-11-05',9,14,0,'1'),(16,'Daniel','Ricciardo','Australia ','@danielricciardo','1989-07-01',9,5,0,'1'),(17,'Valtteri','Bottas','Finlandia','@valtteribottas','1989-08-28',12,0,0,'1'),(18,'Guanyu','Zhou','China','@gyzhou_33','1999-05-30',12,0,0,'1'),(19,'Kevin','Magnussen','Dinamarca','@kevinmagnussen','1992-10-05',11,1,0,'1'),(20,'Niko','Hulkenberg','Alemania ','@hulkhulkenberg','1987-08-19',11,6,0,'1'),(21,'Michael','Schumacher','Alemania','-','1969-03-01',1,0,7,'0'),(22,'Juan Manuel','Fangio','Argentina ','-','1911-06-24',2,0,5,'0'),(23,'Alain','Prost','Francia','@prost_official','1955-02-24',6,0,4,'0'),(24,'Sebastian','Vettel','Alemania ','@vettelofficial','1987-07-03',7,0,4,'0'),(25,'Jack',' Brabham','Australia ','-','1926-02-04',11,0,3,'0'),(26,'Jackie','Stewart','Reino Unido','@sirjackiestewart','1939-06-11',11,0,3,'0'),(27,'Niki','Lauda','Austria','-','1949-02-22',2,0,3,'0'),(28,'Nelson','Piquet','Brasil','-','1952-08-17',8,0,3,'0'),(29,'Ayrton','Senna','Brasil','-','1960-03-21',4,0,3,'0'),(30,'Alberto','Ascari','Italia','-','1918-07-13',2,0,2,'0'),(31,'Graham','Hill','Reino Unido','-','1929-02-15',5,0,2,'0'),(32,'Jim','Clark','Reino Unido','-','1936-04-03',5,0,2,'0'),(33,'Emerson','Fittipaldi','Brasil','-','1946-12-12',4,0,2,'0'),(34,'Mika','Hakkinen','Finlandia','@mikahakkinen','1968-09-28',4,0,2,'0'),(35,'Giuseppe','Farina','Italia','-','1906-10-30',8,0,1,'0'),(36,'Mike','Hawthorn','Reino Unido','-','1929-10-04',2,0,1,'0'),(37,'Phil','Hill','Reino Unido','-','1927-04-20',2,0,1,'0'),(38,'John',' Surtees','Reino Unido','-','1934-02-11',2,0,1,'0'),(39,'Denny','Hulme','Australia ','-','1936-06-18',4,0,1,'0'),(40,'Jochen','Rindt','Austria','-','1942-04-18',5,0,1,'0'),(41,'James',' Hunt','Reino Unido','-','1947-08-29',4,0,1,'0'),(42,'Mario',' Andretti','Estados Unidos ','-','1940-02-28',5,0,1,'0'),(43,'Jody','Scheckter','Sudafrica','-','1950-01-29',2,0,1,'0'),(44,'Alan','Jones','Australia ','-','1946-11-02',5,0,1,'0'),(45,'Keke',' Rosberg','Finlandia','-','1948-06-12',5,0,1,'0'),(46,'Nigel',' Mansell','Reino Unido','@nigelmansell','1953-08-08',5,0,1,'0'),(47,'Damon','Hill','Reino Unido','-','1960-09-17',5,0,1,'0'),(48,'Jacques','Villeneuve','Canada','@jacquesvilleneuve','1971-04-09',5,0,1,'0'),(49,'Kimi','Raikkonen','Finlandia','@kimimatiasraikkonen','1979-10-17',12,0,1,'0'),(50,'Jenson','Button','Reino Unido','@jensonbutton','1980-01-19',12,0,1,'0'),(51,'Nico','Rosberg','Alemania ','@nicorosberg','1985-06-27',1,0,1,'0'),(52,'Oliver','Bearman','Reino Unido',NULL,'2005-05-08',2,0,0,'0'),(53,'Lewis','Hamilton','Reino Unido','@lewishamilton','1985-07-01',1,27,7,'1'),(54,'Max','Verstappen','Paises Bajos','@maxverstappen','1997-09-30',3,136,3,'1'),(55,'Fernando','Alonso','EspaÃ±a','@fernandoalo','1981-07-29',7,33,2,'1'),(56,'Sergio','Perez','Mexico','@schecoperez','1990-01-26',3,103,0,'1'),(57,'George','Russell','Reino Unido','@georgerussell63','1998-02-15',1,37,0,'1'),(58,'Charles','Leclerc','Monaco','@charles_leclerc','1997-10-16',2,98,0,'1'),(59,'Carlos','Sainz','EspaÃ±a','@carlossainz55','1994-09-01',2,83,0,'1'),(60,'Lando','Norris','Reino Unido','@landonorris','1999-11-13',4,83,0,'1'),(61,'Oscar','Piastri','Australia ','-','2001-06-04',4,41,0,'1'),(62,'Lance','Strol','Canada','@lance_stroll','1998-10-29',7,9,0,'1'),(63,'Esteban','Ocon','Francia','@estebanocon','1996-09-17',10,1,0,'1'),(64,'Pierre','Gasly','Francia','@pierregasly','1996-02-07',10,0,0,'1'),(65,'Alexander','Albon','Tailandia','@alex_albon','1996-07-03',5,0,0,'1'),(66,'Logan','Sargeant','Estados Unidos ','@logansargeant','2000-12-31',5,0,0,'1'),(67,'Yuki','Tsunoda','Japon','@yukitsunoda07','2000-11-05',9,14,0,'1'),(68,'Daniel','Ricciardo','Australia ','@danielricciardo','1989-07-01',9,5,0,'1'),(69,'Valtteri','Bottas','Finlandia','@valtteribottas','1989-08-28',12,0,0,'1'),(70,'Guanyu','Zhou','China','@gyzhou_33','1999-05-30',12,0,0,'1'),(71,'Kevin','Magnussen','Dinamarca','@kevinmagnussen','1992-10-05',11,1,0,'1'),(72,'Niko','Hulkenberg','Alemania ','@hulkhulkenberg','1987-08-19',11,6,0,'1'),(73,'Michael','Schumacher','Alemania','-','1969-03-01',1,0,7,'0'),(74,'Juan Manuel','Fangio','Argentina ','-','1911-06-24',2,0,5,'0'),(75,'Alain','Prost','Francia','@prost_official','1955-02-24',6,0,4,'0'),(76,'Sebastian','Vettel','Alemania ','@vettelofficial','1987-07-03',7,0,4,'0'),(77,'Jack',' Brabham','Australia ','-','1926-02-04',11,0,3,'0'),(78,'Jackie','Stewart','Reino Unido','@sirjackiestewart','1939-06-11',11,0,3,'0'),(79,'Niki','Lauda','Austria','-','1949-02-22',2,0,3,'0'),(80,'Nelson','Piquet','Brasil','-','1952-08-17',8,0,3,'0'),(81,'Ayrton','Senna','Brasil','-','1960-03-21',4,0,3,'0'),(82,'Alberto','Ascari','Italia','-','1918-07-13',2,0,2,'0'),(83,'Graham','Hill','Reino Unido','-','1929-02-15',5,0,2,'0'),(84,'Jim','Clark','Reino Unido','-','1936-04-03',5,0,2,'0'),(85,'Emerson','Fittipaldi','Brasil','-','1946-12-12',4,0,2,'0'),(86,'Mika','Hakkinen','Finlandia','@mikahakkinen','1968-09-28',4,0,2,'0'),(87,'Giuseppe','Farina','Italia','-','1906-10-30',8,0,1,'0'),(88,'Mike','Hawthorn','Reino Unido','-','1929-10-04',2,0,1,'0'),(89,'Phil','Hill','Reino Unido','-','1927-04-20',2,0,1,'0'),(90,'John',' Surtees','Reino Unido','-','1934-02-11',2,0,1,'0'),(91,'Denny','Hulme','Australia ','-','1936-06-18',4,0,1,'0'),(92,'Jochen','Rindt','Austria','-','1942-04-18',5,0,1,'0'),(93,'James',' Hunt','Reino Unido','-','1947-08-29',4,0,1,'0'),(94,'Mario',' Andretti','Estados Unidos ','-','1940-02-28',5,0,1,'0'),(95,'Jody','Scheckter','Sudafrica','-','1950-01-29',2,0,1,'0'),(96,'Alan','Jones','Australia ','-','1946-11-02',5,0,1,'0'),(97,'Keke',' Rosberg','Finlandia','-','1948-06-12',5,0,1,'0'),(98,'Nigel',' Mansell','Reino Unido','@nigelmansell','1953-08-08',5,0,1,'0'),(99,'Damon','Hill','Reino Unido','-','1960-09-17',5,0,1,'0'),(100,'Jacques','Villeneuve','Canada','@jacquesvilleneuve','1971-04-09',5,0,1,'0'),(101,'Kimi','Raikkonen','Finlandia','@kimimatiasraikkonen','1979-10-17',12,0,1,'0'),(102,'Jenson','Button','Reino Unido','@jensonbutton','1980-01-19',12,0,1,'0'),(103,'Nico','Rosberg','Alemania ','@nicorosberg','1985-06-27',1,0,1,'0');
/*!40000 ALTER TABLE `pilotos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `pilotosactivos`
--

DROP TABLE IF EXISTS `pilotosactivos`;
/*!50001 DROP VIEW IF EXISTS `pilotosactivos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `pilotosactivos` AS SELECT 
 1 AS `nombre`,
 1 AS `apellidos`,
 1 AS `escuderia`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `podios_carreras`
--

DROP TABLE IF EXISTS `podios_carreras`;
/*!50001 DROP VIEW IF EXISTS `podios_carreras`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `podios_carreras` AS SELECT 
 1 AS `Nombre_Circuito`,
 1 AS `Pais`,
 1 AS `Fecha_Carrera`,
 1 AS `Orden_Podio`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `resultados`
--

DROP TABLE IF EXISTS `resultados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resultados` (
  `Id_Result` int NOT NULL AUTO_INCREMENT,
  `Carrera` int NOT NULL,
  `Primer_puesto` int NOT NULL,
  `Seg_puesto` int NOT NULL,
  `Terc_puesto` int NOT NULL,
  `Cuarto_puesto` int NOT NULL,
  `Quinto_puesto` int NOT NULL,
  `Sexto_puesto` int NOT NULL,
  `Sept_puesto` int NOT NULL,
  `Octav_puesto` int NOT NULL,
  `Noven_puesto` int NOT NULL,
  `Decim_puesto` int NOT NULL,
  `Vuelta_rapida` int NOT NULL,
  PRIMARY KEY (`Id_Result`),
  KEY `Carrera` (`Carrera`),
  KEY `Primer_puesto` (`Primer_puesto`),
  KEY `Seg_puesto` (`Seg_puesto`),
  KEY `Terc_puesto` (`Terc_puesto`),
  KEY `Cuarto_puesto` (`Cuarto_puesto`),
  KEY `Quinto_puesto` (`Quinto_puesto`),
  KEY `Sexto_puesto` (`Sexto_puesto`),
  KEY `Sept_puesto` (`Sept_puesto`),
  KEY `Octav_puesto` (`Octav_puesto`),
  KEY `Noven_puesto` (`Noven_puesto`),
  KEY `Decim_puesto` (`Decim_puesto`),
  KEY `Vuelta_rapida` (`Vuelta_rapida`),
  CONSTRAINT `resultados_ibfk_1` FOREIGN KEY (`Carrera`) REFERENCES `carreras` (`Id_carrera`),
  CONSTRAINT `resultados_ibfk_10` FOREIGN KEY (`Noven_puesto`) REFERENCES `pilotos` (`Id_piloto`),
  CONSTRAINT `resultados_ibfk_11` FOREIGN KEY (`Decim_puesto`) REFERENCES `pilotos` (`Id_piloto`),
  CONSTRAINT `resultados_ibfk_12` FOREIGN KEY (`Vuelta_rapida`) REFERENCES `pilotos` (`Id_piloto`),
  CONSTRAINT `resultados_ibfk_2` FOREIGN KEY (`Primer_puesto`) REFERENCES `pilotos` (`Id_piloto`),
  CONSTRAINT `resultados_ibfk_3` FOREIGN KEY (`Seg_puesto`) REFERENCES `pilotos` (`Id_piloto`),
  CONSTRAINT `resultados_ibfk_4` FOREIGN KEY (`Terc_puesto`) REFERENCES `pilotos` (`Id_piloto`),
  CONSTRAINT `resultados_ibfk_5` FOREIGN KEY (`Cuarto_puesto`) REFERENCES `pilotos` (`Id_piloto`),
  CONSTRAINT `resultados_ibfk_6` FOREIGN KEY (`Quinto_puesto`) REFERENCES `pilotos` (`Id_piloto`),
  CONSTRAINT `resultados_ibfk_7` FOREIGN KEY (`Sexto_puesto`) REFERENCES `pilotos` (`Id_piloto`),
  CONSTRAINT `resultados_ibfk_8` FOREIGN KEY (`Sept_puesto`) REFERENCES `pilotos` (`Id_piloto`),
  CONSTRAINT `resultados_ibfk_9` FOREIGN KEY (`Octav_puesto`) REFERENCES `pilotos` (`Id_piloto`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resultados`
--

LOCK TABLES `resultados` WRITE;
/*!40000 ALTER TABLE `resultados` DISABLE KEYS */;
INSERT INTO `resultados` VALUES (1,1,2,4,7,6,5,8,1,9,3,10,2),(2,2,2,4,6,9,3,5,52,8,1,20,6),(3,3,7,6,8,9,4,10,15,3,20,19,6),(4,4,2,4,7,6,8,3,5,9,7,15,2),(5,5,2,8,4,6,7,5,3,9,1,20,3),(6,6,8,2,6,4,7,1,15,5,3,11,9);
/*!40000 ALTER TABLE `resultados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `top3`
--

DROP TABLE IF EXISTS `top3`;
/*!50001 DROP VIEW IF EXISTS `top3`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `top3` AS SELECT 
 1 AS `nombre`,
 1 AS `apellidos`,
 1 AS `puntos`,
 1 AS `escuderia`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `carrerascorridas`
--

/*!50001 DROP VIEW IF EXISTS `carrerascorridas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `carrerascorridas` AS select `resultados`.`Id_Result` AS `id_result`,`circuitos`.`Nombre` AS `nombre`,`carreras`.`Fecha` AS `fecha` from ((`resultados` join `carreras` on((`carreras`.`Id_carrera` = `resultados`.`Carrera`))) join `circuitos` on((`carreras`.`Circ` = `circuitos`.`Id_circuito`))) where (`carreras`.`Id_carrera` is not null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `circuitosfaltantes`
--

/*!50001 DROP VIEW IF EXISTS `circuitosfaltantes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `circuitosfaltantes` AS select `circuitos`.`Id_circuito` AS `id_circuito`,`circuitos`.`Nombre` AS `nombre`,`circuitos`.`Pais` AS `pais` from ((`circuitos` join `carreras` on((`circuitos`.`Id_circuito` = `carreras`.`Circ`))) left join `resultados` on((`carreras`.`Id_carrera` = `resultados`.`Carrera`))) where (`resultados`.`Carrera` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `pilotosactivos`
--

/*!50001 DROP VIEW IF EXISTS `pilotosactivos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pilotosactivos` AS select `pilotos`.`Nombre` AS `nombre`,`pilotos`.`Apellidos` AS `apellidos`,`escuderias`.`Nombre` AS `escuderia` from (`pilotos` join `escuderias` on((`pilotos`.`Escud` = `escuderias`.`Id_esc`))) where (`pilotos`.`Estado` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `podios_carreras`
--

/*!50001 DROP VIEW IF EXISTS `podios_carreras`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `podios_carreras` AS select `circuitos`.`Nombre` AS `Nombre_Circuito`,`circuitos`.`Pais` AS `Pais`,`carreras`.`Fecha` AS `Fecha_Carrera`,group_concat(`pilotos`.`Nombre`,' ',`pilotos`.`Apellidos`,' ' separator ',') AS `Orden_Podio` from (((`circuitos` join `carreras` on((`circuitos`.`Id_circuito` = `carreras`.`Circ`))) left join `resultados` on((`carreras`.`Id_carrera` = `resultados`.`Carrera`))) join `pilotos` on(((`resultados`.`Primer_puesto` = `pilotos`.`Id_piloto`) or (`resultados`.`Seg_puesto` = `pilotos`.`Id_piloto`) or (`resultados`.`Terc_puesto` = `pilotos`.`Id_piloto`)))) group by `carreras`.`Id_carrera` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `top3`
--

/*!50001 DROP VIEW IF EXISTS `top3`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `top3` AS select `pilotos`.`Nombre` AS `nombre`,`pilotos`.`Apellidos` AS `apellidos`,`pilotos`.`Puntos` AS `puntos`,`escuderias`.`Nombre` AS `escuderia` from (`pilotos` join `escuderias` on((`pilotos`.`Escud` = `escuderias`.`Id_esc`))) where (`pilotos`.`Estado` = 1) order by `pilotos`.`Puntos` desc limit 3 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-17 19:13:29
