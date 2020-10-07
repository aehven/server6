-- MySQL dump 10.13  Distrib 5.7.29, for osx10.15 (x86_64)
--
-- Host: localhost    Database: generic_develop
-- ------------------------------------------------------
-- Server version	5.7.29

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
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_internal_metadata`
--

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2020-10-07 21:46:21.778879','2020-10-07 21:46:21.778879'),('schema_sha1','28f26d8645df8bd601f12c939ee4d600c97c79f6','2020-10-07 21:46:21.789826','2020-10-07 21:46:21.789826');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base_stations`
--

DROP TABLE IF EXISTS `base_stations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `base_stations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `serial_number` int(11) NOT NULL,
  `active` tinyint(1) DEFAULT '1',
  `encryption_key` text,
  `organization_id` bigint(20) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_base_stations_on_organization_id` (`organization_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_stations`
--

LOCK TABLES `base_stations` WRITE;
/*!40000 ALTER TABLE `base_stations` DISABLE KEYS */;
INSERT INTO `base_stations` VALUES (1,0,1,'---\n- 1\n- 2\n- 3\n- 4\n',NULL,'2020-10-07 21:46:34.300780','2020-10-07 21:46:34.300780');
/*!40000 ALTER TABLE `base_stations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cte_data`
--

DROP TABLE IF EXISTS `cte_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cte_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cte_id` bigint(20) DEFAULT NULL,
  `dataset_number` int(11) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `content` text,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_cte_data_on_cte_id` (`cte_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cte_data`
--

LOCK TABLES `cte_data` WRITE;
/*!40000 ALTER TABLE `cte_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `cte_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cte_dexes`
--

DROP TABLE IF EXISTS `cte_dexes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cte_dexes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cte_id` bigint(20) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `content` text,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_cte_dexes_on_cte_id` (`cte_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cte_dexes`
--

LOCK TABLES `cte_dexes` WRITE;
/*!40000 ALTER TABLE `cte_dexes` DISABLE KEYS */;
/*!40000 ALTER TABLE `cte_dexes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cte_logs`
--

DROP TABLE IF EXISTS `cte_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cte_logs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cte_id` bigint(20) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `content` text,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_cte_logs_on_cte_id` (`cte_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cte_logs`
--

LOCK TABLES `cte_logs` WRITE;
/*!40000 ALTER TABLE `cte_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `cte_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ctes`
--

DROP TABLE IF EXISTS `ctes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `radio_id` int(11) DEFAULT NULL,
  `serial_number` varchar(255) DEFAULT NULL,
  `encryption_key` text,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ctes`
--

LOCK TABLES `ctes` WRITE;
/*!40000 ALTER TABLE `ctes` DISABLE KEYS */;
INSERT INTO `ctes` VALUES (1,'Right Knee',100,'100A','---\n- 9\n- 8\n- 7\n- 6\n','2020-10-07 21:46:33.910744','2020-10-07 21:46:33.910744'),(2,'Right Knee',1000,NULL,'---\n- 0\n- 1\n- 2\n- 3\n','2020-10-07 21:46:33.940477','2020-10-07 21:46:33.940477'),(3,'Left Knee',2000,NULL,'---\n- 1\n- 2\n- 3\n- 4\n','2020-10-07 21:46:33.950144','2020-10-07 21:46:33.950144'),(4,'Right Knee',3000,NULL,'---\n- 2\n- 3\n- 4\n- 5\n','2020-10-07 21:46:33.958303','2020-10-07 21:46:33.958303'),(5,'Left Knee',4000,NULL,'---\n- 3\n- 4\n- 5\n- 6\n','2020-10-07 21:46:33.966213','2020-10-07 21:46:33.966213'),(6,'Right Knee',5000,NULL,'---\n- 4\n- 5\n- 6\n- 7\n','2020-10-07 21:46:33.975104','2020-10-07 21:46:33.975104'),(7,'Left Knee',6000,NULL,'---\n- 5\n- 6\n- 7\n- 8\n','2020-10-07 21:46:33.984749','2020-10-07 21:46:33.984749'),(8,'Right Knee',7000,NULL,'---\n- 6\n- 7\n- 8\n- 9\n','2020-10-07 21:46:33.993464','2020-10-07 21:46:33.993464'),(9,'Left Knee',8000,NULL,'---\n- 7\n- 8\n- 9\n- 10\n','2020-10-07 21:46:34.001601','2020-10-07 21:46:34.001601'),(10,'Right Knee',9000,NULL,'---\n- 8\n- 9\n- 10\n- 11\n','2020-10-07 21:46:34.009967','2020-10-07 21:46:34.009967'),(11,'Left Knee',10000,NULL,'---\n- 9\n- 10\n- 11\n- 12\n','2020-10-07 21:46:34.018540','2020-10-07 21:46:34.018540'),(12,'Right Knee',11000,NULL,'---\n- 10\n- 11\n- 12\n- 13\n','2020-10-07 21:46:34.026952','2020-10-07 21:46:34.026952'),(13,'Left Knee',12000,NULL,'---\n- 11\n- 12\n- 13\n- 14\n','2020-10-07 21:46:34.035237','2020-10-07 21:46:34.035237'),(14,'Right Knee',13000,NULL,'---\n- 12\n- 13\n- 14\n- 15\n','2020-10-07 21:46:34.043998','2020-10-07 21:46:34.043998'),(15,'Left Knee',14000,NULL,'---\n- 13\n- 14\n- 15\n- 16\n','2020-10-07 21:46:34.055410','2020-10-07 21:46:34.055410'),(16,'Right Knee',15000,NULL,'---\n- 14\n- 15\n- 16\n- 17\n','2020-10-07 21:46:34.065187','2020-10-07 21:46:34.065187'),(17,'Left Knee',16000,NULL,'---\n- 15\n- 16\n- 17\n- 18\n','2020-10-07 21:46:34.074053','2020-10-07 21:46:34.074053'),(18,'Right Knee',17000,NULL,'---\n- 16\n- 17\n- 18\n- 19\n','2020-10-07 21:46:34.104156','2020-10-07 21:46:34.104156'),(19,'Left Knee',18000,NULL,'---\n- 17\n- 18\n- 19\n- 20\n','2020-10-07 21:46:34.114172','2020-10-07 21:46:34.114172'),(20,'Right Knee',19000,NULL,'---\n- 18\n- 19\n- 20\n- 21\n','2020-10-07 21:46:34.123675','2020-10-07 21:46:34.123675'),(21,'Left Knee',20000,NULL,'---\n- 19\n- 20\n- 21\n- 22\n','2020-10-07 21:46:34.132975','2020-10-07 21:46:34.132975'),(22,'Right Knee',21000,NULL,'---\n- 20\n- 21\n- 22\n- 23\n','2020-10-07 21:46:34.142562','2020-10-07 21:46:34.142562'),(23,'Left Knee',22000,NULL,'---\n- 21\n- 22\n- 23\n- 24\n','2020-10-07 21:46:34.152086','2020-10-07 21:46:34.152086'),(24,'Right Knee',23000,NULL,'---\n- 22\n- 23\n- 24\n- 25\n','2020-10-07 21:46:34.161120','2020-10-07 21:46:34.161120'),(25,'Left Knee',24000,NULL,'---\n- 23\n- 24\n- 25\n- 26\n','2020-10-07 21:46:34.170592','2020-10-07 21:46:34.170592'),(26,'Right Knee',25000,NULL,'---\n- 24\n- 25\n- 26\n- 27\n','2020-10-07 21:46:34.179833','2020-10-07 21:46:34.179833'),(27,'Left Knee',26000,NULL,'---\n- 25\n- 26\n- 27\n- 28\n','2020-10-07 21:46:34.188458','2020-10-07 21:46:34.188458'),(28,'Right Knee',27000,NULL,'---\n- 26\n- 27\n- 28\n- 29\n','2020-10-07 21:46:34.197057','2020-10-07 21:46:34.197057'),(29,'Left Knee',28000,NULL,'---\n- 27\n- 28\n- 29\n- 30\n','2020-10-07 21:46:34.205319','2020-10-07 21:46:34.205319'),(30,'Right Knee',29000,NULL,'---\n- 28\n- 29\n- 30\n- 31\n','2020-10-07 21:46:34.213690','2020-10-07 21:46:34.213690'),(31,'Left Knee',30000,NULL,'---\n- 29\n- 30\n- 31\n- 32\n','2020-10-07 21:46:34.222118','2020-10-07 21:46:34.222118');
/*!40000 ALTER TABLE `ctes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ctes_patients`
--

DROP TABLE IF EXISTS `ctes_patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctes_patients` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cte_id` bigint(20) DEFAULT NULL,
  `patient_id` bigint(20) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_ctes_patients_on_cte_id` (`cte_id`),
  KEY `index_ctes_patients_on_patient_id` (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ctes_patients`
--

LOCK TABLES `ctes_patients` WRITE;
/*!40000 ALTER TABLE `ctes_patients` DISABLE KEYS */;
INSERT INTO `ctes_patients` VALUES (1,1,1,'2020-10-07 21:46:33.936742','2020-10-07 21:46:33.936742'),(2,2,2,'2020-10-07 21:46:33.946149','2020-10-07 21:46:33.946149'),(3,3,3,'2020-10-07 21:46:33.954907','2020-10-07 21:46:33.954907'),(4,4,4,'2020-10-07 21:46:33.963003','2020-10-07 21:46:33.963003'),(5,5,5,'2020-10-07 21:46:33.971012','2020-10-07 21:46:33.971012'),(6,6,6,'2020-10-07 21:46:33.980852','2020-10-07 21:46:33.980852'),(7,7,7,'2020-10-07 21:46:33.989953','2020-10-07 21:46:33.989953'),(8,8,8,'2020-10-07 21:46:33.998330','2020-10-07 21:46:33.998330'),(9,9,9,'2020-10-07 21:46:34.006529','2020-10-07 21:46:34.006529'),(10,10,10,'2020-10-07 21:46:34.014726','2020-10-07 21:46:34.014726'),(11,11,11,'2020-10-07 21:46:34.023555','2020-10-07 21:46:34.023555'),(12,12,12,'2020-10-07 21:46:34.031828','2020-10-07 21:46:34.031828'),(13,13,13,'2020-10-07 21:46:34.040260','2020-10-07 21:46:34.040260'),(14,14,14,'2020-10-07 21:46:34.049426','2020-10-07 21:46:34.049426'),(15,15,15,'2020-10-07 21:46:34.061176','2020-10-07 21:46:34.061176'),(16,16,16,'2020-10-07 21:46:34.070474','2020-10-07 21:46:34.070474'),(17,17,17,'2020-10-07 21:46:34.079340','2020-10-07 21:46:34.079340'),(18,18,18,'2020-10-07 21:46:34.110105','2020-10-07 21:46:34.110105'),(19,19,19,'2020-10-07 21:46:34.119769','2020-10-07 21:46:34.119769'),(20,20,20,'2020-10-07 21:46:34.129092','2020-10-07 21:46:34.129092'),(21,21,21,'2020-10-07 21:46:34.138474','2020-10-07 21:46:34.138474'),(22,22,22,'2020-10-07 21:46:34.148231','2020-10-07 21:46:34.148231'),(23,23,23,'2020-10-07 21:46:34.157451','2020-10-07 21:46:34.157451'),(24,24,24,'2020-10-07 21:46:34.166747','2020-10-07 21:46:34.166747'),(25,25,25,'2020-10-07 21:46:34.176091','2020-10-07 21:46:34.176091'),(26,26,26,'2020-10-07 21:46:34.185139','2020-10-07 21:46:34.185139'),(27,27,27,'2020-10-07 21:46:34.193289','2020-10-07 21:46:34.193289'),(28,28,28,'2020-10-07 21:46:34.201939','2020-10-07 21:46:34.201939'),(29,29,29,'2020-10-07 21:46:34.210301','2020-10-07 21:46:34.210301'),(30,30,30,'2020-10-07 21:46:34.218659','2020-10-07 21:46:34.218659'),(31,31,31,'2020-10-07 21:46:34.227519','2020-10-07 21:46:34.227519');
/*!40000 ALTER TABLE `ctes_patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delayed_jobs`
--

DROP TABLE IF EXISTS `delayed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delayed_jobs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `priority` int(11) NOT NULL DEFAULT '0',
  `attempts` int(11) NOT NULL DEFAULT '0',
  `handler` text NOT NULL,
  `last_error` text,
  `run_at` datetime DEFAULT NULL,
  `locked_at` datetime DEFAULT NULL,
  `failed_at` datetime DEFAULT NULL,
  `locked_by` varchar(255) DEFAULT NULL,
  `queue` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `delayed_jobs_priority` (`priority`,`run_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delayed_jobs`
--

LOCK TABLES `delayed_jobs` WRITE;
/*!40000 ALTER TABLE `delayed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `delayed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `text` text,
  `level` int(11) DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  `in_app` tinyint(1) DEFAULT NULL,
  `email` tinyint(1) DEFAULT NULL,
  `sms` tinyint(1) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `href` varchar(255) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications_users`
--

DROP TABLE IF EXISTS `notifications_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications_users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `notification_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `acknowledged_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_notifications_users_on_notification_id` (`notification_id`),
  KEY `index_notifications_users_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications_users`
--

LOCK TABLES `notifications_users` WRITE;
/*!40000 ALTER TABLE `notifications_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizations`
--

DROP TABLE IF EXISTS `organizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organizations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `kind` int(11) DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `phone1` varchar(255) DEFAULT NULL,
  `phone2` varchar(255) DEFAULT NULL,
  `phone3` varchar(255) DEFAULT NULL,
  `email1` varchar(255) DEFAULT NULL,
  `email2` varchar(255) DEFAULT NULL,
  `email3` varchar(255) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `lft` int(11) NOT NULL,
  `rgt` int(11) NOT NULL,
  `depth` int(11) NOT NULL DEFAULT '0',
  `children_count` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_organizations_on_depth` (`depth`),
  KEY `index_organizations_on_lft` (`lft`),
  KEY `index_organizations_on_name` (`name`),
  KEY `index_organizations_on_parent_id` (`parent_id`),
  KEY `index_organizations_on_rgt` (`rgt`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizations`
--

LOCK TABLES `organizations` WRITE;
/*!40000 ALTER TABLE `organizations` DISABLE KEYS */;
INSERT INTO `organizations` VALUES (1,0,'Muller Group',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,6,0,0,'2020-10-07 21:46:24.022733','2020-10-07 21:46:24.074245'),(2,1,'Lebsack-Howe',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,2,3,1,0,'2020-10-07 21:46:24.030550','2020-10-07 21:46:24.038357'),(3,1,'Bashirian, Ebert and Kuvalis',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,4,5,1,0,'2020-10-07 21:46:24.067845','2020-10-07 21:46:24.074245'),(4,0,'Ziemann, Runolfsson and Boyer',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,12,0,0,'2020-10-07 21:46:24.083867','2020-10-07 21:46:24.111274'),(5,1,'Reichel, Rippin and Kautzer',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,8,9,1,0,'2020-10-07 21:46:24.090039','2020-10-07 21:46:24.096189'),(6,1,'Schmitt, Lubowitz and Walsh',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,10,11,1,0,'2020-10-07 21:46:24.105125','2020-10-07 21:46:24.111274'),(7,0,'Hagenes LLC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,18,0,0,'2020-10-07 21:46:24.119940','2020-10-07 21:46:24.146143'),(8,1,'Pacocha, D\'Amore and Kemmer',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,14,15,1,0,'2020-10-07 21:46:24.125511','2020-10-07 21:46:24.131311'),(9,1,'Bernhard, Mohr and Hand',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,16,17,1,0,'2020-10-07 21:46:24.140051','2020-10-07 21:46:24.146143'),(10,0,'Fisher, Dare and Sawayn',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,24,0,0,'2020-10-07 21:46:24.155328','2020-10-07 21:46:24.182005'),(11,1,'Monahan-O\'Conner',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,20,21,1,0,'2020-10-07 21:46:24.161279','2020-10-07 21:46:24.167300'),(12,1,'Davis, Dare and Langworth',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,22,23,1,0,'2020-10-07 21:46:24.176205','2020-10-07 21:46:24.182005'),(13,0,'Kassulke-McKenzie',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,25,30,0,0,'2020-10-07 21:46:24.190655','2020-10-07 21:46:24.217055'),(14,1,'Hudson, Schmitt and Gutkowski',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,26,27,1,0,'2020-10-07 21:46:24.196233','2020-10-07 21:46:24.201961'),(15,1,'McKenzie, Ondricka and Blanda',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,28,29,1,0,'2020-10-07 21:46:24.210634','2020-10-07 21:46:24.217055');
/*!40000 ALTER TABLE `organizations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizations_test_plans`
--

DROP TABLE IF EXISTS `organizations_test_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organizations_test_plans` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `organization_id` bigint(20) NOT NULL,
  `test_plan_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_organizations_test_plans_on_organization_id` (`organization_id`),
  KEY `index_organizations_test_plans_on_test_plan_id` (`test_plan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizations_test_plans`
--

LOCK TABLES `organizations_test_plans` WRITE;
/*!40000 ALTER TABLE `organizations_test_plans` DISABLE KEYS */;
/*!40000 ALTER TABLE `organizations_test_plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizations_tests`
--

DROP TABLE IF EXISTS `organizations_tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organizations_tests` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `organization_id` bigint(20) NOT NULL,
  `test_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_organizations_tests_on_organization_id` (`organization_id`),
  KEY `index_organizations_tests_on_test_id` (`test_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizations_tests`
--

LOCK TABLES `organizations_tests` WRITE;
/*!40000 ALTER TABLE `organizations_tests` DISABLE KEYS */;
/*!40000 ALTER TABLE `organizations_tests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizations_users`
--

DROP TABLE IF EXISTS `organizations_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organizations_users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `organization_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_organizations_users_on_organization_id` (`organization_id`),
  KEY `index_organizations_users_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizations_users`
--

LOCK TABLES `organizations_users` WRITE;
/*!40000 ALTER TABLE `organizations_users` DISABLE KEYS */;
INSERT INTO `organizations_users` VALUES (1,1,2),(2,9,2),(3,1,3),(4,5,3),(5,1,4),(6,5,4),(7,1,5),(8,6,5),(9,1,6),(10,3,6),(11,1,7),(12,3,7),(13,1,8),(14,6,8),(15,1,9),(16,2,9),(17,1,10),(18,15,10),(19,1,11),(20,9,11),(21,4,12),(22,14,12),(23,4,13),(24,6,13),(25,4,14),(26,8,14),(27,4,15),(28,3,15),(29,4,16),(30,15,16),(31,4,17),(32,15,17),(33,4,18),(34,6,18),(35,4,19),(36,2,19),(37,4,20),(38,3,20),(39,4,21),(40,12,21),(41,7,22),(42,3,22),(43,7,23),(44,5,23),(45,7,24),(46,9,24),(47,7,25),(48,14,25),(49,7,26),(50,6,26),(51,7,27),(52,9,27),(53,7,28),(54,6,28),(55,7,29),(56,11,29),(57,7,30),(58,8,30),(59,7,31),(60,3,31),(61,10,32),(62,11,32),(63,10,33),(64,5,33),(65,10,34),(66,15,34),(67,10,35),(68,5,35),(69,10,36),(70,6,36),(71,10,37),(72,6,37),(73,10,38),(74,14,38),(75,10,39),(76,11,39),(77,10,40),(78,6,40),(79,10,41),(80,9,41),(81,13,42),(82,6,42),(83,13,43),(84,3,43),(85,13,44),(86,3,44),(87,13,45),(88,5,45),(89,13,46),(90,5,46),(91,13,47),(92,8,47),(93,13,48),(94,2,48),(95,13,49),(96,8,49),(97,13,50),(98,15,50),(99,13,51),(100,12,51);
/*!40000 ALTER TABLE `organizations_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patients` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `dob` datetime DEFAULT NULL,
  `surgery_date` datetime DEFAULT NULL,
  `organization_id` bigint(20) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_patients_on_organization_id` (`organization_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (1,'Antonio','Vivaldi','avivaldi@null.com','1234567890','Somplace nice','Uptown','Florence','Tuscany','12345','Itali','1678-03-04 00:00:00','2020-10-20 00:00:00',13,'2020-10-07 21:46:33.933735','2020-10-07 21:46:33.933735'),(2,'Ozella','Greenholt','alexis.oconner@lowe-larson.net','304.077.3596 x731','47462 Bartell Place','Apt. 166','Lake Ayako','Utah','60347-7641','USA','1959-05-10 00:00:00','2020-07-31 00:00:00',9,'2020-10-07 21:46:33.944096','2020-10-07 21:46:33.944096'),(3,'Dylan','Lind','valery@shields-boyer.name','(912) 692-3412 x34318','7671 Marlys Overpass','Suite 657','Ozellfurt','Iowa','03688-2384','USA','1956-09-23 00:00:00','2020-06-10 00:00:00',9,'2020-10-07 21:46:33.953246','2020-10-07 21:46:33.953246'),(4,'Loren','Cruickshank','edward@herzog.com','145.455.1915 x451','81196 Howe Mount','Suite 748','Langside','North Dakota','05117','USA','1975-08-25 00:00:00','2020-04-24 00:00:00',8,'2020-10-07 21:46:33.961383','2020-10-07 21:46:33.961383'),(5,'Isreal','Heidenreich','tyler@borer.info','(610) 711-0960 x4630','50227 Gottlieb Viaduct','Suite 516','Nichollefort','Maine','42203','USA','1967-05-17 00:00:00','2020-08-30 00:00:00',8,'2020-10-07 21:46:33.969305','2020-10-07 21:46:33.969305'),(6,'Elliot','Cartwright','annabell.herzog@ziemann-bartell.name','1-558-467-0712 x69843','17663 Yoko Divide','Apt. 939','Hillsbury','Connecticut','89104-7918','USA','1952-01-20 00:00:00','2020-08-23 00:00:00',2,'2020-10-07 21:46:33.978931','2020-10-07 21:46:33.978931'),(7,'Dwain','Hammes','adrian.schuppe@gorczany-gislason.org','586.545.5145','54565 Krysta Plaza','Suite 495','West Melody','Rhode Island','95964','USA','1931-10-24 00:00:00','2020-06-15 00:00:00',15,'2020-10-07 21:46:33.988107','2020-10-07 21:46:33.988107'),(8,'Chase','Bergstrom','joaquin.denesik@corwin.org','(803) 016-7191 x7070','6766 Terrell Well','Suite 918','Port Ginny','Oregon','47275','USA','1931-09-28 00:00:00','2020-06-05 00:00:00',4,'2020-10-07 21:46:33.996577','2020-10-07 21:46:33.996577'),(9,'Tegan','Moen','maria@kessler.info','350.593.5487','352 Rice Harbors','Suite 192','Kuphalfurt','Alaska','24779-6813','USA','1937-04-30 00:00:00','2020-04-15 00:00:00',5,'2020-10-07 21:46:34.004825','2020-10-07 21:46:34.004825'),(10,'Cecila','Roberts','kenna_gerhold@rohan.org','773.802.9619 x2621','81522 Cherish Neck','Apt. 404','South Charlynton','Louisiana','85162-4814','USA','1943-06-11 00:00:00','2020-06-02 00:00:00',5,'2020-10-07 21:46:34.013067','2020-10-07 21:46:34.013067'),(11,'Refugia','Lubowitz','meg@ankunding-waelchi.co','1-633-566-2110 x990','6894 Elvera Mews','Suite 308','Dorineside','New Mexico','17729','USA','1955-01-21 00:00:00','2020-04-12 00:00:00',14,'2020-10-07 21:46:34.021761','2020-10-07 21:46:34.021761'),(12,'Crista','Skiles','millard@pouros.net','162.277.3502 x7121','3849 Mann Shores','Apt. 937','Ankundingchester','Minnesota','42358-4613','USA','1958-06-18 00:00:00','2020-05-18 00:00:00',3,'2020-10-07 21:46:34.030160','2020-10-07 21:46:34.030160'),(13,'Kaley','Becker','leonel@powlowski-kerluke.net','441.381.0087 x848','702 Schamberger Village','Suite 950','Lake Zackbury','New York','57947','USA','1937-11-13 00:00:00','2020-04-24 00:00:00',10,'2020-10-07 21:46:34.038507','2020-10-07 21:46:34.038507'),(14,'Gale','O\'Conner','yee.abshire@macejkovic.info','(303) 564-5341 x2989','45142 Cruz Road','Suite 849','Parkerberg','Michigan','66376','USA','1951-12-04 00:00:00','2020-08-26 00:00:00',15,'2020-10-07 21:46:34.047648','2020-10-07 21:46:34.047648'),(15,'Franchesca','Kuvalis','horacio@ruecker.io','(498) 758-3767 x12240','8294 Doyle Branch','Suite 968','Noelview','Iowa','82320-0048','USA','1940-04-12 00:00:00','2020-04-25 00:00:00',2,'2020-10-07 21:46:34.059343','2020-10-07 21:46:34.059343'),(16,'Kiera','Donnelly','joanne_barton@reichel-berge.org','374.597.8918 x22322','345 Flatley Wall','Apt. 360','West Arnoldomouth','Indiana','76388','USA','1974-02-03 00:00:00','2020-08-26 00:00:00',15,'2020-10-07 21:46:34.068635','2020-10-07 21:46:34.068635'),(17,'Shanti','Padberg','cornelia.thiel@mcdermott.org','550-400-5232 x2745','230 Friesen Creek','Suite 409','Kemmertown','Georgia','11820','USA','1984-10-20 00:00:00','2020-05-08 00:00:00',10,'2020-10-07 21:46:34.077461','2020-10-07 21:46:34.077461'),(18,'Laticia','Hayes','rachele@roob-williamson.org','689.020.0902 x46387','30057 Lakin Tunnel','Apt. 201','West Lakeesha','Idaho','62043','USA','1931-11-22 00:00:00','2020-08-19 00:00:00',7,'2020-10-07 21:46:34.108110','2020-10-07 21:46:34.108110'),(19,'Kathlyn','Metz','elisha.erdman@runolfsson.com','169.480.0337 x63942','4974 Lewis Glens','Suite 257','Torpbury','New Hampshire','49159-0615','USA','1995-10-17 00:00:00','2020-09-06 00:00:00',11,'2020-10-07 21:46:34.117842','2020-10-07 21:46:34.117842'),(20,'Lonny','Beier','crysta.hermiston@oconner-braun.net','795.692.7448 x33191','956 Stoltenberg Ranch','Apt. 777','East Rebbeca','Pennsylvania','00517-0503','USA','1983-10-08 00:00:00','2020-04-13 00:00:00',11,'2020-10-07 21:46:34.127171','2020-10-07 21:46:34.127171'),(21,'Kiana','Kuhn','casimira_ortiz@gibson.io','(873) 988-8946','27163 Janessa Crest','Suite 237','Rhonaburgh','Illinois','43216-7252','USA','1946-06-26 00:00:00','2020-08-29 00:00:00',4,'2020-10-07 21:46:34.136536','2020-10-07 21:46:34.136536'),(22,'Caitlyn','O\'Conner','foster@lemke.co','585.329.9038','5561 Schroeder Springs','Suite 352','Walkerfort','Nevada','68066-4632','USA','1934-11-01 00:00:00','2020-08-22 00:00:00',6,'2020-10-07 21:46:34.146299','2020-10-07 21:46:34.146299'),(23,'Mathilda','Grant','russell@ward.net','444.792.0234 x5095','88150 Franecki Course','Suite 794','New Suellen','Tennessee','69448-0330','USA','1993-02-08 00:00:00','2020-09-06 00:00:00',12,'2020-10-07 21:46:34.155527','2020-10-07 21:46:34.155527'),(24,'Kylee','Muller','filiberto.hayes@nader.biz','1-151-290-3154 x270','92167 Jast Land','Suite 217','Henryfort','Idaho','44200','USA','1999-12-09 00:00:00','2020-07-24 00:00:00',15,'2020-10-07 21:46:34.164788','2020-10-07 21:46:34.164788'),(25,'Selene','Legros','katlyn@zieme-senger.info','1-728-607-4710 x4161','99490 Hilpert View','Apt. 197','New Isidrotown','Pennsylvania','67208','USA','1961-05-18 00:00:00','2020-04-29 00:00:00',7,'2020-10-07 21:46:34.174146','2020-10-07 21:46:34.174146'),(26,'Ramiro','Collins','tonia@gibson.net','402.833.2734 x627','2572 Schamberger Valley','Suite 155','Laneberg','Georgia','06728','USA','1944-04-23 00:00:00','2020-07-05 00:00:00',6,'2020-10-07 21:46:34.183290','2020-10-07 21:46:34.183290'),(27,'Tonia','Hauck','caryn@dubuque-gibson.org','443.903.4048 x1366','5434 Cummings Shore','Apt. 723','Wolfview','North Dakota','31136','USA','1936-01-07 00:00:00','2020-08-31 00:00:00',7,'2020-10-07 21:46:34.191622','2020-10-07 21:46:34.191622'),(28,'Ezekiel','Anderson','sommer@ullrich.biz','465.096.8802 x21359','88573 Arden Court','Apt. 651','East Derrickmouth','Washington','52494-8171','USA','1959-07-26 00:00:00','2020-05-10 00:00:00',3,'2020-10-07 21:46:34.200237','2020-10-07 21:46:34.200237'),(29,'Charles','Hayes','louie_toy@schowalter.name','560.414.9713','4253 Andrew Drives','Suite 922','Odeliaside','Indiana','10292-1145','USA','1984-11-01 00:00:00','2020-08-03 00:00:00',14,'2020-10-07 21:46:34.208462','2020-10-07 21:46:34.208462'),(30,'Vincenzo','Brakus','rubin_fahey@gibson.name','921.647.0363 x70909','131 Olson Knolls','Apt. 821','West Rosamaria','Massachusetts','02392-6451','USA','1939-10-30 00:00:00','2020-05-15 00:00:00',2,'2020-10-07 21:46:34.216885','2020-10-07 21:46:34.216885'),(31,'Linh','Bergstrom','maia@fay.name','1-674-363-7010 x69233','829 Yun Freeway','Apt. 300','Linneashire','Rhode Island','23515-2549','USA','1955-03-03 00:00:00','2020-05-31 00:00:00',8,'2020-10-07 21:46:34.225179','2020-10-07 21:46:34.225179');
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients_test_plans`
--

DROP TABLE IF EXISTS `patients_test_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patients_test_plans` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `patient_id` bigint(20) NOT NULL,
  `test_plan_id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_patients_test_plans_on_patient_id` (`patient_id`),
  KEY `index_patients_test_plans_on_test_plan_id` (`test_plan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients_test_plans`
--

LOCK TABLES `patients_test_plans` WRITE;
/*!40000 ALTER TABLE `patients_test_plans` DISABLE KEYS */;
/*!40000 ALTER TABLE `patients_test_plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients_users`
--

DROP TABLE IF EXISTS `patients_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patients_users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `patient_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_patients_users_on_patient_id` (`patient_id`),
  KEY `index_patients_users_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients_users`
--

LOCK TABLES `patients_users` WRITE;
/*!40000 ALTER TABLE `patients_users` DISABLE KEYS */;
INSERT INTO `patients_users` VALUES (1,1,46);
/*!40000 ALTER TABLE `patients_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20180813213222'),('20180825191605'),('20180829210029'),('20180911204656'),('20180916215300'),('20180919225441'),('20200630205145'),('20200706160004'),('20200922224225'),('20200922232129'),('20200922235007');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_plans`
--

DROP TABLE IF EXISTS `test_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_plans` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_plans`
--

LOCK TABLES `test_plans` WRITE;
/*!40000 ALTER TABLE `test_plans` DISABLE KEYS */;
INSERT INTO `test_plans` VALUES (1,'Plan A','2020-10-07 21:46:34.266644','2020-10-07 21:46:34.266644'),(2,'Plan B','2020-10-07 21:46:34.269007','2020-10-07 21:46:34.269007'),(3,'Plan C','2020-10-07 21:46:34.271605','2020-10-07 21:46:34.271605'),(4,'Plan D','2020-10-07 21:46:34.273782','2020-10-07 21:46:34.273782'),(5,'Plan E','2020-10-07 21:46:34.276051','2020-10-07 21:46:34.276051'),(6,'Plan F','2020-10-07 21:46:34.278204','2020-10-07 21:46:34.278204');
/*!40000 ALTER TABLE `test_plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_plans_tests`
--

DROP TABLE IF EXISTS `test_plans_tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_plans_tests` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `test_id` bigint(20) NOT NULL,
  `test_plan_id` bigint(20) NOT NULL,
  `duration` int(11) NOT NULL,
  `high_res` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_test_plans_tests_on_test_id` (`test_id`),
  KEY `index_test_plans_tests_on_test_plan_id` (`test_plan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_plans_tests`
--

LOCK TABLES `test_plans_tests` WRITE;
/*!40000 ALTER TABLE `test_plans_tests` DISABLE KEYS */;
INSERT INTO `test_plans_tests` VALUES (1,1,1,10,0),(2,3,1,10,1),(3,5,1,20,0),(4,4,1,10,1);
/*!40000 ALTER TABLE `test_plans_tests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_results`
--

DROP TABLE IF EXISTS `test_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_results` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `patients_test_plan_id` bigint(20) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `dataset_number` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  KEY `index_test_results_on_patients_test_plan_id` (`patients_test_plan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_results`
--

LOCK TABLES `test_results` WRITE;
/*!40000 ALTER TABLE `test_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests`
--

DROP TABLE IF EXISTS `tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tests` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests`
--

LOCK TABLES `tests` WRITE;
/*!40000 ALTER TABLE `tests` DISABLE KEYS */;
INSERT INTO `tests` VALUES (1,'Squats','2020-10-07 21:46:34.239093','2020-10-07 21:46:34.239093'),(2,'Walking','2020-10-07 21:46:34.241608','2020-10-07 21:46:34.241608'),(3,'Jumping Jacks','2020-10-07 21:46:34.243850','2020-10-07 21:46:34.243850'),(4,'Lunges','2020-10-07 21:46:34.246155','2020-10-07 21:46:34.246155'),(5,'Stairs Up','2020-10-07 21:46:34.248477','2020-10-07 21:46:34.248477'),(6,'Stairs Down','2020-10-07 21:46:34.250692','2020-10-07 21:46:34.250692'),(7,'Stairs','2020-10-07 21:46:34.252769','2020-10-07 21:46:34.252769'),(8,'Stand Up and Go','2020-10-07 21:46:34.254911','2020-10-07 21:46:34.254911');
/*!40000 ALTER TABLE `tests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password_digest` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `role` int(11) DEFAULT '100',
  `tac_agreed_at` datetime DEFAULT NULL,
  `unsubscribe_token` varchar(255) DEFAULT NULL,
  `unsubscribed_at` datetime DEFAULT NULL,
  `password_expires_at` datetime DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'$2a$12$tOpCDwsgsF7NWzmT.0OPher0oIQyYibcYq4mpxmv9Hw/fRRMD8oxq',NULL,NULL,0,NULL,NULL,NULL,NULL,'Roger','Waters',NULL,NULL,'admin@null.com',1000,NULL,'55690b2aa7a5942b5b5d3580f9d325799300029f2b15e6e51fea1d58b0e7',NULL,NULL,'2020-10-07 21:46:23.873135','2020-10-07 21:46:23.873135'),(2,'$2a$12$mWdqfOjgODwCIq4yyPvtFuZZjkfAy5nJLmsn3uu39qP29XJXaOSl.',NULL,NULL,0,NULL,NULL,NULL,NULL,'Karl','Watsica',NULL,NULL,'Doctor0@Muller.com',300,NULL,'d7aa7e30568f33a769f2cc5e208b2f0015a1099eb4d98b3617adc8c481b3',NULL,NULL,'2020-10-07 21:46:24.421543','2020-10-07 21:46:24.421543'),(3,'$2a$12$q4Rf3LaWUz3PXRKI16ZG/OKfAkY8joU5V1DdOQutjn8g.0y6QRLYW',NULL,NULL,0,NULL,NULL,NULL,NULL,'Joanne','Kiehn',NULL,NULL,'Admin1@Muller.com',400,NULL,'75851c00b70bec0942383d783b428135e5331dc543a407d0a21bb298be16',NULL,NULL,'2020-10-07 21:46:24.613562','2020-10-07 21:46:24.613562'),(4,'$2a$12$ycHvALnnlf4N4Vr.t465ge1ZGC1e5oOTRjrjaOCsszTI5Bs.L1.py',NULL,NULL,0,NULL,NULL,NULL,NULL,'Robert','Watsica',NULL,NULL,'Admin2@Muller.com',400,NULL,'042c14d80630f233dd2ec08bc4e4bcd5eb5df3c507027f571c3d69c85427',NULL,NULL,'2020-10-07 21:46:24.807276','2020-10-07 21:46:24.807276'),(5,'$2a$12$/OOJO0iuyxjYlWP/WLwlHe8TyfKdCS7k1NLIHuaKLPT7r//vKSkGG',NULL,NULL,0,NULL,NULL,NULL,NULL,'Victor','Smith',NULL,NULL,'Doctor3@Muller.com',300,NULL,'b870e1ed8cd53d74edc89423ad47900e661e71a0ab1241d4ab5433becf2d',NULL,NULL,'2020-10-07 21:46:25.000456','2020-10-07 21:46:25.000456'),(6,'$2a$12$dry4Wu5g9wVhWqaV2C8tRO8Txj9eoRbDOayjaV707lD9INqZxVdpO',NULL,NULL,0,NULL,NULL,NULL,NULL,'Rosanne','Wunsch',NULL,NULL,'CanaryAdmin4@Muller.com',1000,NULL,'6fe74b3eb71f181727d702132aa305cf466aa37a7696f0f126cc3ba3e575',NULL,NULL,'2020-10-07 21:46:25.193628','2020-10-07 21:46:25.193628'),(7,'$2a$12$bVXdVRnsG4JrdqgOQqYcquJ9pKozmJU3gw.EJv.sMGwj64rW8ENS.',NULL,NULL,0,NULL,NULL,NULL,NULL,'Kyong','Cartwright',NULL,NULL,'Nurse5@Muller.com',200,NULL,'d218ab03a8a43dc9f8e03ce3b1af6654790378b4a9ef0a5a55b84e8f7a6e',NULL,NULL,'2020-10-07 21:46:25.388918','2020-10-07 21:46:25.388918'),(8,'$2a$12$L3eqJN4H.cKJRx/0jgmN1OLDYsevyTSraqZJ3Tfa0LmEn9eojIWRi',NULL,NULL,0,NULL,NULL,NULL,NULL,'Patrick','Ullrich',NULL,NULL,'Nurse6@Muller.com',200,NULL,'7aa826478fbd5689a9c77fd2737aba67a0c2d495f87f891d7b81aeb56a7f',NULL,NULL,'2020-10-07 21:46:25.581266','2020-10-07 21:46:25.581266'),(9,'$2a$12$q.wP5nfrqW4EfCkW0.GkbeY1GubpjfbXDuF0WKe79Ki7lJHZIYrxG',NULL,NULL,0,NULL,NULL,NULL,NULL,'Alfonzo','Frami',NULL,NULL,'Therapist7@Muller.com',100,NULL,'47ed1c84bee7b6e675c13045d2cc43f8672c7da9d472ff0005e6b4162533',NULL,NULL,'2020-10-07 21:46:25.772255','2020-10-07 21:46:25.772255'),(10,'$2a$12$6EpQKPPrrG2lC7wfK4AxqeDKcBd1quV5c0aCz1GXlLjaxqA1aN4uy',NULL,NULL,0,NULL,NULL,NULL,NULL,'Stevie','Roob',NULL,NULL,'Doctor8@Muller.com',300,NULL,'08e40548b466469306d8f2201d6236cdfa70f5b6536568759cab192387aa',NULL,NULL,'2020-10-07 21:46:25.967761','2020-10-07 21:46:25.967761'),(11,'$2a$12$k8DZ42K2DssHvSs.iOe.mu17S10Xl.VEPyH/HW9u0Y86sJH4/Yaxq',NULL,NULL,0,NULL,NULL,NULL,NULL,'Oren','Hudson',NULL,NULL,'Doctor9@Muller.com',300,NULL,'bed51cdb90ec444fa9d5a3ef3ae85520fc784d9541bf16368c37af566165',NULL,NULL,'2020-10-07 21:46:26.185598','2020-10-07 21:46:26.185598'),(12,'$2a$12$i7gS9FjilMs3bwvaq1qqU.LbnMbFfcmqFLkBaP7L1wXrYPNssaOvq',NULL,NULL,0,NULL,NULL,NULL,NULL,'Eleonor','Greenfelder',NULL,NULL,'Doctor0@Ziemann.com',300,NULL,'3f068d1e2c1e4ae0a202b06c9a8f24f80c1265d17b7637cd253020dabe2b',NULL,NULL,'2020-10-07 21:46:26.377187','2020-10-07 21:46:26.377187'),(13,'$2a$12$aUHPYOgiwgsrK7iJq9vR4uKz3qCwgM8Y7.yokqFeGtxXDOe.jqpba',NULL,NULL,0,NULL,NULL,NULL,NULL,'Orval','Corkery',NULL,NULL,'Therapist1@Ziemann.com',100,NULL,'93a33596f2a1e5e9127bed959c83f920f99668885946813484e303de2b51',NULL,NULL,'2020-10-07 21:46:26.570551','2020-10-07 21:46:26.570551'),(14,'$2a$12$9RvJlhSAK11mJq3v6.3VLOomwLp5rDEzOzWym2gz8GV8G0U1nE6uS',NULL,NULL,0,NULL,NULL,NULL,NULL,'Blossom','Kohler',NULL,NULL,'Nurse2@Ziemann.com',200,NULL,'4f7a64e8ecff6175ebefad5ae2158f0487570c1eb615afd67793f2dda3db',NULL,NULL,'2020-10-07 21:46:26.761230','2020-10-07 21:46:26.761230'),(15,'$2a$12$nPqzH/7Hd2VMzhsdbQLcBeoFoF8USFIepyjDfq.jvv6C.n/qvxStK',NULL,NULL,0,NULL,NULL,NULL,NULL,'Damion','Kiehn',NULL,NULL,'Nurse3@Ziemann.com',200,NULL,'65e7eac4bdbaf4bf1cd1e8158aacfacaefe460995a089ffd3833845d247a',NULL,NULL,'2020-10-07 21:46:26.954704','2020-10-07 21:46:26.954704'),(16,'$2a$12$mTDQxvGkpTl5uVzGzdeLEOnJUvUIfU9xZ8teSr1td6wxjbTPOi0Ey',NULL,NULL,0,NULL,NULL,NULL,NULL,'Phillip','McDermott',NULL,NULL,'Nurse4@Ziemann.com',200,NULL,'fffcb6828a085bdbbd652bb26c6282e1b23393fd48461dba91344749adce',NULL,NULL,'2020-10-07 21:46:27.147400','2020-10-07 21:46:27.147400'),(17,'$2a$12$1W6nez2YolkS7bP8d6kw/eSy3ec3eculjP5uYveW5Czu13k7lopdC',NULL,NULL,0,NULL,NULL,NULL,NULL,'Sherly','Hettinger',NULL,NULL,'Doctor5@Ziemann.com',300,NULL,'b0d8c294add86e901b1b4758da205afa590ceb53dbb3965caba9490cdb1a',NULL,NULL,'2020-10-07 21:46:27.336771','2020-10-07 21:46:27.336771'),(18,'$2a$12$5Jg9mGE3JxUVTCmyGpEVfu8/.D/G396H398yw/RPqVE/tnAUQ.FZa',NULL,NULL,0,NULL,NULL,NULL,NULL,'Shayla','Franecki',NULL,NULL,'Doctor6@Ziemann.com',300,NULL,'8527cfb6141b702e7f60aa86185e2ac19907ce00a9f07cdf7aeb81d197f5',NULL,NULL,'2020-10-07 21:46:27.527111','2020-10-07 21:46:27.527111'),(19,'$2a$12$gDT6tlUSuA6amlcLwHB9ouiHnu7KcwglgWibGAYoqCv.JBFxrc3iO',NULL,NULL,0,NULL,NULL,NULL,NULL,'Karole','Mills',NULL,NULL,'Therapist7@Ziemann.com',100,NULL,'125f6335ac5d9e83f46a59c1c871a5b19b60859e3f5ba9a9efddcffcb6bd',NULL,NULL,'2020-10-07 21:46:27.722285','2020-10-07 21:46:27.722285'),(20,'$2a$12$DMtq.nEx.krR.94pzer8Zuqmrzmp1n45Vctyxj0WISZQg9U0sODky',NULL,NULL,0,NULL,NULL,NULL,NULL,'Gwyn','Labadie',NULL,NULL,'CanaryAdmin8@Ziemann.com',1000,NULL,'bc352998e59d78e8c3698a3dfc238cbdae85fee64ebcbaf40c193c375016',NULL,NULL,'2020-10-07 21:46:27.914805','2020-10-07 21:46:27.914805'),(21,'$2a$12$Hrljll0.nLPezjl2saZGBe4SL8zjmChe.A9IJfrpzSYadCI7JOVSK',NULL,NULL,0,NULL,NULL,NULL,NULL,'Adell','Lubowitz',NULL,NULL,'Admin9@Ziemann.com',400,NULL,'0ffb7a93c28a49b4a8a197e5aea48574cca21c0b673e36c18dbdcb6d3b6e',NULL,NULL,'2020-10-07 21:46:28.106834','2020-10-07 21:46:28.106834'),(22,'$2a$12$FH1dMpF.jQz7lIuVVdsqrOe09cMSKz0mzhXQqTDgiHMAgjRJs.eTK',NULL,NULL,0,NULL,NULL,NULL,NULL,'Stacee','Beahan',NULL,NULL,'Therapist0@Hagenes.com',100,NULL,'799ac83027bcef0c2ab1b2441ebe35e931fdba8c8a70dfe3d4b518f13ba8',NULL,NULL,'2020-10-07 21:46:28.303213','2020-10-07 21:46:28.303213'),(23,'$2a$12$DfkFR7B.iAamTVU89/wSzODhj2R2t8LG1X6xdIwJtVtuvwXIzFz/W',NULL,NULL,0,NULL,NULL,NULL,NULL,'Shavonne','Jacobson',NULL,NULL,'Nurse1@Hagenes.com',200,NULL,'805f97e503643a3215b2fc71f47b80a3e735be23f00d613193153b060de3',NULL,NULL,'2020-10-07 21:46:28.493196','2020-10-07 21:46:28.493196'),(24,'$2a$12$zdLLq4T7/VqsCi/ZhhC7KeAQWOCwKGWHHkXG4A8QYBuQ.CvWULKuW',NULL,NULL,0,NULL,NULL,NULL,NULL,'Keitha','Pfannerstill',NULL,NULL,'CanaryAdmin2@Hagenes.com',1000,NULL,'3e5a81abd386cc64c73d9d76665e1846af8847f372f3f137168085d0b876',NULL,NULL,'2020-10-07 21:46:28.686739','2020-10-07 21:46:28.686739'),(25,'$2a$12$mhrrZ.NqJQ/TjAQkdqBGIOYkSu9RVoL1pI3Z7umAbgUFGIgUTQz7m',NULL,NULL,0,NULL,NULL,NULL,NULL,'Lilla','Schinner',NULL,NULL,'Nurse3@Hagenes.com',200,NULL,'bc201981f6845eff40d4841fcdd5bf9c7599acab3fd873b4ee0c0332de8c',NULL,NULL,'2020-10-07 21:46:28.877004','2020-10-07 21:46:28.877004'),(26,'$2a$12$b/3kl0CW4Q9gieVPc7H9cudB4zFPgvi9Crj0/Qk81JAZwYl89GHue',NULL,NULL,0,NULL,NULL,NULL,NULL,'Ozell','Gislason',NULL,NULL,'Admin4@Hagenes.com',400,NULL,'797752589144c36a53bafe09b650277cb67a3af6101d62a0c692c32cc54d',NULL,NULL,'2020-10-07 21:46:29.071133','2020-10-07 21:46:29.071133'),(27,'$2a$12$3HZuroAzb6vv1GdnvI1wT.JjYJXBp0CLC2PoZDP.FrzlOY34yqVs2',NULL,NULL,0,NULL,NULL,NULL,NULL,'Meryl','Langworth',NULL,NULL,'Therapist5@Hagenes.com',100,NULL,'c987cc8a8434403e5a4651fdd74b506ba830c05d5c9e22c5d922aa9fd0de',NULL,NULL,'2020-10-07 21:46:29.266903','2020-10-07 21:46:29.266903'),(28,'$2a$12$xXf868EMC1MmsTQ1igtMie4XK6Ohw5sX36m25N6/jX6d7hLIRypRW',NULL,NULL,0,NULL,NULL,NULL,NULL,'Jan','Hansen',NULL,NULL,'CanaryAdmin6@Hagenes.com',1000,NULL,'05128625806df1a0d8187dd154437266f6b3a411fc9bd1643894bf789020',NULL,NULL,'2020-10-07 21:46:29.460388','2020-10-07 21:46:29.460388'),(29,'$2a$12$SJbY1m91aCO5E0UheETPFOzdxyqVey0lcb3vmE1Il3htOnENtBz5W',NULL,NULL,0,NULL,NULL,NULL,NULL,'Stephen','Bartoletti',NULL,NULL,'Nurse7@Hagenes.com',200,NULL,'a93a9b7b48111300376982cde20fd5f26cf4b57d5ddf52a167619545a855',NULL,NULL,'2020-10-07 21:46:29.651401','2020-10-07 21:46:29.651401'),(30,'$2a$12$QHQgxMpd9EvEzHMFdo6riebC7fYGv7JpHHNa2nE8N6G0IJT0n4JLy',NULL,NULL,0,NULL,NULL,NULL,NULL,'Armand','Mann',NULL,NULL,'CanaryAdmin8@Hagenes.com',1000,NULL,'b92de44d82eaa5dae55f7881f3bc144c217ff6fc958b518a07cece1f1501',NULL,NULL,'2020-10-07 21:46:29.850705','2020-10-07 21:46:29.850705'),(31,'$2a$12$9FITP6lSHj09v/mJAleTq.OSTEyMkewqfbvUN7If/LL21GBw0VU.K',NULL,NULL,0,NULL,NULL,NULL,NULL,'Eldon','Stiedemann',NULL,NULL,'Doctor9@Hagenes.com',300,NULL,'063c2cc706858e7e1ecbdf8a6ad5b13b636c28598247f82e2cb54ec6f691',NULL,NULL,'2020-10-07 21:46:30.036963','2020-10-07 21:46:30.036963'),(32,'$2a$12$o.IETXIyW/3rTbVfrz6dOeJa7MPYyPibuVP40MyfxV145v5eTiRpK',NULL,NULL,0,NULL,NULL,NULL,NULL,'Bok','Rodriguez',NULL,NULL,'Doctor0@Fisher.com',300,NULL,'70dc49d31e428958ed0f8a9d85f0db42ed7b9abcaa26adf7da20471b6326',NULL,NULL,'2020-10-07 21:46:30.232164','2020-10-07 21:46:30.232164'),(33,'$2a$12$OP5Mo.Lqk0FdPzrRj1qM8OmhAoBRdzDIe7nGEscgDo/D9/ZL1z.g2',NULL,NULL,0,NULL,NULL,NULL,NULL,'Jessenia','Cartwright',NULL,NULL,'CanaryAdmin1@Fisher.com',1000,NULL,'969238183f4e6adcdd663aaf5680bdcc370bd3f45428a5871fdf1f24ef2e',NULL,NULL,'2020-10-07 21:46:30.423046','2020-10-07 21:46:30.423046'),(34,'$2a$12$l7mmWmtLzS7LH3IUUvXgZeJy5qB/vjcEjxOcIyUbudq0Cxy4HBBvq',NULL,NULL,0,NULL,NULL,NULL,NULL,'Vasiliki','Roberts',NULL,NULL,'Nurse2@Fisher.com',200,NULL,'164997c5fe240ebe394ef9810fa8a02b1268ae9c86d2e685beae4e29f709',NULL,NULL,'2020-10-07 21:46:30.614162','2020-10-07 21:46:30.614162'),(35,'$2a$12$bqbmqkAWJWBynaB98RTcieN0X.lC67nV8sINbawU8bt0zPS6Ksjme',NULL,NULL,0,NULL,NULL,NULL,NULL,'Naoma','Schamberger',NULL,NULL,'Admin3@Fisher.com',400,NULL,'8b647a9bd1219dae432faff25c62b526bed8c95758956ad8f3558d8da230',NULL,NULL,'2020-10-07 21:46:30.807657','2020-10-07 21:46:30.807657'),(36,'$2a$12$rQfIpYLIIkCQADi6dUvFfOazimitMW6XzYhriABFDRsWpizkZEaHq',NULL,NULL,0,NULL,NULL,NULL,NULL,'Shelby','Braun',NULL,NULL,'Therapist4@Fisher.com',100,NULL,'67c5e60f058a4efe6b74db13f8549cf7e640d8af2a129e5938f149dea436',NULL,NULL,'2020-10-07 21:46:30.998337','2020-10-07 21:46:30.998337'),(37,'$2a$12$5LfAAaibMsuiKtDkqrbwke3nSRliwvGcLeQqVPStNUHQz06/f8xXS',NULL,NULL,0,NULL,NULL,NULL,NULL,'Brenton','Gorczany',NULL,NULL,'Doctor5@Fisher.com',300,NULL,'a3b49f107717af51b6c088e5fe24fb9094d2c1ccfb049511513cd5c76144',NULL,NULL,'2020-10-07 21:46:31.190619','2020-10-07 21:46:31.190619'),(38,'$2a$12$my8dV8XXlP0MCDG7SXyD2O/6EZeakAK8KcSescuwLN.pMKod.UTf2',NULL,NULL,0,NULL,NULL,NULL,NULL,'Wes','Kuvalis',NULL,NULL,'Doctor6@Fisher.com',300,NULL,'0aecd84a916f6abca92be15c62174eb9a852a8c3be84e2bf3ca86d59458b',NULL,NULL,'2020-10-07 21:46:31.383192','2020-10-07 21:46:31.383192'),(39,'$2a$12$BfiKYBcaToRAnWbbs/fGhOBwGBjiJ0Snx/K5q03WBjhkvm/FUuAv2',NULL,NULL,0,NULL,NULL,NULL,NULL,'Donnie','Buckridge',NULL,NULL,'Therapist7@Fisher.com',100,NULL,'5e1c935a9ed439e200de560e6a361213db067b16513075abaaa06a3ba000',NULL,NULL,'2020-10-07 21:46:31.573465','2020-10-07 21:46:31.573465'),(40,'$2a$12$8lgDznmJMwca/ddoOfD4yuxIFcqsTmEpGCIfA7pZqebIq9UAh0egu',NULL,NULL,0,NULL,NULL,NULL,NULL,'Lee','Kuhlman',NULL,NULL,'Therapist8@Fisher.com',100,NULL,'b7c2baf24d6bcf5996017d9a6882ded2ed76979e7d683e661ae961fcb70a',NULL,NULL,'2020-10-07 21:46:31.766200','2020-10-07 21:46:31.766200'),(41,'$2a$12$fIh7zBn5pQvuyKyb6nRjUO.QMmLDomWQtxkQx4ILviQ0x8fY5PbJK',NULL,NULL,0,NULL,NULL,NULL,NULL,'Lynell','Schmitt',NULL,NULL,'Admin9@Fisher.com',400,NULL,'b7a5617665bf1721954642c50467486a1e37613b1ce6c437d3451a0dbd7f',NULL,NULL,'2020-10-07 21:46:31.956059','2020-10-07 21:46:31.956059'),(42,'$2a$12$G3G1nrbPTaQ9d3L7LkmS2.9IJKtiytGKGWV.X2D9Ur0XZYDl1zqaq',NULL,NULL,0,NULL,NULL,NULL,NULL,'Wendolyn','Harvey',NULL,NULL,'Nurse0@Kassulke-McKenzie.com',200,NULL,'712903be4347ecc73397e6ec8c70af8174234c0b03cae44c2024fc4625b4',NULL,NULL,'2020-10-07 21:46:32.148140','2020-10-07 21:46:32.148140'),(43,'$2a$12$dX1utIa8OzxnJxOL/l/Z7.kPvDo9IijWNCE0W1ZbC8m2oLBzhZFYC',NULL,NULL,0,NULL,NULL,NULL,NULL,'Max','Abbott',NULL,NULL,'Therapist1@Kassulke-McKenzie.com',100,NULL,'e492fea465ae5d602ed14cb8b7f5791a17032a5222e3041d60778e168df0',NULL,NULL,'2020-10-07 21:46:32.339412','2020-10-07 21:46:32.339412'),(44,'$2a$12$gu4MGAZ26rfUty5z5p7ZauWufSuRIvOZV63yVS4TwbCksdr4Z5pwK',NULL,NULL,0,NULL,NULL,NULL,NULL,'Mary','Heaney',NULL,NULL,'CanaryAdmin2@Kassulke-McKenzie.com',1000,NULL,'1d8a48a5a890c9e99d54368c47cd64908cbf072349c75734a72382b94b65',NULL,NULL,'2020-10-07 21:46:32.530314','2020-10-07 21:46:32.530314'),(45,'$2a$12$RuXWvXyURouP4o7g4msMoeUCoJg0KYCAltBYqvYBiPG0hjFsTKg6K',NULL,NULL,0,NULL,NULL,NULL,NULL,'Archie','McDermott',NULL,NULL,'Therapist3@Kassulke-McKenzie.com',100,NULL,'ad8962df88187812b35c55a658e4533d8f26e89b66a121c9c316e74b2123',NULL,NULL,'2020-10-07 21:46:32.716611','2020-10-07 21:46:32.716611'),(46,'$2a$12$eGBMKGajDh1ciKJBcd9reO8.1uJGgSZBxyWR.PcY3r.FsUYBdhb5S',NULL,NULL,0,NULL,NULL,NULL,NULL,'Yon','Murray',NULL,NULL,'Doctor4@Kassulke-McKenzie.com',300,NULL,'5487dbee6696737ca383476be5c8194ddd1a9bf6403c5801d2020fa07a25',NULL,NULL,'2020-10-07 21:46:32.929191','2020-10-07 21:46:32.929191'),(47,'$2a$12$LDuj1mMnjpeEZzg4U4zJXeMHDW/U9SdJl1EjvZAkyRoHvMlE.IpLO',NULL,NULL,0,NULL,NULL,NULL,NULL,'Ernesto','Hartmann',NULL,NULL,'Doctor5@Kassulke-McKenzie.com',300,NULL,'a7c0be2c90a3a73f7eea6f0b9474339d333e2eacf714cc934b5bb811abd2',NULL,NULL,'2020-10-07 21:46:33.123021','2020-10-07 21:46:33.123021'),(48,'$2a$12$1VBeX1AY95UWDsQt5Nt4GueRf8.YPZ11EUghRYa3SoQS1Kv8FPL7a',NULL,NULL,0,NULL,NULL,NULL,NULL,'Fay','Satterfield',NULL,NULL,'Nurse6@Kassulke-McKenzie.com',200,NULL,'66a19316fefb6832ee3f1b0949c8b7066ede6594dd02a6d863f84ef9667f',NULL,NULL,'2020-10-07 21:46:33.313844','2020-10-07 21:46:33.313844'),(49,'$2a$12$.mnIR3BfjobOORZpa/c93eCiBpngiHiFGHvWQimjXdE8.Ej419C6G',NULL,NULL,0,NULL,NULL,NULL,NULL,'Myra','Klocko',NULL,NULL,'Nurse7@Kassulke-McKenzie.com',200,NULL,'fc4fe7b88ef160f33c2fc5d5fa6556a0e9a16cf7a36566cfa556967f681d',NULL,NULL,'2020-10-07 21:46:33.505887','2020-10-07 21:46:33.505887'),(50,'$2a$12$ckhAQEl5wMZsQRBVaeFfuORHloTpv5NClQdiacqENJ3wLYondRGXW',NULL,NULL,0,NULL,NULL,NULL,NULL,'Shonda','Wolff',NULL,NULL,'CanaryAdmin8@Kassulke-McKenzie.com',1000,NULL,'4193c09744648f204e621f05b754da572d8975e31101d774ccf1c3faf6e5',NULL,NULL,'2020-10-07 21:46:33.700582','2020-10-07 21:46:33.700582'),(51,'$2a$12$WACgVsVGQgWtdV2YsvERheiJ7n1giH4edivd7Z0RiiHVwjksWXLE6',NULL,NULL,0,NULL,NULL,NULL,NULL,'Tobi','Streich',NULL,NULL,'CanaryAdmin9@Kassulke-McKenzie.com',1000,NULL,'5b1c96b8caf0f47503d256e9c30d214ce318be94e13650b1628d768d0033',NULL,NULL,'2020-10-07 21:46:33.891712','2020-10-07 21:46:33.891712');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `versions`
--

DROP TABLE IF EXISTS `versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `versions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `item_type` varchar(191) NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_subtype` varchar(255) DEFAULT NULL,
  `event` varchar(255) NOT NULL,
  `whodunnit` varchar(255) DEFAULT NULL,
  `object` longtext,
  `created_at` datetime DEFAULT NULL,
  `object_changes` longtext,
  `comment` text,
  PRIMARY KEY (`id`),
  KEY `index_versions_on_item_type_and_item_id` (`item_type`,`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versions`
--

LOCK TABLES `versions` WRITE;
/*!40000 ALTER TABLE `versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `versions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-07 15:46:34
