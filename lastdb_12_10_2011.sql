-- MySQL dump 10.13  Distrib 5.1.51, for apple-darwin10.4.0 (i386)
--
-- Host: localhost    Database: newproject
-- ------------------------------------------------------
-- Server version	5.1.51

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `applications`
--

DROP TABLE IF EXISTS `applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `applications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `serial` int(11) NOT NULL,
  `mac` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `groupapp_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `activate` tinyint(1) DEFAULT '1',
  `old_serial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reboot` varchar(255) COLLATE utf8_unicode_ci DEFAULT '0',
  `statpaiement` tinyint(1) DEFAULT '0',
  `remotename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remotevalue` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ville` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'Ville non renseigne',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applications`
--

LOCK TABLES `applications` WRITE;
/*!40000 ALTER TABLE `applications` DISABLE KEYS */;
INSERT INTO `applications` VALUES (2,'mediawall - 54',426374,NULL,'2010-09-07 16:33:06','2011-02-08 11:15:19',NULL,1,3,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(3,'testplans',558156,NULL,'2010-10-19 09:13:54','2011-02-02 20:57:16',NULL,3,3,1,NULL,'remoteassistance',0,NULL,NULL,'Ville non renseigne'),(4,'testcentury21',692072,NULL,'2010-11-03 17:29:04','2011-02-03 10:25:45',NULL,1,3,1,NULL,'reboot',1,NULL,NULL,'Ville non renseigne'),(5,'',706171,'58:b0:35:ff:e6:98','2010-11-22 17:01:56','2011-02-02 20:32:10',NULL,1,3,1,NULL,'0',0,NULL,NULL,'(Private Address)'),(6,'test',596010,NULL,'2010-11-29 17:41:56','2011-02-02 21:00:02',NULL,1,4,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(7,'test',375847,NULL,'2010-11-29 17:42:42','2010-11-29 17:42:42',NULL,1,2,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(8,'test',263345,NULL,'2010-11-29 17:54:52','2010-11-29 17:54:52',NULL,1,2,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(9,'test',638874,NULL,'2010-11-29 17:56:10','2010-11-29 17:56:10',NULL,1,2,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(11,'test',809674,NULL,'2010-11-29 17:58:03','2010-11-29 17:58:03',NULL,1,2,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(12,'test',385535,NULL,'2010-11-29 17:59:47','2010-11-29 17:59:47',NULL,1,2,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(13,'test',767677,NULL,'2010-11-29 18:00:01','2010-11-29 18:00:01',NULL,1,2,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(14,'test',631058,NULL,'2010-11-29 18:00:09','2010-11-29 18:00:09',NULL,1,2,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(15,'test',954758,NULL,'2010-11-29 18:00:44','2010-11-29 18:00:44',NULL,1,2,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(16,'',636785,NULL,'2010-11-29 18:01:27','2011-02-02 20:14:41',NULL,1,2,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(17,'fdsffdsfds',87811,NULL,'2010-11-29 18:02:18','2010-11-29 18:02:18',NULL,1,3,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(18,'dsfsdfsd',558205,NULL,'2010-11-29 18:04:39','2010-11-29 18:04:39',NULL,1,2,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(19,'',848697,NULL,'2010-11-29 18:05:20','2010-11-29 18:05:20',NULL,1,3,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(20,'',755796,NULL,'2010-11-29 18:05:57','2010-11-29 18:05:57',NULL,1,2,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(21,'rr',871164,NULL,'2010-11-30 15:30:02','2010-11-30 15:30:02',NULL,1,2,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(22,'mdr',289149,NULL,'2010-12-01 14:03:08','2010-12-01 14:03:08',NULL,1,4,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(24,'mm',189199,NULL,'2010-12-01 17:58:02','2010-12-01 17:58:02',NULL,1,2,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(25,'',187260,NULL,'2010-12-01 18:01:08','2010-12-01 18:01:08',NULL,1,4,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(26,'',295254,NULL,'2010-12-01 18:02:46','2010-12-09 14:36:37',NULL,1,4,1,NULL,'0',1,NULL,NULL,'Ville non renseigne'),(27,'',358105,NULL,'2010-12-01 18:04:17','2010-12-01 18:04:17',NULL,1,3,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(28,'',567192,NULL,'2010-12-01 18:05:52','2010-12-01 18:05:52',NULL,1,4,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(29,'',704680,NULL,'2010-12-01 18:06:26','2010-12-01 18:06:26',NULL,1,4,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(30,'testmediawallgroups',276450,NULL,'2010-12-03 10:57:01','2010-12-03 10:57:01',NULL,1,6,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(31,'mediawall - 29',73890,NULL,'2010-12-07 14:28:42','2010-12-07 14:33:21',NULL,1,3,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(32,'mediawall - 30',517027,NULL,'2010-12-07 14:49:30','2010-12-07 14:50:31',NULL,1,4,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(33,'mediawall - 30',379545,NULL,'2010-12-07 14:51:44','2010-12-07 14:51:44',NULL,1,4,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(34,'mediawall - 31',145577,NULL,'2010-12-07 14:53:17','2010-12-07 14:53:17',NULL,1,4,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(35,'mediawall - 32',848864,NULL,'2010-12-07 14:55:30','2010-12-07 14:55:30',NULL,1,4,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(36,'mediawall - 33',474766,NULL,'2010-12-07 14:56:41','2010-12-07 14:56:41',NULL,1,4,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(37,'mediawall - 34',396831,NULL,'2010-12-07 14:57:11','2010-12-07 14:57:11',NULL,1,4,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(38,'mediawall - 35',353538,NULL,'2010-12-07 14:57:36','2010-12-07 14:57:36',NULL,1,4,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(39,'mediawall - 36',678418,NULL,'2010-12-13 10:35:45','2010-12-13 10:35:45',NULL,1,4,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(40,'mediawall - 36',551445,NULL,'2010-12-13 10:40:42','2010-12-13 10:40:42',NULL,1,4,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(41,'PDF Reader-test',418296,NULL,'2010-12-27 11:17:04','2010-12-27 11:17:04',NULL,6,1,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(42,'testgrouproles - 0',823443,NULL,'2010-12-30 10:35:04','2010-12-30 10:35:04',NULL,7,1,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(43,'testgrouproles - 1',741126,NULL,'2010-12-30 10:36:43','2010-12-30 10:36:43',NULL,7,1,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(44,'testgrouproles-2',337585,NULL,'2011-01-28 13:31:54','2011-02-24 17:06:51',NULL,7,34,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(45,'mediawall - testmigratecurrentversion',77262,NULL,'2011-01-28 14:00:40','2011-01-28 14:00:40',NULL,1,1,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(46,'mediawall - testmigratecurrentversion',779041,NULL,'2011-01-28 14:00:59','2011-01-28 14:00:59',NULL,1,1,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(47,'mediawall - testmigratecurrentversion',842365,NULL,'2011-01-28 14:01:38','2011-01-28 14:01:38',NULL,1,1,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(48,'mediawall - testmigratecurrentversion',735069,NULL,'2011-01-28 14:02:28','2011-01-28 14:02:28',NULL,1,1,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(49,'mediawall - testmigratecurrentversion',235506,NULL,'2011-01-28 14:03:13','2011-01-28 14:03:13',NULL,1,1,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(50,'mediawall - testmigratecurrentversion',870508,NULL,'2011-01-28 14:06:01','2011-01-28 14:06:01',NULL,1,4,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(51,'mediawall - 43',943144,NULL,'2011-01-28 14:08:42','2011-01-28 14:08:42',NULL,1,4,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(52,'mediawall - 44',60129,NULL,'2011-01-28 14:11:20','2011-01-28 14:11:20',NULL,1,25,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(53,'mediawall - 44',702865,NULL,'2011-01-28 14:13:29','2011-01-28 14:13:29',NULL,1,25,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(54,'mediawall - 46',566245,NULL,'2011-01-28 14:13:37','2011-01-28 14:13:37',NULL,1,25,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(55,'mediawall - 46',133044,NULL,'2011-01-28 14:15:14','2011-01-28 14:15:14',NULL,1,25,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(56,'mediawall - restestmigrate',956515,NULL,'2011-01-28 14:15:52','2011-01-28 14:15:52',NULL,1,4,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(57,'mediawall - restestmigrate',183728,NULL,'2011-01-28 14:16:10','2011-01-28 14:16:10',NULL,1,4,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(58,'mediawall - oyyyyyyyyeeeeeeee',273603,NULL,'2011-01-28 14:17:05','2011-01-28 14:17:05',NULL,1,4,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(59,'mediawall - nicolasencoretest',344851,NULL,'2011-01-28 14:17:59','2011-01-28 14:17:59',NULL,1,4,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(60,'mediawall - 52',462974,NULL,'2011-01-28 14:18:45','2011-01-28 14:18:45',NULL,1,28,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(61,'testoupsencore - 0',346433,NULL,'2011-02-04 16:20:23','2011-02-04 16:20:23',NULL,8,1,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(62,'testoupsencore - 1',360058,NULL,'2011-02-04 16:21:46','2011-02-04 16:21:46',NULL,8,2,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(63,'testoupsencore - 2',26058,NULL,'2011-02-04 16:27:02','2011-02-04 16:27:02',NULL,8,35,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(64,'mediawall - 53',1765,NULL,'2011-02-07 13:14:09','2011-02-07 13:14:09',NULL,1,35,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(65,'testgrouproles - 3',94435,NULL,'2011-02-07 13:31:03','2011-02-24 17:06:51',NULL,7,35,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(66,'testoupsencore - 3',763151,NULL,'2011-02-07 13:32:30','2011-02-07 13:32:30',NULL,8,35,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(67,'testoupsencore - 4',137028,NULL,'2011-02-07 13:46:32','2011-02-07 13:46:32',NULL,8,35,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(68,'testgrouproles - testversiondefault',632886,NULL,'2011-03-02 13:43:04','2011-03-02 13:43:04',NULL,7,1,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(69,'testgrouproles - testversiondefaultbis',30338,NULL,'2011-03-02 14:00:07','2011-03-02 14:00:07',NULL,7,1,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(70,'testgrouproles - currenversion',71177,NULL,'2011-03-08 11:54:06','2011-03-08 11:54:06',NULL,7,1,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(71,'testgrouproles - 7',554439,NULL,'2011-03-08 14:19:17','2011-03-08 14:19:17',NULL,7,1,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(72,'mediawall - testsame',713173,NULL,'2011-03-09 11:23:56','2011-03-09 11:23:56',NULL,1,1,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(73,'mediawall - testsame',167463,NULL,'2011-03-09 11:25:09','2011-03-09 11:25:09',NULL,1,1,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(74,'mediawall - testsame',278936,NULL,'2011-03-09 11:25:32','2011-03-09 11:25:32',NULL,1,1,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(75,'mediawall - 57',728213,NULL,'2011-03-09 11:26:13','2011-03-09 11:26:13',NULL,1,1,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(76,'mediawall - 58',356588,NULL,'2011-03-09 11:26:49','2011-03-09 11:26:49',NULL,1,1,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(77,'mediawall - 59',546263,NULL,'2011-03-09 11:28:09','2011-03-09 11:28:09',NULL,1,1,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(78,'mediawall - 60',873820,NULL,'2011-03-09 11:28:52','2011-03-09 11:28:52',NULL,1,1,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(79,'mediawall - 61',34054,NULL,'2011-03-09 11:29:30','2011-03-09 11:29:30',NULL,1,1,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(80,'mediawall - 62',636270,NULL,'2011-03-09 11:31:59','2011-03-09 11:31:59',NULL,1,1,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(81,'mediawall - testnicolasmdr',564052,NULL,'2011-03-09 13:28:10','2011-03-09 13:28:10',NULL,1,1,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(82,'mediawall - encoretestnicolas',900962,NULL,'2011-03-09 13:45:14','2011-03-09 13:45:14',NULL,1,1,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(83,'mediawall - testbaseversioncurrent',403116,NULL,'2011-03-10 10:36:32','2011-03-10 10:36:32',NULL,1,1,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(84,'mediawall - testbaseversion',134131,NULL,'2011-03-10 10:38:16','2011-03-10 10:38:16',NULL,1,1,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(85,'mediawall - testbaseversion',970598,NULL,'2011-03-10 10:40:22','2011-03-10 10:40:22',NULL,1,1,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(86,'mediawall - testbaseversion',332901,NULL,'2011-03-10 10:42:11','2011-03-10 10:42:11',NULL,1,1,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(87,'mediawall - 68',324145,NULL,'2011-03-10 10:43:23','2011-03-10 10:43:23',NULL,1,1,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(88,'mediawall - 69',280520,NULL,'2011-03-10 10:44:07','2011-03-10 10:44:07',NULL,1,1,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(89,'testoupsencore - 5',794527,NULL,'2011-03-10 11:00:22','2011-03-10 11:00:22',NULL,8,1,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(90,'mediawall - 70',541165,NULL,'2011-03-10 12:53:17','2011-03-10 12:53:17',NULL,1,1,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(91,'mediawall - 71',535463,NULL,'2011-03-10 12:55:18','2011-03-10 12:55:18',NULL,1,1,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(92,'mediawall - 72',292185,NULL,'2011-03-10 13:06:03','2011-03-10 13:06:03',NULL,1,1,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(93,'mediawall - 73',813924,NULL,'2011-03-10 14:53:38','2011-03-10 14:53:38',NULL,1,1,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(94,'mediawall - 74',747740,NULL,'2011-03-10 15:01:25','2011-03-10 15:01:25',NULL,1,1,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(95,'mediawall - 75',589572,NULL,'2011-03-15 16:10:17','2011-03-15 16:10:17',NULL,1,1,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(96,'mediawall - 76',610590,NULL,'2011-04-05 11:23:08','2011-04-05 11:23:08',NULL,1,1,1,NULL,'0',0,NULL,NULL,'Ville non renseigne'),(97,'mediawall - 76',32719,NULL,'2011-04-05 11:23:29','2011-04-05 11:23:29',NULL,1,1,1,NULL,'0',0,NULL,NULL,'Ville non renseigne');
/*!40000 ALTER TABLE `applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applications_users`
--

DROP TABLE IF EXISTS `applications_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `applications_users` (
  `user_id` int(11) NOT NULL,
  `application_id` int(11) NOT NULL,
  KEY `application_id` (`application_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applications_users`
--

LOCK TABLES `applications_users` WRITE;
/*!40000 ALTER TABLE `applications_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `applications_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avoirs`
--

DROP TABLE IF EXISTS `avoirs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avoirs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fichiercompression_id` int(11) NOT NULL,
  `application_id` int(11) NOT NULL,
  `currentversion` tinyint(1) DEFAULT '0',
  `archive_currentversion` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `application_id` (`application_id`),
  KEY `fichiercompression_id` (`fichiercompression_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9267 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avoirs`
--

LOCK TABLES `avoirs` WRITE;
/*!40000 ALTER TABLE `avoirs` DISABLE KEYS */;
INSERT INTO `avoirs` VALUES (8482,428,45,0,0),(8483,428,46,0,0),(8484,428,47,0,0),(8485,428,48,0,0),(8486,428,49,0,0),(8487,428,72,0,0),(8488,428,73,0,0),(8489,428,74,0,0),(8490,428,75,0,0),(8491,428,76,0,0),(8492,428,77,0,0),(8493,428,78,0,0),(8494,428,79,0,0),(8495,428,80,0,0),(8496,428,81,0,0),(8497,428,82,0,0),(8498,428,83,0,0),(8499,428,84,0,0),(8500,428,85,0,0),(8501,428,86,0,0),(8502,428,87,0,0),(8503,428,88,0,0),(8504,428,90,0,0),(8505,428,91,0,0),(8506,428,92,0,0),(8507,428,93,0,0),(8508,428,94,0,0),(8509,428,95,0,0),(8510,428,96,0,0),(8511,428,97,0,0),(8513,428,8,0,0),(8514,428,9,0,0),(8515,428,11,0,0),(8516,428,12,0,0),(8517,428,13,0,0),(8518,428,14,0,0),(8519,428,15,0,0),(8520,428,16,0,0),(8521,428,18,0,0),(8522,428,20,0,0),(8523,428,21,0,0),(8524,428,24,0,0),(8525,428,64,0,0),(8526,428,2,0,0),(8528,428,5,0,0),(8529,428,17,0,0),(8530,428,19,0,0),(8531,428,27,0,0),(8532,428,31,0,0),(8533,428,6,0,0),(8534,428,22,0,0),(8535,428,25,0,0),(8536,428,26,0,0),(8537,428,28,0,0),(8538,428,29,0,0),(8539,428,32,0,0),(8540,428,33,0,0),(8541,428,34,0,0),(8542,428,35,0,0),(8543,428,36,0,0),(8544,428,37,0,0),(8545,428,38,0,0),(8546,428,39,0,0),(8547,428,40,0,0),(8548,428,50,0,0),(8549,428,51,0,0),(8550,428,56,0,0),(8551,428,57,0,0),(8552,428,58,0,0),(8553,428,59,0,0),(8554,428,52,0,0),(8555,428,53,0,0),(8556,428,54,0,0),(8557,428,55,0,0),(8558,428,60,0,0),(8559,428,30,0,0),(8560,429,45,0,0),(8561,429,46,0,0),(8562,429,47,0,0),(8563,429,48,0,0),(8564,429,49,0,0),(8565,429,72,0,0),(8566,429,73,0,0),(8567,429,74,0,0),(8568,429,75,0,0),(8569,429,76,0,0),(8570,429,77,0,0),(8571,429,78,0,0),(8572,429,79,0,0),(8573,429,80,0,0),(8574,429,81,0,0),(8575,429,82,0,0),(8576,429,83,0,0),(8577,429,84,0,0),(8578,429,85,0,0),(8579,429,86,0,0),(8580,429,87,0,0),(8581,429,88,0,0),(8582,429,90,0,0),(8583,429,91,0,0),(8584,429,92,0,0),(8585,429,93,0,0),(8586,429,94,0,0),(8587,429,95,0,0),(8588,429,96,0,0),(8589,429,97,0,0),(8590,429,7,0,0),(8591,429,8,0,0),(8592,429,9,0,0),(8593,429,11,0,0),(8594,429,12,0,0),(8595,429,13,0,0),(8596,429,14,0,0),(8597,429,15,0,0),(8598,429,16,0,0),(8599,429,18,0,0),(8600,429,20,0,0),(8601,429,21,0,0),(8602,429,24,0,0),(8603,429,64,0,0),(8604,429,2,0,0),(8605,429,4,0,1),(8606,429,5,0,0),(8607,429,17,0,0),(8608,429,19,0,0),(8609,429,27,0,0),(8610,429,31,0,0),(8611,429,6,0,0),(8612,429,22,0,0),(8613,429,25,0,0),(8614,429,26,0,0),(8615,429,28,0,0),(8616,429,29,0,0),(8617,429,32,0,0),(8618,429,33,0,0),(8619,429,34,0,0),(8620,429,35,0,0),(8621,429,36,0,0),(8622,429,37,0,0),(8623,429,38,0,0),(8624,429,39,0,0),(8625,429,40,0,0),(8626,429,50,0,0),(8627,429,51,0,0),(8628,429,56,0,0),(8629,429,57,0,0),(8630,429,58,0,0),(8631,429,59,0,0),(8632,429,52,0,0),(8633,429,53,0,0),(8634,429,54,0,0),(8635,429,55,0,0),(8636,429,60,0,0),(8637,429,30,0,0),(8646,431,42,0,0),(8647,431,43,0,0),(8648,431,68,0,0),(8649,431,69,0,0),(8650,431,70,0,0),(8651,431,71,0,0),(8652,431,65,0,0),(8653,431,44,0,0),(8654,433,42,0,0),(8655,433,43,0,0),(8656,433,68,0,0),(8657,433,69,0,0),(8658,433,70,0,0),(8659,433,71,0,0),(8660,433,65,0,0),(8661,433,44,0,0),(8662,434,3,0,1),(8663,435,3,0,0),(8664,436,3,0,0),(8665,437,3,0,0),(8666,438,3,0,0),(8667,439,3,0,0),(8668,440,3,0,0),(8669,441,3,0,0),(8670,442,3,0,0),(8671,443,3,0,0),(8672,444,3,0,0),(8673,445,3,0,0),(8674,446,3,1,0),(8675,449,45,0,0),(8676,449,46,0,0),(8677,449,47,0,0),(8678,449,48,0,0),(8679,449,49,0,0),(8680,449,72,0,0),(8681,449,73,0,0),(8682,449,74,0,0),(8683,449,75,0,0),(8684,449,76,0,0),(8685,449,77,0,0),(8686,449,78,0,0),(8687,449,79,0,0),(8688,449,80,0,0),(8689,449,81,0,0),(8690,449,82,0,0),(8691,449,83,0,0),(8692,449,84,0,0),(8693,449,85,0,0),(8694,449,86,0,0),(8695,449,87,0,0),(8696,449,88,0,0),(8697,449,90,0,0),(8698,449,91,0,0),(8699,449,92,0,0),(8700,449,93,0,0),(8701,449,94,0,0),(8702,449,95,0,0),(8703,449,96,0,0),(8704,449,97,0,0),(8705,449,7,0,0),(8706,449,8,0,0),(8707,449,9,0,0),(8708,449,11,0,0),(8709,449,12,0,0),(8710,449,13,0,0),(8711,449,14,0,0),(8712,449,15,0,0),(8713,449,16,0,0),(8714,449,18,0,0),(8715,449,20,0,0),(8716,449,21,0,0),(8717,449,24,0,0),(8718,449,64,0,0),(8719,449,2,0,0),(8720,449,4,0,1),(8721,449,5,0,0),(8722,449,17,0,0),(8723,449,19,0,0),(8724,449,27,0,0),(8725,449,31,0,0),(8726,449,6,0,0),(8727,449,22,0,0),(8728,449,25,0,0),(8729,449,26,0,0),(8730,449,28,0,0),(8731,449,29,0,0),(8732,449,32,0,0),(8733,449,33,0,0),(8734,449,34,0,0),(8735,449,35,0,0),(8736,449,36,0,0),(8737,449,37,0,0),(8738,449,38,0,0),(8739,449,39,0,0),(8740,449,40,0,0),(8741,449,50,0,0),(8742,449,51,0,0),(8743,449,56,0,0),(8744,449,57,0,0),(8745,449,58,0,0),(8746,449,59,0,0),(8747,449,52,0,0),(8748,449,53,0,0),(8749,449,54,0,0),(8750,449,55,0,0),(8751,449,60,0,0),(8752,449,30,0,0),(8831,452,42,0,0),(8832,452,43,0,0),(8833,452,68,0,0),(8834,452,69,0,0),(8835,452,70,0,0),(8836,452,71,0,0),(8837,452,65,0,0),(8838,452,44,0,0),(8839,454,42,0,0),(8840,454,43,0,0),(8841,454,68,0,0),(8842,454,69,0,0),(8843,454,70,0,0),(8844,454,71,0,0),(8845,454,65,0,0),(8846,454,44,0,0),(8847,458,42,0,0),(8848,458,43,0,0),(8849,458,68,0,0),(8850,458,69,0,0),(8851,458,70,0,0),(8852,458,71,0,0),(8853,458,65,0,0),(8854,458,44,0,0),(8855,460,42,0,0),(8856,460,43,0,0),(8857,460,68,0,0),(8858,460,69,0,0),(8859,460,70,0,0),(8860,460,71,0,0),(8861,460,65,0,0),(8862,460,44,0,0),(8863,461,42,0,0),(8864,461,43,0,0),(8865,461,68,0,0),(8866,461,69,0,0),(8867,461,70,0,0),(8868,461,71,0,0),(8869,461,65,0,0),(8870,461,44,0,0),(8871,462,42,0,0),(8872,462,43,0,0),(8873,462,68,0,0),(8874,462,69,0,0),(8875,462,70,0,0),(8876,462,71,0,0),(8877,462,65,0,0),(8878,462,44,0,0),(8879,463,42,0,0),(8880,463,43,0,0),(8881,463,68,0,0),(8882,463,69,0,0),(8883,463,70,0,0),(8884,463,71,0,0),(8885,463,65,0,0),(8886,463,44,0,0),(8887,467,42,0,0),(8888,467,43,0,0),(8889,467,68,0,0),(8890,467,69,0,0),(8891,467,70,0,0),(8892,467,71,0,0),(8893,467,65,0,0),(8894,467,44,0,0),(8895,468,42,0,0),(8896,468,43,0,0),(8897,468,68,0,0),(8898,468,69,0,0),(8899,468,70,0,0),(8900,468,71,0,0),(8901,468,65,0,0),(8902,468,44,0,0),(8903,469,42,0,1),(8904,469,43,0,1),(8905,469,68,0,1),(8906,469,69,0,1),(8907,469,70,0,1),(8908,469,71,0,1),(8909,469,65,0,1),(8910,469,44,0,1),(8911,471,42,0,1),(8912,471,43,0,1),(8913,471,68,0,1),(8914,471,69,0,1),(8915,471,70,0,1),(8916,471,71,0,1),(8917,471,65,0,1),(8918,471,44,0,1),(8997,473,45,0,1),(8998,473,46,0,1),(8999,473,47,0,1),(9000,473,48,0,1),(9001,473,49,0,1),(9002,473,72,0,1),(9003,473,73,0,1),(9004,473,74,0,1),(9005,473,75,0,1),(9006,473,76,0,1),(9007,473,77,0,1),(9008,473,78,0,1),(9009,473,79,0,1),(9010,473,80,0,1),(9011,473,81,0,1),(9012,473,82,0,1),(9013,473,83,0,1),(9014,473,84,0,1),(9015,473,85,0,1),(9016,473,86,0,1),(9017,473,87,0,1),(9018,473,88,0,1),(9019,473,90,0,1),(9020,473,91,0,1),(9021,473,92,0,1),(9022,473,93,0,1),(9023,473,94,0,1),(9024,473,95,0,1),(9025,473,96,0,1),(9026,473,97,0,1),(9027,473,7,0,1),(9028,473,8,0,1),(9029,473,9,0,1),(9030,473,11,0,1),(9031,473,12,0,1),(9032,473,13,0,1),(9033,473,14,0,1),(9034,473,15,0,1),(9035,473,16,0,1),(9036,473,18,0,1),(9037,473,20,0,1),(9038,473,21,0,1),(9039,473,24,0,1),(9040,473,64,0,1),(9041,473,2,0,1),(9042,473,4,0,1),(9043,473,5,0,1),(9044,473,17,0,1),(9045,473,19,0,1),(9046,473,27,0,1),(9047,473,31,0,1),(9048,473,6,0,1),(9049,473,22,0,1),(9050,473,25,0,1),(9051,473,26,0,1),(9052,473,28,0,1),(9053,473,29,0,1),(9054,473,32,0,1),(9055,473,33,0,1),(9056,473,34,0,1),(9057,473,35,0,1),(9058,473,36,0,1),(9059,473,37,0,1),(9060,473,38,0,1),(9061,473,39,0,1),(9062,473,40,0,1),(9063,473,50,0,1),(9064,473,51,0,1),(9065,473,56,0,1),(9066,473,57,0,1),(9067,473,58,0,1),(9068,473,59,0,1),(9069,473,52,0,1),(9070,473,53,0,1),(9071,473,54,0,1),(9072,473,55,0,1),(9073,473,60,0,1),(9074,473,30,0,1),(9077,451,2,0,0),(9078,474,3,0,1),(9079,475,45,1,0),(9080,475,46,1,0),(9081,475,47,1,0),(9082,475,48,1,0),(9083,475,49,1,0),(9084,475,72,1,0),(9085,475,73,1,0),(9086,475,74,1,0),(9087,475,75,1,0),(9088,475,76,1,0),(9089,475,77,1,0),(9090,475,78,1,0),(9091,475,79,1,0),(9092,475,80,1,0),(9093,475,81,1,0),(9094,475,82,1,0),(9095,475,83,1,0),(9096,475,84,1,0),(9097,475,85,1,0),(9098,475,86,1,0),(9099,475,87,1,0),(9100,475,88,1,0),(9101,475,90,1,0),(9102,475,91,1,0),(9103,475,92,1,0),(9104,475,93,1,0),(9105,475,94,1,0),(9106,475,95,1,0),(9107,475,96,1,0),(9108,475,97,1,0),(9109,475,7,1,0),(9110,475,8,1,0),(9111,475,9,1,0),(9112,475,11,1,0),(9113,475,12,1,0),(9114,475,13,1,0),(9115,475,14,1,0),(9116,475,15,1,0),(9117,475,16,1,0),(9118,475,18,1,0),(9119,475,20,1,0),(9120,475,21,1,0),(9121,475,24,1,0),(9122,475,64,1,0),(9123,475,2,1,0),(9124,475,4,1,0),(9125,475,5,1,0),(9126,475,17,1,0),(9127,475,19,1,0),(9128,475,27,1,0),(9129,475,31,1,0),(9130,475,6,1,0),(9131,475,22,1,0),(9132,475,25,1,0),(9133,475,26,1,0),(9134,475,28,1,0),(9135,475,29,1,0),(9136,475,32,1,0),(9137,475,33,1,0),(9138,475,34,1,0),(9139,475,35,1,0),(9140,475,36,1,0),(9141,475,37,1,0),(9142,475,38,1,0),(9143,475,39,1,0),(9144,475,40,1,0),(9145,475,50,1,0),(9146,475,51,1,0),(9147,475,56,1,0),(9148,475,57,1,0),(9149,475,58,1,0),(9150,475,59,1,0),(9151,475,52,1,0),(9152,475,53,1,0),(9153,475,54,1,0),(9154,475,55,1,0),(9155,475,60,1,0),(9156,475,30,1,0),(9157,476,45,0,0),(9158,476,46,0,0),(9159,476,47,0,0),(9160,476,48,0,0),(9161,476,49,0,0),(9162,476,72,0,0),(9163,476,73,0,0),(9164,476,74,0,0),(9165,476,75,0,0),(9166,476,76,0,0),(9167,476,77,0,0),(9168,476,78,0,0),(9169,476,79,0,0),(9170,476,80,0,0),(9171,476,81,0,0),(9172,476,82,0,0),(9173,476,83,0,0),(9174,476,84,0,0),(9175,476,85,0,0),(9176,476,86,0,0),(9177,476,87,0,0),(9178,476,88,0,0),(9179,476,90,0,0),(9180,476,91,0,0),(9181,476,92,0,0),(9182,476,93,0,0),(9183,476,94,0,0),(9184,476,95,0,0),(9185,476,96,0,0),(9186,476,97,0,0),(9187,476,7,0,0),(9188,476,8,0,0),(9189,476,9,0,0),(9190,476,11,0,0),(9191,476,12,0,0),(9192,476,13,0,0),(9193,476,14,0,0),(9194,476,15,0,0),(9195,476,16,0,0),(9196,476,18,0,0),(9197,476,20,0,0),(9198,476,21,0,0),(9199,476,24,0,0),(9200,476,64,0,0),(9201,476,2,0,0),(9202,476,4,0,0),(9203,476,5,0,0),(9204,476,17,0,0),(9205,476,19,0,0),(9206,476,27,0,0),(9207,476,31,0,0),(9208,476,6,0,0),(9209,476,22,0,0),(9210,476,25,0,0),(9211,476,26,0,0),(9212,476,28,0,0),(9213,476,29,0,0),(9214,476,32,0,0),(9215,476,33,0,0),(9216,476,34,0,0),(9217,476,35,0,0),(9218,476,36,0,0),(9219,476,37,0,0),(9220,476,38,0,0),(9221,476,39,0,0),(9222,476,40,0,0),(9223,476,50,0,0),(9224,476,51,0,0),(9225,476,56,0,0),(9226,476,57,0,0),(9227,476,58,0,0),(9228,476,59,0,0),(9229,476,52,0,0),(9230,476,53,0,0),(9231,476,54,0,0),(9232,476,55,0,0),(9233,476,60,0,0),(9234,476,30,0,0),(9235,477,42,0,0),(9236,477,43,0,0),(9237,477,68,0,0),(9238,477,69,0,0),(9239,477,70,0,0),(9240,477,71,0,0),(9241,477,65,0,0),(9242,477,44,0,0),(9243,478,42,1,0),(9244,478,43,1,0),(9245,478,68,1,0),(9246,478,69,1,0),(9247,478,70,1,0),(9248,478,71,1,0),(9249,478,65,1,0),(9250,478,44,1,0),(9251,479,42,0,0),(9252,479,43,0,0),(9253,479,68,0,0),(9254,479,69,0,0),(9255,479,70,0,0),(9256,479,71,0,0),(9257,479,65,0,0),(9258,479,44,0,0),(9259,430,42,0,0),(9260,430,43,0,0),(9261,430,44,0,0),(9262,430,65,0,0),(9263,430,68,0,0),(9264,430,69,0,0),(9265,430,70,0,0),(9266,430,71,0,0);
/*!40000 ALTER TABLE `avoirs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoriecolonnetables_colonnes`
--

DROP TABLE IF EXISTS `categoriecolonnetables_colonnes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoriecolonnetables_colonnes` (
  `colonne_id` int(11) NOT NULL,
  `categoriecolonnetable_id` int(11) NOT NULL,
  KEY `categoriecolonnetable_id` (`categoriecolonnetable_id`),
  KEY `colonne_id` (`colonne_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoriecolonnetables_colonnes`
--

LOCK TABLES `categoriecolonnetables_colonnes` WRITE;
/*!40000 ALTER TABLE `categoriecolonnetables_colonnes` DISABLE KEYS */;
INSERT INTO `categoriecolonnetables_colonnes` VALUES (10,1);
/*!40000 ALTER TABLE `categoriecolonnetables_colonnes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoriecolonnetables_roles`
--

DROP TABLE IF EXISTS `categoriecolonnetables_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoriecolonnetables_roles` (
  `role_id` int(11) NOT NULL,
  `categoriecolonnetable_id` int(11) NOT NULL,
  KEY `categoriecolonnetable_id` (`categoriecolonnetable_id`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoriecolonnetables_roles`
--

LOCK TABLES `categoriecolonnetables_roles` WRITE;
/*!40000 ALTER TABLE `categoriecolonnetables_roles` DISABLE KEYS */;
INSERT INTO `categoriecolonnetables_roles` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(1,2),(2,2),(3,2),(4,2),(5,2),(6,2);
/*!40000 ALTER TABLE `categoriecolonnetables_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controllersdroits`
--

DROP TABLE IF EXISTS `controllersdroits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `controllersdroits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controllersdroits`
--

LOCK TABLES `controllersdroits` WRITE;
/*!40000 ALTER TABLE `controllersdroits` DISABLE KEYS */;
INSERT INTO `controllersdroits` VALUES (1,'applications'),(2,'statistics'),(3,'users'),(4,'groupapps'),(5,'roles'),(6,'controllersdroits'),(7,'fichiercompressions'),(8,'applications/new'),(9,'addrolessimplifie'),(10,'pings');
/*!40000 ALTER TABLE `controllersdroits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controllersdroits_roles`
--

DROP TABLE IF EXISTS `controllersdroits_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `controllersdroits_roles` (
  `role_id` int(11) NOT NULL,
  `controllersdroit_id` int(11) NOT NULL,
  KEY `controllersdroit_id` (`controllersdroit_id`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controllersdroits_roles`
--

LOCK TABLES `controllersdroits_roles` WRITE;
/*!40000 ALTER TABLE `controllersdroits_roles` DISABLE KEYS */;
INSERT INTO `controllersdroits_roles` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(6,1),(6,2),(6,3),(6,4),(6,5),(6,6),(6,7),(4,1),(4,2),(7,1),(7,2),(7,8),(16,1),(16,2),(18,1),(4,3),(4,9),(1,10),(3,10),(4,10),(6,10),(7,10),(35,1),(35,2),(35,4),(35,7),(1,9),(37,1),(40,1),(41,1),(41,8),(41,2),(42,1),(42,8),(42,2),(43,1),(43,8),(43,2),(44,1),(44,8),(44,2),(45,1),(45,8),(45,2),(46,1),(46,8),(46,2),(47,1),(47,2),(48,1),(49,1),(49,2),(50,1),(50,2),(51,1),(51,2),(52,1),(52,2),(52,3),(53,1),(53,2),(53,3),(54,1),(54,2),(54,3),(55,1),(55,2),(55,3),(56,1),(56,2),(56,3),(57,1),(58,1),(59,1),(60,1),(61,1),(62,1),(63,1),(64,1),(65,1),(66,1),(67,1),(68,1),(68,2),(68,3),(69,1),(69,2),(69,3),(70,1),(70,2),(70,3),(71,1),(71,2),(71,3),(72,1);
/*!40000 ALTER TABLE `controllersdroits_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fichiercompressions`
--

DROP TABLE IF EXISTS `fichiercompressions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fichiercompressions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `file_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_file_size` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_updated_at` datetime DEFAULT NULL,
  `file_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `base_version` tinyint(1) DEFAULT '0',
  `mergeversion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=480 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fichiercompressions`
--

LOCK TABLES `fichiercompressions` WRITE;
/*!40000 ALTER TABLE `fichiercompressions` DISABLE KEYS */;
INSERT INTO `fichiercompressions` VALUES (428,'2011/04/05 22:02:28','2011-04-05 20:03:12','2011-04-05 20:03:12','application/zip','28483438','2011-04-05 20:03:12','MediaWall_Demo_Opticien_Dev.zip',0,NULL),(429,'2011/04/05 22:02:28','2011-04-05 20:15:19','2011-04-05 20:15:19','application/zip','28483438','2011-04-05 20:15:19','MediaWall_Demo_Opticien_Dev.zip',0,NULL),(430,'2011/04/05 22:02:28','2011-04-05 20:25:03','2011-04-05 20:25:03','application/zip','774529','2011-04-05 20:25:03','colorpicker.zip',0,NULL),(431,'2011/04/05 22:02:28','2011-04-05 20:34:45','2011-04-05 20:34:45','application/zip','774529','2011-04-05 20:34:45','colorpicker.zip',0,NULL),(432,'2011/04/05 22:02:28','2011-04-05 20:44:29','2011-04-05 20:44:29','application/zip','774529','2011-04-05 20:44:29','colorpicker.zip',0,NULL),(433,'2011/04/05 22:02:28','2011-04-05 20:48:10','2011-04-05 20:48:10','application/zip','774529','2011-04-05 20:48:10','colorpicker.zip',0,NULL),(434,'2011/04/11 14:31:08','2011-04-11 12:31:30','2011-04-11 12:31:37','application/zip','774529','2011-04-11 12:31:30','colorpicker.zip',0,NULL),(435,NULL,'2011-04-11 13:42:14','2011-04-11 13:42:14','application/zip','774529',NULL,'colorpicker.zip',0,NULL),(436,NULL,'2011-04-11 13:42:17','2011-04-11 13:42:17','application/zip','774529',NULL,'colorpicker.zip',0,NULL),(437,NULL,'2011-04-11 13:43:40','2011-04-11 13:43:40','application/zip','774529',NULL,'colorpicker.zip',0,NULL),(438,NULL,'2011-04-11 13:46:30','2011-04-11 13:46:30','application/zip','774529',NULL,'colorpicker.zip',0,NULL),(439,NULL,'2011-04-11 14:24:06','2011-04-11 14:24:06','application/zip','774529',NULL,'colorpicker.zip',0,NULL),(440,NULL,'2011-04-11 14:36:42','2011-04-11 14:36:42','application/zip','774529',NULL,'colorpicker.zip',0,NULL),(441,NULL,'2011-04-11 14:39:12','2011-04-11 14:39:12','application/zip','774529',NULL,'colorpicker.zip',0,NULL),(442,NULL,'2011-04-11 14:39:26','2011-04-11 14:39:26','application/zip','774529',NULL,'colorpicker.zip',0,NULL),(443,NULL,'2011-04-11 14:40:55','2011-04-11 14:40:55','application/zip','774529',NULL,'colorpicker.zip',0,NULL),(444,NULL,'2011-04-11 14:47:14','2011-04-11 14:47:14','application/zip','774529',NULL,'colorpicker.zip',0,NULL),(445,NULL,'2011-04-11 14:48:37','2011-04-11 14:48:37','application/zip','774529',NULL,'colorpicker.zip',0,NULL),(446,NULL,'2011-04-11 14:49:45','2011-04-11 14:49:45','application/zip','774529',NULL,'colorpicker.zip',0,NULL),(447,'2011/04/18 10:48:36','2011-04-18 08:49:25','2011-04-18 08:49:25','application/zip','774529','2011-04-18 08:49:25','colorpicker.zip',0,NULL),(448,'2011/04/18 10:48:36','2011-04-18 08:50:05','2011-04-18 08:50:05','application/zip','774529','2011-04-18 08:50:05','colorpicker.zip',0,NULL),(449,'2011/04/18 10:48:36','2011-04-18 08:50:47','2011-04-18 16:11:16','application/zip','774529','2011-04-18 08:50:47','colorpicker.zip',0,NULL),(450,'2011/04/18 18:07:57','2011-04-18 16:09:06','2011-04-18 16:09:06','application/zip','1355','2011-04-18 16:09:06','reboot.zip',0,NULL),(451,'2011/04/18 18:07:57','2011-04-18 16:11:14','2011-04-18 16:11:20','application/zip','1355','2011-04-18 16:11:14','reboot.zip',0,NULL),(452,'2011/04/18 18:11:21','2011-04-18 16:15:26','2011-04-18 16:16:58','application/zip','774529','2011-04-18 16:15:26','colorpicker.zip',0,NULL),(453,'2011/04/18 18:15:31','2011-04-18 16:15:59','2011-04-18 16:15:59','application/zip','774529','2011-04-18 16:15:59','colorpicker.zip',0,NULL),(454,'2011/04/18 18:15:31','2011-04-18 16:16:57','2011-04-18 16:17:14','application/zip','774529','2011-04-18 16:16:57','colorpicker.zip',0,NULL),(455,'2011/04/18 18:17:15','2011-04-18 16:18:16','2011-04-18 16:18:16','application/zip','774529','2011-04-18 16:18:16','colorpicker.zip',0,NULL),(456,'2011/04/18 18:17:15','2011-04-18 16:18:44','2011-04-18 16:18:44','application/zip','774529','2011-04-18 16:18:44','colorpicker.zip',0,NULL),(457,'2011/04/18 18:17:15','2011-04-18 16:22:05','2011-04-18 16:22:05','application/zip','774529','2011-04-18 16:22:05','colorpicker.zip',0,NULL),(458,'2011/04/18 18:17:15','2011-04-18 16:24:22','2011-04-18 16:24:22','application/zip','774529','2011-04-18 16:24:22','colorpicker.zip',0,NULL),(459,'2011/04/19 11:53:21','2011-04-19 09:53:50','2011-04-19 09:53:50','application/zip','6294203','2011-04-19 09:53:50','paper-113.zip',0,NULL),(460,'2011/04/19 11:53:21','2011-04-19 10:00:34','2011-04-19 10:00:35','application/zip','6294203','2011-04-19 10:00:34','paper-113.zip',0,'merge_[42-43-68-69-70-71-65-44].zip'),(461,'test_nicolas','2011-04-26 12:11:56','2011-05-09 12:55:35','application/zip','774529','2011-04-26 12:11:56','colorpicker.zip',0,NULL),(462,'testnicolas','2011-04-26 12:12:47','2011-04-26 12:12:47','application/zip','774529','2011-04-26 12:12:47','colorpicker.zip',0,NULL),(463,'2011/04/26 14:13:02','2011-04-26 12:13:27','2011-04-26 12:13:27','application/zip','774529','2011-04-26 12:13:27','colorpicker.zip',0,NULL),(464,'2011/05/09 14:55:16','2011-05-09 12:55:35','2011-05-09 12:55:35','application/zip','47545','2011-05-09 12:55:35','encherails_tin.zip',1,NULL),(465,'2011/05/09 14:55:16','2011-05-09 12:58:01','2011-05-09 12:58:01','application/zip','47545','2011-05-09 12:58:01','encherails_tin.zip',1,NULL),(466,'2011/05/09 14:55:16','2011-05-09 12:58:44','2011-05-09 12:58:44','application/zip','47545','2011-05-09 12:58:44','encherails_tin.zip',1,NULL),(467,'2011/05/09 14:55:16','2011-05-09 12:59:42','2011-05-09 13:22:43','application/zip','47545','2011-05-09 12:59:42','encherails_tin.zip',0,NULL),(468,'2011/05/09 15:22:24','2011-05-09 13:22:43','2011-05-09 13:22:43','application/zip','53811573','2011-05-09 13:22:42','IGN_01.zip',1,NULL),(469,'2011/05/11 14:08:53','2011-05-11 12:09:25','2011-05-11 12:09:25','application/zip','774529','2011-05-11 12:09:24','colorpicker.zip',0,NULL),(470,'2011/05/11 14:17:49','2011-05-11 12:18:06','2011-05-11 12:18:06','application/zip','774529','2011-05-11 12:18:06','colorpicker.zip',0,NULL),(471,'2011/05/11 14:17:49','2011-05-11 12:18:39','2011-05-11 12:18:39','application/zip','774529','2011-05-11 12:18:39','colorpicker.zip',0,NULL),(472,'2011/05/11 14:19:03','2011-05-11 12:19:18','2011-05-11 12:19:18','application/zip','774529','2011-05-11 12:19:18','colorpicker.zip',0,NULL),(473,'2011/05/11 14:19:54','2011-05-11 12:20:06','2011-05-11 12:20:06','application/zip','774529','2011-05-11 12:20:06','colorpicker.zip',0,NULL),(474,'2011/06/08 12:19:28','2011-06-08 10:20:02','2011-06-08 10:20:02','application/zip','774529','2011-06-08 10:20:02','colorpicker.zip',0,NULL),(475,'2011/06/09 16:27:26','2011-06-09 14:28:12','2011-06-09 14:28:12','application/zip','40774651','2011-06-09 14:28:12','MediaWallDev.zip',0,NULL),(476,'2011/06/09 16:28:28','2011-06-09 14:28:46','2011-06-09 14:28:46','application/zip','40774651','2011-06-09 14:28:46','MediaWallDev.zip',0,NULL),(477,'2011/06/13 15:53:15','2011-06-13 13:53:29','2011-06-13 13:53:29','application/zip','774529','2011-06-13 13:53:29','colorpicker.zip',0,NULL),(478,'2011/06/13 16:27:21','2011-06-13 14:27:35','2011-06-13 14:27:35','application/zip','774529','2011-06-13 14:27:35','colorpicker.zip',0,NULL),(479,'2011/06/14 17:20:15','2011-06-14 15:20:40','2011-06-14 15:20:40','application/zip','40774651','2011-06-14 15:20:40','MediaWallDev.zip',0,NULL);
/*!40000 ALTER TABLE `fichiercompressions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groupapps`
--

DROP TABLE IF EXISTS `groupapps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groupapps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groupapps`
--

LOCK TABLES `groupapps` WRITE;
/*!40000 ALTER TABLE `groupapps` DISABLE KEYS */;
INSERT INTO `groupapps` VALUES (1,'mediawall','2010-09-07 14:59:59','2010-09-07 14:59:59'),(2,'testnicolas','2010-09-24 20:06:38','2010-09-24 20:06:38'),(3,'plans','2010-10-19 09:12:53','2010-10-19 09:12:53'),(4,'nicolastestoups','2010-11-25 15:32:54','2010-11-25 15:32:54'),(5,'mdr','2010-11-25 15:44:25','2010-11-25 15:44:25'),(6,'PDF Reader','2010-12-27 11:16:42','2010-12-27 11:16:42'),(7,'testgrouproles','2010-12-29 10:51:04','2010-12-29 10:51:04'),(8,'testoupsencore','2011-02-04 16:19:30','2011-02-04 16:19:30'),(9,'restest','2011-03-15 17:41:36','2011-03-15 17:41:36');
/*!40000 ALTER TABLE `groupapps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groupapps_roles`
--

DROP TABLE IF EXISTS `groupapps_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groupapps_roles` (
  `role_id` int(11) NOT NULL,
  `groupapp_id` int(11) NOT NULL,
  KEY `role_id` (`role_id`),
  KEY `groupapp_id` (`groupapp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groupapps_roles`
--

LOCK TABLES `groupapps_roles` WRITE;
/*!40000 ALTER TABLE `groupapps_roles` DISABLE KEYS */;
INSERT INTO `groupapps_roles` VALUES (34,1),(34,2),(34,3),(34,4),(34,5),(34,6),(1,7),(2,7),(3,7),(1,1),(1,8),(2,8),(3,8),(4,8),(5,8),(6,8),(7,8),(16,8),(18,8),(19,8),(20,8),(21,8),(22,8),(23,8),(24,8),(25,8),(26,8),(27,8),(28,8),(29,8),(30,8),(31,8),(32,8),(33,8),(34,8),(35,1),(35,2),(35,3),(35,4),(35,5),(35,6),(35,7),(35,8),(36,1),(37,1),(38,1),(39,1),(40,1),(41,1),(42,1),(43,1),(44,1),(45,1),(1,9),(46,9),(47,1),(48,1),(48,2),(49,1),(50,1),(51,1),(51,2),(52,1),(52,3),(52,4),(53,1),(53,3),(53,4),(54,1),(54,3),(54,4),(55,1),(55,3),(55,4),(56,1),(56,3),(56,4),(57,1),(58,1),(59,1),(60,1),(61,1),(62,1),(63,1),(64,1),(65,1),(66,1),(67,1),(68,1),(68,2),(69,1),(69,2),(70,1),(70,2),(71,1),(71,2),(1,2),(1,3),(1,4),(1,5),(1,6);
/*!40000 ALTER TABLE `groupapps_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `nbcategory`
--

DROP TABLE IF EXISTS `nbcategory`;
/*!50001 DROP VIEW IF EXISTS `nbcategory`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `nbcategory` (
  `nbcategory` varchar(255),
  `idinsert` int(11)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `nbmedias`
--

DROP TABLE IF EXISTS `nbmedias`;
/*!50001 DROP VIEW IF EXISTS `nbmedias`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `nbmedias` (
  `nbmedias` varchar(255),
  `idinsert` int(11)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `pings`
--

DROP TABLE IF EXISTS `pings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `application_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `application_id` (`application_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pings`
--

LOCK TABLES `pings` WRITE;
/*!40000 ALTER TABLE `pings` DISABLE KEYS */;
INSERT INTO `pings` VALUES (1,'2010-10-01 10:00:25','OK',2),(3,'2010-10-01 10:15:30','okyes',1),(5,'2010-10-01 15:37:10','ok',1),(7,'2010-10-02 06:32:14','ok',1),(9,'2010-10-02 06:32:29','oktest',1),(10,'2010-10-02 06:32:33','oktest',1),(11,'2010-10-02 06:32:35','oktest',1),(12,'2010-10-04 08:58:26','ok',1),(13,'2010-10-04 08:58:31','ok',1),(14,'2010-10-04 08:58:34','ok',1),(15,'2010-10-04 08:58:37','ok',1),(16,'2010-10-04 08:58:39','ok',1),(17,'2010-10-04 08:58:43','ok',1);
/*!40000 ALTER TABLE `pings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'administrateur',NULL),(2,'test',1),(3,'subadmin',1),(4,'subadminnicolas',3),(5,'oups',4),(6,'testnicolas',1),(7,'client',6),(16,'test',1),(18,'testgroupmail',1),(19,'testrolesimplifie',5),(20,'testrolesimplifie',5),(21,'rolepopop',20),(22,'rolepopop',20),(23,'rolepopopoups',20),(24,'rolepopopoupsdfqsffds',23),(25,'mdr',24),(26,'mdr',24),(27,'whet',5),(28,'merde',5),(29,'dsfdsfdsfdsfsdf',NULL),(30,'dsfdsfdsfdsfsdf',28),(31,'dsfdsfdsfdsfsdf',28),(32,'test',31),(33,'qsdfqsdfqsfdqsftest',32),(34,'testroles',18),(35,'testtest',2),(36,'test',NULL),(37,'dfdsfsdf',1),(38,'testdfdsfsd',NULL),(39,'test2localnicolasasupmail',NULL),(40,'fdsfdsf',1),(41,'dsfdsfsdfsd',1),(42,'nicolas',1),(43,'nicolastest',1),(44,'fdsfdsfsdfdsfsd',1),(45,'testnicolas',1),(46,'instore',1),(47,'test',1),(48,'test',1),(49,'testnicolas',35),(50,'testnicolasbisoupsmdr',35),(51,'mdrnicolasoups',50),(52,'testnicolas',35),(53,'testnicolas',35),(54,'testnicolas',35),(55,'testnicolas',35),(56,'testnicolas',35),(57,'testnicolas',3),(58,'test',3),(59,'testnicolas',4),(60,'testgroupmail',19),(61,'testgroupmail',19),(62,'subadmin',3),(63,'subadmin',20),(64,'subadmin',20),(65,'subadmin',20),(66,'subadmin',20),(67,'subadmin',20),(68,'test nicolas verif',2),(69,'test nicolas verif',2),(70,'testfdsfdsfdsfdsfdsf',2),(71,'testfdsfdsfdsfdsfdsfdsqdfsqfsqd',2),(72,'test nicolas oups',NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20101215131516'),('20101228173037'),('20101229100957'),('20110127154320'),('20110127155418'),('20110127162621'),('20110127163752'),('20110131101742'),('20110201150343'),('20110201162325'),('20110202103405'),('20110202112418'),('20110202142049'),('20110202153246'),('20110217130108'),('20110221100806'),('20110221111102'),('20110224144458'),('20110228134256'),('20110314135645'),('20110314144058'),('20110315102231'),('20110315122735'),('20110328101333'),('20110511085329');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `serial`
--

DROP TABLE IF EXISTS `serial`;
/*!50001 DROP VIEW IF EXISTS `serial`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `serial` (
  `roleid` int(11),
  `rolename` varchar(255),
  `groupid` int(11),
  `groupname` varchar(255),
  `applicationid` int(11),
  `applicationame` varchar(255),
  `serial` int(11)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `session_durations`
--

DROP TABLE IF EXISTS `session_durations`;
/*!50001 DROP VIEW IF EXISTS `session_durations`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `session_durations` (
  `duration` varchar(255),
  `idinsert` int(11)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `sessionid`
--

DROP TABLE IF EXISTS `sessionid`;
/*!50001 DROP VIEW IF EXISTS `sessionid`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `sessionid` (
  `sessionid` varchar(255),
  `idinsert` int(11)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!50001 DROP VIEW IF EXISTS `sessions`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `sessions` (
  `idinsert` int(11),
  `sessionid` varchar(255),
  `nbcategory` varchar(255),
  `nbmedias` varchar(255),
  `duration` varchar(255)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `stat_categoriecolonnetables`
--

DROP TABLE IF EXISTS `stat_categoriecolonnetables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_categoriecolonnetables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `typegraph` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `nameen` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nbrubriquecontenu` int(11) DEFAULT NULL,
  `table_id` int(11) DEFAULT NULL,
  `titrelegendestatglobal` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'Statistique global',
  PRIMARY KEY (`id`),
  KEY `table_id` (`table_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_categoriecolonnetables`
--

LOCK TABLES `stat_categoriecolonnetables` WRITE;
/*!40000 ALTER TABLE `stat_categoriecolonnetables` DISABLE KEYS */;
/*!40000 ALTER TABLE `stat_categoriecolonnetables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_categorieindexs`
--

DROP TABLE IF EXISTS `stat_categorieindexs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_categorieindexs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nameen` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_categorieindexs`
--

LOCK TABLES `stat_categorieindexs` WRITE;
/*!40000 ALTER TABLE `stat_categorieindexs` DISABLE KEYS */;
/*!40000 ALTER TABLE `stat_categorieindexs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `stat_categoriesessiondates`
--

DROP TABLE IF EXISTS `stat_categoriesessiondates`;
/*!50001 DROP VIEW IF EXISTS `stat_categoriesessiondates`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `stat_categoriesessiondates` (
  `roleid` int(11),
  `rolename` varchar(255),
  `groupid` int(11),
  `groupname` varchar(255),
  `applicationid` int(11),
  `applicationname` varchar(255),
  `serial` varchar(255),
  `widgetid` varchar(255),
  `sessionid` varchar(255),
  `date` varchar(255)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `stat_categoriesessions`
--

DROP TABLE IF EXISTS `stat_categoriesessions`;
/*!50001 DROP VIEW IF EXISTS `stat_categoriesessions`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `stat_categoriesessions` (
  `roleid` int(11),
  `rolename` varchar(255),
  `groupid` int(11),
  `groupname` varchar(255),
  `applicationid` int(11),
  `applicationname` varchar(255),
  `serial` varchar(255),
  `widgetid` varchar(255),
  `sessionid` varchar(255)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `stat_categoriewidgetdates`
--

DROP TABLE IF EXISTS `stat_categoriewidgetdates`;
/*!50001 DROP VIEW IF EXISTS `stat_categoriewidgetdates`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `stat_categoriewidgetdates` (
  `date` varchar(255),
  `widgetid` varchar(255)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `stat_categoriewidgetids`
--

DROP TABLE IF EXISTS `stat_categoriewidgetids`;
/*!50001 DROP VIEW IF EXISTS `stat_categoriewidgetids`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `stat_categoriewidgetids` (
  `contenu` varchar(255),
  `idinsert` int(11)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `stat_categoriewidgetnames`
--

DROP TABLE IF EXISTS `stat_categoriewidgetnames`;
/*!50001 DROP VIEW IF EXISTS `stat_categoriewidgetnames`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `stat_categoriewidgetnames` (
  `widgetid` varchar(255),
  `widgetname` varchar(255),
  `serial` varchar(255),
  `idinsert` int(11),
  `sessionid` varchar(255)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `stat_categoriewidgetserials`
--

DROP TABLE IF EXISTS `stat_categoriewidgetserials`;
/*!50001 DROP VIEW IF EXISTS `stat_categoriewidgetserials`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `stat_categoriewidgetserials` (
  `widgetid` varchar(255),
  `serial` varchar(255),
  `idinsert` int(11)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `stat_categoriewidgetserialsessions`
--

DROP TABLE IF EXISTS `stat_categoriewidgetserialsessions`;
/*!50001 DROP VIEW IF EXISTS `stat_categoriewidgetserialsessions`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `stat_categoriewidgetserialsessions` (
  `widgetid` varchar(255),
  `sessionid` varchar(255),
  `serial` varchar(255),
  `idinsert` int(11)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `stat_colonnes`
--

DROP TABLE IF EXISTS `stat_colonnes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_colonnes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `table_id` int(11) NOT NULL,
  `affichagecolonne` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `choixaffichage` tinyint(1) DEFAULT NULL,
  `statx` tinyint(1) DEFAULT '0',
  `time_column` tinyint(1) DEFAULT NULL,
  `affichagecolonneen` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `apps_serial_column` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `table_id` (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_colonnes`
--

LOCK TABLES `stat_colonnes` WRITE;
/*!40000 ALTER TABLE `stat_colonnes` DISABLE KEYS */;
INSERT INTO `stat_colonnes` VALUES (127,'categoryName',12,'',0,0,0,'0',0),(128,'duration',12,'',0,0,0,'0',0),(129,'userSessionId',12,'',0,0,0,'0',0),(130,'time',12,'',1,1,1,'0',0),(131,'application_serial',12,'',0,0,0,'0',1),(132,'session_id',12,'',0,0,0,'0',0),(133,'language',12,'',0,0,0,'0',0),(134,'userSessionId',13,'',1,0,0,'0',0),(135,'duration',13,'',1,0,0,'0',0),(136,'nbWidgetsConsulted',13,'',1,0,0,'0',0),(137,'nbCategoriesConsulted',13,'',1,0,0,'0',0),(138,'time',13,'',1,1,1,'0',0),(139,'application_serial',13,'',1,0,0,'0',1),(140,'session_id',13,'',1,0,0,'0',0),(141,'language',13,'',1,0,0,'0',0),(142,'widgetName',14,'',1,0,0,'0',0),(143,'widgetReference',14,'',1,0,0,'0',0),(144,'duration',14,'',1,0,0,'0',0),(145,'userSessionId',14,'',1,0,0,'0',0),(146,'time',14,'',1,1,1,'0',0),(147,'application_serial',14,'',1,0,0,'0',1),(148,'session_id',14,'',1,0,0,'0',0),(149,'language',14,'',1,0,0,'0',0),(150,'widgetName',15,'',1,0,0,'0',0),(151,'widgetReference',15,'',1,0,0,'0',0),(152,'categoryName',15,'',1,0,0,'0',0),(153,'duration',15,'',1,0,0,'0',0),(154,'userSessionId',15,'',1,0,0,'0',0),(155,'time',15,'',1,1,1,'0',0),(156,'application_serial',15,'',1,0,0,'0',1),(157,'session_id',15,'',1,0,0,'0',0),(158,'language',15,'',1,0,0,'0',0),(159,'time',16,'',1,1,1,'0',0),(160,'application_serial',16,'',1,0,0,'0',1),(161,'session_id',16,'',1,0,0,'0',0),(162,'frame_rate',16,'',1,0,0,'0',0),(163,'memory_usage',16,'',1,0,0,'0',0);
/*!40000 ALTER TABLE `stat_colonnes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_contenus`
--

DROP TABLE IF EXISTS `stat_contenus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_contenus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contenu` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `colonne_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `idinsert` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `colonne_id` (`colonne_id`)
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_contenus`
--

LOCK TABLES `stat_contenus` WRITE;
/*!40000 ALTER TABLE `stat_contenus` DISABLE KEYS */;
INSERT INTO `stat_contenus` VALUES (144,'1300382828',159,'2011-03-17 17:38:44',0),(145,'300304',160,'2011-03-17 17:38:44',0),(146,'1300380418',161,'2011-03-17 17:38:44',0),(147,'53.1027214771763',162,'2011-03-17 17:38:44',0),(148,'331380',163,'2011-03-17 17:38:44',0),(149,'\'flux rss\'',127,'2011-03-17 17:38:50',1),(150,'3',128,'2011-03-17 17:38:50',1),(151,'1300382900',129,'2011-03-17 17:38:50',1),(152,'1300382911',130,'2011-03-17 17:38:50',1),(153,'426374',131,'2011-03-17 17:38:50',1),(154,'1300382871',132,'2011-03-17 17:38:50',1),(155,'26226',133,'2011-03-17 17:38:50',1),(156,'1300382896',159,'2011-03-17 17:38:50',2),(157,'426374',160,'2011-03-17 17:38:50',2),(158,'1300382871',161,'2011-03-17 17:38:50',2),(159,'0.0',162,'2011-03-17 17:38:50',2),(160,'437860',163,'2011-03-17 17:38:50',2),(161,'\'flux rss\'',127,'2011-03-17 17:38:57',3),(162,'4',128,'2011-03-17 17:38:57',3),(163,'1300383000',129,'2011-03-17 17:38:57',3),(164,'1300383006',130,'2011-03-17 17:38:57',3),(165,'426374',131,'2011-03-17 17:38:57',3),(166,'1300382970',132,'2011-03-17 17:38:57',3),(167,'26226',133,'2011-03-17 17:38:57',3),(168,'\'flux rss\'',127,'2011-03-17 17:38:57',4),(169,'2',128,'2011-03-17 17:38:57',4),(170,'1300383000',129,'2011-03-17 17:38:57',4),(171,'1300383011',130,'2011-03-17 17:38:57',4),(172,'426374',131,'2011-03-17 17:38:57',4),(173,'1300382970',132,'2011-03-17 17:38:57',4),(174,'26226',133,'2011-03-17 17:38:57',4),(175,'\'flux rss\'',127,'2011-03-17 17:38:57',5),(176,'2',128,'2011-03-17 17:38:57',5),(177,'1300383000',129,'2011-03-17 17:38:57',5),(178,'1300383016',130,'2011-03-17 17:38:57',5),(179,'426374',131,'2011-03-17 17:38:57',5),(180,'1300382970',132,'2011-03-17 17:38:57',5),(181,'26226',133,'2011-03-17 17:38:57',5),(182,'1300382994',159,'2011-03-17 17:38:57',6),(183,'426374',160,'2011-03-17 17:38:57',6),(184,'1300382970',161,'2011-03-17 17:38:57',6),(185,'0.0',162,'2011-03-17 17:38:57',6),(186,'441256',163,'2011-03-17 17:38:57',6),(187,'1300382828',159,'2011-05-09 17:34:56',7),(188,'300304',160,'2011-05-09 17:34:56',7),(189,'1300380418',161,'2011-05-09 17:34:56',7),(190,'53.1027214771763',162,'2011-05-09 17:34:56',7),(191,'331380',163,'2011-05-09 17:34:56',7),(192,'1300382828',159,'2011-05-10 08:29:52',8),(193,'300304',160,'2011-05-10 08:29:52',8),(194,'1300380418',161,'2011-05-10 08:29:52',8),(195,'53.1027214771763',162,'2011-05-10 08:29:52',8),(196,'331380',163,'2011-05-10 08:29:52',8);
/*!40000 ALTER TABLE `stat_contenus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `stat_mediasessiondates`
--

DROP TABLE IF EXISTS `stat_mediasessiondates`;
/*!50001 DROP VIEW IF EXISTS `stat_mediasessiondates`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `stat_mediasessiondates` (
  `roleid` int(11),
  `rolename` varchar(255),
  `groupid` int(11),
  `groupname` varchar(255),
  `applicationid` int(11),
  `applicationname` varchar(255),
  `serial` varchar(255),
  `widgetid` varchar(255),
  `widgetname` varchar(255),
  `sessionid` varchar(255),
  `date` varchar(255)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `stat_mediasessions`
--

DROP TABLE IF EXISTS `stat_mediasessions`;
/*!50001 DROP VIEW IF EXISTS `stat_mediasessions`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `stat_mediasessions` (
  `roleid` int(11),
  `rolename` varchar(255),
  `groupid` int(11),
  `groupname` varchar(255),
  `applicationid` int(11),
  `applicationname` varchar(255),
  `serial` varchar(255),
  `widgetid` varchar(255),
  `widgetname` varchar(255),
  `sessionid` varchar(255)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `stat_posseders`
--

DROP TABLE IF EXISTS `stat_posseders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_posseders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categorieindex_id` int(11) NOT NULL,
  `categoriecolonnetable_id` int(11) NOT NULL,
  `imagegrand` tinyint(1) DEFAULT '0',
  `affichagenombrestatglobal` tinyint(1) DEFAULT '0',
  `titregraphique` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'Statistique Global',
  `statistic` tinyint(1) DEFAULT '1',
  `titregraphiqueen` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'Gloabal statistic',
  PRIMARY KEY (`id`),
  KEY `categoriecolonnetable_id` (`categoriecolonnetable_id`),
  KEY `categorieindex_id` (`categorieindex_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_posseders`
--

LOCK TABLES `stat_posseders` WRITE;
/*!40000 ALTER TABLE `stat_posseders` DISABLE KEYS */;
/*!40000 ALTER TABLE `stat_posseders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `stat_serials`
--

DROP TABLE IF EXISTS `stat_serials`;
/*!50001 DROP VIEW IF EXISTS `stat_serials`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `stat_serials` (
  `roleid` int(11),
  `rolename` varchar(255),
  `groupid` int(11),
  `groupname` varchar(255),
  `applicationid` int(11),
  `applicationname` varchar(255),
  `serial` int(11)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `stat_tablearchivecategoriecategoriesessiondates`
--

DROP TABLE IF EXISTS `stat_tablearchivecategoriecategoriesessiondates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_tablearchivecategoriecategoriesessiondates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleid` int(11) NOT NULL,
  `rolename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `groupid` int(11) NOT NULL,
  `groupname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `applicationid` int(11) NOT NULL,
  `applicationname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `serial` int(11) NOT NULL,
  `widgetid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sessionid` int(11) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_tablearchivecategoriecategoriesessiondates`
--

LOCK TABLES `stat_tablearchivecategoriecategoriesessiondates` WRITE;
/*!40000 ALTER TABLE `stat_tablearchivecategoriecategoriesessiondates` DISABLE KEYS */;
/*!40000 ALTER TABLE `stat_tablearchivecategoriecategoriesessiondates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_tablearchivemediasessiondates`
--

DROP TABLE IF EXISTS `stat_tablearchivemediasessiondates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_tablearchivemediasessiondates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleid` int(11) NOT NULL,
  `rolename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `groupid` int(11) NOT NULL,
  `groupname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `applicationid` int(11) NOT NULL,
  `applicationname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `serial` int(11) NOT NULL,
  `widgetid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sessionid` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `widgetname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_tablearchivemediasessiondates`
--

LOCK TABLES `stat_tablearchivemediasessiondates` WRITE;
/*!40000 ALTER TABLE `stat_tablearchivemediasessiondates` DISABLE KEYS */;
INSERT INTO `stat_tablearchivemediasessiondates` VALUES (1,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Videos/13187226.avi\'',1288360620,'2010-10-29 13:57:03','\'Titre Big\''),(2,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Videos/13187226.avi\'',1288360620,'2010-10-29 13:57:09','\'Titre Big\''),(3,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Videos/13187226.avi\'',1288360620,'2010-10-29 13:57:12','\'Titre Big\''),(4,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Videos/13187226.avi\'',1288360620,'2010-10-29 13:57:13','\'Titre Big\''),(5,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Videos/13187226.avi\'',1288360620,'2010-10-29 13:57:15','\'Titre Big\''),(6,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Videos/13187226.avi\'',1288360620,'2010-10-29 13:57:19','\'Titre Big\''),(7,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Images/architecture2_fotolia_2923012_m.png\'',1288360620,'2010-10-29 13:57:04','\'Titre Big\''),(8,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Images/architecture2_fotolia_2923012_m.png\'',1288360620,'2010-10-29 13:57:16','\'Titre Big\''),(9,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Images/architecture2_fotolia_2923012_m.png\'',1288360620,'2010-10-29 13:57:24','\'Titre Big\''),(10,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Images/architecture1_fotolia_7362112_m.png\'',1288360620,'2010-10-29 13:57:05','\'Titre Big\''),(11,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Images/architecture1_fotolia_7362112_m.png\'',1288360620,'2010-10-29 13:57:21','\'Titre Big\''),(12,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Images/architecture1_fotolia_7362112_m.png\'',1288360620,'2010-10-29 13:57:26','\'Titre Big\''),(13,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Images/architecture4_fotolia_10380200_m.png\'',1288360620,'2010-10-29 13:57:07','\'Titre Big\''),(14,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Images/architecture4_fotolia_10380200_m.png\'',1288360620,'2010-10-29 13:57:18','\'Titre Big\''),(15,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Videos/13187226.avi\'',1288360620,'2010-10-29 13:57:03','\'Titre Big\''),(16,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Videos/13187226.avi\'',1288360620,'2010-10-29 13:57:09','\'Titre Big\''),(17,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Videos/13187226.avi\'',1288360620,'2010-10-29 13:57:12','\'Titre Big\''),(18,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Videos/13187226.avi\'',1288360620,'2010-10-29 13:57:13','\'Titre Big\''),(19,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Videos/13187226.avi\'',1288360620,'2010-10-29 13:57:15','\'Titre Big\''),(20,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Videos/13187226.avi\'',1288360620,'2010-10-29 13:57:19','\'Titre Big\''),(21,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Images/architecture3_fotolia_5816837_m.png\'',1288360620,'2010-10-29 13:57:10','\'Titre Big\''),(22,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Images/architecture3_fotolia_5816837_m.png\'',1288360620,'2010-10-29 13:57:22','\'Titre Big\''),(23,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Videos/13187226.avi\'',1288360620,'2010-10-29 13:57:03','\'Titre Big\''),(24,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Videos/13187226.avi\'',1288360620,'2010-10-29 13:57:09','\'Titre Big\''),(25,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Videos/13187226.avi\'',1288360620,'2010-10-29 13:57:12','\'Titre Big\''),(26,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Videos/13187226.avi\'',1288360620,'2010-10-29 13:57:13','\'Titre Big\''),(27,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Videos/13187226.avi\'',1288360620,'2010-10-29 13:57:15','\'Titre Big\''),(28,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Videos/13187226.avi\'',1288360620,'2010-10-29 13:57:19','\'Titre Big\''),(29,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Videos/13187226.avi\'',1288360620,'2010-10-29 13:57:03','\'Titre Big\''),(30,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Videos/13187226.avi\'',1288360620,'2010-10-29 13:57:09','\'Titre Big\''),(31,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Videos/13187226.avi\'',1288360620,'2010-10-29 13:57:12','\'Titre Big\''),(32,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Videos/13187226.avi\'',1288360620,'2010-10-29 13:57:13','\'Titre Big\''),(33,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Videos/13187226.avi\'',1288360620,'2010-10-29 13:57:15','\'Titre Big\''),(34,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Videos/13187226.avi\'',1288360620,'2010-10-29 13:57:19','\'Titre Big\''),(35,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Videos/13187226.avi\'',1288360620,'2010-10-29 13:57:03','\'Titre Big\''),(36,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Videos/13187226.avi\'',1288360620,'2010-10-29 13:57:09','\'Titre Big\''),(37,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Videos/13187226.avi\'',1288360620,'2010-10-29 13:57:12','\'Titre Big\''),(38,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Videos/13187226.avi\'',1288360620,'2010-10-29 13:57:13','\'Titre Big\''),(39,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Videos/13187226.avi\'',1288360620,'2010-10-29 13:57:15','\'Titre Big\''),(40,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Videos/13187226.avi\'',1288360620,'2010-10-29 13:57:19','\'Titre Big\''),(41,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Images/architecture2_fotolia_2923012_m.png\'',1288360620,'2010-10-29 13:57:04','\'Titre Big\''),(42,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Images/architecture2_fotolia_2923012_m.png\'',1288360620,'2010-10-29 13:57:16','\'Titre Big\''),(43,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Images/architecture2_fotolia_2923012_m.png\'',1288360620,'2010-10-29 13:57:24','\'Titre Big\''),(44,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Images/architecture4_fotolia_10380200_m.png\'',1288360620,'2010-10-29 13:57:07','\'Titre Big\''),(45,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Images/architecture4_fotolia_10380200_m.png\'',1288360620,'2010-10-29 13:57:18','\'Titre Big\''),(46,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Videos/13187226.avi\'',1288360620,'2010-10-29 13:57:03','\'Titre Big\''),(47,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Videos/13187226.avi\'',1288360620,'2010-10-29 13:57:09','\'Titre Big\''),(48,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Videos/13187226.avi\'',1288360620,'2010-10-29 13:57:12','\'Titre Big\''),(49,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Videos/13187226.avi\'',1288360620,'2010-10-29 13:57:13','\'Titre Big\''),(50,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Videos/13187226.avi\'',1288360620,'2010-10-29 13:57:15','\'Titre Big\''),(51,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Videos/13187226.avi\'',1288360620,'2010-10-29 13:57:19','\'Titre Big\''),(52,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Images/architecture1_fotolia_7362112_m.png\'',1288360620,'2010-10-29 13:57:05','\'Titre Big\''),(53,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Images/architecture1_fotolia_7362112_m.png\'',1288360620,'2010-10-29 13:57:21','\'Titre Big\''),(54,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Images/architecture1_fotolia_7362112_m.png\'',1288360620,'2010-10-29 13:57:26','\'Titre Big\''),(55,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Images/architecture3_fotolia_5816837_m.png\'',1288360620,'2010-10-29 13:57:10','\'Titre Big\''),(56,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Images/architecture3_fotolia_5816837_m.png\'',1288360620,'2010-10-29 13:57:22','\'Titre Big\''),(57,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Images/architecture2_fotolia_2923012_m.png\'',1288360620,'2010-10-29 13:57:04','\'Titre Big\''),(58,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Images/architecture2_fotolia_2923012_m.png\'',1288360620,'2010-10-29 13:57:16','\'Titre Big\''),(59,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Images/architecture2_fotolia_2923012_m.png\'',1288360620,'2010-10-29 13:57:24','\'Titre Big\''),(60,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Images/architecture1_fotolia_7362112_m.png\'',1288360620,'2010-10-29 13:57:05','\'Titre Big\''),(61,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Images/architecture1_fotolia_7362112_m.png\'',1288360620,'2010-10-29 13:57:21','\'Titre Big\''),(62,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Images/architecture1_fotolia_7362112_m.png\'',1288360620,'2010-10-29 13:57:26','\'Titre Big\''),(63,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Images/personne14_fotolia_8311449_m.png\'',1288366801,'2010-10-29 15:40:04','\'\''),(64,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Images/personne28_fotolia_527715_m.png\'',1288366801,'2010-10-29 15:40:06','\'\''),(65,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Images/personne11_fotolia_8085392_m.png\'',1288366801,'2010-10-29 15:40:09','\'\''),(66,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Images/personne19_fotolia_22092764_m.png\'',1288366801,'2010-10-29 15:40:11','\'\''),(67,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Images/personne24_fotolia_23673985_m.png\'',1288366801,'2010-10-29 15:40:13','\'\''),(68,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Images/personne25_fotolia_10067855_m.png\'',1288366801,'2010-10-29 15:40:15','\'\''),(69,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Images/personne6_fotolia_6642695_m.png\'',1288366801,'2010-10-29 15:40:18','\'\''),(70,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Images/personne16_fotolia_2545256_m.png\'',1288366801,'2010-10-29 15:40:21','\'\''),(71,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Images/personne4_fotolia_12998657_m.png\'',1288366801,'2010-10-29 15:40:23','\'\''),(72,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Images/personne30_fotolia_7456361_m.png\'',1288366801,'2010-10-29 15:40:25','\'\''),(73,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Images/personne26_fotolia_4089858_m.png\'',1288366801,'2010-10-29 15:40:27','\'\''),(74,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/koala.png\'',1288804126,'2010-11-03 17:08:51','\'\''),(75,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/koala.png\'',1288804126,'2010-11-03 17:09:41','\'\''),(76,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/koala.png\'',1288804126,'2010-11-03 17:10:36','\'\''),(77,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/koala.png\'',1288804126,'2010-11-03 17:10:39','\'\''),(78,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/koala.png\'',1288804126,'2010-11-03 17:10:41','\'\''),(79,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/koala.png\'',1288804126,'2010-11-03 17:11:08','\'\''),(80,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/koala.png\'',1288804126,'2010-11-03 17:12:30','\'\''),(81,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/jellyfish.png\'',1288804126,'2010-11-03 17:08:56','\'\''),(82,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/jellyfish.png\'',1288804126,'2010-11-03 17:13:56','\'\''),(83,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/penguins.png\'',1288804126,'2010-11-03 17:08:58','\'\''),(84,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/penguins.png\'',1288804126,'2010-11-03 17:14:04','\'\''),(85,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/lighthouse.png\'',1288804126,'2010-11-03 17:09:35','\'\''),(86,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/lighthouse.png\'',1288804126,'2010-11-03 17:12:49','\'\''),(87,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/chrysanthemum.png\'',1288804126,'2010-11-03 17:09:37','\'\''),(88,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/chrysanthemum.png\'',1288804126,'2010-11-03 17:12:04','\'\''),(89,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/chrysanthemum.png\'',1288804126,'2010-11-03 17:12:22','\'\''),(90,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/chrysanthemum.png\'',1288804126,'2010-11-03 17:14:14','\'\''),(91,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/tulipes.png\'',1288804126,'2010-11-03 17:09:39','\'\''),(92,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/tulipes.png\'',1288804126,'2010-11-03 17:10:44','\'\''),(93,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/tulipes.png\'',1288804126,'2010-11-03 17:10:46','\'\''),(94,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/tulipes.png\'',1288804126,'2010-11-03 17:12:24','\'\''),(95,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/koala.png\'',1288804126,'2010-11-03 17:08:51','\'\''),(96,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/koala.png\'',1288804126,'2010-11-03 17:09:41','\'\''),(97,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/koala.png\'',1288804126,'2010-11-03 17:10:36','\'\''),(98,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/koala.png\'',1288804126,'2010-11-03 17:10:39','\'\''),(99,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/koala.png\'',1288804126,'2010-11-03 17:10:41','\'\''),(100,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/koala.png\'',1288804126,'2010-11-03 17:11:08','\'\''),(101,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/koala.png\'',1288804126,'2010-11-03 17:12:30','\'\''),(102,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/desert.png\'',0,'2010-11-03 17:10:33','\'\''),(103,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/desert.png\'',0,'2010-11-03 17:12:39','\'\''),(104,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/koala.png\'',1288804233,'2010-11-03 17:08:51','\'\''),(105,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/koala.png\'',1288804233,'2010-11-03 17:09:41','\'\''),(106,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/koala.png\'',1288804233,'2010-11-03 17:10:36','\'\''),(107,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/koala.png\'',1288804233,'2010-11-03 17:10:39','\'\''),(108,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/koala.png\'',1288804233,'2010-11-03 17:10:41','\'\''),(109,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/koala.png\'',1288804233,'2010-11-03 17:11:08','\'\''),(110,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/koala.png\'',1288804233,'2010-11-03 17:12:30','\'\''),(111,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/koala.png\'',1288804233,'2010-11-03 17:08:51','\'\''),(112,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/koala.png\'',1288804233,'2010-11-03 17:09:41','\'\''),(113,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/koala.png\'',1288804233,'2010-11-03 17:10:36','\'\''),(114,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/koala.png\'',1288804233,'2010-11-03 17:10:39','\'\''),(115,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/koala.png\'',1288804233,'2010-11-03 17:10:41','\'\''),(116,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/koala.png\'',1288804233,'2010-11-03 17:11:08','\'\''),(117,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/koala.png\'',1288804233,'2010-11-03 17:12:30','\'\''),(118,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/koala.png\'',1288804233,'2010-11-03 17:08:51','\'\''),(119,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/koala.png\'',1288804233,'2010-11-03 17:09:41','\'\''),(120,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/koala.png\'',1288804233,'2010-11-03 17:10:36','\'\''),(121,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/koala.png\'',1288804233,'2010-11-03 17:10:39','\'\''),(122,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/koala.png\'',1288804233,'2010-11-03 17:10:41','\'\''),(123,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/koala.png\'',1288804233,'2010-11-03 17:11:08','\'\''),(124,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/koala.png\'',1288804233,'2010-11-03 17:12:30','\'\''),(125,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/tulipes.png\'',1288804233,'2010-11-03 17:09:39','\'\''),(126,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/tulipes.png\'',1288804233,'2010-11-03 17:10:44','\'\''),(127,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/tulipes.png\'',1288804233,'2010-11-03 17:10:46','\'\''),(128,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/tulipes.png\'',1288804233,'2010-11-03 17:12:24','\'\''),(129,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/tulipes.png\'',1288804233,'2010-11-03 17:09:39','\'\''),(130,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/tulipes.png\'',1288804233,'2010-11-03 17:10:44','\'\''),(131,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/tulipes.png\'',1288804233,'2010-11-03 17:10:46','\'\''),(132,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/tulipes.png\'',1288804233,'2010-11-03 17:12:24','\'\''),(133,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/koala.png\'',1288804233,'2010-11-03 17:08:51','\'\''),(134,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/koala.png\'',1288804233,'2010-11-03 17:09:41','\'\''),(135,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/koala.png\'',1288804233,'2010-11-03 17:10:36','\'\''),(136,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/koala.png\'',1288804233,'2010-11-03 17:10:39','\'\''),(137,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/koala.png\'',1288804233,'2010-11-03 17:10:41','\'\''),(138,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/koala.png\'',1288804233,'2010-11-03 17:11:08','\'\''),(139,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/koala.png\'',1288804233,'2010-11-03 17:12:30','\'\''),(140,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/chrysanthemum.png\'',0,'2010-11-03 17:09:37','\'\''),(141,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/chrysanthemum.png\'',0,'2010-11-03 17:12:04','\'\''),(142,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/chrysanthemum.png\'',0,'2010-11-03 17:12:22','\'\''),(143,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/chrysanthemum.png\'',0,'2010-11-03 17:14:14','\'\''),(144,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/chrysanthemum.png\'',1288804324,'2010-11-03 17:09:37','\'\''),(145,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/chrysanthemum.png\'',1288804324,'2010-11-03 17:12:04','\'\''),(146,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/chrysanthemum.png\'',1288804324,'2010-11-03 17:12:22','\'\''),(147,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/chrysanthemum.png\'',1288804324,'2010-11-03 17:14:14','\'\''),(148,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/tulipes.png\'',1288804324,'2010-11-03 17:09:39','\'\''),(149,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/tulipes.png\'',1288804324,'2010-11-03 17:10:44','\'\''),(150,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/tulipes.png\'',1288804324,'2010-11-03 17:10:46','\'\''),(151,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/tulipes.png\'',1288804324,'2010-11-03 17:12:24','\'\''),(152,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/koala.png\'',1288804324,'2010-11-03 17:08:51','\'\''),(153,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/koala.png\'',1288804324,'2010-11-03 17:09:41','\'\''),(154,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/koala.png\'',1288804324,'2010-11-03 17:10:36','\'\''),(155,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/koala.png\'',1288804324,'2010-11-03 17:10:39','\'\''),(156,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/koala.png\'',1288804324,'2010-11-03 17:10:41','\'\''),(157,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/koala.png\'',1288804324,'2010-11-03 17:11:08','\'\''),(158,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/koala.png\'',1288804324,'2010-11-03 17:12:30','\'\''),(159,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/desert.png\'',1288804324,'2010-11-03 17:10:33','\'\''),(160,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/desert.png\'',1288804324,'2010-11-03 17:12:39','\'\''),(161,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/lighthouse.png\'',1288804324,'2010-11-03 17:09:35','\'\''),(162,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/lighthouse.png\'',1288804324,'2010-11-03 17:12:49','\'\''),(163,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/jellyfish.png\'',0,'2010-11-03 17:08:56','\'\''),(164,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/jellyfish.png\'',0,'2010-11-03 17:13:56','\'\''),(165,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/penguins.png\'',0,'2010-11-03 17:08:58','\'\''),(166,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/penguins.png\'',0,'2010-11-03 17:14:04','\'\''),(167,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/chrysanthemum.png\'',1288804450,'2010-11-03 17:09:37','\'\''),(168,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/chrysanthemum.png\'',1288804450,'2010-11-03 17:12:04','\'\''),(169,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/chrysanthemum.png\'',1288804450,'2010-11-03 17:12:22','\'\''),(170,3,'subadmin',1,'mediawall',4,'testcentury21',692072,'\'UI/Images/chrysanthemum.png\'',1288804450,'2010-11-03 17:14:14','\'\''),(171,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'http://www.webcam.tharsis-software.com/out.jpg\'',1289819409,'2010-11-15 11:10:12','\'\''),(172,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'http://www.webcam.tharsis-software.com/out.jpg\'',1289819409,'2010-11-15 11:10:17','\'\''),(173,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'http://www.webcam.tharsis-software.com/out.jpg\'',1289819409,'2010-11-15 11:10:55','\'\''),(174,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'http://www.webcam.tharsis-software.com/out.jpg\'',1289819409,'2010-11-15 11:12:36','\'\''),(175,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'http://www.webcam.tharsis-software.com/out.jpg\'',1289819409,'2010-11-15 11:13:00','\'\''),(176,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'http://www.webcam.tharsis-software.com/out.jpg\'',1289819409,'2010-11-15 11:10:12','\'\''),(177,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'http://www.webcam.tharsis-software.com/out.jpg\'',1289819409,'2010-11-15 11:10:17','\'\''),(178,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'http://www.webcam.tharsis-software.com/out.jpg\'',1289819409,'2010-11-15 11:10:55','\'\''),(179,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'http://www.webcam.tharsis-software.com/out.jpg\'',1289819409,'2010-11-15 11:12:36','\'\''),(180,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'http://www.webcam.tharsis-software.com/out.jpg\'',1289819409,'2010-11-15 11:13:00','\'\''),(181,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Videos/ending the day.avi\'',1289819409,'2010-11-15 11:10:22','\'\''),(182,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Videos/ending the day.avi\'',1289819409,'2010-11-15 11:12:09','\'\''),(183,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Videos/ending the day.avi\'',1289819409,'2010-11-15 11:12:23','\'\''),(184,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'http://www.webcam.tharsis-software.com/out.jpg\'',1289819409,'2010-11-15 11:10:12','\'\''),(185,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'http://www.webcam.tharsis-software.com/out.jpg\'',1289819409,'2010-11-15 11:10:17','\'\''),(186,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'http://www.webcam.tharsis-software.com/out.jpg\'',1289819409,'2010-11-15 11:10:55','\'\''),(187,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'http://www.webcam.tharsis-software.com/out.jpg\'',1289819409,'2010-11-15 11:12:36','\'\''),(188,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'http://www.webcam.tharsis-software.com/out.jpg\'',1289819409,'2010-11-15 11:13:00','\'\''),(189,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Videos/ending the day.avi\'',0,'2010-11-15 11:10:22','\'\''),(190,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Videos/ending the day.avi\'',0,'2010-11-15 11:12:09','\'\''),(191,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Videos/ending the day.avi\'',0,'2010-11-15 11:12:23','\'\''),(192,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Videos/ending the day.avi\'',0,'2010-11-15 11:10:22','\'\''),(193,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Videos/ending the day.avi\'',0,'2010-11-15 11:12:09','\'\''),(194,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'UI/Videos/ending the day.avi\'',0,'2010-11-15 11:12:23','\'\''),(195,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'http://www.webcam.tharsis-software.com/out.jpg\'',0,'2010-11-15 11:10:12','\'\''),(196,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'http://www.webcam.tharsis-software.com/out.jpg\'',0,'2010-11-15 11:10:17','\'\''),(197,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'http://www.webcam.tharsis-software.com/out.jpg\'',0,'2010-11-15 11:10:55','\'\''),(198,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'http://www.webcam.tharsis-software.com/out.jpg\'',0,'2010-11-15 11:12:36','\'\''),(199,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'http://www.webcam.tharsis-software.com/out.jpg\'',0,'2010-11-15 11:13:00','\'\''),(200,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'http://www.webcam.tharsis-software.com/out.jpg\'',0,'2010-11-15 11:10:12','\'\''),(201,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'http://www.webcam.tharsis-software.com/out.jpg\'',0,'2010-11-15 11:10:17','\'\''),(202,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'http://www.webcam.tharsis-software.com/out.jpg\'',0,'2010-11-15 11:10:55','\'\''),(203,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'http://www.webcam.tharsis-software.com/out.jpg\'',0,'2010-11-15 11:12:36','\'\''),(204,3,'subadmin',1,'mediawall',2,'medaiwall-sub',426374,'\'http://www.webcam.tharsis-software.com/out.jpg\'',0,'2010-11-15 11:13:00','\'\'');
/*!40000 ALTER TABLE `stat_tablearchivemediasessiondates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_tablearchivewidgettotalusersapps`
--

DROP TABLE IF EXISTS `stat_tablearchivewidgettotalusersapps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_tablearchivewidgettotalusersapps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleid` int(11) NOT NULL,
  `rolename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `groupid` int(11) NOT NULL,
  `groupname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `applicationid` int(11) NOT NULL,
  `duration` int(11) NOT NULL,
  `sessionid` int(11) NOT NULL,
  `serial` int(11) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_tablearchivewidgettotalusersapps`
--

LOCK TABLES `stat_tablearchivewidgettotalusersapps` WRITE;
/*!40000 ALTER TABLE `stat_tablearchivewidgettotalusersapps` DISABLE KEYS */;
INSERT INTO `stat_tablearchivewidgettotalusersapps` VALUES (1,3,'subadmin',1,'mediawall',2,46,1288366801,426374,'2010-10-29 15:41:08'),(2,3,'subadmin',1,'mediawall',4,55,1288804126,692072,'2010-11-03 17:10:26'),(3,3,'subadmin',1,'mediawall',4,35,1288804233,692072,'2010-11-03 17:11:53'),(4,3,'subadmin',1,'mediawall',4,45,1288804324,692072,'2010-11-03 17:13:35'),(5,3,'subadmin',1,'mediawall',2,50,1289819409,426374,'2010-11-15 11:12:00');
/*!40000 ALTER TABLE `stat_tablearchivewidgettotalusersapps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_tablecategoriesessiondates`
--

DROP TABLE IF EXISTS `stat_tablecategoriesessiondates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_tablecategoriesessiondates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleid` int(11) NOT NULL,
  `rolename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `groupid` int(11) NOT NULL,
  `groupname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `applicationid` int(11) NOT NULL,
  `applicationname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `serial` int(11) NOT NULL,
  `widgetid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sessionid` int(11) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_tablecategoriesessiondates`
--

LOCK TABLES `stat_tablecategoriesessiondates` WRITE;
/*!40000 ALTER TABLE `stat_tablecategoriesessiondates` DISABLE KEYS */;
/*!40000 ALTER TABLE `stat_tablecategoriesessiondates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_tablemediasessiondates`
--

DROP TABLE IF EXISTS `stat_tablemediasessiondates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_tablemediasessiondates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleid` int(11) NOT NULL,
  `rolename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `groupid` int(11) NOT NULL,
  `groupname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `applicationid` int(11) NOT NULL,
  `applicationname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `serial` int(11) NOT NULL,
  `widgetid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sessionid` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `widgetname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3200 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_tablemediasessiondates`
--

LOCK TABLES `stat_tablemediasessiondates` WRITE;
/*!40000 ALTER TABLE `stat_tablemediasessiondates` DISABLE KEYS */;
INSERT INTO `stat_tablemediasessiondates` VALUES (3177,2,'test',1,'mediawall',9,'test',638874,'\'UI/Images/penguins.png\'',1296139120,'2011-01-27 14:38:43','\'\''),(3178,2,'test',1,'mediawall',9,'test',638874,'\'UI/Images/penguins.png\'',1296139120,'2011-01-27 14:38:45','\'\''),(3179,2,'test',1,'mediawall',9,'test',638874,'\'UI/Images/penguins.png\'',1296139120,'2011-01-27 14:38:46','\'\''),(3180,2,'test',1,'mediawall',9,'test',638874,'\'UI/Images/penguins.png\'',1296139120,'2011-01-27 14:38:48','\'\''),(3181,2,'test',1,'mediawall',9,'test',638874,'\'UI/Images/penguins.png\'',1296139120,'2011-01-27 14:38:49','\'\''),(3182,2,'test',1,'mediawall',9,'test',638874,'\'UI/Images/penguins.png\'',1296139120,'2011-01-27 14:38:51','\'\''),(3183,2,'test',1,'mediawall',9,'test',638874,'\'UI/Images/penguins.png\'',1296139120,'2011-01-27 14:38:52','\'\''),(3184,2,'test',1,'mediawall',9,'test',638874,'\'UI/Images/penguins.png\'',1296139120,'2011-01-27 14:38:54','\'\''),(3185,2,'test',1,'mediawall',9,'test',638874,'\'UI/Images/penguins.png\'',1296139120,'2011-01-27 14:38:55','\'\''),(3186,2,'test',1,'mediawall',9,'test',638874,'\'UI/Images/penguins.png\'',1296139120,'2011-01-27 14:38:57','\'\''),(3187,2,'test',1,'mediawall',9,'test',638874,'\'UI/Images/hydrangeas.png\'',1296575267,'2011-02-01 15:47:51','\'\''),(3188,2,'test',1,'mediawall',9,'test',638874,'\'UI/Images/chrysanthemum.png\'',1296575267,'2011-02-01 15:47:53','\'\''),(3189,2,'test',1,'mediawall',9,'test',638874,'\'UI/Images/chrysanthemum.png\'',1296575267,'2011-02-01 15:47:54','\'\''),(3190,2,'test',1,'mediawall',9,'test',638874,'\'UI/Images/hydrangeas.png\'',1296575267,'2011-02-01 15:47:56','\'\''),(3191,2,'test',1,'mediawall',9,'test',638874,'\'UI/Images/hydrangeas.png\'',1296575267,'2011-02-01 15:47:57','\'\''),(3192,2,'test',1,'mediawall',9,'test',638874,'\'UI/Images/hydrangeas.png\'',1296575267,'2011-02-01 15:47:59','\'\''),(3193,2,'test',1,'mediawall',9,'test',638874,'\'UI/Images/koala.png\'',1296575267,'2011-02-01 15:48:00','\'\''),(3194,2,'test',1,'mediawall',9,'test',638874,'\'UI/Images/lighthouse.png\'',1296575267,'2011-02-01 15:48:02','\'\''),(3195,2,'test',1,'mediawall',9,'test',638874,'\'UI/Images/penguins.png\'',1296575267,'2011-02-01 15:48:03','\'\''),(3196,2,'test',1,'mediawall',9,'test',638874,'\'UI/Images/koala.png\'',1296575267,'2011-02-01 15:48:05','\'\''),(3197,2,'test',1,'mediawall',9,'test',638874,'\'UI/Images/lighthouse.png\'',1296575267,'2011-02-01 15:48:06','\'\''),(3198,2,'test',1,'mediawall',9,'test',638874,'\'UI/Images/jellyfish.png\'',1296575267,'2011-02-01 15:48:07','\'\''),(3199,2,'test',1,'mediawall',9,'test',638874,'\'UI/Images/koala.png\'',1296575267,'2011-02-01 15:48:09','\'\'');
/*!40000 ALTER TABLE `stat_tablemediasessiondates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_tables`
--

DROP TABLE IF EXISTS `stat_tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_tables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `affichagetable` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `choixaffichage` tinyint(1) DEFAULT NULL,
  `affichagetableen` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_tables`
--

LOCK TABLES `stat_tables` WRITE;
/*!40000 ALTER TABLE `stat_tables` DISABLE KEYS */;
INSERT INTO `stat_tables` VALUES (12,'Categories_Consulted','',1,NULL),(13,'Users_Sessions','',1,NULL),(14,'Widgets_Consulted','',1,NULL),(15,'Widgets_In_Category_Consulted','',1,NULL),(16,'performance','',1,NULL);
/*!40000 ALTER TABLE `stat_tables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_tablewidgettotalusersapps`
--

DROP TABLE IF EXISTS `stat_tablewidgettotalusersapps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_tablewidgettotalusersapps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleid` int(11) NOT NULL,
  `rolename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `groupid` int(11) NOT NULL,
  `groupname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `applicationid` int(11) NOT NULL,
  `duration` int(11) NOT NULL,
  `sessionid` int(11) NOT NULL,
  `serial` int(11) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_tablewidgettotalusersapps`
--

LOCK TABLES `stat_tablewidgettotalusersapps` WRITE;
/*!40000 ALTER TABLE `stat_tablewidgettotalusersapps` DISABLE KEYS */;
/*!40000 ALTER TABLE `stat_tablewidgettotalusersapps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `stat_viewdurationsessions`
--

DROP TABLE IF EXISTS `stat_viewdurationsessions`;
/*!50001 DROP VIEW IF EXISTS `stat_viewdurationsessions`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `stat_viewdurationsessions` (
  `sessionid` int(11),
  `groupid` int(11),
  `roleid` int(11),
  `applicationid` int(11),
  `countwidgetid` bigint(21),
  `startsession` datetime,
  `duration` bigint(10)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `stat_viewdurationwidgettotalusersapps`
--

DROP TABLE IF EXISTS `stat_viewdurationwidgettotalusersapps`;
/*!50001 DROP VIEW IF EXISTS `stat_viewdurationwidgettotalusersapps`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `stat_viewdurationwidgettotalusersapps` (
  `sessionid` int(11),
  `groupid` int(11),
  `roleid` int(11),
  `applicationid` int(11),
  `startsession` datetime,
  `duration` bigint(10)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `stat_widgetdates`
--

DROP TABLE IF EXISTS `stat_widgetdates`;
/*!50001 DROP VIEW IF EXISTS `stat_widgetdates`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `stat_widgetdates` (
  `date` varchar(255),
  `widgetid` varchar(255)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `stat_widgetids`
--

DROP TABLE IF EXISTS `stat_widgetids`;
/*!50001 DROP VIEW IF EXISTS `stat_widgetids`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `stat_widgetids` (
  `contenu` varchar(255),
  `idinsert` int(11)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `stat_widgetidusers`
--

DROP TABLE IF EXISTS `stat_widgetidusers`;
/*!50001 DROP VIEW IF EXISTS `stat_widgetidusers`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `stat_widgetidusers` (
  `duration` varchar(255),
  `idinsert` int(11)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `stat_widgetnames`
--

DROP TABLE IF EXISTS `stat_widgetnames`;
/*!50001 DROP VIEW IF EXISTS `stat_widgetnames`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `stat_widgetnames` (
  `widgetid` varchar(255),
  `widgetname` varchar(255),
  `serial` varchar(255),
  `idinsert` int(11),
  `sessionid` varchar(255)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `stat_widgetserials`
--

DROP TABLE IF EXISTS `stat_widgetserials`;
/*!50001 DROP VIEW IF EXISTS `stat_widgetserials`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `stat_widgetserials` (
  `widgetid` varchar(255),
  `serial` varchar(255),
  `idinsert` int(11)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `stat_widgetserialsessions`
--

DROP TABLE IF EXISTS `stat_widgetserialsessions`;
/*!50001 DROP VIEW IF EXISTS `stat_widgetserialsessions`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `stat_widgetserialsessions` (
  `widgetid` varchar(255),
  `sessionid` varchar(255),
  `serial` varchar(255),
  `idinsert` int(11)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `stat_widgettotalusers`
--

DROP TABLE IF EXISTS `stat_widgettotalusers`;
/*!50001 DROP VIEW IF EXISTS `stat_widgettotalusers`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `stat_widgettotalusers` (
  `duration` varchar(255),
  `sessionid` varchar(255),
  `serial` varchar(255),
  `date` varchar(255)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `stat_widgettotalusersapps`
--

DROP TABLE IF EXISTS `stat_widgettotalusersapps`;
/*!50001 DROP VIEW IF EXISTS `stat_widgettotalusersapps`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `stat_widgettotalusersapps` (
  `roleid` int(11),
  `rolename` varchar(255),
  `groupid` int(11),
  `groupname` varchar(255),
  `applicationid` int(11),
  `duration` varchar(255),
  `sessionid` varchar(255),
  `serial` varchar(255),
  `date` varchar(255)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `stat_widgetusersessionids`
--

DROP TABLE IF EXISTS `stat_widgetusersessionids`;
/*!50001 DROP VIEW IF EXISTS `stat_widgetusersessionids`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `stat_widgetusersessionids` (
  `sessionid` varchar(255),
  `idinsert` int(11)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `stat_widgetusersessionserials`
--

DROP TABLE IF EXISTS `stat_widgetusersessionserials`;
/*!50001 DROP VIEW IF EXISTS `stat_widgetusersessionserials`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `stat_widgetusersessionserials` (
  `serial` varchar(255),
  `idinsert` int(11)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `stat_widgetusertimes`
--

DROP TABLE IF EXISTS `stat_widgetusertimes`;
/*!50001 DROP VIEW IF EXISTS `stat_widgetusertimes`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `stat_widgetusertimes` (
  `date` varchar(255),
  `idinsert` int(11)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `crypted_password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `persistence_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alertapp` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'nicolas','4fe69a50e173bd0fac7a2a1af9281ffe2d5c392ddb3ac4399774ad41f2752f5d1fccff66140fe87fd64a1a68372fda0c2f15f99a4f204d0df425246dfa9a5065','zpVBzxtPDvqIK0xhSSR','b0ff6984eda076109ab164e7d638fd7a65f9fdb855053a8706feb1a02819cd48c8dfe210642cb816e06e39cc1f87dc6129a603806ab4e15f436e787feb15d399','2010-09-03 13:42:37','2010-12-01 17:26:31',1,'nicolas.vandenbogaerde@gmail.com','fr',1),(2,'toto','b42c2b1af5fc6d59b7822064069b8c42bf0c8d121b347e1e45fedc40ac3d67746bd16717e596764056e2bedaad6977aaf27c08b0751ce229e352992769554818','7mBYhoXpBz9xFqDjlRzU','e8dc2484a7ac2ea787b709ff02210cdd7f708eba66a40299db2af03ccc4a458444e241d11998920d0a4e270ad5c05a7bed28649e4c17e9d13e454fc3d4d7373c','2010-09-13 14:38:37','2010-09-17 09:12:43',4,'toto@gtoto.com','fr',0),(3,'test','eaa7c74e013aab551b9fcdd36ef921c5ef27518b80aeaa27ad8cf25097acac9a5cea0627e8079d6f969550acf17a56975cb72e1241a5dd3b32e24bb8cf9f00c7','VjWfP82jSNQuQCNs82A','e841d93498a13691a22163257e85dfa895dc3a070b06a464a78508fb6b4c66c78707637a016907f5b64c9e48b05a5b5f6a86540340812d18d7d65acea01bb73f','2010-12-01 11:07:39','2010-12-01 11:08:54',6,'nicolas.remia@gmail.com','fr',0),(5,'nicolastest','f8bb52b47dbf8480ff6f6a3f81b7ad5759a2612daad90c1cdd4a5c9cd4d058d94b509d85c20f07424762b60276ce670265ae72565d7ecfc9e0e39fb39f1ba25b','MIufuDdVr9PdzB9CeoJq','df52e462ecbf3663b11d502c98374e42974399a9c4eb4b75bad68b8f0ccaf83bb860c9afbf22b6982315e6be8ab533bb48e1a6aad04ad42488a0a7d5d6de5304','2010-12-09 15:58:08','2010-12-09 15:58:08',1,'nicolas.va@gmail.com','fr',0),(6,'testdsfdsfdsfdsfdsfsd','a302356c171e084cc493249381a6fd39e90571b64eee9770bd98ef213a40d00fe7fd3d9768d9ab12ee0e6e22d08067b47014e28f3686dfa1d2ea9094b40e6128','uzx99ygtrmhkoFQlmpKj','a66c7046a2f6a9c8b8f3cca5314f1f31d02a3ca5f9bad3781cc89b74be02d522aa6af886f6883ddca1b716efe69f7d91502833e157008f087b2e1e8718077dba','2010-12-09 16:45:09','2010-12-09 16:45:09',1,'nicolas@noos.fr','fr',0),(7,'rolepopopoupsdfqsffds','a506419bab3b1c84957a162ad39f1c9e9b55e6811b997b141c25c77003c43b8ff326f3791f41dbdf0b2d1d6cc28bcbd7c1367a58cec2a5c2fbb36a6ac05d9b4c','ydvsn09YP99KGvYBqznO','c2a5816c1fbe13f1ce67b0f1ccfd1336f871450300763036a970a0c71880fd77bc8672e5a47681635aab03b31f2cf4f2c1b0bf94f6016ecce2f0b78a119f0fee','2010-12-16 10:52:49','2010-12-16 10:52:49',24,'default@default.com','fr',0),(8,'dsfdsfdsfdsfsdf','dca1fabdae049070d6b6b1649574a9248f3f6b3ce3b20feead0d4a8a4e07444430d4df8d6de644ae4b767d591ff42c443cd35f326a9ea201b976a8aa3724255c','lMxwALkHMGruQrMNcqxK','09d3d6269663aeb9bf626601876d85deae0e878268343fde8dbb25be0a9c27271aa006f830dd058666389a041685683c2f34974dd41c2421691c33f68343fec1','2010-12-16 11:27:19','2010-12-16 11:27:19',31,'dsfdsfdsfdsfsdf@default.com','fr',0),(9,'qsdfqsdfqsfdqsftest','7337a1cf89ecc0405961539b11113a5781d10571a20e7bdfa5d40577b9a034e3648e1d5097899dfd772b29da78d1f905d2e400fb4fd9e0186aeffd1de2fcf306','NeVEFrbehmwcYTHF','69c41da95e2fb4bfb92a4a658116313bbdcbf4dbe1eed377f0ce643b078e8f581cf8c5e2a1ae6ce79270e8b146c83318f2b2a0b63f097984f164e8bcc128bbb2','2010-12-16 11:32:49','2010-12-16 11:32:49',33,'qsdfqsdfqsfdqsftest@default.com','fr',0),(10,'testroles','342442666666ef1b0f180a41d95ef409396ad31e74f4e1e02627f7874f334b649f6b1b00fe379853eec656885e464b08d1bcbf0360993f873951a616694c369d','xEGxWkjYRS7bLZHT0bi3','51bff7d4a1e56b4f9121477a14f01316783e3d29a8ebb752a6ddf9e00d879d039d4c97a1711332fbf08ca0e938ada05fafb26bb1f0dad70e5ade2a6561168327','2010-12-29 10:19:36','2010-12-29 10:19:36',34,'testroles@default.com','fr',0),(11,'testtest','99748212e4249e8c860749da7dbee676212a55648684e0b76f540499c2bd3ef82524c023736369b8e865001599e05cb663980201973b48e00f712aae26e3d529','DX26ty0cP4SErQMoHogT','973a08ba50eb46f59571ee48c3705dfe46520a0fda589179a4d12dd254f2097b3a67e0bec8dadb3b2049fe17669159813522b58f6f1354f9ade332636b137098','2011-02-04 16:24:27','2011-02-04 16:24:43',35,'testtest@default.com','fr',0),(12,'dfdsfsdf','09e04b576fa8e64dfb1c960d130f2c185f8ef4199e006500eaf25f6276350ed3fd8a767a27475a799bc4783afd819f2a93a94ba3b62e0e47a28e6aa704e1bc52','pl9TxMfeYvqZ1R9A3HuD','0e39b5420f31c2044a4aeca917d876254049c8c0db03a2cd36f6c923980f1ecb4f956a302287eb3807ee6d61a59182f7f1125098586ecb2d0406ff67b18708e3','2011-03-07 10:10:07','2011-03-07 10:10:07',37,'dfdsfsdf@default.com','fr',0),(13,'testdfdsfsd','5ade5815d579e8328735fba4c80293073868c1582f893ddfea89503bcce084c18b1ff65aa7ea55299a843f2b4abaf0115f7a46c3a3a37ac4a92025faa9062408','aN3ixj1b4P2p7Rcd747O','5809be5d4d3064ed9f04ca9b75ea2359d1ec77d8c64bd2893faaa9f5ed3bdd123b197816bb5289ac7efca48bcb3f5b8bd3fe524c7765c81434bd19a0542581f4','2011-03-07 10:10:57','2011-03-07 10:10:57',38,'testdfdsfsd@default.com','fr',0),(14,'test2localnicolasasupmail','a7575674b91d3c10b344725acc6f29268ef4f518355d539612d4b06aa4ca4c36b167771d31b5a12099d885f88ff14894ba9c553230e344087db70a62f078d012','qyv6l5WyXE9RNk2VFZ3','c3baf850936dadd6ec7b6d000d0d21dc41fd4d74e2e8e8e73838ca809d35ef48a15b4033ffcbd0e748f6faaa089afed74d94e3fe5679ee47f596b732a845147f','2011-03-07 10:16:53','2011-03-07 10:16:53',39,'test2localnicolasasupmail@default.com','fr',0),(15,'fdsfdsf','6940c1c307b55572ee3c3835860fffb0a4e1ffee0f06e79399cc1e4ae07031a2c41704bf596a2bad4f1462254244c61fb95d014b9166bb2867970445b5efa286','hoM2GUUXRKl8VxUKSKK8','ef248b987da4454fb79e3ec5b6073bf4c310131c318b5b888964e945225ebc81edb1ea7154cef12412dbf49555694b0256202714118eace321fc2f21b28f019d','2011-03-07 10:24:49','2011-03-07 10:24:49',40,'fdsfdsf@default.com','fr',0),(16,'dsfdsfsdfsd','47ab2c0eb584d837aadb6db8a905788cd2e5ffe2855c59bb3e5f861781f56531aae15cea9bb00449364b4a4d8d5d5a2529ff0740dde100f3a3e7da2f61f0d530','xQ3v2thq0972n7uYrYT','09b9423da90e5b4b0830f8236b91d806a64cade4c4dce851665bfa58bc12227efb4b1c35cfb8456620726944d10bce25b44a07e61ad0c1ccc7f39ccc4072b56e','2011-03-08 10:30:29','2011-03-08 10:30:29',41,'dsfdsfsdfsd@default.com','fr',0),(17,'fdsfdsfsdfdsfsd','66eef04dfd443a799c2a079414d6150c443de826ca3f59f3e178f278382258b425ef5d4ec4644654c42cd719b4a23a2895359949149ca1c67a8db43ba96a7abe','W3USHfYQ8tpkZ1578Ha','2ed396b795cbfc49de8b102d5644f6d3a83f16466badc41746f169ab63c281f9a4350e97f3a733c83d5a1219a3b4333e8043c5c5e9033f41bb5ff83f7f1bc274','2011-03-08 10:32:45','2011-03-08 10:32:45',44,'fdsfdsfsdfdsfsd@default.com','fr',0),(18,'testnicolas','1e0a58d61b9a62375476b539460cd6c395d837d83008a2de4648fc72a581dc151c108a14f1e42613f042290e055f33d4c4ebe505ff5b589c2875fba43e9a51ef','bIZ1bh0UztOtz9RpzzhL','2d0ecce7e986f728fbd18cebc6e7bf30cafe4d354941b1d03fedeb215a4d046ae6d7a5cc4ad8284f5db937dac565168160052b60ba6c63332e34533d69711dfd','2011-03-11 14:55:12','2011-03-11 14:55:12',45,'testnicolas@default.com','fr',0),(19,'instore','b1b939eb7c9b21f673f3322897776fe9770723cf7bfec6afde540016a7522ce82cfd6fffd5e91924cb71de06032a58f7c76f288c6257ac87e2d8434902acf461','pVIzw3qcSAbu2IPtrFi','d4ef2ac5ab5a0e9b7ed4fc57d633c48cf71817f376471fdb251c60a86c0bff32de96f6010d0d0526efe630dc294e6396387232bd5dc6c64c8e3e3446a7d446d7','2011-03-16 15:22:53','2011-03-16 15:22:53',46,'instore@default.com','fr',0),(20,'testnicolasbisoupsmdr','66689725d9618039178f5d4bfa13c39a0b00a1dd75e93e63ba8976847b6e2d21f3a3f88aabf6bc8a6edc733fcf48b1c9234e37910bced64a6b765a8cbdaece09','TFPvEUrK7uIMSJfhRt','a3ef4640618ccb007d40d4bb934b6eed72b762e097e98e76abf4062dcc2cd8cb513cd805398cb0f7a0b04d5b218969bd20a65b7039b747a729d03ed86af4d6a8','2011-03-23 11:09:07','2011-03-23 11:09:07',50,'testnicolasbisoupsmdr@default.com','fr',0),(21,'mdrnicolasoups','974b7888306681cea1b97e6e413973e874177a2d5f0f6e36ae5bc8cb18b7257b7b5f123caa8e017b6f9bbe06d84aab73fcd130d309f53fd092db79083b1ac469','c37XT8gbWBap0ClavlO0','000204d7180c4305e09a6a61db67cd177ba2fe77631cec849121713fa90c965c6c1e0784caf890f6650fe0e1918b4ba14436ac6e70881dc8b34d2ca757682733','2011-03-23 11:09:41','2011-03-23 11:09:41',51,'mdrnicolasoups@default.com','fr',0),(22,'test0','8b8c60082e6531f3a5e54f86f5ab6441bb26dba7a7d1704f6046adeaad1c31af1e051e4705a29e1c2433da718786991e7ab9f91db48e3d3f0a60d9f9dd63f2e9','2mEsoEty5Bholjnaebql','3a840e8690fd0d12dd3d86c842f7971630301e798449250a13be592536d4535c5eac56d0d756ad93b9e347d2321e3424a09be16ec4760c3b22c692f98c46f5c9','2011-03-23 13:26:04','2011-03-23 13:26:04',58,'test@default.com','fr',0),(23,'testgroupmail','a50b2835ac885424856f16d848a3a69d389f52bdaaf647e2fb3aea9787f0b5c9b8e73ec9307c5eb8f9c5f2bbe1434ed8e19b74ff37610a344d54e14769ae0d16','yg5on6QyPtlwcXG2Uqz','d20dc2fa61589f64b3ca7351527d0c3019db78fb4651165db3aa745ff6d16eab6283d1f8d7958d183222b23171f5830fdd9623bef42c60150b68ce14e3f5a9aa','2011-03-23 13:26:44','2011-03-23 13:26:44',60,'testgroupmail@default.com','fr',0),(24,'subadmin','db8915f4fb59f7899468a3bd01bc397cfaf01e1e9a7174f03224292c0c99e5575344c09953ececacc16f7cf462db90d188faefb6fc5d4a35a2d2a140a026a158','PDJ1hGYvEThJGZWR8Lx','1cb616fd38a1e29a8cb2fab5d7506ac27a80172ab03454d2e2d9925700d3b5395de148c9e0272acf65ced466b69e4d899c1228dd069e9dcfa51ca19991fc5de2','2011-03-23 13:30:08','2011-03-23 13:30:08',62,'subadmin@default.com','fr',0),(25,'subadmin0','415c07d8c68a468b9b22ce4fba608092cfae4ad0f993bfbe7e6b413dbb41e0bfd861b19c5b316fce1c5d65d40dbf2589dda8afe059106e8a9eee074488899f42','QI2algm1glpsk7hPXWlI','2ac4c10a51c456ece790e9120df2ae58a4cd7f3ea6b6dde596c9bd0c2cec7be7a64b3afc4f31f2a724d19312a392dddd90d69f72d8095e62d082ba394c58ff43','2011-03-23 13:33:28','2011-03-23 13:33:28',65,'subadmin0@default.com','fr',0),(26,'subadmin1','44b738bbc493372e7297e824917b48e2904f1ab4a83c91e42dbff453c8816a6a67f0c4caa1f81b179e6de7bd934ad3c12efe302377ce7bb5604caba21e42e4bd','eBq29xNaWRvgurUUuRAX','83b3309ade25c098d05b482aabf387a642fc2fc7907cf12b27b20a5a3be4cbdd24cb12e1291002f57dc1e2a96bbee542febca2678981ca5b2d472ec64b915763','2011-03-23 13:33:54','2011-03-23 13:33:54',67,'subadmin1@default.com','fr',0),(27,'test_nicolas_verif','60b32d54f2a5667486252ef7f96d0ff77060a4c7e2c77b6d986dc77b96454bec62cda4c5cc3289403f84d6c99978e6bed71b25233d3c3d514cac30fc937a1dc6','3lXJV9GzTNIMPhGcBH0','e8ecebee0609c94fa1704447c26ee508b96141429fd611730827d8d2f846d41186870bfb167d2e061855c907c8627aff8759f3ce95ae8593a5b735ee4d643568','2011-03-24 17:33:14','2011-03-24 17:33:14',68,'test_nicolas_verif@default.com','fr',0),(28,'test_nicolas_verif0','0bd66cf746ff0d5107c9e7893c226c48f328991d8bf9f95b84179b24eac36265512d6018ad19cd7671a7ff51e967d42d52de88b429bfb20956de8fd84b187853','QiHCrsTh55qRHdz7K4r','2da9228476aede5b2c403ec25232189af14e47fc0acf60fac4b3e3b7ce5bb45dd51805b16de8e48a0d5e1caab3300c1d9d89cdf1c73bf2c441347450088913f3','2011-03-24 17:33:49','2011-03-24 17:33:49',69,'test_nicolas_verif0@default.com','fr',0),(29,'testfdsfdsfdsfdsfdsf','6748a68d0066bdfb1d20019daa7f890052cbf9fc0f095acadb9124f670a365ae84842789b7adca42cd6100224ff06599ce6a7b29f81723d791d5b2dd40b75eeb','0uockfTBIzfq6CKglhqB','007fdf43703df5fc600fba242d3f76e79ea72dbe47b15e54662cf2339f2733ec0ba65649a36b8b2c39eed227bde40ae944e4f392086dbe693017df1c43c41afa','2011-03-24 17:35:05','2011-03-24 17:35:05',70,'testfdsfdsfdsfdsfdsf@default.com','fr',0),(30,'testfdsfdsfdsfdsfdsf0','7889fd052407af74e0f13abf3326efb1680e9c0f0a0251958065d3e9f25ed43a8660813caab589e24d384db5ac2f950547d64ac23ba52a9160fb538d17f1f72f','S61sMOc1kIxPcvOT8qPX','6702205c5d413cc51f890098b40ea7c0b0fef03fb50d75fbbf75b3f361339b41c248e025586286fdc9cca1d93152c1da42a36fd7505a0d7269dc41aaff3915f2','2011-03-24 17:38:14','2011-03-24 17:38:14',71,'testfdsfdsfdsfdsfdsf0@default.com','fr',0),(31,'test_nicolas_oups','e2b3ebceb08fbf7751a183305fe2d83f57035aaeed6f130303606ff48a70106bdbbfd571171ad701e3e4125e307003662ec56a4920e315aebc299b6ff9320aba','Sao4gaP2Dfh90Rx2OXu','31327bf24e7d851ee502acb2827b14c9316f7b4c27a5b53c948208a3ca0848ca81a5ec4a87f312148d3f141151a4fb3ea988a71d0800692792d557d7decc2547','2011-03-24 17:39:06','2011-03-24 17:39:06',72,'test_nicolas_oups@default.com','fr',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `widget_date`
--

DROP TABLE IF EXISTS `widget_date`;
/*!50001 DROP VIEW IF EXISTS `widget_date`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `widget_date` (
  `date` varchar(255),
  `widgetid` varchar(255)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `widget_id`
--

DROP TABLE IF EXISTS `widget_id`;
/*!50001 DROP VIEW IF EXISTS `widget_id`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `widget_id` (
  `contenu` varchar(255),
  `idinsert` int(11)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `widget_serial`
--

DROP TABLE IF EXISTS `widget_serial`;
/*!50001 DROP VIEW IF EXISTS `widget_serial`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `widget_serial` (
  `widgetid` varchar(255),
  `serial` varchar(255),
  `idinsert` int(11)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `widgetserialsession`
--

DROP TABLE IF EXISTS `widgetserialsession`;
/*!50001 DROP VIEW IF EXISTS `widgetserialsession`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `widgetserialsession` (
  `widgetid` varchar(255),
  `sessionid` varchar(255),
  `serial` varchar(255),
  `idinsert` int(11)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `nbcategory`
--

/*!50001 DROP TABLE IF EXISTS `nbcategory`*/;
/*!50001 DROP VIEW IF EXISTS `nbcategory`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `nbcategory` AS select `stat_contenus`.`contenu` AS `nbcategory`,`stat_contenus`.`idinsert` AS `idinsert` from `stat_contenus` where (`stat_contenus`.`colonne_id` = 38) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `nbmedias`
--

/*!50001 DROP TABLE IF EXISTS `nbmedias`*/;
/*!50001 DROP VIEW IF EXISTS `nbmedias`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `nbmedias` AS select `stat_contenus`.`contenu` AS `nbmedias`,`stat_contenus`.`idinsert` AS `idinsert` from `stat_contenus` where (`stat_contenus`.`colonne_id` = 37) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `serial`
--

/*!50001 DROP TABLE IF EXISTS `serial`*/;
/*!50001 DROP VIEW IF EXISTS `serial`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `serial` AS select `roles`.`id` AS `roleid`,`roles`.`name` AS `rolename`,`groupapps`.`id` AS `groupid`,`groupapps`.`name` AS `groupname`,`applications`.`id` AS `applicationid`,`applications`.`name` AS `applicationame`,`applications`.`serial` AS `serial` from ((`roles` join `groupapps`) join `applications`) where ((`applications`.`role_id` = `roles`.`id`) and (`applications`.`groupapp_id` = `groupapps`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `session_durations`
--

/*!50001 DROP TABLE IF EXISTS `session_durations`*/;
/*!50001 DROP VIEW IF EXISTS `session_durations`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `session_durations` AS select `stat_contenus`.`contenu` AS `duration`,`stat_contenus`.`idinsert` AS `idinsert` from `stat_contenus` where (`stat_contenus`.`colonne_id` = 36) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `sessionid`
--

/*!50001 DROP TABLE IF EXISTS `sessionid`*/;
/*!50001 DROP VIEW IF EXISTS `sessionid`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sessionid` AS select `stat_contenus`.`contenu` AS `sessionid`,`stat_contenus`.`idinsert` AS `idinsert` from `stat_contenus` where (`stat_contenus`.`colonne_id` = 50) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `sessions`
--

/*!50001 DROP TABLE IF EXISTS `sessions`*/;
/*!50001 DROP VIEW IF EXISTS `sessions`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sessions` AS select `sessionid`.`idinsert` AS `idinsert`,`sessionid`.`sessionid` AS `sessionid`,`nbcategory`.`nbcategory` AS `nbcategory`,`nbmedias`.`nbmedias` AS `nbmedias`,`session_durations`.`duration` AS `duration` from (((`sessionid` join `nbcategory`) join `nbmedias`) join `session_durations`) where ((`sessionid`.`idinsert` = `nbcategory`.`idinsert`) and (`sessionid`.`idinsert` = `nbmedias`.`idinsert`) and (`sessionid`.`idinsert` = `session_durations`.`idinsert`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `stat_categoriesessiondates`
--

/*!50001 DROP TABLE IF EXISTS `stat_categoriesessiondates`*/;
/*!50001 DROP VIEW IF EXISTS `stat_categoriesessiondates`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `stat_categoriesessiondates` AS select `stat_categoriesessions`.`roleid` AS `roleid`,`stat_categoriesessions`.`rolename` AS `rolename`,`stat_categoriesessions`.`groupid` AS `groupid`,`stat_categoriesessions`.`groupname` AS `groupname`,`stat_categoriesessions`.`applicationid` AS `applicationid`,`stat_categoriesessions`.`applicationname` AS `applicationname`,`stat_categoriesessions`.`serial` AS `serial`,`stat_categoriesessions`.`widgetid` AS `widgetid`,`stat_categoriesessions`.`sessionid` AS `sessionid`,`stat_categoriewidgetdates`.`date` AS `date` from (`stat_categoriesessions` join `stat_categoriewidgetdates`) where (`stat_categoriesessions`.`widgetid` = `stat_categoriewidgetdates`.`widgetid`) group by `stat_categoriewidgetdates`.`date` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `stat_categoriesessions`
--

/*!50001 DROP TABLE IF EXISTS `stat_categoriesessions`*/;
/*!50001 DROP VIEW IF EXISTS `stat_categoriesessions`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `stat_categoriesessions` AS select `stat_serials`.`roleid` AS `roleid`,`stat_serials`.`rolename` AS `rolename`,`stat_serials`.`groupid` AS `groupid`,`stat_serials`.`groupname` AS `groupname`,`stat_serials`.`applicationid` AS `applicationid`,`stat_serials`.`applicationname` AS `applicationname`,`stat_categoriewidgetserialsessions`.`serial` AS `serial`,`stat_categoriewidgetserialsessions`.`widgetid` AS `widgetid`,`stat_categoriewidgetserialsessions`.`sessionid` AS `sessionid` from (`stat_serials` join `stat_categoriewidgetserialsessions`) where (`stat_categoriewidgetserialsessions`.`serial` = `stat_serials`.`serial`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `stat_categoriewidgetdates`
--

/*!50001 DROP TABLE IF EXISTS `stat_categoriewidgetdates`*/;
/*!50001 DROP VIEW IF EXISTS `stat_categoriewidgetdates`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `stat_categoriewidgetdates` AS select `stat_contenus`.`contenu` AS `date`,`stat_categoriewidgetserials`.`widgetid` AS `widgetid` from (`stat_categoriewidgetserials` join `stat_contenus`) where ((`stat_contenus`.`idinsert` = `stat_categoriewidgetserials`.`idinsert`) and (`stat_contenus`.`colonne_id` = (select `stat_colonnes`.`id` from (`stat_tables` join `stat_colonnes`) where ((`stat_colonnes`.`table_id` = `stat_tables`.`id`) and (`stat_tables`.`name` like 'Categories_Consulted') and (`stat_colonnes`.`name` like 'time'))))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `stat_categoriewidgetids`
--

/*!50001 DROP TABLE IF EXISTS `stat_categoriewidgetids`*/;
/*!50001 DROP VIEW IF EXISTS `stat_categoriewidgetids`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `stat_categoriewidgetids` AS select `stat_contenus`.`contenu` AS `contenu`,`stat_contenus`.`idinsert` AS `idinsert` from `stat_contenus` where (`stat_contenus`.`colonne_id` = (select `stat_colonnes`.`id` from (`stat_colonnes` join `stat_tables`) where ((`stat_colonnes`.`table_id` = `stat_tables`.`id`) and (`stat_tables`.`name` like 'Categories_Consulted') and (`stat_colonnes`.`name` like 'categoryName')))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `stat_categoriewidgetnames`
--

/*!50001 DROP TABLE IF EXISTS `stat_categoriewidgetnames`*/;
/*!50001 DROP VIEW IF EXISTS `stat_categoriewidgetnames`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `stat_categoriewidgetnames` AS select `stat_categoriewidgetserialsessions`.`widgetid` AS `widgetid`,`stat_contenus`.`contenu` AS `widgetname`,`stat_categoriewidgetserialsessions`.`serial` AS `serial`,`stat_categoriewidgetserialsessions`.`idinsert` AS `idinsert`,`stat_categoriewidgetserialsessions`.`sessionid` AS `sessionid` from (`stat_contenus` join `stat_categoriewidgetserialsessions`) where ((`stat_contenus`.`idinsert` = `stat_categoriewidgetserialsessions`.`idinsert`) and (`stat_contenus`.`colonne_id` = (select `stat_colonnes`.`id` from (`stat_colonnes` join `stat_tables`) where ((`stat_colonnes`.`table_id` = `stat_tables`.`id`) and (`stat_colonnes`.`name` like 'widgetName') and (`stat_tables`.`name` like 'Widgets_In_Category_Consulted'))))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `stat_categoriewidgetserials`
--

/*!50001 DROP TABLE IF EXISTS `stat_categoriewidgetserials`*/;
/*!50001 DROP VIEW IF EXISTS `stat_categoriewidgetserials`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `stat_categoriewidgetserials` AS select `stat_categoriewidgetids`.`contenu` AS `widgetid`,`stat_contenus`.`contenu` AS `serial`,`stat_categoriewidgetids`.`idinsert` AS `idinsert` from (`stat_contenus` join `stat_categoriewidgetids`) where ((`stat_contenus`.`idinsert` = `stat_categoriewidgetids`.`idinsert`) and (`stat_contenus`.`colonne_id` = (select `stat_colonnes`.`id` from (`stat_colonnes` join `stat_tables`) where ((`stat_colonnes`.`table_id` = `stat_tables`.`id`) and (`stat_tables`.`name` like 'Categories_Consulted') and (`stat_colonnes`.`name` like 'application_serial'))))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `stat_categoriewidgetserialsessions`
--

/*!50001 DROP TABLE IF EXISTS `stat_categoriewidgetserialsessions`*/;
/*!50001 DROP VIEW IF EXISTS `stat_categoriewidgetserialsessions`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `stat_categoriewidgetserialsessions` AS select `stat_categoriewidgetserials`.`widgetid` AS `widgetid`,`stat_contenus`.`contenu` AS `sessionid`,`stat_categoriewidgetserials`.`serial` AS `serial`,`stat_categoriewidgetserials`.`idinsert` AS `idinsert` from (`stat_contenus` join `stat_categoriewidgetserials`) where ((`stat_contenus`.`idinsert` = `stat_categoriewidgetserials`.`idinsert`) and (`stat_contenus`.`colonne_id` = (select `stat_colonnes`.`id` from (`stat_colonnes` join `stat_tables`) where ((`stat_colonnes`.`table_id` = `stat_tables`.`id`) and (`stat_colonnes`.`name` like 'userSessionId') and (`stat_tables`.`name` like 'Categories_Consulted'))))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `stat_mediasessiondates`
--

/*!50001 DROP TABLE IF EXISTS `stat_mediasessiondates`*/;
/*!50001 DROP VIEW IF EXISTS `stat_mediasessiondates`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `stat_mediasessiondates` AS select `stat_mediasessions`.`roleid` AS `roleid`,`stat_mediasessions`.`rolename` AS `rolename`,`stat_mediasessions`.`groupid` AS `groupid`,`stat_mediasessions`.`groupname` AS `groupname`,`stat_mediasessions`.`applicationid` AS `applicationid`,`stat_mediasessions`.`applicationname` AS `applicationname`,`stat_mediasessions`.`serial` AS `serial`,`stat_mediasessions`.`widgetid` AS `widgetid`,`stat_mediasessions`.`widgetname` AS `widgetname`,`stat_mediasessions`.`sessionid` AS `sessionid`,`stat_widgetdates`.`date` AS `date` from (`stat_mediasessions` join `stat_widgetdates`) where (`stat_mediasessions`.`widgetid` = `stat_widgetdates`.`widgetid`) group by `stat_widgetdates`.`date` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `stat_mediasessions`
--

/*!50001 DROP TABLE IF EXISTS `stat_mediasessions`*/;
/*!50001 DROP VIEW IF EXISTS `stat_mediasessions`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `stat_mediasessions` AS select `stat_serials`.`roleid` AS `roleid`,`stat_serials`.`rolename` AS `rolename`,`stat_serials`.`groupid` AS `groupid`,`stat_serials`.`groupname` AS `groupname`,`stat_serials`.`applicationid` AS `applicationid`,`stat_serials`.`applicationname` AS `applicationname`,`stat_widgetnames`.`serial` AS `serial`,`stat_widgetnames`.`widgetid` AS `widgetid`,`stat_widgetnames`.`widgetname` AS `widgetname`,`stat_widgetnames`.`sessionid` AS `sessionid` from (`stat_serials` join `stat_widgetnames`) where (`stat_widgetnames`.`serial` = `stat_serials`.`serial`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `stat_serials`
--

/*!50001 DROP TABLE IF EXISTS `stat_serials`*/;
/*!50001 DROP VIEW IF EXISTS `stat_serials`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `stat_serials` AS select `roles`.`id` AS `roleid`,`roles`.`name` AS `rolename`,`groupapps`.`id` AS `groupid`,`groupapps`.`name` AS `groupname`,`applications`.`id` AS `applicationid`,`applications`.`name` AS `applicationname`,`applications`.`serial` AS `serial` from ((`roles` join `groupapps`) join `applications`) where ((`applications`.`role_id` = `roles`.`id`) and (`applications`.`groupapp_id` = `groupapps`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `stat_viewdurationsessions`
--

/*!50001 DROP TABLE IF EXISTS `stat_viewdurationsessions`*/;
/*!50001 DROP VIEW IF EXISTS `stat_viewdurationsessions`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `stat_viewdurationsessions` AS select `stat_tablemediasessiondates`.`sessionid` AS `sessionid`,`stat_tablemediasessiondates`.`groupid` AS `groupid`,`stat_tablemediasessiondates`.`roleid` AS `roleid`,`stat_tablemediasessiondates`.`applicationid` AS `applicationid`,count(`stat_tablemediasessiondates`.`widgetid`) AS `countwidgetid`,min(`stat_tablemediasessiondates`.`date`) AS `startsession`,time_to_sec(timediff(max(`stat_tablemediasessiondates`.`date`),min(`stat_tablemediasessiondates`.`date`))) AS `duration` from `stat_tablemediasessiondates` group by `stat_tablemediasessiondates`.`sessionid` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `stat_viewdurationwidgettotalusersapps`
--

/*!50001 DROP TABLE IF EXISTS `stat_viewdurationwidgettotalusersapps`*/;
/*!50001 DROP VIEW IF EXISTS `stat_viewdurationwidgettotalusersapps`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `stat_viewdurationwidgettotalusersapps` AS select `stat_tablewidgettotalusersapps`.`sessionid` AS `sessionid`,`stat_tablewidgettotalusersapps`.`groupid` AS `groupid`,`stat_tablewidgettotalusersapps`.`roleid` AS `roleid`,`stat_tablewidgettotalusersapps`.`applicationid` AS `applicationid`,min(`stat_tablewidgettotalusersapps`.`date`) AS `startsession`,time_to_sec(timediff(max(`stat_tablewidgettotalusersapps`.`date`),min(`stat_tablewidgettotalusersapps`.`date`))) AS `duration` from `stat_tablewidgettotalusersapps` group by `stat_tablewidgettotalusersapps`.`sessionid` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `stat_widgetdates`
--

/*!50001 DROP TABLE IF EXISTS `stat_widgetdates`*/;
/*!50001 DROP VIEW IF EXISTS `stat_widgetdates`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `stat_widgetdates` AS select `stat_contenus`.`contenu` AS `date`,`stat_widgetserials`.`widgetid` AS `widgetid` from (`stat_widgetserials` join `stat_contenus`) where ((`stat_contenus`.`idinsert` = `stat_widgetserials`.`idinsert`) and (`stat_contenus`.`colonne_id` = (select `stat_colonnes`.`id` from (`stat_colonnes` join `stat_tables`) where ((`stat_colonnes`.`table_id` = `stat_tables`.`id`) and (`stat_tables`.`name` like 'Widgets_Consulted') and (`stat_colonnes`.`name` like 'time'))))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `stat_widgetids`
--

/*!50001 DROP TABLE IF EXISTS `stat_widgetids`*/;
/*!50001 DROP VIEW IF EXISTS `stat_widgetids`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `stat_widgetids` AS select `stat_contenus`.`contenu` AS `contenu`,`stat_contenus`.`idinsert` AS `idinsert` from `stat_contenus` where (`stat_contenus`.`colonne_id` = (select `stat_colonnes`.`id` from (`stat_colonnes` join `stat_tables`) where ((`stat_colonnes`.`table_id` = `stat_tables`.`id`) and (`stat_tables`.`name` like 'Widgets_Consulted') and (`stat_colonnes`.`name` like 'Widgetreference')))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `stat_widgetidusers`
--

/*!50001 DROP TABLE IF EXISTS `stat_widgetidusers`*/;
/*!50001 DROP VIEW IF EXISTS `stat_widgetidusers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `stat_widgetidusers` AS select `stat_contenus`.`contenu` AS `duration`,`stat_contenus`.`idinsert` AS `idinsert` from `stat_contenus` where (`stat_contenus`.`colonne_id` = (select `stat_colonnes`.`id` from (`stat_colonnes` join `stat_tables`) where ((`stat_colonnes`.`table_id` = `stat_tables`.`id`) and (`stat_tables`.`name` like 'Users_Sessions') and (`stat_colonnes`.`name` like 'duration')))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `stat_widgetnames`
--

/*!50001 DROP TABLE IF EXISTS `stat_widgetnames`*/;
/*!50001 DROP VIEW IF EXISTS `stat_widgetnames`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `stat_widgetnames` AS select `stat_widgetserialsessions`.`widgetid` AS `widgetid`,`stat_contenus`.`contenu` AS `widgetname`,`stat_widgetserialsessions`.`serial` AS `serial`,`stat_widgetserialsessions`.`idinsert` AS `idinsert`,`stat_widgetserialsessions`.`sessionid` AS `sessionid` from (`stat_contenus` join `stat_widgetserialsessions`) where ((`stat_contenus`.`idinsert` = `stat_widgetserialsessions`.`idinsert`) and (`stat_contenus`.`colonne_id` = (select `stat_colonnes`.`id` from (`stat_colonnes` join `stat_tables`) where ((`stat_colonnes`.`table_id` = `stat_tables`.`id`) and (`stat_colonnes`.`name` like 'widgetName') and (`stat_tables`.`name` like 'Widgets_Consulted'))))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `stat_widgetserials`
--

/*!50001 DROP TABLE IF EXISTS `stat_widgetserials`*/;
/*!50001 DROP VIEW IF EXISTS `stat_widgetserials`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `stat_widgetserials` AS select `stat_widgetids`.`contenu` AS `widgetid`,`stat_contenus`.`contenu` AS `serial`,`stat_widgetids`.`idinsert` AS `idinsert` from (`stat_contenus` join `stat_widgetids`) where ((`stat_contenus`.`idinsert` = `stat_widgetids`.`idinsert`) and (`stat_contenus`.`colonne_id` = (select `stat_colonnes`.`id` from (`stat_colonnes` join `stat_tables`) where ((`stat_colonnes`.`table_id` = `stat_tables`.`id`) and (`stat_tables`.`name` like 'Widgets_Consulted') and (`stat_colonnes`.`name` like 'application_serial'))))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `stat_widgetserialsessions`
--

/*!50001 DROP TABLE IF EXISTS `stat_widgetserialsessions`*/;
/*!50001 DROP VIEW IF EXISTS `stat_widgetserialsessions`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `stat_widgetserialsessions` AS select `stat_widgetserials`.`widgetid` AS `widgetid`,`stat_contenus`.`contenu` AS `sessionid`,`stat_widgetserials`.`serial` AS `serial`,`stat_widgetserials`.`idinsert` AS `idinsert` from (`stat_contenus` join `stat_widgetserials`) where ((`stat_contenus`.`idinsert` = `stat_widgetserials`.`idinsert`) and (`stat_contenus`.`colonne_id` = (select `stat_colonnes`.`id` from (`stat_colonnes` join `stat_tables`) where ((`stat_colonnes`.`table_id` = `stat_tables`.`id`) and (`stat_colonnes`.`name` like 'userSessionId') and (`stat_tables`.`name` like 'Widgets_Consulted'))))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `stat_widgettotalusers`
--

/*!50001 DROP TABLE IF EXISTS `stat_widgettotalusers`*/;
/*!50001 DROP VIEW IF EXISTS `stat_widgettotalusers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `stat_widgettotalusers` AS select `stat_widgetidusers`.`duration` AS `duration`,`stat_widgetusersessionids`.`sessionid` AS `sessionid`,`stat_widgetusersessionserials`.`serial` AS `serial`,`stat_widgetusertimes`.`date` AS `date` from (((`stat_widgetidusers` join `stat_widgetusersessionids`) join `stat_widgetusersessionserials`) join `stat_widgetusertimes`) where ((`stat_widgetidusers`.`idinsert` = `stat_widgetusersessionids`.`idinsert`) and (`stat_widgetidusers`.`idinsert` = `stat_widgetusersessionserials`.`idinsert`) and (`stat_widgetidusers`.`idinsert` = `stat_widgetusertimes`.`idinsert`) and (`stat_widgetusersessionids`.`idinsert` = `stat_widgetusersessionserials`.`idinsert`) and (`stat_widgetusersessionids`.`idinsert` = `stat_widgetusertimes`.`idinsert`) and (`stat_widgetusersessionserials`.`idinsert` = `stat_widgetusertimes`.`idinsert`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `stat_widgettotalusersapps`
--

/*!50001 DROP TABLE IF EXISTS `stat_widgettotalusersapps`*/;
/*!50001 DROP VIEW IF EXISTS `stat_widgettotalusersapps`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `stat_widgettotalusersapps` AS select `stat_serials`.`roleid` AS `roleid`,`stat_serials`.`rolename` AS `rolename`,`stat_serials`.`groupid` AS `groupid`,`stat_serials`.`groupname` AS `groupname`,`stat_serials`.`applicationid` AS `applicationid`,`stat_widgettotalusers`.`duration` AS `duration`,`stat_widgettotalusers`.`sessionid` AS `sessionid`,`stat_widgettotalusers`.`serial` AS `serial`,`stat_widgettotalusers`.`date` AS `date` from (`stat_serials` join `stat_widgettotalusers`) where (`stat_serials`.`serial` = `stat_widgettotalusers`.`serial`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `stat_widgetusersessionids`
--

/*!50001 DROP TABLE IF EXISTS `stat_widgetusersessionids`*/;
/*!50001 DROP VIEW IF EXISTS `stat_widgetusersessionids`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `stat_widgetusersessionids` AS select `stat_contenus`.`contenu` AS `sessionid`,`stat_contenus`.`idinsert` AS `idinsert` from `stat_contenus` where (`stat_contenus`.`colonne_id` = (select `stat_colonnes`.`id` from (`stat_colonnes` join `stat_tables`) where ((`stat_colonnes`.`table_id` = `stat_tables`.`id`) and (`stat_tables`.`name` like 'Users_Sessions') and (`stat_colonnes`.`name` like 'userSessionId')))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `stat_widgetusersessionserials`
--

/*!50001 DROP TABLE IF EXISTS `stat_widgetusersessionserials`*/;
/*!50001 DROP VIEW IF EXISTS `stat_widgetusersessionserials`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `stat_widgetusersessionserials` AS select `stat_contenus`.`contenu` AS `serial`,`stat_contenus`.`idinsert` AS `idinsert` from `stat_contenus` where (`stat_contenus`.`colonne_id` = (select `stat_colonnes`.`id` from (`stat_colonnes` join `stat_tables`) where ((`stat_colonnes`.`table_id` = `stat_tables`.`id`) and (`stat_tables`.`name` like 'Users_Sessions') and (`stat_colonnes`.`name` like 'application_serial')))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `stat_widgetusertimes`
--

/*!50001 DROP TABLE IF EXISTS `stat_widgetusertimes`*/;
/*!50001 DROP VIEW IF EXISTS `stat_widgetusertimes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `stat_widgetusertimes` AS select `stat_contenus`.`contenu` AS `date`,`stat_contenus`.`idinsert` AS `idinsert` from `stat_contenus` where (`stat_contenus`.`colonne_id` = (select `stat_colonnes`.`id` from (`stat_colonnes` join `stat_tables`) where ((`stat_colonnes`.`table_id` = `stat_tables`.`id`) and (`stat_tables`.`name` like 'Users_Sessions') and (`stat_colonnes`.`name` like 'time')))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `widget_date`
--

/*!50001 DROP TABLE IF EXISTS `widget_date`*/;
/*!50001 DROP VIEW IF EXISTS `widget_date`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `widget_date` AS select `stat_contenus`.`contenu` AS `date`,`widget_serial`.`widgetid` AS `widgetid` from (`stat_contenus` join `widget_serial`) where (`stat_contenus`.`colonne_id` in (select `stat_colonnes`.`id` from `stat_colonnes` where ((`stat_colonnes`.`table_id` = (select `stat_tables`.`id` from `stat_tables` where (`stat_tables`.`name` = 'Widgets_Consulted'))) and (`stat_colonnes`.`time_column` = 1))) and (`widget_serial`.`idinsert` = `stat_contenus`.`idinsert`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `widget_id`
--

/*!50001 DROP TABLE IF EXISTS `widget_id`*/;
/*!50001 DROP VIEW IF EXISTS `widget_id`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `widget_id` AS select `stat_contenus`.`contenu` AS `contenu`,`stat_contenus`.`idinsert` AS `idinsert` from `stat_contenus` where `stat_contenus`.`colonne_id` in (select `stat_colonnes`.`id` from `stat_colonnes` where (`stat_colonnes`.`name` like 'widgetReference')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `widget_serial`
--

/*!50001 DROP TABLE IF EXISTS `widget_serial`*/;
/*!50001 DROP VIEW IF EXISTS `widget_serial`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `widget_serial` AS select `widget_id`.`contenu` AS `widgetid`,`stat_contenus`.`contenu` AS `serial`,`stat_contenus`.`idinsert` AS `idinsert` from ((`stat_colonnes` join `stat_contenus`) join `widget_id`) where ((`stat_colonnes`.`apps_serial_column` = 1) and (`stat_contenus`.`colonne_id` = `stat_colonnes`.`id`) and (`widget_id`.`idinsert` = `stat_contenus`.`idinsert`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `widgetserialsession`
--

/*!50001 DROP TABLE IF EXISTS `widgetserialsession`*/;
/*!50001 DROP VIEW IF EXISTS `widgetserialsession`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `widgetserialsession` AS select `widget_serial`.`widgetid` AS `widgetid`,`stat_contenus`.`contenu` AS `sessionid`,`widget_serial`.`serial` AS `serial`,`widget_serial`.`idinsert` AS `idinsert` from (`stat_contenus` join `widget_serial`) where ((`stat_contenus`.`idinsert` = `widget_serial`.`idinsert`) and (`stat_contenus`.`colonne_id` = (select `stat_colonnes`.`id` from (`stat_colonnes` join `stat_tables`) where ((`stat_colonnes`.`table_id` = `stat_tables`.`id`) and (`stat_colonnes`.`name` like 'userSessionId') and (`stat_colonnes`.`table_id` = 3))))) */;
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

-- Dump completed on 2011-10-12 13:16:06
