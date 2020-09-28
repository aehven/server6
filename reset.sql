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
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2020-09-28 19:52:10.686712','2020-09-28 19:52:10.686712'),('schema_sha1','28f26d8645df8bd601f12c939ee4d600c97c79f6','2020-09-28 19:52:10.692401','2020-09-28 19:52:10.692401');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_stations`
--

LOCK TABLES `base_stations` WRITE;
/*!40000 ALTER TABLE `base_stations` DISABLE KEYS */;
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
INSERT INTO `ctes` VALUES (1,'Right Knee',100,'100A','---\n- 9\n- 8\n- 7\n- 6\n','2020-09-28 19:52:22.762030','2020-09-28 19:52:22.762030'),(2,'Right Knee',1000,NULL,'---\n- 0\n- 1\n- 2\n- 3\n','2020-09-28 19:52:22.794600','2020-09-28 19:52:22.794600'),(3,'Left Knee',2000,NULL,'---\n- 1\n- 2\n- 3\n- 4\n','2020-09-28 19:52:22.804061','2020-09-28 19:52:22.804061'),(4,'Right Knee',3000,NULL,'---\n- 2\n- 3\n- 4\n- 5\n','2020-09-28 19:52:22.813010','2020-09-28 19:52:22.813010'),(5,'Left Knee',4000,NULL,'---\n- 3\n- 4\n- 5\n- 6\n','2020-09-28 19:52:22.821648','2020-09-28 19:52:22.821648'),(6,'Right Knee',5000,NULL,'---\n- 4\n- 5\n- 6\n- 7\n','2020-09-28 19:52:22.830006','2020-09-28 19:52:22.830006'),(7,'Left Knee',6000,NULL,'---\n- 5\n- 6\n- 7\n- 8\n','2020-09-28 19:52:22.850029','2020-09-28 19:52:22.850029'),(8,'Right Knee',7000,NULL,'---\n- 6\n- 7\n- 8\n- 9\n','2020-09-28 19:52:22.859566','2020-09-28 19:52:22.859566'),(9,'Left Knee',8000,NULL,'---\n- 7\n- 8\n- 9\n- 10\n','2020-09-28 19:52:22.868768','2020-09-28 19:52:22.868768'),(10,'Right Knee',9000,NULL,'---\n- 8\n- 9\n- 10\n- 11\n','2020-09-28 19:52:22.877803','2020-09-28 19:52:22.877803'),(11,'Left Knee',10000,NULL,'---\n- 9\n- 10\n- 11\n- 12\n','2020-09-28 19:52:22.886298','2020-09-28 19:52:22.886298'),(12,'Right Knee',11000,NULL,'---\n- 10\n- 11\n- 12\n- 13\n','2020-09-28 19:52:22.894311','2020-09-28 19:52:22.894311'),(13,'Left Knee',12000,NULL,'---\n- 11\n- 12\n- 13\n- 14\n','2020-09-28 19:52:22.902588','2020-09-28 19:52:22.902588'),(14,'Right Knee',13000,NULL,'---\n- 12\n- 13\n- 14\n- 15\n','2020-09-28 19:52:22.911184','2020-09-28 19:52:22.911184'),(15,'Left Knee',14000,NULL,'---\n- 13\n- 14\n- 15\n- 16\n','2020-09-28 19:52:22.919659','2020-09-28 19:52:22.919659'),(16,'Right Knee',15000,NULL,'---\n- 14\n- 15\n- 16\n- 17\n','2020-09-28 19:52:22.927837','2020-09-28 19:52:22.927837'),(17,'Left Knee',16000,NULL,'---\n- 15\n- 16\n- 17\n- 18\n','2020-09-28 19:52:22.935998','2020-09-28 19:52:22.935998'),(18,'Right Knee',17000,NULL,'---\n- 16\n- 17\n- 18\n- 19\n','2020-09-28 19:52:22.953971','2020-09-28 19:52:22.953971'),(19,'Left Knee',18000,NULL,'---\n- 17\n- 18\n- 19\n- 20\n','2020-09-28 19:52:22.963318','2020-09-28 19:52:22.963318'),(20,'Right Knee',19000,NULL,'---\n- 18\n- 19\n- 20\n- 21\n','2020-09-28 19:52:22.972804','2020-09-28 19:52:22.972804'),(21,'Left Knee',20000,NULL,'---\n- 19\n- 20\n- 21\n- 22\n','2020-09-28 19:52:22.982011','2020-09-28 19:52:22.982011'),(22,'Right Knee',21000,NULL,'---\n- 20\n- 21\n- 22\n- 23\n','2020-09-28 19:52:22.990732','2020-09-28 19:52:22.990732'),(23,'Left Knee',22000,NULL,'---\n- 21\n- 22\n- 23\n- 24\n','2020-09-28 19:52:22.998712','2020-09-28 19:52:22.998712'),(24,'Right Knee',23000,NULL,'---\n- 22\n- 23\n- 24\n- 25\n','2020-09-28 19:52:23.006690','2020-09-28 19:52:23.006690'),(25,'Left Knee',24000,NULL,'---\n- 23\n- 24\n- 25\n- 26\n','2020-09-28 19:52:23.016019','2020-09-28 19:52:23.016019'),(26,'Right Knee',25000,NULL,'---\n- 24\n- 25\n- 26\n- 27\n','2020-09-28 19:52:23.025194','2020-09-28 19:52:23.025194'),(27,'Left Knee',26000,NULL,'---\n- 25\n- 26\n- 27\n- 28\n','2020-09-28 19:52:23.034649','2020-09-28 19:52:23.034649'),(28,'Right Knee',27000,NULL,'---\n- 26\n- 27\n- 28\n- 29\n','2020-09-28 19:52:23.053971','2020-09-28 19:52:23.053971'),(29,'Left Knee',28000,NULL,'---\n- 27\n- 28\n- 29\n- 30\n','2020-09-28 19:52:23.063815','2020-09-28 19:52:23.063815'),(30,'Right Knee',29000,NULL,'---\n- 28\n- 29\n- 30\n- 31\n','2020-09-28 19:52:23.073224','2020-09-28 19:52:23.073224'),(31,'Left Knee',30000,NULL,'---\n- 29\n- 30\n- 31\n- 32\n','2020-09-28 19:52:23.082288','2020-09-28 19:52:23.082288');
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
INSERT INTO `ctes_patients` VALUES (1,1,1,'2020-09-28 19:52:22.790596','2020-09-28 19:52:22.790596'),(2,2,2,'2020-09-28 19:52:22.800148','2020-09-28 19:52:22.800148'),(3,3,3,'2020-09-28 19:52:22.809411','2020-09-28 19:52:22.809411'),(4,4,4,'2020-09-28 19:52:22.818062','2020-09-28 19:52:22.818062'),(5,5,5,'2020-09-28 19:52:22.826626','2020-09-28 19:52:22.826626'),(6,6,6,'2020-09-28 19:52:22.835117','2020-09-28 19:52:22.835117'),(7,7,7,'2020-09-28 19:52:22.855780','2020-09-28 19:52:22.855780'),(8,8,8,'2020-09-28 19:52:22.865052','2020-09-28 19:52:22.865052'),(9,9,9,'2020-09-28 19:52:22.874185','2020-09-28 19:52:22.874185'),(10,10,10,'2020-09-28 19:52:22.883101','2020-09-28 19:52:22.883101'),(11,11,11,'2020-09-28 19:52:22.891032','2020-09-28 19:52:22.891032'),(12,12,12,'2020-09-28 19:52:22.899067','2020-09-28 19:52:22.899067'),(13,13,13,'2020-09-28 19:52:22.907542','2020-09-28 19:52:22.907542'),(14,14,14,'2020-09-28 19:52:22.916278','2020-09-28 19:52:22.916278'),(15,15,15,'2020-09-28 19:52:22.924530','2020-09-28 19:52:22.924530'),(16,16,16,'2020-09-28 19:52:22.932744','2020-09-28 19:52:22.932744'),(17,17,17,'2020-09-28 19:52:22.950059','2020-09-28 19:52:22.950059'),(18,18,18,'2020-09-28 19:52:22.959437','2020-09-28 19:52:22.959437'),(19,19,19,'2020-09-28 19:52:22.968935','2020-09-28 19:52:22.968935'),(20,20,20,'2020-09-28 19:52:22.978322','2020-09-28 19:52:22.978322'),(21,21,21,'2020-09-28 19:52:22.987396','2020-09-28 19:52:22.987396'),(22,22,22,'2020-09-28 19:52:22.995361','2020-09-28 19:52:22.995361'),(23,23,23,'2020-09-28 19:52:23.003498','2020-09-28 19:52:23.003498'),(24,24,24,'2020-09-28 19:52:23.011842','2020-09-28 19:52:23.011842'),(25,25,25,'2020-09-28 19:52:23.021578','2020-09-28 19:52:23.021578'),(26,26,26,'2020-09-28 19:52:23.030736','2020-09-28 19:52:23.030736'),(27,27,27,'2020-09-28 19:52:23.049236','2020-09-28 19:52:23.049236'),(28,28,28,'2020-09-28 19:52:23.059922','2020-09-28 19:52:23.059922'),(29,29,29,'2020-09-28 19:52:23.069344','2020-09-28 19:52:23.069344'),(30,30,30,'2020-09-28 19:52:23.078577','2020-09-28 19:52:23.078577'),(31,31,31,'2020-09-28 19:52:23.091381','2020-09-28 19:52:23.091381');
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
INSERT INTO `organizations` VALUES (1,0,'Lebsack-Flatley',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,6,0,0,'2020-09-28 19:52:12.898387','2020-09-28 19:52:12.932414'),(2,1,'Brakus and Sons',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,2,3,1,0,'2020-09-28 19:52:12.906853','2020-09-28 19:52:12.914989'),(3,1,'Kohler-Walker',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,4,5,1,0,'2020-09-28 19:52:12.926623','2020-09-28 19:52:12.932414'),(4,0,'Dare and Sons',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,12,0,0,'2020-09-28 19:52:12.940812','2020-09-28 19:52:12.968893'),(5,1,'Ondricka LLC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,8,9,1,0,'2020-09-28 19:52:12.947106','2020-09-28 19:52:12.953777'),(6,1,'Terry, Kemmer and Ritchie',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,10,11,1,0,'2020-09-28 19:52:12.963179','2020-09-28 19:52:12.968893'),(7,0,'Murphy-Johnston',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,18,0,0,'2020-09-28 19:52:12.977806','2020-09-28 19:52:13.024203'),(8,1,'Johnson LLC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,14,15,1,0,'2020-09-28 19:52:12.983316','2020-09-28 19:52:13.007607'),(9,1,'Gorczany LLC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,16,17,1,0,'2020-09-28 19:52:13.017597','2020-09-28 19:52:13.024203'),(10,0,'Russel, Graham and Kuvalis',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,24,0,0,'2020-09-28 19:52:13.057438','2020-09-28 19:52:13.090010'),(11,1,'Nienow-Will',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,20,21,1,0,'2020-09-28 19:52:13.062937','2020-09-28 19:52:13.068519'),(12,1,'Rath-Hessel',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,22,23,1,0,'2020-09-28 19:52:13.083502','2020-09-28 19:52:13.090010'),(13,0,'Rodriguez and Sons',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,25,30,0,0,'2020-09-28 19:52:13.104746','2020-09-28 19:52:13.137207'),(14,1,'Skiles-Fahey',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,26,27,1,0,'2020-09-28 19:52:13.111606','2020-09-28 19:52:13.118763'),(15,1,'Hagenes, Lynch and Howell',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,28,29,1,0,'2020-09-28 19:52:13.128875','2020-09-28 19:52:13.137207');
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
INSERT INTO `organizations_users` VALUES (1,1,2),(2,8,2),(3,1,3),(4,12,3),(5,1,4),(6,11,4),(7,1,5),(8,6,5),(9,1,6),(10,8,6),(11,1,7),(12,6,7),(13,1,8),(14,2,8),(15,1,9),(16,9,9),(17,1,10),(18,3,10),(19,1,11),(20,8,11),(21,4,12),(22,2,12),(23,4,13),(24,2,13),(25,4,14),(26,8,14),(27,4,15),(28,14,15),(29,4,16),(30,12,16),(31,4,17),(32,12,17),(33,4,18),(34,12,18),(35,4,19),(36,6,19),(37,4,20),(38,2,20),(39,4,21),(40,2,21),(41,7,22),(42,6,22),(43,7,23),(44,14,23),(45,7,24),(46,12,24),(47,7,25),(48,6,25),(49,7,26),(50,11,26),(51,7,27),(52,15,27),(53,7,28),(54,2,28),(55,7,29),(56,14,29),(57,7,30),(58,8,30),(59,7,31),(60,14,31),(61,10,32),(62,3,32),(63,10,33),(64,3,33),(65,10,34),(66,14,34),(67,10,35),(68,5,35),(69,10,36),(70,9,36),(71,10,37),(72,11,37),(73,10,38),(74,6,38),(75,10,39),(76,2,39),(77,10,40),(78,5,40),(79,10,41),(80,9,41),(81,13,42),(82,2,42),(83,13,43),(84,14,43),(85,13,44),(86,11,44),(87,13,45),(88,2,45),(89,13,46),(90,9,46),(91,13,47),(92,6,47),(93,13,48),(94,5,48),(95,13,49),(96,6,49),(97,13,50),(98,9,50),(99,13,51),(100,5,51);
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
INSERT INTO `patients` VALUES (1,'Antonio','Vivaldi','avivaldi@null.com','1234567890','Somplace nice','Uptown','Florence','Tuscany','12345','Itali','1678-03-04 00:00:00','2020-10-20 00:00:00',7,'2020-09-28 19:52:22.787731','2020-09-28 19:52:22.787731'),(2,'Merle','Howe','ayako_bernier@swaniawski-swift.com','1-723-825-1398 x8042','481 Dave Field','Suite 798','Port Careyhaven','Nevada','78322','USA','1963-04-13 00:00:00','2020-06-05 00:00:00',9,'2020-09-28 19:52:22.798230','2020-09-28 19:52:22.798230'),(3,'Omer','Russel','meda.bayer@conn.com','1-278-464-5914 x825','3049 Eduardo Freeway','Suite 759','New Ethylborough','Maine','74972','USA','1975-11-05 00:00:00','2020-08-20 00:00:00',4,'2020-09-28 19:52:22.807537','2020-09-28 19:52:22.807537'),(4,'Fausto','Tremblay','trudie@dach-glover.io','808-108-7646 x6687','57495 Reginia Prairie','Suite 793','Lanmouth','Colorado','73706-7115','USA','1979-12-11 00:00:00','2020-06-03 00:00:00',5,'2020-09-28 19:52:22.816314','2020-09-28 19:52:22.816314'),(5,'Dia','Feeney','otha@ziemann-collins.name','672-374-4130 x07224','49952 Hills Underpass','Apt. 744','Lake Darcie','Washington','62858-2712','USA','1958-09-14 00:00:00','2020-08-04 00:00:00',4,'2020-09-28 19:52:22.824944','2020-09-28 19:52:22.824944'),(6,'Wilford','Gulgowski','wesley@bins-barton.info','864-211-0768 x375','8602 Veum Gateway','Apt. 638','North Brant','Wisconsin','36332','USA','1951-06-03 00:00:00','2020-08-09 00:00:00',5,'2020-09-28 19:52:22.833343','2020-09-28 19:52:22.833343'),(7,'Kylee','Dicki','woodrow.tremblay@lesch.net','727.946.0179 x6666','6780 Luettgen Shoal','Apt. 793','Tracyview','Wisconsin','24347-4036','USA','1959-03-26 00:00:00','2020-07-14 00:00:00',1,'2020-09-28 19:52:22.853819','2020-09-28 19:52:22.853819'),(8,'Cecil','Rau','karin.fay@fisher.biz','(474) 754-8715 x0875','176 Dusty Forge','Apt. 500','Lebsackborough','Montana','62771-9702','USA','1943-06-16 00:00:00','2020-08-01 00:00:00',1,'2020-09-28 19:52:22.863127','2020-09-28 19:52:22.863127'),(9,'Marion','Rutherford','blair_zemlak@toy-stamm.com','886-519-5981 x6009','99031 Dach Prairie','Apt. 904','DuBuqueborough','Arizona','82285-9139','USA','1960-07-07 00:00:00','2020-06-25 00:00:00',5,'2020-09-28 19:52:22.872252','2020-09-28 19:52:22.872252'),(10,'Estelle','Murphy','georgine.hackett@oconner-fay.info','543-481-3150','175 Metz Orchard','Suite 586','North Mathilde','Vermont','23029-3312','USA','1950-12-12 00:00:00','2020-08-27 00:00:00',11,'2020-09-28 19:52:22.881239','2020-09-28 19:52:22.881239'),(11,'Gabriel','Brakus','karie@goldner-durgan.info','316-283-8778','491 Zulauf Rue','Suite 704','Ritchiebury','Nevada','15722-9587','USA','1933-03-12 00:00:00','2020-06-30 00:00:00',11,'2020-09-28 19:52:22.889341','2020-09-28 19:52:22.889341'),(12,'Jody','Borer','carter_hirthe@rohan.net','997-122-9660 x728','936 Adams Islands','Suite 379','South Daphine','Maine','62428','USA','1968-11-07 00:00:00','2020-07-11 00:00:00',3,'2020-09-28 19:52:22.897431','2020-09-28 19:52:22.897431'),(13,'Galina','Bailey','lon@walker.name','553-877-1998 x83064','33815 Pacocha Unions','Apt. 495','Port Merlin','New Hampshire','94262','USA','1973-09-11 00:00:00','2020-08-07 00:00:00',14,'2020-09-28 19:52:22.905846','2020-09-28 19:52:22.905846'),(14,'Damien','Terry','hien@hagenes.info','(270) 888-6230 x2873','8199 Legros Ramp','Apt. 225','East Kaciestad','Alaska','81305','USA','1990-07-17 00:00:00','2020-05-27 00:00:00',4,'2020-09-28 19:52:22.914588','2020-09-28 19:52:22.914588'),(15,'Erich','Casper','adan_jacobi@konopelski.io','1-909-318-8075','30415 Stevie Brook','Suite 437','South Billi','Georgia','32313-6612','USA','1978-12-05 00:00:00','2020-06-26 00:00:00',5,'2020-09-28 19:52:22.922813','2020-09-28 19:52:22.922813'),(16,'Drusilla','Runte','lauren@carroll-kassulke.io','574.768.2735 x8423','37844 Samual Village','Suite 289','Schummland','Kentucky','60547','USA','1970-03-29 00:00:00','2020-08-13 00:00:00',9,'2020-09-28 19:52:22.931106','2020-09-28 19:52:22.931106'),(17,'Tamisha','Simonis','danny_mante@nienow.org','(571) 015-9763 x371','803 Linwood Flats','Apt. 990','Creminburgh','Alaska','36716','USA','1985-06-24 00:00:00','2020-08-24 00:00:00',10,'2020-09-28 19:52:22.948069','2020-09-28 19:52:22.948069'),(18,'Torie','Altenwerth','santana@heller-heller.org','1-118-167-9134 x31167','49482 Russel Glen','Apt. 641','Phillipborough','Washington','75103-0943','USA','1995-10-26 00:00:00','2020-07-26 00:00:00',5,'2020-09-28 19:52:22.957497','2020-09-28 19:52:22.957497'),(19,'Andra','Hoeger','houston.brown@dibbert.io','494-093-2727 x998','3533 Elia Spring','Apt. 534','Nienowland','Utah','81252','USA','1998-04-06 00:00:00','2020-08-06 00:00:00',2,'2020-09-28 19:52:22.967003','2020-09-28 19:52:22.967003'),(20,'Tyron','Kreiger','adan.koch@bednar.org','(667) 805-3015 x32300','63309 Graham Rue','Apt. 242','Robbyburgh','Vermont','61101','USA','1935-09-09 00:00:00','2020-04-17 00:00:00',3,'2020-09-28 19:52:22.976375','2020-09-28 19:52:22.976375'),(21,'Minh','Volkman','cherri_collier@johnston.com','378-520-0574 x92301','91349 Ratke Trail','Suite 332','Rebekahshire','Washington','00297','USA','1965-12-04 00:00:00','2020-08-11 00:00:00',4,'2020-09-28 19:52:22.985544','2020-09-28 19:52:22.985544'),(22,'Blanche','Okuneva','milagro_lind@waters.io','918-753-0953 x67115','369 Kirk Alley','Apt. 460','Mannberg','Texas','21508','USA','1988-05-05 00:00:00','2020-08-14 00:00:00',15,'2020-09-28 19:52:22.993728','2020-09-28 19:52:22.993728'),(23,'Thad','Schultz','carmine.goldner@littel.io','733-906-2099','440 Legros Circles','Apt. 847','Lake Christinabury','Iowa','72121','USA','1990-08-27 00:00:00','2020-04-28 00:00:00',14,'2020-09-28 19:52:23.001748','2020-09-28 19:52:23.001748'),(24,'Lilliana','Boehm','maryrose@purdy-mayer.biz','1-300-158-4688 x41669','72957 Lynch Valleys','Suite 608','South Raymon','Virginia','74113','USA','1997-12-24 00:00:00','2020-08-07 00:00:00',3,'2020-09-28 19:52:23.009965','2020-09-28 19:52:23.009965'),(25,'Shana','Murphy','janella@abernathy.com','(467) 372-8416 x06940','81303 Alexia Valley','Suite 573','Williamsburgh','Arkansas','95563','USA','1977-04-15 00:00:00','2020-05-17 00:00:00',13,'2020-09-28 19:52:23.019774','2020-09-28 19:52:23.019774'),(26,'Sanda','Sauer','dave@gutkowski-mraz.io','1-265-782-3107','8107 Lind Stream','Apt. 657','Laurenland','Minnesota','99554','USA','1967-04-05 00:00:00','2020-06-14 00:00:00',1,'2020-09-28 19:52:23.028702','2020-09-28 19:52:23.028702'),(27,'Clay','Douglas','kaylee@ohara-thompson.io','1-784-046-4755 x704','5027 Catherina Course','Suite 341','Lake Karmen','Idaho','50685-5806','USA','1952-10-15 00:00:00','2020-06-08 00:00:00',10,'2020-09-28 19:52:23.038039','2020-09-28 19:52:23.038039'),(28,'Miles','Schaden','adalberto_grady@kunde.info','(997) 238-9874 x4185','488 Donnelly Squares','Apt. 866','South Adina','Rhode Island','90570-8631','USA','1944-02-10 00:00:00','2020-05-17 00:00:00',14,'2020-09-28 19:52:23.057856','2020-09-28 19:52:23.057856'),(29,'Johnnie','Mante','arthur@connelly-powlowski.co','(890) 836-2709 x374','768 Scot Pines','Apt. 260','South Mollieshire','South Carolina','64893','USA','1948-12-31 00:00:00','2020-08-06 00:00:00',2,'2020-09-28 19:52:23.067403','2020-09-28 19:52:23.067403'),(30,'Randy','Bednar','jewel_robel@adams.biz','(198) 703-1387 x764','79230 Virgil Centers','Suite 339','Rudyfurt','Texas','55650-1397','USA','1939-12-20 00:00:00','2020-05-28 00:00:00',6,'2020-09-28 19:52:23.076697','2020-09-28 19:52:23.076697'),(31,'Keneth','Lueilwitz','francis_krajcik@crooks.org','408.812.7685','1605 Frida Ville','Suite 667','Wolffbury','Kentucky','66067','USA','1969-07-06 00:00:00','2020-06-14 00:00:00',9,'2020-09-28 19:52:23.089310','2020-09-28 19:52:23.089310');
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
INSERT INTO `patients_users` VALUES (1,1,28);
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
INSERT INTO `test_plans` VALUES (1,'Plan A','2020-09-28 19:52:23.134280','2020-09-28 19:52:23.134280'),(2,'Plan B','2020-09-28 19:52:23.136939','2020-09-28 19:52:23.136939'),(3,'Plan C','2020-09-28 19:52:23.139408','2020-09-28 19:52:23.139408'),(4,'Plan D','2020-09-28 19:52:23.141883','2020-09-28 19:52:23.141883'),(5,'Plan E','2020-09-28 19:52:23.144226','2020-09-28 19:52:23.144226'),(6,'Plan F','2020-09-28 19:52:23.146632','2020-09-28 19:52:23.146632');
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
INSERT INTO `tests` VALUES (1,'Squats','2020-09-28 19:52:23.103619','2020-09-28 19:52:23.103619'),(2,'Walking','2020-09-28 19:52:23.106416','2020-09-28 19:52:23.106416'),(3,'Jumping Jacks','2020-09-28 19:52:23.108942','2020-09-28 19:52:23.108942'),(4,'Lunges','2020-09-28 19:52:23.111362','2020-09-28 19:52:23.111362'),(5,'Stairs Up','2020-09-28 19:52:23.113877','2020-09-28 19:52:23.113877'),(6,'Stairs Down','2020-09-28 19:52:23.116393','2020-09-28 19:52:23.116393'),(7,'Stairs','2020-09-28 19:52:23.118788','2020-09-28 19:52:23.118788'),(8,'Stand Up and Go','2020-09-28 19:52:23.121227','2020-09-28 19:52:23.121227');
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
INSERT INTO `users` VALUES (1,'$2a$12$vFnd.UgXcg32XHI3iAz88uroqbezfEpZpPw0aN.0ep2qUznO.ngKS',NULL,NULL,0,NULL,NULL,NULL,NULL,'Roger','Waters',NULL,NULL,'admin@null.com',1000,NULL,'ee11ad688f5c25993c9784328009ea601ebd7383790820a3e57e6166ec59',NULL,NULL,'2020-09-28 19:52:12.658831','2020-09-28 19:52:12.658831'),(2,'$2a$12$wM/e3AAv0sbleZef4qpnKeZWxJt6kmqlrqVa5jF5S6WGuA7u2dR1W',NULL,NULL,0,NULL,NULL,NULL,NULL,'Delicia','Mohr',NULL,NULL,'Admin0@Lebsack-Flatley.com',400,NULL,'edc5f6969fcc1e4273a558248e02ad6d3bd73e655c13ddb5844a434e8308',NULL,NULL,'2020-09-28 19:52:13.360642','2020-09-28 19:52:13.360642'),(3,'$2a$12$PF.qwohNyZLKaoVB2TUMyeGzcZkogyMK12FWHovNx.wtCsnSlROLq',NULL,NULL,0,NULL,NULL,NULL,NULL,'Antonio','Toy',NULL,NULL,'Admin1@Lebsack-Flatley.com',400,NULL,'3a667dfe314ddfa763aae17a6ab157226a8619be1044dcad100447bc4101',NULL,NULL,'2020-09-28 19:52:13.563930','2020-09-28 19:52:13.563930'),(4,'$2a$12$Uz56tUTA4SuKcseurKW2QeuY/REJ24D2t1BsXH4Z4vK1zpCrYIE1G',NULL,NULL,0,NULL,NULL,NULL,NULL,'Jami','Waters',NULL,NULL,'Doctor2@Lebsack-Flatley.com',300,NULL,'8f2f211d0481eef532b2ee6a035c9562ce53a3369f66409979e6a9337a3e',NULL,NULL,'2020-09-28 19:52:13.757822','2020-09-28 19:52:13.757822'),(5,'$2a$12$Lq6aFeMt/WIBOJN4KBBruedKqWngIdzLM6vQR6t9EONPdVtzDvsZ6',NULL,NULL,0,NULL,NULL,NULL,NULL,'Humberto','Hane',NULL,NULL,'Admin3@Lebsack-Flatley.com',400,NULL,'5737781e6a91a80f131fac2f9fa120e3fed10e6e24e23c974af9b43e64cc',NULL,NULL,'2020-09-28 19:52:13.947979','2020-09-28 19:52:13.947979'),(6,'$2a$12$HSiruSYbok07au5jS2YSmO98c1NotumH7Hpo7fP2bEl0uNKHCpgAe',NULL,NULL,0,NULL,NULL,NULL,NULL,'Tonia','Mayert',NULL,NULL,'Admin4@Lebsack-Flatley.com',400,NULL,'515118b4808ff48fa13df01f656c944b57f88de88db2960a870951ef2475',NULL,NULL,'2020-09-28 19:52:14.135819','2020-09-28 19:52:14.135819'),(7,'$2a$12$xPsppOfjiDNVqMYxKWtYq.xwGOQI7NzD.PsEKeOJ1vV71z77WIlCm',NULL,NULL,0,NULL,NULL,NULL,NULL,'Sebastian','Reilly',NULL,NULL,'Nurse5@Lebsack-Flatley.com',200,NULL,'bcbee95bb1edb4eeabd92aa1484538071f7c04c51797349ef63b771be772',NULL,NULL,'2020-09-28 19:52:14.323921','2020-09-28 19:52:14.323921'),(8,'$2a$12$jv6uaitiWMJsGjF2wh8vwObH3hz0pjiwsghMmr/VPbVLoSJs.uat6',NULL,NULL,0,NULL,NULL,NULL,NULL,'Mauro','Kirlin',NULL,NULL,'Doctor6@Lebsack-Flatley.com',300,NULL,'b6a532a38193facd624401930e5b5dcdd264f1a3d798d821d5f2908ccc98',NULL,NULL,'2020-09-28 19:52:14.513229','2020-09-28 19:52:14.513229'),(9,'$2a$12$oETMTEUY32KsDYMyPs96JeBPDGdtvpGdOP9ez6.7LR/Wb9TWpL6.q',NULL,NULL,0,NULL,NULL,NULL,NULL,'Ana','Wyman',NULL,NULL,'Admin7@Lebsack-Flatley.com',400,NULL,'76b622cb0d31aff0d9aa0d8a1a216e2f875c961fa32bbd4f4f21b0454db0',NULL,NULL,'2020-09-28 19:52:14.706809','2020-09-28 19:52:14.706809'),(10,'$2a$12$I1wyQc5h36T7QfGBYJ.O/OyNIgAUEWHvOiS83EYCyrTrIp5SFvwSK',NULL,NULL,0,NULL,NULL,NULL,NULL,'Gonzalo','Ullrich',NULL,NULL,'Therapist8@Lebsack-Flatley.com',100,NULL,'bc87f405d1fc9a138b53cd313cd257e3f76abced86a7b1be417c397c4cf7',NULL,NULL,'2020-09-28 19:52:14.895496','2020-09-28 19:52:14.895496'),(11,'$2a$12$QraditRsgqvnAtiAlCdP2OGu1/UBKdmWfbfHnYYNGxuiO1yZlwUai',NULL,NULL,0,NULL,NULL,NULL,NULL,'Aliza','Steuber',NULL,NULL,'Doctor9@Lebsack-Flatley.com',300,NULL,'10499a6076ec8df00699515638a2ea5d1ba40d51b90f681275be60e8b9ca',NULL,NULL,'2020-09-28 19:52:15.086809','2020-09-28 19:52:15.086809'),(12,'$2a$12$nOPHlaReme7IxjQuUHOOIe7yjg3uZamRxp8SkDI7PBbEIyWAV1WIK',NULL,NULL,0,NULL,NULL,NULL,NULL,'Nannette','Sporer',NULL,NULL,'CanaryAdmin0@Dare.com',1000,NULL,'164dae95e93d8b65b4563af2f30c01f4b55b75b80a75627392d4df08a3b3',NULL,NULL,'2020-09-28 19:52:15.275760','2020-09-28 19:52:15.275760'),(13,'$2a$12$.FHU/LXrkG0m1ztY/3bsF.s/h0KNixFhm8pqoYG3Oj14xDIuBamai',NULL,NULL,0,NULL,NULL,NULL,NULL,'Barney','Boyer',NULL,NULL,'Nurse1@Dare.com',200,NULL,'e32dca7bc00dcf559cd98ca53b34f2cc92ef9f0ee81ec23af10f9f9f2911',NULL,NULL,'2020-09-28 19:52:15.468547','2020-09-28 19:52:15.468547'),(14,'$2a$12$oq715ik1bYS16EPCA0U22OvZKqpi07k8by.h51j3XcqJ//xX.2ge.',NULL,NULL,0,NULL,NULL,NULL,NULL,'Rhea','Kunze',NULL,NULL,'Therapist2@Dare.com',100,NULL,'4ef449757c3ef7b49c3f0a3d59061d76caeadfe970630086a8cc76e9d05d',NULL,NULL,'2020-09-28 19:52:15.656633','2020-09-28 19:52:15.656633'),(15,'$2a$12$OkqRBP2rkRvKz2F.ywtGZu6/bGm9Y8tcEE39Sypl6Asgmobr6jl/u',NULL,NULL,0,NULL,NULL,NULL,NULL,'Libby','Graham',NULL,NULL,'Doctor3@Dare.com',300,NULL,'04ee0bb9e926074bd5f119388a7bfe76d629de87908c73f59efb56ab82c5',NULL,NULL,'2020-09-28 19:52:15.845383','2020-09-28 19:52:15.845383'),(16,'$2a$12$4zaDI0GiHduw0KwhJJO7sO4CDxibx1kZ0vDE3LQF9gBbdDbWJZBLu',NULL,NULL,0,NULL,NULL,NULL,NULL,'Ozell','Nicolas',NULL,NULL,'Admin4@Dare.com',400,NULL,'10a0fe5c0bb12a9f4ac712f1315b453a0cc4ced3e93df31fefc0c34f0ea2',NULL,NULL,'2020-09-28 19:52:16.032589','2020-09-28 19:52:16.032589'),(17,'$2a$12$LSFbZ8hreL52DKsj/iE0DuR5U0K.yVvOcekKx95ca68C2PpYxRTvK',NULL,NULL,0,NULL,NULL,NULL,NULL,'Efrain','Ziemann',NULL,NULL,'Doctor5@Dare.com',300,NULL,'b92d003cc783238466b09f9bdd702f591589c9eddb0e5d5ae0e8384ec246',NULL,NULL,'2020-09-28 19:52:16.218238','2020-09-28 19:52:16.218238'),(18,'$2a$12$fpp6vTQF/79W9oFrkTXsIeJ6FGHwSa2aJ/t88ID1ApuHM5KUydpz.',NULL,NULL,0,NULL,NULL,NULL,NULL,'Porfirio','Schiller',NULL,NULL,'Admin6@Dare.com',400,NULL,'de27a2c332e0e324bd1be522633ac99f139e98c854e9247bea0a8ec55b20',NULL,NULL,'2020-09-28 19:52:16.416824','2020-09-28 19:52:16.416824'),(19,'$2a$12$EPLN9t5nmQ9Qk.Vpw9LkFuj0xQecv1ZAlshUAVi8yCuWWVGT30uq6',NULL,NULL,0,NULL,NULL,NULL,NULL,'Rodrigo','Bergnaum',NULL,NULL,'Therapist7@Dare.com',100,NULL,'b20def15d148b6a9564881444a5ce600107699e143440f709eb5296a60f1',NULL,NULL,'2020-09-28 19:52:16.608704','2020-09-28 19:52:16.608704'),(20,'$2a$12$pfTC.a5auDoZZqDMIPo3S.gQToJuXLnNlTEueoIcqtCXAVkC0tJDy',NULL,NULL,0,NULL,NULL,NULL,NULL,'Curtis','Ruecker',NULL,NULL,'Doctor8@Dare.com',300,NULL,'7b2183bfcedb36ee1d4c3dd3dda3c68760f27d1563882167f527ac03ffad',NULL,NULL,'2020-09-28 19:52:16.797078','2020-09-28 19:52:16.797078'),(21,'$2a$12$e2sn5Ha5JlWsrDgFZjoirupUYh.Kzyi4hszxyj1AfxzB4PnuXfOrG',NULL,NULL,0,NULL,NULL,NULL,NULL,'Ellena','Kulas',NULL,NULL,'Doctor9@Dare.com',300,NULL,'7005747d04d8c8c1757b32e43ab378a35c008e2766e519228be008b90c16',NULL,NULL,'2020-09-28 19:52:16.983005','2020-09-28 19:52:16.983005'),(22,'$2a$12$zBG6eaOrCQo4LR1wb/ZKqOoHAtRJoEZkg0kWe1IKWMzFLVdyZbAi.',NULL,NULL,0,NULL,NULL,NULL,NULL,'Reatha','Kreiger',NULL,NULL,'CanaryAdmin0@Murphy-Johnston.com',1000,NULL,'4dd477d817a38fc49ea6a40766006993ad23013b33314d5b9f2d7ab6c268',NULL,NULL,'2020-09-28 19:52:17.169225','2020-09-28 19:52:17.169225'),(23,'$2a$12$88vj2OsPPjUyZf5lFFsuKe064qrz2edSNTUtayTaO0ixQu6.9LIEC',NULL,NULL,0,NULL,NULL,NULL,NULL,'Clair','Konopelski',NULL,NULL,'Nurse1@Murphy-Johnston.com',200,NULL,'e77db13f2cef5e2c5189d1ec88143fe0c7e819006eff81ab2392d09d7c8c',NULL,NULL,'2020-09-28 19:52:17.357019','2020-09-28 19:52:17.357019'),(24,'$2a$12$xrd2s5lb78TEGPwyrQds6eaF1FpB.tAll37bXjoooGLGSpFkQLZ82',NULL,NULL,0,NULL,NULL,NULL,NULL,'Neil','Brakus',NULL,NULL,'CanaryAdmin2@Murphy-Johnston.com',1000,NULL,'d1263ee37f5404d49b3d3253f86c6230b00152026b2527cbcd17dd618af6',NULL,NULL,'2020-09-28 19:52:17.547546','2020-09-28 19:52:17.547546'),(25,'$2a$12$Fyu1H3qLR.E3u5YylBrKLehb3pvXf.XeZU2G3ZFXQmZB0Plbe4JHy',NULL,NULL,0,NULL,NULL,NULL,NULL,'Ashlyn','Hudson',NULL,NULL,'Doctor3@Murphy-Johnston.com',300,NULL,'778b34ecf270a16f835f73a2a5d733664b297daa31df8bff08c78074b873',NULL,NULL,'2020-09-28 19:52:17.733317','2020-09-28 19:52:17.733317'),(26,'$2a$12$WuxOWwrk6enVCGxXvVVOHOaCHGxiU2t1ivsVgx6IyUlWIyOYSM5xa',NULL,NULL,0,NULL,NULL,NULL,NULL,'Levi','Bogisich',NULL,NULL,'CanaryAdmin4@Murphy-Johnston.com',1000,NULL,'af7186137afc1060dc685fae2a24e97df8fd84a514264798d4a19d122210',NULL,NULL,'2020-09-28 19:52:17.923776','2020-09-28 19:52:17.923776'),(27,'$2a$12$5HaXI9J./Esia2UQiEI5Belw5rfiBLitAO502IEWPt0Yhb708g8lO',NULL,NULL,0,NULL,NULL,NULL,NULL,'Angelo','Durgan',NULL,NULL,'Therapist5@Murphy-Johnston.com',100,NULL,'45b2558430b16693a5869e560aab73dfe8db483e22a65983a7a95d45f17c',NULL,NULL,'2020-09-28 19:52:18.112657','2020-09-28 19:52:18.112657'),(28,'$2a$12$uJ5NQD8RgtzFgX0my/QrK.zUf8XCvekKfqzaU.NV0X1qeZWdBAZpC',NULL,NULL,0,NULL,NULL,NULL,NULL,'Henry','Hessel',NULL,NULL,'Doctor6@Murphy-Johnston.com',300,NULL,'3565124c524aa64913cd35839fd2e1dfc629cb3b2b7c91aa087f6e4e2e99',NULL,NULL,'2020-09-28 19:52:18.302526','2020-09-28 19:52:18.302526'),(29,'$2a$12$5VECkr16pjJU5KPIyFpBqeH6oO0aQcPUc8qE/ZRSmUo38ZEsvd/3W',NULL,NULL,0,NULL,NULL,NULL,NULL,'Dee','Barrows',NULL,NULL,'Nurse7@Murphy-Johnston.com',200,NULL,'02cf89e55a705f66ca47697b2ad56c4e37c66ec4d93f858235d49a821ea4',NULL,NULL,'2020-09-28 19:52:18.489852','2020-09-28 19:52:18.489852'),(30,'$2a$12$9l3C0KUlHW/rCcsGuU3kkeYa5OP.guBGdcXvKowchTAcQ44sg7pQG',NULL,NULL,0,NULL,NULL,NULL,NULL,'Basil','Hauck',NULL,NULL,'Nurse8@Murphy-Johnston.com',200,NULL,'6b488bb7562c40ea751f35085074010523edeaa8e0f250e827aa1f11a26a',NULL,NULL,'2020-09-28 19:52:18.675855','2020-09-28 19:52:18.675855'),(31,'$2a$12$qxJk/lizxANHj3oFI.rBy..4qLl55gpqQAmDuzJdYbmjqoGfTfgNC',NULL,NULL,0,NULL,NULL,NULL,NULL,'Suzie','Mante',NULL,NULL,'CanaryAdmin9@Murphy-Johnston.com',1000,NULL,'373489465aaa7921e113fd307ea04d6c9a25940ef3ba9f545b8d64b58b0c',NULL,NULL,'2020-09-28 19:52:18.864507','2020-09-28 19:52:18.864507'),(32,'$2a$12$UclKzvD2tibZjK4wdivLBeDg318M0h9fu/VJD1Z..Wkc2Z6uuaGEa',NULL,NULL,0,NULL,NULL,NULL,NULL,'Mariann','Walker',NULL,NULL,'Doctor0@Russel.com',300,NULL,'d76a5b772ccbfb0cdfcab09f28609767c88a6dc55bee10bc3b3f7db78fe7',NULL,NULL,'2020-09-28 19:52:19.052801','2020-09-28 19:52:19.052801'),(33,'$2a$12$QmVha8iC879PV4FlZH.DsuDkmXvdvN4TVT.Ndzy1PJS9bD0YGhNMK',NULL,NULL,0,NULL,NULL,NULL,NULL,'Granville','Wolf',NULL,NULL,'CanaryAdmin1@Russel.com',1000,NULL,'3b8d3f9c40d61797b47cc1b4e6e52cf560f8957d025450c67d3c5a4e5a54',NULL,NULL,'2020-09-28 19:52:19.241226','2020-09-28 19:52:19.241226'),(34,'$2a$12$k17mk3jkAyDSk4oaHPtmz.ULVZLwxAf2tBqkPQIozHo0QST07xU0q',NULL,NULL,0,NULL,NULL,NULL,NULL,'Sylvester','Gutmann',NULL,NULL,'CanaryAdmin2@Russel.com',1000,NULL,'6136ea7d443e5f72ea6b22891e030a3589e4beeb5cbe02b546ea58087631',NULL,NULL,'2020-09-28 19:52:19.439819','2020-09-28 19:52:19.439819'),(35,'$2a$12$R83M2xzCINdVOnwllELtruQU9Ri42JeExGFEHe9gibaM4JwhAKkVO',NULL,NULL,0,NULL,NULL,NULL,NULL,'Maritza','Rempel',NULL,NULL,'Doctor3@Russel.com',300,NULL,'d1f421ebcd93f9210660c6d2e806aafc9ac7239f0b509fa6b53ddd992686',NULL,NULL,'2020-09-28 19:52:19.634070','2020-09-28 19:52:19.634070'),(36,'$2a$12$oOzCYynzxlIozzJff1U4OuyqNyts2gvZ/wKpTLoleYOJCZzWskTvm',NULL,NULL,0,NULL,NULL,NULL,NULL,'Agustin','Goodwin',NULL,NULL,'Nurse4@Russel.com',200,NULL,'30cb7dafe960083bf512a2bfe3f353a65516a92c065cab1ba8fdc3ae51cf',NULL,NULL,'2020-09-28 19:52:19.828574','2020-09-28 19:52:19.828574'),(37,'$2a$12$KHaFHA5y8lId3MIFROqZTevDJq54zmIaleUpIbehT8NnvGtlxqL5S',NULL,NULL,0,NULL,NULL,NULL,NULL,'Livia','Reichert',NULL,NULL,'CanaryAdmin5@Russel.com',1000,NULL,'ad2a5ebe26a8e7d76027a81f5fa6c0cafb1e56d3bdd595ce3130b1bb006b',NULL,NULL,'2020-09-28 19:52:20.022028','2020-09-28 19:52:20.022028'),(38,'$2a$12$dfPU25ChlGqWLBxjKxlGt.isM7GpXZ8mO.LmhIKS41pz48XEBZ13q',NULL,NULL,0,NULL,NULL,NULL,NULL,'Jake','Christiansen',NULL,NULL,'Nurse6@Russel.com',200,NULL,'66acb015153203c612c92709069f3e937337da8a637100d9960c89c3e911',NULL,NULL,'2020-09-28 19:52:20.214984','2020-09-28 19:52:20.214984'),(39,'$2a$12$s.QQwVmc.sG6CFVx.EFPceOJy/wATqdNrmSAbkZZtvzlv7bKDK0Om',NULL,NULL,0,NULL,NULL,NULL,NULL,'Laurence','Reichel',NULL,NULL,'Admin7@Russel.com',400,NULL,'0f9a093fc4db960095f1ee125e0a8e78256ad9302fdc6a71231bc1a01869',NULL,NULL,'2020-09-28 19:52:20.407853','2020-09-28 19:52:20.407853'),(40,'$2a$12$4Qa5S5j5v0esMHXze.ANMeEUmX/HMq2ivqs8MJx/.xxpRoHRtyrGC',NULL,NULL,0,NULL,NULL,NULL,NULL,'Rochelle','Mraz',NULL,NULL,'Nurse8@Russel.com',200,NULL,'11e33f0fa8a78be6cf33de15c6ad785273cc70d821f019f264a1b5fb4815',NULL,NULL,'2020-09-28 19:52:20.602125','2020-09-28 19:52:20.602125'),(41,'$2a$12$0B/6lkF79i1.FeCWRacsaOa0ic7qn/WQ8.SyI1b6pYvC0iDFyBq7G',NULL,NULL,0,NULL,NULL,NULL,NULL,'Neoma','Ruecker',NULL,NULL,'Admin9@Russel.com',400,NULL,'8390d8da7adc198981ab155244b9ea402d8a297fe2d91da639d5d17ac98e',NULL,NULL,'2020-09-28 19:52:20.794357','2020-09-28 19:52:20.794357'),(42,'$2a$12$E3nOPULuhFKhLuU25Mu/k.mgWIn8Nd89/fjeSg1Ff4RH.ARm2pwhO',NULL,NULL,0,NULL,NULL,NULL,NULL,'Mozelle','Conroy',NULL,NULL,'Nurse0@Rodriguez.com',200,NULL,'0656f6f797a42ca6d0897dd6d37366fb1e9646789bc64c0c13ad028e47ad',NULL,NULL,'2020-09-28 19:52:20.987865','2020-09-28 19:52:20.987865'),(43,'$2a$12$slqLnvV406rUgcRZgfeUBOyINTksEdYx6WrCjDXomuAcoNhHjEr3a',NULL,NULL,0,NULL,NULL,NULL,NULL,'Jody','Ferry',NULL,NULL,'Doctor1@Rodriguez.com',300,NULL,'de2be0ac0e3eed4d641402b7e84ff794f1fb4fb1be1e7e45eb472a7f0c01',NULL,NULL,'2020-09-28 19:52:21.180580','2020-09-28 19:52:21.180580'),(44,'$2a$12$MKyhvYyhVXuoixxCZf/hreb0c/87BaHN87xmzXtcZ1KUUegcfNLRe',NULL,NULL,0,NULL,NULL,NULL,NULL,'Elmo','Reilly',NULL,NULL,'Nurse2@Rodriguez.com',200,NULL,'383cd61a9baf5c310302db04ef323478da51eefcf2d0991688fb30e97efb',NULL,NULL,'2020-09-28 19:52:21.370433','2020-09-28 19:52:21.370433'),(45,'$2a$12$AmK/JWNJqLdzUK6bWYTZi.dj1cnQkUSxMljoV.ZzjyPzK8Ak7COy6',NULL,NULL,0,NULL,NULL,NULL,NULL,'Manuel','Kutch',NULL,NULL,'Admin3@Rodriguez.com',400,NULL,'1c221a3cea4c88acccecd95f1b2ccef6c091273d620be34404f62d9474db',NULL,NULL,'2020-09-28 19:52:21.565542','2020-09-28 19:52:21.565542'),(46,'$2a$12$2qc/WtWVbHA6j091uUaWw./I4kUtsgVNNIRcOQinmV7nMrinyhVPS',NULL,NULL,0,NULL,NULL,NULL,NULL,'Cindie','Balistreri',NULL,NULL,'Nurse4@Rodriguez.com',200,NULL,'9e0a096f20059cecb0dd31cd36b39b6bf011abb05fbc288f5e81f1c4bdf8',NULL,NULL,'2020-09-28 19:52:21.759497','2020-09-28 19:52:21.759497'),(47,'$2a$12$uH0sShDf83JyQLT4JFxYNOCI0cVPsjhjJwP1/5L9v8.mE.mLKFBhi',NULL,NULL,0,NULL,NULL,NULL,NULL,'Ronald','Greenholt',NULL,NULL,'Nurse5@Rodriguez.com',200,NULL,'8deb5875d7fc787144e5a7a3ee4399ebd3877c52d448ec3137b5719661b7',NULL,NULL,'2020-09-28 19:52:21.953047','2020-09-28 19:52:21.953047'),(48,'$2a$12$.vhb.MyqQpczRaOjaP/UhOJ.VCnp7V98TrYIO1YW1oD6jWCRSa1h6',NULL,NULL,0,NULL,NULL,NULL,NULL,'Gaston','Deckow',NULL,NULL,'Admin6@Rodriguez.com',400,NULL,'afb3b8a39b3c713e4335d827898db43195d5418c8040cf9902fcdccd088e',NULL,NULL,'2020-09-28 19:52:22.147533','2020-09-28 19:52:22.147533'),(49,'$2a$12$XGNjbYtvE4Ywd8N09ab4d.E20G2BPwDCsQC/TwqWE5oPOO.BrwlrW',NULL,NULL,0,NULL,NULL,NULL,NULL,'Cleveland','Wehner',NULL,NULL,'Admin7@Rodriguez.com',400,NULL,'f20233fb6c13f9aa34e40cbeb8202e7ee6d98e89caf6b6b1804f7248fdc3',NULL,NULL,'2020-09-28 19:52:22.352033','2020-09-28 19:52:22.352033'),(50,'$2a$12$u0tZ8cmFOGEURIUZ0iFbZunW.c4PbRYN9x1lFktjHSeC2P7MP1Bc6',NULL,NULL,0,NULL,NULL,NULL,NULL,'Arden','Reichel',NULL,NULL,'CanaryAdmin8@Rodriguez.com',1000,NULL,'37b6018b3d43f4136023d467984cf3656312745c119d119a15a9864b60ee',NULL,NULL,'2020-09-28 19:52:22.544950','2020-09-28 19:52:22.544950'),(51,'$2a$12$28VTCV3Sjwt4cY0zHAugRO0DeEyY4/qAyivN2VwmZk9DGEkVYbFlm',NULL,NULL,0,NULL,NULL,NULL,NULL,'Kimbra','Walsh',NULL,NULL,'Admin9@Rodriguez.com',400,NULL,'6a1ef7843ae31aacdbfe063c694045d19f3de882a30501651c573d6bbe30',NULL,NULL,'2020-09-28 19:52:22.737093','2020-09-28 19:52:22.737093');
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

-- Dump completed on 2020-09-28 13:52:23
