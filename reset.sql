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
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2020-09-22 23:44:07.754733','2020-09-22 23:44:07.754733'),('schema_sha1','bbbf344388b13173a9548c27365c0a629aa230cf','2020-09-22 23:44:07.764052','2020-09-22 23:44:07.764052');
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
-- Table structure for table `ctes`
--

DROP TABLE IF EXISTS `ctes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `radio_id` int(11) DEFAULT NULL,
  `encryption_key` text,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ctes`
--

LOCK TABLES `ctes` WRITE;
/*!40000 ALTER TABLE `ctes` DISABLE KEYS */;
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
  PRIMARY KEY (`id`),
  KEY `index_ctes_patients_on_cte_id` (`cte_id`),
  KEY `index_ctes_patients_on_patient_id` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ctes_patients`
--

LOCK TABLES `ctes_patients` WRITE;
/*!40000 ALTER TABLE `ctes_patients` DISABLE KEYS */;
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
INSERT INTO `organizations` VALUES (1,0,'Rosenbaum, Veum and Welch',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,6,0,0,'2020-09-22 23:44:10.225276','2020-09-22 23:44:10.268644'),(2,1,'Sporer, Pollich and McClure',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,2,3,1,0,'2020-09-22 23:44:10.235827','2020-09-22 23:44:10.245403'),(3,1,'Crona LLC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,4,5,1,0,'2020-09-22 23:44:10.260369','2020-09-22 23:44:10.268644'),(4,0,'Jakubowski, Labadie and Blick',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,12,0,0,'2020-09-22 23:44:10.281410','2020-09-22 23:44:10.316503'),(5,1,'Pagac-Stehr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,8,9,1,0,'2020-09-22 23:44:10.289257','2020-09-22 23:44:10.297293'),(6,1,'Kub-Murray',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,10,11,1,0,'2020-09-22 23:44:10.308905','2020-09-22 23:44:10.316503'),(7,0,'Beier-Vandervort',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,18,0,0,'2020-09-22 23:44:10.360702','2020-09-22 23:44:10.398086'),(8,1,'Effertz, Gorczany and Ondricka',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,14,15,1,0,'2020-09-22 23:44:10.368918','2020-09-22 23:44:10.376989'),(9,1,'Predovic, Lehner and Padberg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,16,17,1,0,'2020-09-22 23:44:10.389823','2020-09-22 23:44:10.398086'),(10,0,'Raynor, Nikolaus and Zieme',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,24,0,0,'2020-09-22 23:44:10.410727','2020-09-22 23:44:10.445678'),(11,1,'Hilll, Hirthe and Bashirian',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,20,21,1,0,'2020-09-22 23:44:10.418442','2020-09-22 23:44:10.426297'),(12,1,'MacGyver, Mayert and Brekke',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,22,23,1,0,'2020-09-22 23:44:10.438183','2020-09-22 23:44:10.445678'),(13,0,'Effertz-Heidenreich',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,25,30,0,0,'2020-09-22 23:44:10.456428','2020-09-22 23:44:10.500461'),(14,1,'Deckow LLC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,26,27,1,0,'2020-09-22 23:44:10.463175','2020-09-22 23:44:10.481883'),(15,1,'Krajcik, Corkery and Hermiston',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,28,29,1,0,'2020-09-22 23:44:10.493334','2020-09-22 23:44:10.500461');
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
INSERT INTO `organizations_users` VALUES (1,1,2),(2,8,2),(3,1,3),(4,5,3),(5,1,4),(6,12,4),(7,1,5),(8,14,5),(9,1,6),(10,6,6),(11,1,7),(12,11,7),(13,1,8),(14,2,8),(15,1,9),(16,11,9),(17,1,10),(18,9,10),(19,1,11),(20,15,11),(21,4,12),(22,5,12),(23,4,13),(24,12,13),(25,4,14),(26,8,14),(27,4,15),(28,15,15),(29,4,16),(30,3,16),(31,4,17),(32,8,17),(33,4,18),(34,5,18),(35,4,19),(36,2,19),(37,4,20),(38,8,20),(39,4,21),(40,14,21),(41,7,22),(42,15,22),(43,7,23),(44,9,23),(45,7,24),(46,15,24),(47,7,25),(48,2,25),(49,7,26),(50,8,26),(51,7,27),(52,3,27),(53,7,28),(54,12,28),(55,7,29),(56,14,29),(57,7,30),(58,11,30),(59,7,31),(60,6,31),(61,10,32),(62,11,32),(63,10,33),(64,5,33),(65,10,34),(66,14,34),(67,10,35),(68,9,35),(69,10,36),(70,8,36),(71,10,37),(72,11,37),(73,10,38),(74,14,38),(75,10,39),(76,8,39),(77,10,40),(78,3,40),(79,10,41),(80,6,41),(81,13,42),(82,6,42),(83,13,43),(84,5,43),(85,13,44),(86,2,44),(87,13,45),(88,11,45),(89,13,46),(90,6,46),(91,13,47),(92,15,47),(93,13,48),(94,3,48),(95,13,49),(96,2,49),(97,13,50),(98,15,50),(99,13,51),(100,11,51);
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
INSERT INTO `patients` VALUES (1,'Antonio','Vivaldi','avivaldi@null.com','1234567890','Somplace nice','Uptown','Florence','Tuscany','12345','Itali','1678-03-04 00:00:00','2020-10-20 00:00:00',13,'2020-09-22 23:44:20.879875','2020-09-22 23:44:20.879875'),(2,'Chase','Lindgren','elia_schumm@marks-graham.name','1-908-756-7571','995 Ledner Overpass','Apt. 983','Rosalindland','Arizona','70119','USA','1953-04-20 00:00:00','2020-07-27 00:00:00',12,'2020-09-22 23:44:20.887221','2020-09-22 23:44:20.887221'),(3,'Nakia','Kozey','joseph@hand.io','(423) 416-0476','6051 Kuvalis Rapid','Suite 925','Eldonland','New Mexico','56284','USA','1970-09-26 00:00:00','2020-07-05 00:00:00',8,'2020-09-22 23:44:20.892549','2020-09-22 23:44:20.892549'),(4,'Benny','Pouros','candida@kertzmann-barrows.org','594.151.3041 x305','6535 Edgardo Underpass','Suite 405','West Pam','Arkansas','60372','USA','1991-04-15 00:00:00','2020-04-16 00:00:00',10,'2020-09-22 23:44:20.898005','2020-09-22 23:44:20.898005'),(5,'Regenia','Johnson','theresa@pouros.info','916-222-3916 x347','7306 Brekke Keys','Apt. 129','Lake Faeville','Ohio','26933-2691','USA','1931-09-17 00:00:00','2020-06-04 00:00:00',12,'2020-09-22 23:44:20.925333','2020-09-22 23:44:20.925333'),(6,'Leland','Schmidt','mohammed@schowalter.io','1-132-660-7251 x41703','203 Wyman Glens','Suite 384','Herlindaville','Utah','72072','USA','1988-07-07 00:00:00','2020-07-03 00:00:00',1,'2020-09-22 23:44:20.930855','2020-09-22 23:44:20.930855'),(7,'Samara','Larkin','felicia@kovacek-tromp.net','426.618.6206 x4734','490 Wehner Mountains','Apt. 656','Verniceland','Kansas','34322','USA','1964-11-10 00:00:00','2020-05-04 00:00:00',11,'2020-09-22 23:44:20.936133','2020-09-22 23:44:20.936133'),(8,'Paris','Haley','karl_stark@oconner.name','1-205-422-8043 x816','170 Dooley River','Apt. 933','Port Monserrate','Indiana','55850','USA','1984-11-08 00:00:00','2020-07-06 00:00:00',9,'2020-09-22 23:44:20.941219','2020-09-22 23:44:20.941219'),(9,'Eduardo','Wilderman','leana@kovacek.org','1-914-067-8979 x6275','3943 Benito Fork','Apt. 325','New Garfield','Louisiana','94832-6336','USA','1963-03-03 00:00:00','2020-08-11 00:00:00',2,'2020-09-22 23:44:20.946441','2020-09-22 23:44:20.946441'),(10,'Russell','Volkman','trish@langworth-jakubowski.name','(615) 230-3405 x94483','508 Nitzsche Station','Apt. 235','Lavinaland','West Virginia','82277-1563','USA','1968-07-16 00:00:00','2020-05-11 00:00:00',10,'2020-09-22 23:44:20.951440','2020-09-22 23:44:20.951440'),(11,'Brendon','Christiansen','sandra_mosciski@ritchie.co','835.985.1064 x438','2634 Dickinson Knolls','Apt. 750','Boyleside','Iowa','96497','USA','1935-02-27 00:00:00','2020-08-09 00:00:00',15,'2020-09-22 23:44:20.956380','2020-09-22 23:44:20.956380'),(12,'Eldon','Kuvalis','johanna_kemmer@lueilwitz.io','457.684.3269 x0273','319 Maricela Forge','Suite 741','West Phillip','New Mexico','67770-8995','USA','1978-12-21 00:00:00','2020-05-17 00:00:00',6,'2020-09-22 23:44:20.961763','2020-09-22 23:44:20.961763'),(13,'Kasandra','Cronin','juliana@gislason.org','1-412-767-8202','75593 Jacob Pine','Suite 137','Port Cierrahaven','Rhode Island','79743','USA','1990-12-20 00:00:00','2020-06-11 00:00:00',2,'2020-09-22 23:44:20.966612','2020-09-22 23:44:20.966612'),(14,'Vicki','Cronin','lanny_dietrich@lind.co','1-814-808-8659 x3711','813 Mervin Knoll','Apt. 253','Goodwinport','Nebraska','96504','USA','1976-04-20 00:00:00','2020-07-14 00:00:00',8,'2020-09-22 23:44:20.971575','2020-09-22 23:44:20.971575'),(15,'Celestine','Wintheiser','brittanie@spencer-kihn.net','699.351.3894 x27076','41774 Anderson Causeway','Apt. 170','Port Tannaside','South Carolina','65084','USA','1942-02-14 00:00:00','2020-03-29 00:00:00',5,'2020-09-22 23:44:20.976561','2020-09-22 23:44:20.976561'),(16,'Sterling','Watsica','sharlene@blick-torp.io','(941) 763-0877 x91053','609 Enda Village','Suite 919','West Timmy','Montana','69139-5065','USA','1938-05-17 00:00:00','2020-08-03 00:00:00',1,'2020-09-22 23:44:20.981355','2020-09-22 23:44:20.981355'),(17,'Martin','Bayer','keven.ebert@wunsch-turner.org','688.952.6285','67946 Jerrold Mills','Apt. 717','Millsberg','Colorado','16142','USA','1993-08-11 00:00:00','2020-07-16 00:00:00',14,'2020-09-22 23:44:20.986245','2020-09-22 23:44:20.986245'),(18,'Kyoko','Skiles','chas_pfeffer@nader-howell.com','1-586-197-3789','1921 Erdman Spur','Suite 333','Joellenhaven','Washington','62116','USA','1931-08-12 00:00:00','2020-05-14 00:00:00',5,'2020-09-22 23:44:20.990930','2020-09-22 23:44:20.990930'),(19,'Lynelle','Johnson','roy@ziemann.org','728.956.0896 x11751','12803 Marjorie Tunnel','Suite 910','Vincenzostad','New Jersey','84205','USA','1999-09-06 00:00:00','2020-04-20 00:00:00',1,'2020-09-22 23:44:20.995805','2020-09-22 23:44:20.995805'),(20,'Lillie','Waters','sid_stracke@wehner.info','1-148-991-0643 x1478','739 Ruecker Manors','Apt. 414','Feestville','Idaho','66435','USA','1946-04-27 00:00:00','2020-06-21 00:00:00',8,'2020-09-22 23:44:21.000255','2020-09-22 23:44:21.000255'),(21,'Rodney','Ruecker','lawrence@hermann.org','1-625-574-7742 x28635','65492 Simon Club','Apt. 570','Sawaynhaven','Alaska','95023-0008','USA','1975-01-20 00:00:00','2020-08-05 00:00:00',5,'2020-09-22 23:44:21.004768','2020-09-22 23:44:21.004768'),(22,'Helene','Bergnaum','mike.walsh@ruecker-will.com','879.816.5768 x68244','5630 Fermina Walk','Suite 992','Sonyaburgh','Washington','98242-5914','USA','1990-11-14 00:00:00','2020-07-22 00:00:00',5,'2020-09-22 23:44:21.009637','2020-09-22 23:44:21.009637'),(23,'Skye','Greenholt','carrol@hodkiewicz.name','(721) 618-5536 x84925','90272 Mitchell Branch','Apt. 188','Barabarafort','Florida','45005-1710','USA','1996-11-20 00:00:00','2020-07-10 00:00:00',7,'2020-09-22 23:44:21.014166','2020-09-22 23:44:21.014166'),(24,'Zelma','Kris','ambrose@jakubowski-predovic.info','(324) 320-9134 x293','46174 Connelly Tunnel','Apt. 289','Port Shalaville','New Hampshire','67213','USA','1970-06-11 00:00:00','2020-07-11 00:00:00',5,'2020-09-22 23:44:21.018507','2020-09-22 23:44:21.018507'),(25,'Alene','Marquardt','luci@heathcote.name','732-733-9299','545 Christoper Flats','Apt. 536','New Roxannaberg','Oregon','43483-1376','USA','1932-02-09 00:00:00','2020-07-24 00:00:00',3,'2020-09-22 23:44:21.023302','2020-09-22 23:44:21.023302'),(26,'Elmira','Rice','johnna.bosco@dietrich.name','(729) 082-1604 x96498','10823 Jacobson Road','Suite 852','Kingbury','New Mexico','53771-7707','USA','1961-06-02 00:00:00','2020-04-01 00:00:00',5,'2020-09-22 23:44:21.028473','2020-09-22 23:44:21.028473'),(27,'Wilford','Kuhlman','murray_volkman@barrows.org','(960) 895-1334 x086','2406 Medhurst Dale','Apt. 246','Jedton','Texas','98602-5584','USA','1969-12-17 00:00:00','2020-03-28 00:00:00',7,'2020-09-22 23:44:21.033560','2020-09-22 23:44:21.033560'),(28,'Mia','Hermann','helaine.weber@blanda-bednar.name','638.471.0637 x806','527 Abshire Shores','Apt. 688','Susytown','Tennessee','56284','USA','1933-12-30 00:00:00','2020-08-11 00:00:00',8,'2020-09-22 23:44:21.038590','2020-09-22 23:44:21.038590'),(29,'Letitia','Bergstrom','dorthey.oconner@koelpin.com','892-656-3936','702 Dorthy Throughway','Suite 656','Bridgettefurt','Kentucky','82371-8356','USA','1994-12-08 00:00:00','2020-07-12 00:00:00',15,'2020-09-22 23:44:21.043728','2020-09-22 23:44:21.043728'),(30,'Tomeka','Cummerata','merilyn@anderson-ullrich.net','1-798-347-3600','577 Linda Burgs','Apt. 392','East Barrieborough','Illinois','18612-8644','USA','1943-11-14 00:00:00','2020-05-06 00:00:00',14,'2020-09-22 23:44:21.048490','2020-09-22 23:44:21.048490'),(31,'Cecelia','Rogahn','mitchell.cummings@herman.com','(974) 108-8270 x805','67763 Raymond Oval','Apt. 542','New Casseymouth','New Mexico','67644','USA','1976-04-19 00:00:00','2020-05-02 00:00:00',3,'2020-09-22 23:44:21.053426','2020-09-22 23:44:21.053426');
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
INSERT INTO `schema_migrations` VALUES ('20180813213222'),('20180825191605'),('20180829210029'),('20180911204656'),('20180916215300'),('20180919225441'),('20200630205145'),('20200706160004'),('20200922224225'),('20200922232129');
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
INSERT INTO `test_plans` VALUES (1,'Plan A','2020-09-22 23:44:21.101756','2020-09-22 23:44:21.101756'),(2,'Plan B','2020-09-22 23:44:21.104624','2020-09-22 23:44:21.104624'),(3,'Plan C','2020-09-22 23:44:21.107466','2020-09-22 23:44:21.107466'),(4,'Plan D','2020-09-22 23:44:21.110370','2020-09-22 23:44:21.110370'),(5,'Plan E','2020-09-22 23:44:21.112901','2020-09-22 23:44:21.112901'),(6,'Plan F','2020-09-22 23:44:21.115440','2020-09-22 23:44:21.115440');
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
INSERT INTO `tests` VALUES (1,'Squats','2020-09-22 23:44:21.065358','2020-09-22 23:44:21.065358'),(2,'Walking','2020-09-22 23:44:21.068275','2020-09-22 23:44:21.068275'),(3,'Jumping Jacks','2020-09-22 23:44:21.070842','2020-09-22 23:44:21.070842'),(4,'Lunges','2020-09-22 23:44:21.073420','2020-09-22 23:44:21.073420'),(5,'Stairs Up','2020-09-22 23:44:21.075728','2020-09-22 23:44:21.075728'),(6,'Stairs Down','2020-09-22 23:44:21.078170','2020-09-22 23:44:21.078170'),(7,'Stairs','2020-09-22 23:44:21.080460','2020-09-22 23:44:21.080460'),(8,'Stand Up and Go','2020-09-22 23:44:21.086938','2020-09-22 23:44:21.086938');
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
INSERT INTO `users` VALUES (1,'$2a$12$QcYjIQ60fTACDAFtIK9Jz.kHkAkk.Vt.5yxf5lM8oED0.EO1UjSYW',NULL,NULL,0,NULL,NULL,NULL,NULL,'Roger','Waters',NULL,NULL,'admin@null.com',1000,NULL,'668ef2b7807a8c605c3ce2becb7567e8417a83e11cdac73edd9b6c758c9c',NULL,NULL,'2020-09-22 23:44:10.028015','2020-09-22 23:44:10.028015'),(2,'$2a$12$a.YlQV7ZdUEZbLP6ueZH9eK6Te2eEa2vD2wZTQ8dPXkCzppaDO90S',NULL,NULL,0,NULL,NULL,NULL,NULL,'Hal','VonRueden',NULL,NULL,'Nurse0@Rosenbaum.com',200,NULL,'64da6ef463018dd818c32627247a4839617b671b66b89c78cd03896ac3fe',NULL,NULL,'2020-09-22 23:44:10.722015','2020-09-22 23:44:10.722015'),(3,'$2a$12$ULKAxpxCQg9NF9N1DyIPnOPJhIZpvtaHnyTpvogfWNZsPv6KLMA3m',NULL,NULL,0,NULL,NULL,NULL,NULL,'Jan','Haley',NULL,NULL,'Admin1@Rosenbaum.com',400,NULL,'4b0b805371f24acba9b337f0f9b79ad5c2e71b5357f77a0a412f5dd8d6ed',NULL,NULL,'2020-09-22 23:44:10.931525','2020-09-22 23:44:10.931525'),(4,'$2a$12$Iiibu/CUKhorz/Z1MUU4He24U00Pws3st9uBLj5hs8XRhQfuil5DO',NULL,NULL,0,NULL,NULL,NULL,NULL,'Arnold','Renner',NULL,NULL,'Therapist2@Rosenbaum.com',100,NULL,'e1b8e94095c12142f77b91fce4f7e36d31dddd5dded22ae04be03c2817dc',NULL,NULL,'2020-09-22 23:44:11.149698','2020-09-22 23:44:11.149698'),(5,'$2a$12$xU32gn9F6u8i7mBdWontiOPbLj.mulJ.jl5BK34K4IQl/W.un3P.2',NULL,NULL,0,NULL,NULL,NULL,NULL,'Warren','Boyer',NULL,NULL,'CanaryAdmin3@Rosenbaum.com',1000,NULL,'680c34f91e68072ffc0c1c731afec6e9ac42644bd67aa81c6d617c02b95f',NULL,NULL,'2020-09-22 23:44:11.356878','2020-09-22 23:44:11.356878'),(6,'$2a$12$7piadwJJkHBQySTd3dytMuBNTQgyTfSqHAmgj/qIW8rvwdGSTEV4G',NULL,NULL,0,NULL,NULL,NULL,NULL,'Desmond','Keeling',NULL,NULL,'Doctor4@Rosenbaum.com',300,NULL,'1d59f3655b0aaec825c77a4b268d30672d0c3aaaf9611fa25bba20a493d4',NULL,NULL,'2020-09-22 23:44:11.569078','2020-09-22 23:44:11.569078'),(7,'$2a$12$cdTlCE07UGMibv4ZK6Z0hOlWKqBjJHhhdmGa6yO63enqFG2zHzunm',NULL,NULL,0,NULL,NULL,NULL,NULL,'Kimberely','Macejkovic',NULL,NULL,'Admin5@Rosenbaum.com',400,NULL,'b1cdca72427a41eb38d574ea4a292ea6c4d4a2a377e7f88bf293937de950',NULL,NULL,'2020-09-22 23:44:11.779206','2020-09-22 23:44:11.779206'),(8,'$2a$12$RZ5vFektcM/Yc.ETyc.pr.uoA2J2C0AY.HLhxUbgNNlzj8uqAxeTO',NULL,NULL,0,NULL,NULL,NULL,NULL,'Jeremy','Rempel',NULL,NULL,'Doctor6@Rosenbaum.com',300,NULL,'9c38ed43bc1460764714519e9cbd3eba31675b8475cf41ef4ab8488a8113',NULL,NULL,'2020-09-22 23:44:11.992027','2020-09-22 23:44:11.992027'),(9,'$2a$12$2AxUq9CQpjV4Z8usdfgRBOPTQHC73MbEkVYVZE54o9grGW/vXadA2',NULL,NULL,0,NULL,NULL,NULL,NULL,'Lucienne','Lemke',NULL,NULL,'Nurse7@Rosenbaum.com',200,NULL,'9f1a9581a1146e6db90449361bca7657c59e0e178d7fee42a4c020c47715',NULL,NULL,'2020-09-22 23:44:12.199709','2020-09-22 23:44:12.199709'),(10,'$2a$12$9oRpEGg/8EbVtbuwS4lP6umHv6CeFcrftt2M.OJsV09LmSZz.3sFy',NULL,NULL,0,NULL,NULL,NULL,NULL,'Terrell','Rath',NULL,NULL,'Admin8@Rosenbaum.com',400,NULL,'8045dd58ca2eba4e7b1282c341e4ee013aae75caaef97d9aefcec304fcdb',NULL,NULL,'2020-09-22 23:44:12.418006','2020-09-22 23:44:12.418006'),(11,'$2a$12$xPkdeZ1hSo1m87EXvH/LwOchdKnFQSX1ySbsFQVPf7hJ.dnzqNt0C',NULL,NULL,0,NULL,NULL,NULL,NULL,'Trisha','Boehm',NULL,NULL,'Nurse9@Rosenbaum.com',200,NULL,'b4efc8e7815ac6459915a08382cc76264b4991e248787c33ef3c57d0eda7',NULL,NULL,'2020-09-22 23:44:12.629945','2020-09-22 23:44:12.629945'),(12,'$2a$12$UE3b1b98gVMhAOfM4/v3muvRJtK.H3Bwi4IlavRpxFvqCB8YSy2YW',NULL,NULL,0,NULL,NULL,NULL,NULL,'Renato','Lemke',NULL,NULL,'Therapist0@Jakubowski.com',100,NULL,'6366cf3ef271a156b1a5e7e8ebf1870b0db1cc409baa3e0a33b1ac84f6d2',NULL,NULL,'2020-09-22 23:44:12.849848','2020-09-22 23:44:12.849848'),(13,'$2a$12$oGK/4hFYNBsi6Bux2pNu7.OD7dGVDP/jvQ/jOrAOyE0Nsij6Z4Qq2',NULL,NULL,0,NULL,NULL,NULL,NULL,'Lance','Schuppe',NULL,NULL,'CanaryAdmin1@Jakubowski.com',1000,NULL,'ab1144b4afc924e2dafea3a178497031b95bbe8da64def2880d624723371',NULL,NULL,'2020-09-22 23:44:13.051978','2020-09-22 23:44:13.051978'),(14,'$2a$12$bpTBiKo8hPplVpuBrEo15Oc4hjS5wHDor6xP3BCOQp3H1xfhO41A2',NULL,NULL,0,NULL,NULL,NULL,NULL,'Prince','McCullough',NULL,NULL,'CanaryAdmin2@Jakubowski.com',1000,NULL,'468a6b819fcad3cd2d201f985809fd83a9226e3481bb928932634182bd8f',NULL,NULL,'2020-09-22 23:44:13.256873','2020-09-22 23:44:13.256873'),(15,'$2a$12$xPnBS3JmyX60CqTWKToxee55nR3j4Hp2pLyw93VZI9oIX9oh81eEC',NULL,NULL,0,NULL,NULL,NULL,NULL,'Tobias','Lebsack',NULL,NULL,'Therapist3@Jakubowski.com',100,NULL,'71049dc06c6b8fa91e5cc4c9cc1a24403327fe0bc4d21281868fd73862ab',NULL,NULL,'2020-09-22 23:44:13.460467','2020-09-22 23:44:13.460467'),(16,'$2a$12$50Eem8Is2no4VCuPqM0wS.DQuQBxjEvieL.27fc4ZzbAru23ki4Qq',NULL,NULL,0,NULL,NULL,NULL,NULL,'Efren','Crooks',NULL,NULL,'Doctor4@Jakubowski.com',300,NULL,'6e4ab80511ad5d6f6bc5c8c63f3de8c2354264a9469125f9f67581354cd6',NULL,NULL,'2020-09-22 23:44:13.663841','2020-09-22 23:44:13.663841'),(17,'$2a$12$LbnoIr1FuN/s0qUPgucx7uGVuH18EnF.7LD4BIKQmbDwPRQzCqix.',NULL,NULL,0,NULL,NULL,NULL,NULL,'Shanna','Pfannerstill',NULL,NULL,'Nurse5@Jakubowski.com',200,NULL,'d6167c07a0ee8f8d3400e66551e568e9b2f87fbfb53a6b37e6d1a33347da',NULL,NULL,'2020-09-22 23:44:13.873560','2020-09-22 23:44:13.873560'),(18,'$2a$12$sb/EpPR5oZE8U716Fy.IxeGoylt2b2RARxBrexqzwhQNfsKTI9w2W',NULL,NULL,0,NULL,NULL,NULL,NULL,'Johnette','Kuhic',NULL,NULL,'CanaryAdmin6@Jakubowski.com',1000,NULL,'5e3afe6bd49c11f38b519a53c0110c74cd4f6259b694553c90a9b33f9736',NULL,NULL,'2020-09-22 23:44:14.085740','2020-09-22 23:44:14.085740'),(19,'$2a$12$zGCHc5AbYmoQeoigxfzKFuBCMA/JhFb9wU/0zJQrlZHhRq8DKr9Sq',NULL,NULL,0,NULL,NULL,NULL,NULL,'Daryl','Stracke',NULL,NULL,'CanaryAdmin7@Jakubowski.com',1000,NULL,'ead575025f54a2a9760439f37c380a130aeec3e27fa506feb57c9abfbd68',NULL,NULL,'2020-09-22 23:44:14.301664','2020-09-22 23:44:14.301664'),(20,'$2a$12$iAYmhq.pHdRhcK5FORqoNOV0t6RTbvMU/0r13Vg5bAawgK3JgFM2a',NULL,NULL,0,NULL,NULL,NULL,NULL,'Jesus','Hagenes',NULL,NULL,'CanaryAdmin8@Jakubowski.com',1000,NULL,'5e0edfc54ae881d670aa517937c9513cca4eecaf017fca8103c6b0ed88f6',NULL,NULL,'2020-09-22 23:44:14.511821','2020-09-22 23:44:14.511821'),(21,'$2a$12$aPi5l6jyxEQqEdo1Fe1RqeOICcR37qa2igr/gQ2hx1tb9xw7FxUia',NULL,NULL,0,NULL,NULL,NULL,NULL,'Loyd','DuBuque',NULL,NULL,'CanaryAdmin9@Jakubowski.com',1000,NULL,'25619b075b5daec493c07f4225026b22d2cf4c14a2feded13f898e8ba38c',NULL,NULL,'2020-09-22 23:44:14.717105','2020-09-22 23:44:14.717105'),(22,'$2a$12$Y9YBT2.stY./Lh3NnvejZeKQGTJYmwakhNlOb3JYVZsePWLestc3S',NULL,NULL,0,NULL,NULL,NULL,NULL,'Long','Wolf',NULL,NULL,'CanaryAdmin0@Beier-Vandervort.com',1000,NULL,'0fd7aca4d535a8c1490e4fdcb33976c7abdf8c08983c2a278225f5e10503',NULL,NULL,'2020-09-22 23:44:14.922002','2020-09-22 23:44:14.922002'),(23,'$2a$12$4IpqxiR991iGLjs0KPH1c.rqW3Hqsj1KgAFZ1Lm8/Xn6xIcCKHbqW',NULL,NULL,0,NULL,NULL,NULL,NULL,'Adelina','Streich',NULL,NULL,'Nurse1@Beier-Vandervort.com',200,NULL,'6eb497126c20a53e414f995c58e8f02827899bf80b1a4eb4326408a03dd8',NULL,NULL,'2020-09-22 23:44:15.154703','2020-09-22 23:44:15.154703'),(24,'$2a$12$ero3c3MclnEFu0w1e3pBqeleIQj8EtGV.MlyABPEHoZJ6m/lPODei',NULL,NULL,0,NULL,NULL,NULL,NULL,'Bennie','Cartwright',NULL,NULL,'Nurse2@Beier-Vandervort.com',200,NULL,'55414e52a04df4a6c8de6dc3b4fe143196813c67129cc4a6821cbaf14bf0',NULL,NULL,'2020-09-22 23:44:15.355886','2020-09-22 23:44:15.355886'),(25,'$2a$12$PBg/UP3tIKDby4fwLFUoBed/uhM3jeTFn6J7ZvjS2e2twiwGZeK/S',NULL,NULL,0,NULL,NULL,NULL,NULL,'Kaylee','Ritchie',NULL,NULL,'Therapist3@Beier-Vandervort.com',100,NULL,'d2e60ed32c45a67290c5d2091c2eb32910a5e75672ceb615ad8295784614',NULL,NULL,'2020-09-22 23:44:15.557567','2020-09-22 23:44:15.557567'),(26,'$2a$12$e0RWtc2E8ZFf3dtQzeizCO2FA4glU5Pr6cNFBRS47.I7GmC5VPiTO',NULL,NULL,0,NULL,NULL,NULL,NULL,'Sheri','Roberts',NULL,NULL,'CanaryAdmin4@Beier-Vandervort.com',1000,NULL,'c472e459c7b40d7995ab2337337fa01e5af98be9ecb80a75dec3a5b7125d',NULL,NULL,'2020-09-22 23:44:15.764357','2020-09-22 23:44:15.764357'),(27,'$2a$12$FFcezEyrdg9VTetcNEPlN.7iIRyANoSCGRstPdcr5z.JGBJayvXKi',NULL,NULL,0,NULL,NULL,NULL,NULL,'Vanetta','Homenick',NULL,NULL,'Admin5@Beier-Vandervort.com',400,NULL,'956ab195c1739eca77eb16a8538b2ebbe223cae4b794ff17bb0bb60dc0e7',NULL,NULL,'2020-09-22 23:44:15.965525','2020-09-22 23:44:15.965525'),(28,'$2a$12$Co82eltiMHJJvn5FbIQLEOI.K3wFjKV1tZFSNiD2vNPcnt9nURL9C',NULL,NULL,0,NULL,NULL,NULL,NULL,'Argentina','Cassin',NULL,NULL,'Doctor6@Beier-Vandervort.com',300,NULL,'47b2df9d788cf9bb1957233a8f3000dd389944564794644015c7ed995ba0',NULL,NULL,'2020-09-22 23:44:16.166764','2020-09-22 23:44:16.166764'),(29,'$2a$12$lPI969hYC9H18ZHlTOYlb.4Oh0egic2PygzMVVFDBlZKqLtW9o2kW',NULL,NULL,0,NULL,NULL,NULL,NULL,'Edgar','Ziemann',NULL,NULL,'Doctor7@Beier-Vandervort.com',300,NULL,'955c7729597cb0347b7b5bbe0a42596c255279e4ca3bf7f7d29295191309',NULL,NULL,'2020-09-22 23:44:16.371755','2020-09-22 23:44:16.371755'),(30,'$2a$12$fIVmfUPltgXUQLMcHF9ameisDlOygOUWNkDCqiW4hFr0b86TIl.56',NULL,NULL,0,NULL,NULL,NULL,NULL,'Stephan','Sipes',NULL,NULL,'Therapist8@Beier-Vandervort.com',100,NULL,'72c25361fcf414363e5a0c32da75e02e57d902a364ce0bdfb44bc15c0478',NULL,NULL,'2020-09-22 23:44:16.571879','2020-09-22 23:44:16.571879'),(31,'$2a$12$zE01akiDsg7F4cyyzC18veBIqBJuhL8Drlk6pOWt1p33icy72sUTa',NULL,NULL,0,NULL,NULL,NULL,NULL,'Jonas','Weissnat',NULL,NULL,'Admin9@Beier-Vandervort.com',400,NULL,'4144ae0250daf2783a1de41bb7b469d8a3564fdbb26c128664fae28a6210',NULL,NULL,'2020-09-22 23:44:16.775213','2020-09-22 23:44:16.775213'),(32,'$2a$12$ph7WT2STV0c5X6Z5aTA.Ieb7dckBme09LFZb.6z7iDqA5HFK1lmW.',NULL,NULL,0,NULL,NULL,NULL,NULL,'Juanita','Cassin',NULL,NULL,'Nurse0@Raynor.com',200,NULL,'0d3fde83e30f4f8b24d9df34ccebb4fe21f2f40bf0681b20ed391c86e425',NULL,NULL,'2020-09-22 23:44:16.977848','2020-09-22 23:44:16.977848'),(33,'$2a$12$O.1l8F2oQYT0flAp/R2gP.GZ8KYjFE1Ar7Ar9QfeHLM4AUkgokSe2',NULL,NULL,0,NULL,NULL,NULL,NULL,'Sylvia','Hartmann',NULL,NULL,'Doctor1@Raynor.com',300,NULL,'27964c1e8db1e4308440461438e4a648b0f8e780e32b558c543a75faeb9e',NULL,NULL,'2020-09-22 23:44:17.183859','2020-09-22 23:44:17.183859'),(34,'$2a$12$EwxNXI8tvKdLdxMBlRyLNeb0LwakGWgNl7A2DS5CfEgOrdA92xtxO',NULL,NULL,0,NULL,NULL,NULL,NULL,'Loreen','Howell',NULL,NULL,'CanaryAdmin2@Raynor.com',1000,NULL,'5a3ffce40923c0570103cef67eedcd07ddec31d8749530872ca7c0df6c52',NULL,NULL,'2020-09-22 23:44:17.384929','2020-09-22 23:44:17.384929'),(35,'$2a$12$GwadeQrsUz2ZHcfkGRjI2.eQaIoXQaHnst9B.53B9/J6I1WkWXcB6',NULL,NULL,0,NULL,NULL,NULL,NULL,'Galina','Marks',NULL,NULL,'Doctor3@Raynor.com',300,NULL,'9d0f8b58ac2dacdc4e3878a7a4884d7e225e825c54ac60afd62748a0d53b',NULL,NULL,'2020-09-22 23:44:17.584932','2020-09-22 23:44:17.584932'),(36,'$2a$12$EPJhHhEijnpNWdGblAHdJunzHUbdcc7fmA/AJ6CKlcKaPtP1GOeii',NULL,NULL,0,NULL,NULL,NULL,NULL,'Dena','Boyle',NULL,NULL,'CanaryAdmin4@Raynor.com',1000,NULL,'75e8107435ca425133b49d328e9094d9f58602ee2c5704809ff55d452f39',NULL,NULL,'2020-09-22 23:44:17.786536','2020-09-22 23:44:17.786536'),(37,'$2a$12$2whwXYnFTDtUSvqWCoAG6OwmpsAVoFMdJcSYbS7Ir8R./6wSsbjBa',NULL,NULL,0,NULL,NULL,NULL,NULL,'Chantel','Ebert',NULL,NULL,'CanaryAdmin5@Raynor.com',1000,NULL,'20cebaf666b30b15b6c3352a558c74e787886125d266beed0e7f05a19efa',NULL,NULL,'2020-09-22 23:44:17.987112','2020-09-22 23:44:17.987112'),(38,'$2a$12$KbuUSqlxoxoY43T0UFzH8.NZK23r.gjB1N5rt8WKk53LZNSCwWkzm',NULL,NULL,0,NULL,NULL,NULL,NULL,'Melynda','Kling',NULL,NULL,'CanaryAdmin6@Raynor.com',1000,NULL,'01f3720b7aea2d9784706808203a23b4c4bd33cc87dc9f5f7a089bc5b36e',NULL,NULL,'2020-09-22 23:44:18.188683','2020-09-22 23:44:18.188683'),(39,'$2a$12$KjB/LH5AePmo.OICHIjtH.4yOVHJ0S48lnaZgUZ8MfaKPku3yfrJm',NULL,NULL,0,NULL,NULL,NULL,NULL,'Steven','Heller',NULL,NULL,'Admin7@Raynor.com',400,NULL,'3baadb9670e27a21ca379a7f7d5fe6e4c27519149165e28fc251ba671105',NULL,NULL,'2020-09-22 23:44:18.392824','2020-09-22 23:44:18.392824'),(40,'$2a$12$LDpuxXGtnKbY9GDFLwUD1e01GuEnJnZGaCFQ8r4JJHi0MnK6SsCdK',NULL,NULL,0,NULL,NULL,NULL,NULL,'Kip','Corkery',NULL,NULL,'Admin8@Raynor.com',400,NULL,'4d758b49dbd6f6e990154fe415b5b86bb5b715ee1da08a70480df2188691',NULL,NULL,'2020-09-22 23:44:18.598167','2020-09-22 23:44:18.598167'),(41,'$2a$12$PEFiil73dMRva6cOhKt80Oe51E1gMS5dqXFFZkAcEu4VXpOQuJXA2',NULL,NULL,0,NULL,NULL,NULL,NULL,'Jamie','Von',NULL,NULL,'Nurse9@Raynor.com',200,NULL,'d070444dc008dfe8455b54dcbeca6519cc2b8ddb9666f3a6d6c8f6e6ce07',NULL,NULL,'2020-09-22 23:44:18.801122','2020-09-22 23:44:18.801122'),(42,'$2a$12$4ffDSo3NMpf0pvLEvAUSC.aEYU5E.G/1857Yt4ol0ou34dQJr9oJO',NULL,NULL,0,NULL,NULL,NULL,NULL,'Lavonna','Rice',NULL,NULL,'CanaryAdmin0@Effertz-Heidenreich.com',1000,NULL,'f6bbabf5e4efc1a8074a165cd9b871f93d53ae334a5476183a217fc56f94',NULL,NULL,'2020-09-22 23:44:19.005425','2020-09-22 23:44:19.005425'),(43,'$2a$12$QfHMC1vRg7RFDJhTrXR2..oTMuiiOv4qdDKli3AIEtlsQvOXi9Twq',NULL,NULL,0,NULL,NULL,NULL,NULL,'Evia','Deckow',NULL,NULL,'Nurse1@Effertz-Heidenreich.com',200,NULL,'eeb85f3b544a184d457773998535772e7ec4970bb93cae0f317827854fbd',NULL,NULL,'2020-09-22 23:44:19.207960','2020-09-22 23:44:19.207960'),(44,'$2a$12$VXeSJfYKi26FfUo1SA2/i.2LF3m5jbbJa5f20eA8xBJdRkXyhOp2C',NULL,NULL,0,NULL,NULL,NULL,NULL,'Donette','Grimes',NULL,NULL,'Admin2@Effertz-Heidenreich.com',400,NULL,'b8996d5317b910a90db59e73e4d9990ee43c982db5814a73fd164f3821f7',NULL,NULL,'2020-09-22 23:44:19.411703','2020-09-22 23:44:19.411703'),(45,'$2a$12$nGwEI3xDo5IIJdhlGGihLOLcthOQ1WKQTiLMnsxveRmhTpV64YOuO',NULL,NULL,0,NULL,NULL,NULL,NULL,'Jess','Gulgowski',NULL,NULL,'Nurse3@Effertz-Heidenreich.com',200,NULL,'d09e16350282010db6163b0fa651292694b85715c6fb3cb78f5652547938',NULL,NULL,'2020-09-22 23:44:19.618483','2020-09-22 23:44:19.618483'),(46,'$2a$12$tw1ozHJ/kgwhDDrKitl.aOlqzCpr0H6HLnhIHPkrqna/bTgWpIz3G',NULL,NULL,0,NULL,NULL,NULL,NULL,'Yasmine','Witting',NULL,NULL,'Doctor4@Effertz-Heidenreich.com',300,NULL,'9da60f59e00f192ce7ca743e6988d0321f55f82d28e4b058537372c3b0b6',NULL,NULL,'2020-09-22 23:44:19.822671','2020-09-22 23:44:19.822671'),(47,'$2a$12$pBAO5yEEoNhazlt8ZwXhjO0yefwZIKF8ytD/oeWcHcQ/r8ZwxEoRy',NULL,NULL,0,NULL,NULL,NULL,NULL,'Dagny','Thompson',NULL,NULL,'Admin5@Effertz-Heidenreich.com',400,NULL,'4e55e443c7ab31b6df5ad19fba532a2dfae4085cf434c1b262ba510172de',NULL,NULL,'2020-09-22 23:44:20.024576','2020-09-22 23:44:20.024576'),(48,'$2a$12$ppEx.yjC1HXGTrdPBzG4IOhQngMO3LAFRjsN4Pl.ePj7LKCAOg5.O',NULL,NULL,0,NULL,NULL,NULL,NULL,'Aron','Fritsch',NULL,NULL,'Admin6@Effertz-Heidenreich.com',400,NULL,'e398c01d2a3874bc0bdc6af7980dcd5e0a3a7bc8e1ce4b37aa1772dabf70',NULL,NULL,'2020-09-22 23:44:20.234418','2020-09-22 23:44:20.234418'),(49,'$2a$12$5uIS1tD4c3.gE89KVqReye8q8stPzr4PcnFbsQ408PLSGsY.KX5La',NULL,NULL,0,NULL,NULL,NULL,NULL,'Belkis','Price',NULL,NULL,'Nurse7@Effertz-Heidenreich.com',200,NULL,'3ae74d3d3b7583dff989fb1157fbee19b9aa933f01a406fd546f99956b03',NULL,NULL,'2020-09-22 23:44:20.439161','2020-09-22 23:44:20.439161'),(50,'$2a$12$awJTHyqIY9eQ4wnrDGLEz.LhHe7upGQJvEYiv4zozy8iesk.L5gme',NULL,NULL,0,NULL,NULL,NULL,NULL,'Norberto','Flatley',NULL,NULL,'Doctor8@Effertz-Heidenreich.com',300,NULL,'73168390bb5580af71c89001112e84e8ae416856bf19f7e594ae0a3ffc96',NULL,NULL,'2020-09-22 23:44:20.644535','2020-09-22 23:44:20.644535'),(51,'$2a$12$.9k9Tr2L0p97pZNIvUW2d.66TVuz/uIw/td5kV15NYRnD0t97p8tm',NULL,NULL,0,NULL,NULL,NULL,NULL,'Domenic','Gaylord',NULL,NULL,'Therapist9@Effertz-Heidenreich.com',100,NULL,'8a792d84f4b8a5fa3d759e49f71581e7bc0fde34c9a18620f1863c647898',NULL,NULL,'2020-09-22 23:44:20.847842','2020-09-22 23:44:20.847842');
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

-- Dump completed on 2020-09-22 17:44:21
