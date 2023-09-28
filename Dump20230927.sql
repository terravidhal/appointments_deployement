-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: appointments_db
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tasks` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_appointments_users_idx` (`user_id`),
  CONSTRAINT `fk_appointments_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
INSERT INTO `appointments` VALUES (1,'Max\'s Playdate','2023-09-14','Pending','2023-09-27 12:51:21','2023-09-27 12:51:21',2),(2,'Doctor appointement','2023-09-15','Done','2023-09-27 12:57:35','2023-09-27 13:22:14',2),(4,'cinema','2023-09-05','Done','2023-09-27 13:02:13','2023-09-27 13:02:13',2),(5,'dinner with marianes','2023-08-12','Done','2023-09-27 13:03:54','2023-09-27 13:21:36',1),(6,'football','2023-09-09','Missed','2023-09-27 13:34:01','2023-09-27 13:34:01',2),(7,'basketball','2023-09-14','Pending','2023-09-27 13:57:27','2023-09-27 13:57:27',1),(8,'diner with andrea','2023-09-02','Done','2023-09-27 14:04:10','2023-09-27 14:04:10',1),(9,'volley ball','2023-09-15','Missed','2023-09-27 14:05:39','2023-09-27 14:05:39',1),(10,'golf','2023-09-25','Pending','2023-09-27 14:05:54','2023-09-27 14:05:54',1),(11,'boxe','2023-09-06','Missed','2023-09-27 14:16:38','2023-09-27 14:16:38',1),(12,'barbecue','2023-09-14','Missed','2023-09-27 14:19:40','2023-09-27 14:19:40',2),(13,'recipes gambas','2023-09-26','Pending','2023-09-27 14:39:57','2023-09-27 14:39:57',2),(14,'recipes gmbas','2023-09-19','Pending','2023-09-27 14:50:59','2023-09-27 14:50:59',2),(15,'gambas','2023-09-29','Pending','2023-09-27 14:56:39','2023-09-27 14:56:39',1),(16,'danse','2023-09-28','Pending','2023-09-27 15:14:20','2023-09-27 15:14:20',1),(17,'recipes beeftect','2023-09-29','Pending','2023-09-27 15:26:29','2023-09-27 15:26:29',2),(19,'recipes gambas','2023-09-29','Missed','2023-09-27 15:29:27','2023-09-27 15:29:27',3),(20,'recipes beefteck','2023-09-29','Done','2023-09-27 15:29:44','2023-09-27 15:29:44',3);
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'terra','vidhal','terravidhal@gmail.com','$2b$12$aHG7Qpnbs7n9n1PE8YXsc.PTqGa3pCmIRtz2tQ2/WuDUUx30r8kra','2023-09-27 12:47:52','2023-09-27 12:47:52'),(2,'nick','santora','nicksantora@gmail.com','$2b$12$ugHfZ9KXLP6lhGOBowDONODTwm6mDAx8qiLhKDaxPXA7R6bNR3FLa','2023-09-27 12:48:50','2023-09-27 12:48:50'),(3,'tom','hanks','tomhanks@gmail.com','$2b$12$iFmpvIxkg50FQne1/D9/m.ZpnCEo8Qw.pYAjPNchVbWESGCkwZaEm','2023-09-27 15:28:40','2023-09-27 15:28:40');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-27 16:16:47
