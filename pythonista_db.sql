-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: pythonista
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `chapters`
--

DROP TABLE IF EXISTS `chapters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chapters` (
  `id` int NOT NULL,
  `chapter_name` varchar(45) NOT NULL,
  PRIMARY KEY (`chapter_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chapters`
--

LOCK TABLES `chapters` WRITE;
/*!40000 ALTER TABLE `chapters` DISABLE KEYS */;
INSERT INTO `chapters` VALUES (9,'AdvancedTest'),(5,'BasicsTest'),(2,'Chapter1'),(3,'Chapter2'),(4,'Chapter3'),(6,'Chapter4'),(7,'Chapter5'),(8,'Chapter6'),(10,'Chapter7'),(11,'Chapter8'),(12,'Chapter9'),(13,'ExpertTest'),(1,'Quickstart');
/*!40000 ALTER TABLE `chapters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chapters_users_info`
--

DROP TABLE IF EXISTS `chapters_users_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chapters_users_info` (
  `user_id` int NOT NULL,
  `chapter_name` varchar(100) NOT NULL,
  PRIMARY KEY (`user_id`,`chapter_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chapters_users_info`
--

LOCK TABLES `chapters_users_info` WRITE;
/*!40000 ALTER TABLE `chapters_users_info` DISABLE KEYS */;
INSERT INTO `chapters_users_info` VALUES (3,'Quickstart');
/*!40000 ALTER TABLE `chapters_users_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests`
--

DROP TABLE IF EXISTS `tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tests` (
  `id` int NOT NULL,
  `test_name` varchar(45) NOT NULL,
  PRIMARY KEY (`test_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests`
--

LOCK TABLES `tests` WRITE;
/*!40000 ALTER TABLE `tests` DISABLE KEYS */;
INSERT INTO `tests` VALUES (9,'AdvancedTest_test'),(5,'BasicsTest_test'),(2,'Chapter1_test'),(3,'Chapter2_test'),(4,'Chapter3_test'),(6,'Chapter4_test'),(7,'Chapter5_test'),(8,'Chapter6_test'),(10,'Chapter7_test'),(11,'Chapter8_test'),(12,'Chapter9_test'),(13,'ExpertTest_test'),(1,'Quickstart_test');
/*!40000 ALTER TABLE `tests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests_questions`
--

DROP TABLE IF EXISTS `tests_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tests_questions` (
  `test_name` varchar(100) NOT NULL,
  `question_type` varchar(20) NOT NULL,
  `question` varchar(300) NOT NULL,
  `right_answer` varchar(100) NOT NULL,
  `multiple1` varchar(100) DEFAULT NULL,
  `multiple2` varchar(100) DEFAULT NULL,
  `multiple3` varchar(100) DEFAULT NULL,
  `multiple4` varchar(100) DEFAULT NULL,
  `chapter_name` varchar(45) NOT NULL,
  `subchapter` varchar(100) NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests_questions`
--

LOCK TABLES `tests_questions` WRITE;
/*!40000 ALTER TABLE `tests_questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tests_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests_users_info`
--

DROP TABLE IF EXISTS `tests_users_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tests_users_info` (
  `user_id` int NOT NULL,
  `test_name` varchar(100) NOT NULL,
  `score` int DEFAULT NULL,
  PRIMARY KEY (`user_id`,`test_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests_users_info`
--

LOCK TABLES `tests_users_info` WRITE;
/*!40000 ALTER TABLE `tests_users_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `tests_users_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_info`
--

DROP TABLE IF EXISTS `users_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_info` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(64) NOT NULL,
  `salt` binary(32) NOT NULL,
  `email` varchar(254) NOT NULL,
  `age` int NOT NULL,
  `teacher` tinyint DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_info`
--

LOCK TABLES `users_info` WRITE;
/*!40000 ALTER TABLE `users_info` DISABLE KEYS */;
INSERT INTO `users_info` VALUES (2,'elena1234','fcd5ca02faa92138393ff718dda40daf943bf759f77b343a7b21aaea2ab8760c',_binary 'ó∏ü£i§U\¬\'ÑBgP?¢ç_\Õp£9Ñ\r2\ÓK\ÿ\÷9õ','example@domain.gr',21,1),(3,'antonis1234','65c4413dc30c6185e2c61c4ca9662609f909b669f362783400cb9f1eed260aca',_binary 'Wx◊ñB«¢\÷f˜z™\Ìgyñ÷ÑFif\ÎÚ\È\\∏¡E','example@domain.com',22,NULL),(10,'kostas1234','3158ac5ea8007a21c07242da361e30a71a23ff24bf985a218d81c9760ff3c86f',_binary '>öJ`\∆ná>V\0Y\œ#∫Ö•	Õ∑mnù=Ú4’Ö~=$','example@domain.it',53,NULL);
/*!40000 ALTER TABLE `users_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-25 23:56:39
