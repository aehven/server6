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
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2020-09-08 17:12:11.958214','2020-09-08 17:12:11.958214'),('schema_sha1','08f92237446a868211e2e3411f15d6432a8c7b7d','2020-09-08 17:12:11.963401','2020-09-08 17:12:11.963401');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
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
INSERT INTO `organizations` VALUES (1,0,'Kirlin, Johnson and Littel',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,6,0,0,'2020-09-08 17:12:14.180331','2020-09-08 17:12:14.239492'),(2,1,'Windler, Harvey and Lynch',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,2,3,1,0,'2020-09-08 17:12:14.191588','2020-09-08 17:12:14.200139'),(3,1,'Gleason-Rice',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,4,5,1,0,'2020-09-08 17:12:14.232504','2020-09-08 17:12:14.239492'),(4,0,'Wiza and Sons',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,12,0,0,'2020-09-08 17:12:14.255301','2020-09-08 17:12:14.290991'),(5,1,'Brown, Kub and Moen',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,8,9,1,0,'2020-09-08 17:12:14.265858','2020-09-08 17:12:14.272315'),(6,1,'Mosciski, Jones and Ritchie',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,10,11,1,0,'2020-09-08 17:12:14.284377','2020-09-08 17:12:14.290991'),(7,0,'Hettinger Inc',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,18,0,0,'2020-09-08 17:12:14.301803','2020-09-08 17:12:14.333061'),(8,1,'Ortiz-Schimmel',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,14,15,1,0,'2020-09-08 17:12:14.308615','2020-09-08 17:12:14.315120'),(9,1,'Harber-Rice',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,16,17,1,0,'2020-09-08 17:12:14.326047','2020-09-08 17:12:14.333061'),(10,0,'Hessel Group',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,24,0,0,'2020-09-08 17:12:14.348321','2020-09-08 17:12:14.378361'),(11,1,'Ernser, Miller and Sipes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,20,21,1,0,'2020-09-08 17:12:14.355213','2020-09-08 17:12:14.361816'),(12,1,'Wolf, Emard and Toy',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,22,23,1,0,'2020-09-08 17:12:14.371826','2020-09-08 17:12:14.378361'),(13,0,'Turcotte Group',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,25,30,0,0,'2020-09-08 17:12:14.388219','2020-09-08 17:12:14.415333'),(14,1,'Stoltenberg, Altenwerth and Jakubowski',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,26,27,1,0,'2020-09-08 17:12:14.394215','2020-09-08 17:12:14.400329'),(15,1,'Emmerich and Sons',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,28,29,1,0,'2020-09-08 17:12:14.409527','2020-09-08 17:12:14.415333');
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
INSERT INTO `organizations_users` VALUES (1,1,2),(2,6,2),(3,1,3),(4,6,3),(5,1,4),(6,15,4),(7,1,5),(8,15,5),(9,1,6),(10,8,6),(11,1,7),(12,12,7),(13,1,8),(14,6,8),(15,1,9),(16,8,9),(17,1,10),(18,3,10),(19,1,11),(20,12,11),(21,4,12),(22,5,12),(23,4,13),(24,15,13),(25,4,14),(26,12,14),(27,4,15),(28,12,15),(29,4,16),(30,14,16),(31,4,17),(32,9,17),(33,4,18),(34,2,18),(35,4,19),(36,14,19),(37,4,20),(38,12,20),(39,4,21),(40,9,21),(41,7,22),(42,15,22),(43,7,23),(44,8,23),(45,7,24),(46,8,24),(47,7,25),(48,15,25),(49,7,26),(50,8,26),(51,7,27),(52,14,27),(53,7,28),(54,2,28),(55,7,29),(56,12,29),(57,7,30),(58,8,30),(59,7,31),(60,8,31),(61,10,32),(62,3,32),(63,10,33),(64,11,33),(65,10,34),(66,15,34),(67,10,35),(68,3,35),(69,10,36),(70,14,36),(71,10,37),(72,12,37),(73,10,38),(74,6,38),(75,10,39),(76,15,39),(77,10,40),(78,5,40),(79,10,41),(80,3,41),(81,13,42),(82,8,42),(83,13,43),(84,9,43),(85,13,44),(86,11,44),(87,13,45),(88,2,45),(89,13,46),(90,6,46),(91,13,47),(92,14,47),(93,13,48),(94,11,48),(95,13,49),(96,12,49),(97,13,50),(98,12,50),(99,13,51),(100,5,51);
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
  PRIMARY KEY (`id`),
  KEY `index_patients_on_organization_id` (`organization_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (1,'Antonio','Vivaldi','avivaldi@null.com','1234567890','Somplace nice','Uptown','Florence','Tuscany','12345','Itali','1678-03-04 00:00:00','2020-10-20 00:00:00',13),(2,'Jen','Gerhold','su_langworth@barrows.org','(140) 659-4075 x691','2433 Schumm Crest','Suite 344','West Hassan','Rhode Island','47667-3905','USA','1990-03-30 00:00:00','2020-03-26 00:00:00',2),(3,'Hyon','Heller','glen@nolan.io','927.612.1100 x94101','38329 Stark Pike','Suite 779','North Reyton','Florida','59964','USA','1955-12-22 00:00:00','2020-04-30 00:00:00',8),(4,'Allyson','Blick','angelo@konopelski-blanda.org','(206) 796-7231 x35078','8733 Mraz Lodge','Apt. 955','Lake Ivonneborough','South Carolina','84346-1213','USA','1988-04-26 00:00:00','2020-05-14 00:00:00',14),(5,'Carmelo','Schuster','andre_langosh@denesik-howell.io','(142) 513-9887 x00460','18368 Courtney Prairie','Suite 606','East Jamaaltown','North Carolina','80590','USA','1976-03-06 00:00:00','2020-05-01 00:00:00',6),(6,'Chanda','Terry','heriberto_daniel@koch-gibson.biz','1-323-777-6925 x0450','572 Carleen Crescent','Suite 454','Rolandville','Oklahoma','87939-8169','USA','1955-06-19 00:00:00','2020-04-20 00:00:00',2),(7,'Tad','Schowalter','fernande@bosco.biz','274.353.6047 x8702','38664 Bechtelar Lake','Suite 742','East Cammystad','California','57282','USA','1971-01-05 00:00:00','2020-07-23 00:00:00',10),(8,'Prince','Robel','misty@kub.net','(769) 822-2624 x62316','83949 Luettgen Grove','Apt. 998','North Denna','Nevada','70383-9579','USA','1932-02-21 00:00:00','2020-07-21 00:00:00',6),(9,'Samira','Bogan','deja@bergnaum.com','1-808-076-2644','3504 Manda Centers','Apt. 331','Rosenbaumland','Wyoming','26236-7207','USA','1985-06-01 00:00:00','2020-04-23 00:00:00',8),(10,'Amiee','Kuhlman','rosendo_nikolaus@hirthe.net','569-957-1703 x521','4055 Hauck Island','Suite 180','Ernserland','Nebraska','41084','USA','1978-03-05 00:00:00','2020-04-23 00:00:00',14),(11,'Ardelia','Heaney','kimberly.kerluke@howe.org','1-723-139-7046 x07448','610 Stanley Motorway','Suite 783','Florenciaburgh','Mississippi','80151','USA','1974-07-14 00:00:00','2020-05-12 00:00:00',14),(12,'Edmundo','Kshlerin','guadalupe.hudson@kozey.name','1-460-343-8088 x821','480 Klein Rest','Apt. 844','Keithberg','Nebraska','42108-8967','USA','1955-02-08 00:00:00','2020-03-09 00:00:00',14),(13,'Jetta','Abbott','brett@satterfield-metz.name','282-344-2350','666 Darline Springs','Suite 506','Byronton','Utah','46266','USA','1989-03-25 00:00:00','2020-07-20 00:00:00',14),(14,'Suk','Schuppe','jesus_macgyver@schoen-hahn.info','314.361.8085 x0429','245 Altenwerth Roads','Suite 666','Lake Bomouth','Alabama','62952-3880','USA','1936-10-15 00:00:00','2020-05-26 00:00:00',12),(15,'Kizzy','Schamberger','houston.aufderhar@rowe-luettgen.org','532.375.3845','30027 Odis Roads','Suite 217','Bergstromfort','Iowa','27703','USA','1970-12-31 00:00:00','2020-06-08 00:00:00',2),(16,'Johnie','Gorczany','zane.harvey@corwin.info','199-130-9027 x9844','189 Latonya Club','Apt. 743','Port Chanceberg','South Carolina','19925','USA','1982-07-09 00:00:00','2020-04-21 00:00:00',9),(17,'Alix','Jenkins','anthony@heathcote-gorczany.io','(336) 832-6221 x6953','7259 Jeffie Tunnel','Suite 478','Luettgenborough','Oregon','19042','USA','1940-11-14 00:00:00','2020-08-04 00:00:00',9),(18,'Mary','Farrell','jimmy@tromp.info','804-344-0995 x6064','8693 Miquel Wall','Suite 267','Sonashire','North Carolina','47418','USA','1944-05-22 00:00:00','2020-04-13 00:00:00',6),(19,'Gaye','Klein','jordon_greenfelder@hauck.info','895-627-8068','5682 Debbra Place','Suite 718','Lake Zack','Maryland','33209-3036','USA','1939-05-01 00:00:00','2020-05-02 00:00:00',14),(20,'Billie','Ernser','angelena_dicki@rath.com','(332) 278-0122 x6973','27975 Rempel Roads','Suite 494','Jongfort','Oklahoma','49277-7547','USA','1935-01-19 00:00:00','2020-06-22 00:00:00',5),(21,'Jordan','Zemlak','edna_roob@kessler.info','521.437.9648 x94144','780 Schowalter Garden','Suite 858','Nickytown','Oklahoma','96579-9692','USA','1986-09-05 00:00:00','2020-04-27 00:00:00',15),(22,'Russ','Ziemann','reynaldo_hills@dach.io','1-189-124-4706 x348','1144 Predovic Court','Suite 210','Schadenburgh','Virginia','70414-1544','USA','1955-12-09 00:00:00','2020-04-07 00:00:00',15),(23,'Alberto','Bartell','domenica_friesen@marvin-koss.co','1-687-824-5151','874 Berge Stravenue','Suite 200','Mosciskimouth','Idaho','04970-7282','USA','1970-01-31 00:00:00','2020-04-11 00:00:00',10),(24,'Rufina','Kilback','joeann@prosacco-powlowski.net','1-209-927-2988 x898','8294 Considine Circle','Apt. 262','Carylonland','Texas','11153','USA','1992-05-02 00:00:00','2020-07-30 00:00:00',2),(25,'Mohammad','Schaden','adrian@lockman.co','866.825.9472 x905','39308 Zieme Spurs','Apt. 741','Lockmanmouth','Louisiana','08646-1376','USA','1933-01-22 00:00:00','2020-04-05 00:00:00',13),(26,'Benny','Hauck','cathi@thiel.name','1-934-863-2506 x0453','540 Omer Ferry','Apt. 795','North Juan','Montana','12140','USA','1959-01-03 00:00:00','2020-03-15 00:00:00',13),(27,'Kory','Kling','cleora@emard.name','(784) 968-6009 x0743','4869 Van Keys','Suite 167','Runolfsdottirfort','Georgia','84424','USA','1958-04-30 00:00:00','2020-03-08 00:00:00',9),(28,'Senaida','Blanda','mertie@wintheiser.co','(856) 811-9728','294 Del Coves','Suite 966','VonRuedenview','New Hampshire','27933','USA','1947-01-18 00:00:00','2020-03-16 00:00:00',5),(29,'Elease','Padberg','lenard@dietrich.co','238-239-5230 x1961','75409 Cartwright Estates','Apt. 471','Avischester','Montana','97831-5348','USA','1946-06-07 00:00:00','2020-08-08 00:00:00',8),(30,'Sandy','Schmidt','brian.gutmann@mcdermott.io','(414) 822-8269 x41415','90076 Nora Crescent','Apt. 695','Vonland','Kansas','29387','USA','1985-01-09 00:00:00','2020-04-20 00:00:00',9),(31,'Douglass','Beahan','reed@tillman.io','984-976-9714 x9603','93325 Braun Courts','Suite 198','West Morganstad','Nebraska','93418-2606','USA','1959-12-01 00:00:00','2020-07-26 00:00:00',12);
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
INSERT INTO `patients_users` VALUES (1,1,50);
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
INSERT INTO `schema_migrations` VALUES ('20180813213222'),('20180825191605'),('20180829210029'),('20180911204656'),('20180916215300'),('20180919225441'),('20200630205145'),('20200706160004');
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_plans`
--

LOCK TABLES `test_plans` WRITE;
/*!40000 ALTER TABLE `test_plans` DISABLE KEYS */;
INSERT INTO `test_plans` VALUES (1,'Plan A'),(2,'Plan B'),(3,'Plan C'),(4,'Plan D'),(5,'Plan E'),(6,'Plan F');
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests`
--

LOCK TABLES `tests` WRITE;
/*!40000 ALTER TABLE `tests` DISABLE KEYS */;
INSERT INTO `tests` VALUES (1,'Squats'),(2,'Walking'),(3,'Jumping Jacks'),(4,'Lunges'),(5,'Stairs Up'),(6,'Stairs Down'),(7,'Stairs'),(8,'Stand Up and Go');
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
INSERT INTO `users` VALUES (1,'$2a$12$aVz22s07xC3KxndP58zPSeb/E0QpiPDPQ27YDP7Zo0.C9UUklGn5C',NULL,NULL,0,NULL,NULL,NULL,NULL,'Roger','Waters',NULL,NULL,'admin@null.com',1000,NULL,'a1ff6c9b300ca310b1e2be229e3d2f768deb0de6657a0dcc6d5c43b02f2b',NULL,NULL,'2020-09-08 17:12:14.009750','2020-09-08 17:12:14.009750'),(2,'$2a$12$wCHOb680OXG7tCSgRVGbyeOdU5wxb2gJM9OfEv2Rwqtg6Fl253cjW',NULL,NULL,0,NULL,NULL,NULL,NULL,'Keren','Orn',NULL,NULL,'CanaryAdmin0@Kirlin.com',1000,NULL,'8d1e9d7ec788f8043e52417b67b682a1cdffa08f8b557b52f7d31dfc1154',NULL,NULL,'2020-09-08 17:12:14.620128','2020-09-08 17:12:14.620128'),(3,'$2a$12$vlDhZ1iWHEOy1OXa2lL0ke1M0iGMuQBs8Ze.ittPulYmMxlxw6HVK',NULL,NULL,0,NULL,NULL,NULL,NULL,'Paris','Abbott',NULL,NULL,'Doctor1@Kirlin.com',300,NULL,'159ba91d1662e012719b4e79fb597f10ad4caf9313d8d7d6356b6b3da03c',NULL,NULL,'2020-09-08 17:12:14.803611','2020-09-08 17:12:14.803611'),(4,'$2a$12$IbuNpsB1K3PungTDswYDS.pRrhlcqM.nbPOVu1smdbHKdNV6/T1R2',NULL,NULL,0,NULL,NULL,NULL,NULL,'Willy','Kulas',NULL,NULL,'Admin2@Kirlin.com',400,NULL,'2163fbb7c10ab900bd2aa9431e24da017745a435fc4f5cc8ea7800a5d903',NULL,NULL,'2020-09-08 17:12:15.000523','2020-09-08 17:12:15.000523'),(5,'$2a$12$M7lLwYjva9pyOhcv4xKV2e/ppTjfkS8Eb4uJlJ6hESyMvhyLeou6q',NULL,NULL,0,NULL,NULL,NULL,NULL,'Trish','Roberts',NULL,NULL,'CanaryAdmin3@Kirlin.com',1000,NULL,'5d04a41fa3d7775d10727b7af842bdcb936ef57556d3588508a268279a7e',NULL,NULL,'2020-09-08 17:12:15.197028','2020-09-08 17:12:15.197028'),(6,'$2a$12$s4AL.qQCqKyoCuz3RCjjJODOUm6jl/EEviRgtPaWkugS5qfx.H0Cm',NULL,NULL,0,NULL,NULL,NULL,NULL,'Eboni','Lockman',NULL,NULL,'Doctor4@Kirlin.com',300,NULL,'ca28c0bceb2a9168dbaf467a1e8fc15755311f8e33ed60af995ac194da2a',NULL,NULL,'2020-09-08 17:12:15.393929','2020-09-08 17:12:15.393929'),(7,'$2a$12$QZZ2fj0yPXsWqOOIceXGauc0YFPZr2fObt4.eINKYSn0NceWuVX6y',NULL,NULL,0,NULL,NULL,NULL,NULL,'Marc','Stracke',NULL,NULL,'CanaryAdmin5@Kirlin.com',1000,NULL,'f39ef31ebc7ce18d430130f7bc2a9a5b06120a2a9409bcf321e1d76b7d35',NULL,NULL,'2020-09-08 17:12:15.583117','2020-09-08 17:12:15.583117'),(8,'$2a$12$ZzQ6SD0zUbVEAIu.lLWTjeFrPUaP/WwQ577K4qQHAy5XKl.P3toO6',NULL,NULL,0,NULL,NULL,NULL,NULL,'Florencio','Turcotte',NULL,NULL,'Therapist6@Kirlin.com',100,NULL,'c3049acf59950b99197fc4c853c1e3c0f0a514c08ceb7326cc9a7101095d',NULL,NULL,'2020-09-08 17:12:15.771644','2020-09-08 17:12:15.771644'),(9,'$2a$12$ak7nD/wSGWEeKgEqq.rw4OYYr3Oq6VsjfKJZNKUTbNry9x74fX8g2',NULL,NULL,0,NULL,NULL,NULL,NULL,'Flora','Murphy',NULL,NULL,'CanaryAdmin7@Kirlin.com',1000,NULL,'b0c27a28e0c0124ca6157637489895a8826aacf43da44efe3afe3c051bd5',NULL,NULL,'2020-09-08 17:12:15.959592','2020-09-08 17:12:15.959592'),(10,'$2a$12$FxHqh9h2zLxe4XNmB0eB3OWwbPa/rPug8Ytqz5LzUGXm2kNcxe1Du',NULL,NULL,0,NULL,NULL,NULL,NULL,'Lee','McClure',NULL,NULL,'Doctor8@Kirlin.com',300,NULL,'4cb7c5ea160ccc376e083df821be3f4e2bb1280372effe5a641418b4aeb4',NULL,NULL,'2020-09-08 17:12:16.145908','2020-09-08 17:12:16.145908'),(11,'$2a$12$lhyfWA8UA6wNqiWN5Td/kOC1.QzZiuxjT8uAvwkcu9I1MPWSA0DMS',NULL,NULL,0,NULL,NULL,NULL,NULL,'Brent','Wolff',NULL,NULL,'Doctor9@Kirlin.com',300,NULL,'35cc81c6711daf6d2f3d101a42c491c5b90822948dfb592b399a2b518e31',NULL,NULL,'2020-09-08 17:12:16.334147','2020-09-08 17:12:16.334147'),(12,'$2a$12$GFhUqYsRQZxYpPsUjvQ0IuaB6nsc.I5TjimdImQeZt3E43AJKMTiO',NULL,NULL,0,NULL,NULL,NULL,NULL,'Greg','Lesch',NULL,NULL,'Therapist0@Wiza.com',100,NULL,'43c6848e4f1706b390ed9f4f0dc63e6fb22fa793a59bb016f6744884e05c',NULL,NULL,'2020-09-08 17:12:16.545845','2020-09-08 17:12:16.545845'),(13,'$2a$12$g58C5ahmTOrfCmsSzHtcqOS/MjHv53D7SqSTA3Nqa9Fi8mqTPuCsK',NULL,NULL,0,NULL,NULL,NULL,NULL,'Carmon','Willms',NULL,NULL,'Admin1@Wiza.com',400,NULL,'80211b4de73b837b5817d92432274563a078c81c2fa4e149605266c81c2d',NULL,NULL,'2020-09-08 17:12:16.729615','2020-09-08 17:12:16.729615'),(14,'$2a$12$sECG7WFb9HsskWGDVz45Fu3d8zA5IZBqEdc9Ky4ddtLsi57EHKpRe',NULL,NULL,0,NULL,NULL,NULL,NULL,'Hedwig','O\'Kon',NULL,NULL,'Doctor2@Wiza.com',300,NULL,'3426580eb9f767fe9d4a87d2966f605827339c8cf5a752817f9945c9a583',NULL,NULL,'2020-09-08 17:12:16.912802','2020-09-08 17:12:16.912802'),(15,'$2a$12$lD0pOKl8nxyltTIjaSibmO2Kf2gGX1cABoMFd/72oJuiw0X0Tujz.',NULL,NULL,0,NULL,NULL,NULL,NULL,'Rico','Ondricka',NULL,NULL,'Admin3@Wiza.com',400,NULL,'5bf36b9d8c71892761d0e3f880e40e5865ff8672d67966a8e5b06e0e15a3',NULL,NULL,'2020-09-08 17:12:17.101445','2020-09-08 17:12:17.101445'),(16,'$2a$12$AjoHcXeYzMeok9QzSpiF/.3wqZNphC4UvFM3NJVY79ZG.K6vgbH1a',NULL,NULL,0,NULL,NULL,NULL,NULL,'Olen','Mayer',NULL,NULL,'Admin4@Wiza.com',400,NULL,'27c952a6ceaf3d40160278348fd45005f940a695f375c92344c8cef31cae',NULL,NULL,'2020-09-08 17:12:17.301090','2020-09-08 17:12:17.301090'),(17,'$2a$12$6cKpRz2kJpMXrA04ONe/Le7yne3WbjczuUvYCQvwd/b5SQl3yxoYu',NULL,NULL,0,NULL,NULL,NULL,NULL,'Lucien','Murphy',NULL,NULL,'Admin5@Wiza.com',400,NULL,'9d560ba29d22721c5b7780b47bc090824bacd2d6c8587bd024bcdf3c0c4e',NULL,NULL,'2020-09-08 17:12:17.499626','2020-09-08 17:12:17.499626'),(18,'$2a$12$VWwNqCJ1Mzfne3787cuoTea6ihmgWmwYvbhaBXqio5IEWGM0FNWC6',NULL,NULL,0,NULL,NULL,NULL,NULL,'Charlie','Ebert',NULL,NULL,'Therapist6@Wiza.com',100,NULL,'9e9eff41d7488a01c614db0d91ca2054ef1e014c6ed7e7681117a5bcf3d9',NULL,NULL,'2020-09-08 17:12:17.687160','2020-09-08 17:12:17.687160'),(19,'$2a$12$wGY3vr0ZINUDWgHMzD.I1e5QRe2zt7jIbd7nvvQgy3R5F931r9y8e',NULL,NULL,0,NULL,NULL,NULL,NULL,'Larue','Torphy',NULL,NULL,'Doctor7@Wiza.com',300,NULL,'6e1f38267c625e8b6002a486f6a2d699628f306ff932a0d860c697c93dc0',NULL,NULL,'2020-09-08 17:12:17.882320','2020-09-08 17:12:17.882320'),(20,'$2a$12$81/ROCqVUDhwIcK9CGnB6e/zbIcef1xyn2B15MrCTlK7gUUhWeSe2',NULL,NULL,0,NULL,NULL,NULL,NULL,'John','Jenkins',NULL,NULL,'Therapist8@Wiza.com',100,NULL,'43b7799062c38ebddbe4ac3cd2d673f3e95cf100f9ada3917683c64de8a7',NULL,NULL,'2020-09-08 17:12:18.066005','2020-09-08 17:12:18.066005'),(21,'$2a$12$ULwlHIF54OhNqB9Azy97Gu3/yxkUN.cHTFc/730KWjwleHKblDiOG',NULL,NULL,0,NULL,NULL,NULL,NULL,'Mitzi','Crona',NULL,NULL,'Doctor9@Wiza.com',300,NULL,'6bdc8364d591df233d3e6b1d09a64a6ef06b8f51006a629944c2068a6756',NULL,NULL,'2020-09-08 17:12:18.251769','2020-09-08 17:12:18.251769'),(22,'$2a$12$iCW6l9qWyWf0Fv6Gqpg3Dezav1LTW0sXmmFU7gtXeH9lDgVATal.a',NULL,NULL,0,NULL,NULL,NULL,NULL,'Josiah','Kunze',NULL,NULL,'Therapist0@Hettinger.com',100,NULL,'1de18c3c019d819b7b46082d0da620ea528aed85a2a19112b5bbdf5c6c87',NULL,NULL,'2020-09-08 17:12:18.443809','2020-09-08 17:12:18.443809'),(23,'$2a$12$CkZhwFTGICPs0PtoBJpjWOTEXZ9jJHor19ZdjSQpfRMSSlOtCx/b2',NULL,NULL,0,NULL,NULL,NULL,NULL,'Wendy','Kunze',NULL,NULL,'Therapist1@Hettinger.com',100,NULL,'0f159b2e640400287350bed8e88648d2c215433fdde257606452aab3c810',NULL,NULL,'2020-09-08 17:12:18.628917','2020-09-08 17:12:18.628917'),(24,'$2a$12$YUsqBB.tDgDMsVlT/cnpbuRHhUAcXMLjyvBgeqfZYYX4lICp1W6sS',NULL,NULL,0,NULL,NULL,NULL,NULL,'Kraig','Fritsch',NULL,NULL,'Nurse2@Hettinger.com',200,NULL,'e98e021e33417bea971c7046f7c04d6843671f1f1bffb2ccd8e91fef525c',NULL,NULL,'2020-09-08 17:12:18.821052','2020-09-08 17:12:18.821052'),(25,'$2a$12$QQ6vihGQResO.9Yt5kvEXuCs0ppHz3I06G75B3QNQCbZIzYMjCbsO',NULL,NULL,0,NULL,NULL,NULL,NULL,'Derrick','Zboncak',NULL,NULL,'CanaryAdmin3@Hettinger.com',1000,NULL,'7bb6a6518fa9aa627eeaef5e01e49d81e8bdc597b2425192f44caceee0be',NULL,NULL,'2020-09-08 17:12:19.015648','2020-09-08 17:12:19.015648'),(26,'$2a$12$erEdXB3aSCp3LWFf/GY5jOT17Tomkj5e/6rAYnE4dijogchtUekra',NULL,NULL,0,NULL,NULL,NULL,NULL,'Claretha','Flatley',NULL,NULL,'Nurse4@Hettinger.com',200,NULL,'53cdedfc4b52bcbe029df08fc0bf1d91670587a325d36a71743d29fe4f2d',NULL,NULL,'2020-09-08 17:12:19.199738','2020-09-08 17:12:19.199738'),(27,'$2a$12$Li87nc/pIqFUcHjvVJXdkeN8AO6KbkRcOBfYYJrV.15sQ2ILDyTFi',NULL,NULL,0,NULL,NULL,NULL,NULL,'Debora','Willms',NULL,NULL,'Nurse5@Hettinger.com',200,NULL,'d3c6f86d5272898eaad0e0d34111db3b4a4d40ff75fab5c63b1ec49ec38d',NULL,NULL,'2020-09-08 17:12:19.388616','2020-09-08 17:12:19.388616'),(28,'$2a$12$Q9o8F20HmvhgDqiQQdpl8uxx5NnWkJ6PqD0MZPinYbvtS3HWUrGUi',NULL,NULL,0,NULL,NULL,NULL,NULL,'Sung','Howell',NULL,NULL,'Therapist6@Hettinger.com',100,NULL,'d34ceebb0b93fe0db04e31b4f52089fa603b9e4a49c08a4112fe2ed4ecb1',NULL,NULL,'2020-09-08 17:12:19.581520','2020-09-08 17:12:19.581520'),(29,'$2a$12$Hr22HfmO/YindhqSklPlhuSv8tS7LdcMZayisLUG5vEwJm2ffKw2u',NULL,NULL,0,NULL,NULL,NULL,NULL,'Lorri','Hamill',NULL,NULL,'Nurse7@Hettinger.com',200,NULL,'0902d03d80375133d2f0cefed69163e3771a3976f14faa5e40ed801487fa',NULL,NULL,'2020-09-08 17:12:19.771110','2020-09-08 17:12:19.771110'),(30,'$2a$12$cXwXpSBxy54EioRPSyK.3esNQRMK9uAACA6Q4dE/FPWEVo7MwLDCm',NULL,NULL,0,NULL,NULL,NULL,NULL,'Stacey','Toy',NULL,NULL,'Nurse8@Hettinger.com',200,NULL,'73735996a2825f337a17e773482afb44428de0398bc9cc0662897648d0ac',NULL,NULL,'2020-09-08 17:12:19.958239','2020-09-08 17:12:19.958239'),(31,'$2a$12$VfeUFrfOYDhmSuqjYpEmMu33si.QfJQp5v4WYpAlUkxzk8xt6k1QO',NULL,NULL,0,NULL,NULL,NULL,NULL,'Galen','Muller',NULL,NULL,'Admin9@Hettinger.com',400,NULL,'0f91c5f4e76364c6ca4caf00fa42c5523efe88f922cc5fb98a906daf2738',NULL,NULL,'2020-09-08 17:12:20.142501','2020-09-08 17:12:20.142501'),(32,'$2a$12$9DZ3Kc0BZT2OeND41lCuX.36h9XYSvT0kXbcZtZ99scBPMQ4uM1Ie',NULL,NULL,0,NULL,NULL,NULL,NULL,'Daron','Haag',NULL,NULL,'Admin0@Hessel.com',400,NULL,'c68e7ec414ae7d9ec171fc2c3eaa0d14313c284a46f37be1bb7b682a15f0',NULL,NULL,'2020-09-08 17:12:20.329736','2020-09-08 17:12:20.329736'),(33,'$2a$12$Nrf4Gd8CpmyIag6p1iwpKetblBmc3XxxLffPnB5INFWq46Luashwe',NULL,NULL,0,NULL,NULL,NULL,NULL,'Dan','Jacobson',NULL,NULL,'Doctor1@Hessel.com',300,NULL,'a3a48b43e65fcf10e776a745cfcc3ea6ea3d63d77ccb22b2977ee4521072',NULL,NULL,'2020-09-08 17:12:20.524257','2020-09-08 17:12:20.524257'),(34,'$2a$12$UdfOk5l/krZu3EW35cv1Nefy92DoPQdL094uYWBWM1mKwbULRoPBO',NULL,NULL,0,NULL,NULL,NULL,NULL,'Bonita','Schoen',NULL,NULL,'Nurse2@Hessel.com',200,NULL,'e170e27ecc0ac134e7624ac0a0e6f341374501e447f9cabdf7a367030b0e',NULL,NULL,'2020-09-08 17:12:20.706881','2020-09-08 17:12:20.706881'),(35,'$2a$12$QaAOm5XiWEJOdEpEir9x0.X2G6KPH75YlShdi/t0qN9vWbbcyA0QO',NULL,NULL,0,NULL,NULL,NULL,NULL,'Lyndsay','Rau',NULL,NULL,'Doctor3@Hessel.com',300,NULL,'77556fa4299fc9d197f077ad8a62b35e784f233e5ad24c33c7bbf84ee32e',NULL,NULL,'2020-09-08 17:12:20.889383','2020-09-08 17:12:20.889383'),(36,'$2a$12$3zC/W9ykCu/Aj2Ad1Ei8gu/0Q3wl9GgViZqv71r1WZIZt0XJjBzLi',NULL,NULL,0,NULL,NULL,NULL,NULL,'Susanna','Rolfson',NULL,NULL,'Therapist4@Hessel.com',100,NULL,'3af2f7bec9ce0945aa2e1def64de389c3abab19a888bbaab48d86a678e46',NULL,NULL,'2020-09-08 17:12:21.071895','2020-09-08 17:12:21.071895'),(37,'$2a$12$2dZwevnc6CdzWeQVxl5Hzu5yrVL0ZqjrojjaEKn0bPD5B3lEh7Kr2',NULL,NULL,0,NULL,NULL,NULL,NULL,'Rosaline','Pfannerstill',NULL,NULL,'CanaryAdmin5@Hessel.com',1000,NULL,'e82670b07cbe0fbe238326c6a069dd6dad19544b3848065943e463a57b0f',NULL,NULL,'2020-09-08 17:12:21.257933','2020-09-08 17:12:21.257933'),(38,'$2a$12$VWlhDOM7L69uPpd0qTXGx.oNfc0u322V/OoWkLt5kqF4yyIpmCaum',NULL,NULL,0,NULL,NULL,NULL,NULL,'Jarred','Stanton',NULL,NULL,'Nurse6@Hessel.com',200,NULL,'389916af329af650994245066ae14d8e26b2b06a390416b306ca0a2bf3b6',NULL,NULL,'2020-09-08 17:12:21.444804','2020-09-08 17:12:21.444804'),(39,'$2a$12$NTZaiZr1JJ2/FoWBR2l4kuHFvajeG/I17xxydxJy8gaxWc51Aso.6',NULL,NULL,0,NULL,NULL,NULL,NULL,'Tommy','Rice',NULL,NULL,'Doctor7@Hessel.com',300,NULL,'4365cf37bbf61c5a31996a751e6edee42f8d2a6f2eb276af238ffb7a177f',NULL,NULL,'2020-09-08 17:12:21.631124','2020-09-08 17:12:21.631124'),(40,'$2a$12$H/JZvIFTFPZv4DF.oalBXuuIA55LKgTiBUlSCaZZ227UqVsB2IL4i',NULL,NULL,0,NULL,NULL,NULL,NULL,'Marguerita','Schiller',NULL,NULL,'Doctor8@Hessel.com',300,NULL,'52ae77b03b114770d91d0078ae311479187959a24029d723d839831d71ef',NULL,NULL,'2020-09-08 17:12:21.813587','2020-09-08 17:12:21.813587'),(41,'$2a$12$WDwnXy3ChB6Ejx4/CO1KwOVz4BalHcY1bhaILiUeQuWjyzcUmg00i',NULL,NULL,0,NULL,NULL,NULL,NULL,'Jeffrey','Wisozk',NULL,NULL,'Therapist9@Hessel.com',100,NULL,'00a546c820930a07c52808b3844daa3d96dd74ed1d7f80df0ef0b63ecf3a',NULL,NULL,'2020-09-08 17:12:21.998459','2020-09-08 17:12:21.998459'),(42,'$2a$12$gohY.1h/y8s.4WTFwkylMekaOQCICvbwpgtzthQ1OSXb.nBv3aOJe',NULL,NULL,0,NULL,NULL,NULL,NULL,'Catalina','Durgan',NULL,NULL,'Therapist0@Turcotte.com',100,NULL,'344447d6b22a614464c31122326183bccbe6fefe2664860a3f70192a5a5d',NULL,NULL,'2020-09-08 17:12:22.189151','2020-09-08 17:12:22.189151'),(43,'$2a$12$YriyGr8VlZSuv/QfTqY7Kem.cPxbMKB1FaH4DmvEGXmUOjWnfIxB.',NULL,NULL,0,NULL,NULL,NULL,NULL,'Jerold','Kuhic',NULL,NULL,'Nurse1@Turcotte.com',200,NULL,'e86e56bea301561fe3dc5dbe1fa5fa46e6d55a77daf8d0fc8ae959b365c3',NULL,NULL,'2020-09-08 17:12:22.382095','2020-09-08 17:12:22.382095'),(44,'$2a$12$EaRtv0awUWPGcs8okYUiQ.ohQbnEsGdkQjqOJyJ0ijd12jzU/DY0C',NULL,NULL,0,NULL,NULL,NULL,NULL,'Carol','Schowalter',NULL,NULL,'CanaryAdmin2@Turcotte.com',1000,NULL,'fe6a52d0fe9fe8f91943b216bcfa2fa8cf3d471e062cdfe3f699846b346a',NULL,NULL,'2020-09-08 17:12:22.566244','2020-09-08 17:12:22.566244'),(45,'$2a$12$PGKRSTSKOs4gFpx2IAactOJJJekTWZY3XO8/ooyZE1kxWpFK7boGi',NULL,NULL,0,NULL,NULL,NULL,NULL,'Chery','Schuppe',NULL,NULL,'Doctor3@Turcotte.com',300,NULL,'1f1d7c44c83a01dd83b2b3d5573eff2a228f5d1e21bfe49bd7169fecacad',NULL,NULL,'2020-09-08 17:12:22.753321','2020-09-08 17:12:22.753321'),(46,'$2a$12$nJcGOqJ441aXXkKn7hHzQOBML9PWQ1cBiNutTd21YIdqsNaOOrrw.',NULL,NULL,0,NULL,NULL,NULL,NULL,'Brendon','Bergstrom',NULL,NULL,'Admin4@Turcotte.com',400,NULL,'4975803edd7dd510fba075ff12e6aa8eb2bc4316369e11056f87532bd541',NULL,NULL,'2020-09-08 17:12:22.949843','2020-09-08 17:12:22.949843'),(47,'$2a$12$a3dF5cdRU8IKFG1OG9pgouxUlmLZSnqGLDSzjlb2esCfsbTkmt2ze',NULL,NULL,0,NULL,NULL,NULL,NULL,'Merle','Stracke',NULL,NULL,'Nurse5@Turcotte.com',200,NULL,'cdc14ccf2441e1dac622cc28b9c0fbe1c83179a88703fc6f08530a5955f9',NULL,NULL,'2020-09-08 17:12:23.172394','2020-09-08 17:12:23.172394'),(48,'$2a$12$RaUTJWYwDO8aDf0kqoi7Gu4JgSXI2oAw92ZHiMuzut0gXEJqvmxvu',NULL,NULL,0,NULL,NULL,NULL,NULL,'Zada','Berge',NULL,NULL,'CanaryAdmin6@Turcotte.com',1000,NULL,'de5d601eabd06a8df7b82023a5f6ce81b40e7a7f2ad38ab8e9a4a0563344',NULL,NULL,'2020-09-08 17:12:23.357919','2020-09-08 17:12:23.357919'),(49,'$2a$12$s7NVbvQ2eq6VSj.4LGB4zejys2qxVw4WuedIoJ43Pci4fyxwho.Uy',NULL,NULL,0,NULL,NULL,NULL,NULL,'Christopher','Schmitt',NULL,NULL,'Admin7@Turcotte.com',400,NULL,'3d55aa5dc8653465c2b8a152b47e4ab5d211da699cdd898604b8fe418a73',NULL,NULL,'2020-09-08 17:12:23.547704','2020-09-08 17:12:23.547704'),(50,'$2a$12$28ysFAnpOaKvsxhH4DBXMOS07319ZpWoaA.CHuYkGpJ1dtpLRwhHG',NULL,NULL,0,NULL,NULL,NULL,NULL,'Jamar','Nolan',NULL,NULL,'Doctor8@Turcotte.com',300,NULL,'f47acae7bf7c7c6503d174235ad9465851c9ca37d720e31914533f2630ae',NULL,NULL,'2020-09-08 17:12:23.737168','2020-09-08 17:12:23.737168'),(51,'$2a$12$CFNoDAWmb1PoOhphjt89mOtzfpstxVSQ3pUv/UCc6uHWMr8DatRvS',NULL,NULL,0,NULL,NULL,NULL,NULL,'Adolph','Welch',NULL,NULL,'Doctor9@Turcotte.com',300,NULL,'08b1c2c6eb277bdd002ee6e230d283abcd6dfeebd7f97125ab2ba94e08b0',NULL,NULL,'2020-09-08 17:12:23.927864','2020-09-08 17:12:23.927864');
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

-- Dump completed on 2020-09-08 11:12:24
