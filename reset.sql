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
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2020-08-21 11:59:52.075987','2020-08-21 11:59:52.075987'),('schema_sha1','08f92237446a868211e2e3411f15d6432a8c7b7d','2020-08-21 11:59:52.081885','2020-08-21 11:59:52.081885');
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
INSERT INTO `organizations` VALUES (1,0,'Purdy-Keebler',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,6,0,0,'2020-08-21 11:59:54.233044','2020-08-21 11:59:54.274025'),(2,1,'Robel-Herman',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,2,3,1,0,'2020-08-21 11:59:54.242292','2020-08-21 11:59:54.251303'),(3,1,'Kshlerin LLC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,4,5,1,0,'2020-08-21 11:59:54.265772','2020-08-21 11:59:54.274025'),(4,0,'Nolan, Kozey and Carter',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,12,0,0,'2020-08-21 11:59:54.285378','2020-08-21 11:59:54.318648'),(5,1,'Halvorson-Ledner',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,8,9,1,0,'2020-08-21 11:59:54.292712','2020-08-21 11:59:54.300056'),(6,1,'Mueller Group',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,10,11,1,0,'2020-08-21 11:59:54.311116','2020-08-21 11:59:54.318648'),(7,0,'Bogisich-Schneider',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,18,0,0,'2020-08-21 11:59:54.329856','2020-08-21 11:59:54.386286'),(8,1,'Schimmel, Bruen and Stamm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,14,15,1,0,'2020-08-21 11:59:54.336847','2020-08-21 11:59:54.344826'),(9,1,'Moen-Wyman',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,16,17,1,0,'2020-08-21 11:59:54.378568','2020-08-21 11:59:54.386286'),(10,0,'Conn-Kuphal',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,24,0,0,'2020-08-21 11:59:54.397164','2020-08-21 11:59:54.428850'),(11,1,'Gleichner, Kilback and Will',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,20,21,1,0,'2020-08-21 11:59:54.403922','2020-08-21 11:59:54.411161'),(12,1,'Gerlach, Stiedemann and Casper',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,22,23,1,0,'2020-08-21 11:59:54.421686','2020-08-21 11:59:54.428850'),(13,0,'Dooley and Sons',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,25,30,0,0,'2020-08-21 11:59:54.439445','2020-08-21 11:59:54.470695'),(14,1,'Walker Inc',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,26,27,1,0,'2020-08-21 11:59:54.446254','2020-08-21 11:59:54.453270'),(15,1,'Miller, Shields and Kozey',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,28,29,1,0,'2020-08-21 11:59:54.463799','2020-08-21 11:59:54.470695');
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
INSERT INTO `organizations_users` VALUES (1,1,2),(2,11,2),(3,1,3),(4,11,3),(5,1,4),(6,9,4),(7,1,5),(8,9,5),(9,1,6),(10,8,6),(11,1,7),(12,15,7),(13,1,8),(14,3,8),(15,1,9),(16,6,9),(17,1,10),(18,8,10),(19,1,11),(20,6,11),(21,4,12),(22,2,12),(23,4,13),(24,5,13),(25,4,14),(26,12,14),(27,4,15),(28,8,15),(29,4,16),(30,14,16),(31,4,17),(32,3,17),(33,4,18),(34,6,18),(35,4,19),(36,8,19),(37,4,20),(38,8,20),(39,4,21),(40,9,21),(41,7,22),(42,14,22),(43,7,23),(44,9,23),(45,7,24),(46,14,24),(47,7,25),(48,6,25),(49,7,26),(50,5,26),(51,7,27),(52,2,27),(53,7,28),(54,5,28),(55,7,29),(56,2,29),(57,7,30),(58,3,30),(59,7,31),(60,14,31),(61,10,32),(62,3,32),(63,10,33),(64,14,33),(65,10,34),(66,12,34),(67,10,35),(68,14,35),(69,10,36),(70,8,36),(71,10,37),(72,8,37),(73,10,38),(74,12,38),(75,10,39),(76,12,39),(77,10,40),(78,11,40),(79,10,41),(80,3,41),(81,13,42),(82,6,42),(83,13,43),(84,14,43),(85,13,44),(86,3,44),(87,13,45),(88,5,45),(89,13,46),(90,8,46),(91,13,47),(92,14,47),(93,13,48),(94,15,48),(95,13,49),(96,12,49),(97,13,50),(98,14,50),(99,13,51),(100,9,51);
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
INSERT INTO `patients` VALUES (1,'Antonio','Vivaldi','avivaldi@null.com','1234567890','Somplace nice','Uptown','Florence','Tuscany','12345','Itali','1678-03-04 00:00:00','2020-10-20 00:00:00',7),(2,'Isaac','Kulas','floyd@walter-kulas.biz','1-472-929-6352 x660','108 Sawayn Key','Suite 180','Johnettaberg','Ohio','91466-8948','USA','1977-11-08 00:00:00','2020-07-13 00:00:00',8),(3,'Junita','Hettinger','lani.bechtelar@gusikowski.info','839.955.5653 x3376','2893 Weldon Villages','Suite 193','East Leonie','California','45005','USA','1931-12-31 00:00:00','2020-07-03 00:00:00',10),(4,'Seth','Kilback','hilma_carroll@johnson.name','1-465-618-9603 x71882','9253 Fran Knolls','Apt. 786','Issacchester','Oklahoma','07848-7887','USA','1961-04-20 00:00:00','2020-03-29 00:00:00',8),(5,'Felicia','Metz','isaias@raynor.org','918-254-3180','605 Kunde Summit','Apt. 959','New Toney','Utah','74916','USA','2000-01-26 00:00:00','2020-04-11 00:00:00',13),(6,'Setsuko','Sanford','stacey.leffler@abernathy.info','841-597-5126 x567','5768 John Oval','Suite 976','Port Sergioview','Texas','62715-4600','USA','1948-09-28 00:00:00','2020-06-23 00:00:00',11),(7,'Leon','Stoltenberg','connie@ortiz.com','974-429-1886 x03842','3782 Silvana Oval','Apt. 450','Lake Librada','Minnesota','92261','USA','1995-11-10 00:00:00','2020-03-26 00:00:00',1),(8,'Ellis','Labadie','britni.rau@brekke.name','(853) 056-2126 x33208','2829 Carisa Fort','Apt. 935','New Nathanael','Pennsylvania','64624-4011','USA','1952-10-19 00:00:00','2020-04-06 00:00:00',3),(9,'Dana','Torp','janessa.boyle@boyer-crona.com','153-986-6260','4482 Wunsch Overpass','Suite 691','Port Miles','Iowa','09366','USA','1972-02-17 00:00:00','2020-05-06 00:00:00',3),(10,'Jonah','Franecki','dion.schuster@goodwin.biz','179.567.8753','3936 Andrea Knoll','Apt. 979','Port Dusty','Maine','92188','USA','1982-09-29 00:00:00','2020-05-19 00:00:00',3),(11,'Mikaela','Feest','trina.monahan@wisozk-lueilwitz.io','(291) 603-4171 x286','1473 Boehm Track','Apt. 788','West Donnie','Iowa','14804-8138','USA','1948-06-09 00:00:00','2020-04-18 00:00:00',14),(12,'Kaci','Fahey','denna_rippin@prohaska-cartwright.io','1-569-050-2931 x2920','83342 Tanner Corners','Apt. 168','Port Lucillachester','Indiana','64468','USA','1945-04-20 00:00:00','2020-03-21 00:00:00',2),(13,'Gilberto','Dibbert','billie.ankunding@borer-toy.biz','660-039-1905 x4023','504 Schimmel Trafficway','Suite 107','West Gladys','Arkansas','96027','USA','1974-05-21 00:00:00','2020-05-11 00:00:00',2),(14,'Cami','Witting','jazmin.jacobi@crooks.org','1-765-779-8069 x473','706 Stiedemann Grove','Apt. 426','Rogahnton','Maryland','18400','USA','1997-06-12 00:00:00','2020-03-23 00:00:00',11),(15,'Teisha','Barrows','wm@steuber-mckenzie.name','(225) 596-4387 x03566','5826 Rippin Drive','Suite 709','New Shayneside','Georgia','96188','USA','1939-06-15 00:00:00','2020-05-28 00:00:00',11),(16,'Jonathan','Ankunding','dione.wisozk@crist.biz','(551) 388-6995 x79615','165 Olin Lock','Suite 170','Macejkovictown','Kentucky','76959','USA','1974-11-05 00:00:00','2020-04-16 00:00:00',10),(17,'Willian','Yundt','keira.fadel@hills-corwin.co','1-521-509-2290 x1039','31515 Tanna Unions','Apt. 578','East Aldo','Arkansas','04351','USA','1981-12-09 00:00:00','2020-03-02 00:00:00',10),(18,'Jackqueline','Boyer','shelton_frami@crona.name','390.762.1930','9954 Goyette Radial','Suite 157','Geoffreytown','Wisconsin','89842-1060','USA','1980-03-10 00:00:00','2020-05-18 00:00:00',3),(19,'Rachel','Cartwright','mac@quigley.net','(430) 812-4417 x17910','59941 Schaefer Roads','Apt. 356','East Josphinebury','New Hampshire','08693','USA','1982-06-25 00:00:00','2020-06-09 00:00:00',6),(20,'Basilia','Bartell','elisabeth.prosacco@yundt.net','1-497-953-1477','6633 Jannette Orchard','Suite 596','West Earlean','Rhode Island','30676-4675','USA','1946-12-10 00:00:00','2020-06-25 00:00:00',6),(21,'Amiee','Bartell','tora@jacobs-oconner.co','638-740-3942 x683','4190 Rina Village','Apt. 489','Lake Milanburgh','New Hampshire','95818-4731','USA','1998-12-07 00:00:00','2020-02-27 00:00:00',4),(22,'Julieann','DuBuque','rolando@bernhard.biz','799.631.4127 x23015','37065 Okuneva Parkways','Apt. 750','Lake Metaborough','Montana','74199-7354','USA','1966-12-19 00:00:00','2020-04-28 00:00:00',4),(23,'Andrea','Homenick','brice_hauck@rau-hilll.name','391-890-0817 x230','8762 Kylie Drive','Suite 298','New Haywood','Alabama','15728-6037','USA','1957-05-18 00:00:00','2020-04-24 00:00:00',4),(24,'Maurice','Stracke','lia@mante.org','1-741-927-2233 x342','623 Kelvin Knolls','Suite 217','West Johnnie','Texas','43073-0518','USA','1942-09-25 00:00:00','2020-07-20 00:00:00',8),(25,'Les','Collier','manuela@volkman-schmeler.info','(860) 693-0061 x3916','9814 Hoeger Lodge','Suite 389','Summerside','Oklahoma','43556-0962','USA','1995-02-18 00:00:00','2020-04-30 00:00:00',15),(26,'Evangeline','Runte','caroll_kirlin@howe.co','1-186-356-0834 x13702','558 Mason Fall','Suite 177','New Dorotha','Mississippi','74838','USA','1992-12-17 00:00:00','2020-04-26 00:00:00',2),(27,'Janett','Torphy','hilton@schaefer.info','(564) 408-7850 x210','8281 Bradley Mission','Suite 644','Wolfhaven','Texas','74185-1269','USA','1944-07-07 00:00:00','2020-07-21 00:00:00',5),(28,'Michel','Walker','lyman@lakin-barrows.com','880-847-3950 x2452','1360 Hellen Pass','Apt. 587','Luettgenhaven','Florida','60878','USA','1982-06-08 00:00:00','2020-04-06 00:00:00',9),(29,'Alton','Gottlieb','elane.weimann@zboncak.biz','(512) 671-9220 x5366','36809 Buckridge River','Suite 526','West Brandeeland','New Jersey','24366','USA','1982-03-28 00:00:00','2020-05-06 00:00:00',5),(30,'Darrick','Murray','fermina.greenfelder@runolfsson.biz','1-820-099-5968 x415','23216 Hessel Walk','Suite 619','Lake Ambermouth','New Jersey','40791-8107','USA','1984-10-11 00:00:00','2020-06-08 00:00:00',2),(31,'Phung','Stanton','xavier.fay@cassin.io','(901) 442-0034 x023','358 Rosendo Inlet','Suite 312','North Nickmouth','Nevada','44942-6081','USA','1962-06-02 00:00:00','2020-04-26 00:00:00',9);
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
INSERT INTO `test_plans_tests` VALUES (1,1,1,10,0),(2,3,1,15,1),(3,5,1,20,0),(4,4,1,15,1);
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
INSERT INTO `users` VALUES (1,'$2a$12$QOWvaZ5VSftT3RvKSddRwekhl5dVQlvYmomepTpsKpTQrV0YmwK8S',NULL,NULL,0,NULL,NULL,NULL,NULL,'Roger','Waters',NULL,NULL,'admin@null.com',1000,NULL,'ec015553399342146fd7739748b974cee5b85cd6e0a920e741bd5af2125e',NULL,NULL,'2020-08-21 11:59:54.031361','2020-08-21 11:59:54.031361'),(2,'$2a$12$TtxmDENt2g737lVEZHiCNejmfJXKS2p/hNsWPWe5DRQLciqlw/uBW',NULL,NULL,0,NULL,NULL,NULL,NULL,'Ilene','Williamson',NULL,NULL,'Admin0@Purdy-Keebler.com',400,NULL,'d069938e812dd1d31209c4281590e255ef7dd2ff92b00baeb97b6ee3eb48',NULL,NULL,'2020-08-21 11:59:54.718060','2020-08-21 11:59:54.718060'),(3,'$2a$12$H8djBDXMuMA0SHja9MRPmexeqzpLA6NKgxDYyqxfASu6eCjFQrDi2',NULL,NULL,0,NULL,NULL,NULL,NULL,'Maire','Mosciski',NULL,NULL,'CanaryAdmin1@Purdy-Keebler.com',1000,NULL,'fa4ee4dfed0dc0db68297e4214475bb737e92ba1e4c9040bdde563b4791a',NULL,NULL,'2020-08-21 11:59:54.926131','2020-08-21 11:59:54.926131'),(4,'$2a$12$XO1.z/VUJKyYOQG/6tRnFeAGD/qgT8/.qq9kXi8j7NczrJXdJsq2W',NULL,NULL,0,NULL,NULL,NULL,NULL,'Keeley','Walker',NULL,NULL,'CanaryAdmin2@Purdy-Keebler.com',1000,NULL,'8b68f4c79f6a9deee4f6c3222310932bc6eecf85c4eec6fb6565f8ec4f95',NULL,NULL,'2020-08-21 11:59:55.117358','2020-08-21 11:59:55.117358'),(5,'$2a$12$zZ8duhHOoAEuDnAllMQoFOG.fzPiWHnB44EDhXdHhiwl7TI6TDyvq',NULL,NULL,0,NULL,NULL,NULL,NULL,'Leesa','Kuvalis',NULL,NULL,'Therapist3@Purdy-Keebler.com',100,NULL,'42c1059a4cff1f6a84a4e94b48615c473210f1dad4b33e71febd0c1bbbd9',NULL,NULL,'2020-08-21 11:59:55.311421','2020-08-21 11:59:55.311421'),(6,'$2a$12$Dg62ctPLFaFliNFGkZJideIcUz77fz4XANT9UPasf0n5br/YB.pOq',NULL,NULL,0,NULL,NULL,NULL,NULL,'Bula','Bergnaum',NULL,NULL,'Admin4@Purdy-Keebler.com',400,NULL,'879e7cc7d84ba137421a5bc9856cab29fe114b84d0712f5313a2ee9cc881',NULL,NULL,'2020-08-21 11:59:55.523889','2020-08-21 11:59:55.523889'),(7,'$2a$12$D5Ji2RCUmc3RiLOR39KKl.UUhRKiLuWed3cRhdRYJ0j6D19jrzz7K',NULL,NULL,0,NULL,NULL,NULL,NULL,'Leigh','Hills',NULL,NULL,'Admin5@Purdy-Keebler.com',400,NULL,'6e50d415b41a883bc6a2a45b6b0dcc9b5abc3f74a4231c12c5043092b77f',NULL,NULL,'2020-08-21 11:59:55.719080','2020-08-21 11:59:55.719080'),(8,'$2a$12$AShtYE8gCW2M9I9RjBEGUOjm1eZcVi42jZH0jDiATn4S6xnprawJW',NULL,NULL,0,NULL,NULL,NULL,NULL,'Rey','Kirlin',NULL,NULL,'CanaryAdmin6@Purdy-Keebler.com',1000,NULL,'ab2bb5d36892e279965db2610dc8a7174dde6f618d0831b81409e5afb8f7',NULL,NULL,'2020-08-21 11:59:55.908399','2020-08-21 11:59:55.908399'),(9,'$2a$12$JLVEjcNLB.0CFukiempHsebQTr8oXSNMiNje7Ur.vHs.3dtI5K5MW',NULL,NULL,0,NULL,NULL,NULL,NULL,'Rey','Mante',NULL,NULL,'Therapist7@Purdy-Keebler.com',100,NULL,'220a31c307c11bed81e1117e448b8e4df9113398e17065e4293bb57bbedc',NULL,NULL,'2020-08-21 11:59:56.102321','2020-08-21 11:59:56.102321'),(10,'$2a$12$dbe8EnncmvDFvJiawmyBk.TBieou6tkrYZ6bft4txMBPEfL15vuDC',NULL,NULL,0,NULL,NULL,NULL,NULL,'Kevin','Romaguera',NULL,NULL,'Admin8@Purdy-Keebler.com',400,NULL,'c01e377979112fa8819c51f3283db35084a7085ad363de69e747bfa82306',NULL,NULL,'2020-08-21 11:59:56.296491','2020-08-21 11:59:56.296491'),(11,'$2a$12$FhYOOGU2fYz7xDUdgV02Ou8UHsj4zjWNQL6W3NazGYHqwP.liUDiu',NULL,NULL,0,NULL,NULL,NULL,NULL,'Rodger','Hamill',NULL,NULL,'Admin9@Purdy-Keebler.com',400,NULL,'41c56955ffeb388f6347291252fea1cce8f141822a5c94c352828ba97d06',NULL,NULL,'2020-08-21 11:59:56.488207','2020-08-21 11:59:56.488207'),(12,'$2a$12$balTTUBJtVgafVuOkWTdROdIVWo5NKtVtYVt12WL4/TgR7gBbZZ8.',NULL,NULL,0,NULL,NULL,NULL,NULL,'Kathaleen','Leannon',NULL,NULL,'Therapist0@Nolan.com',100,NULL,'37790da7e4554064dada8cc07630c1c491164288df34708f44c8a4be90a9',NULL,NULL,'2020-08-21 11:59:56.676980','2020-08-21 11:59:56.676980'),(13,'$2a$12$TUukDevy6gNy1FgmduC7I.x9zvOBK2mQi3SPIDqOwRokeDiiGB6mm',NULL,NULL,0,NULL,NULL,NULL,NULL,'Dominick','Fay',NULL,NULL,'Admin1@Nolan.com',400,NULL,'7c08a5ff20bcd9809db5f8909caf9cafdc96efa9c58466f859de084652ae',NULL,NULL,'2020-08-21 11:59:56.867095','2020-08-21 11:59:56.867095'),(14,'$2a$12$JIjhXNPEpQqexn.JR0D2OuD2N8.BE05B0Zi0J5hOJa/qdzcm.vvSS',NULL,NULL,0,NULL,NULL,NULL,NULL,'Dion','Sipes',NULL,NULL,'Nurse2@Nolan.com',200,NULL,'5a84c0daf97e1083eae8e82a68dde8d87b0b13e9594c16e7dda147c4b63e',NULL,NULL,'2020-08-21 11:59:57.055672','2020-08-21 11:59:57.055672'),(15,'$2a$12$e1c001Z2bhOne5gFpSIC6eYkkf4ZgRD48BLa9JPHztp7YNl99hZh6',NULL,NULL,0,NULL,NULL,NULL,NULL,'Helena','Beer',NULL,NULL,'Doctor3@Nolan.com',300,NULL,'26f85584f1f04a80f6dcbde88a4f5f096da73d1fa55894f7613ab3118b62',NULL,NULL,'2020-08-21 11:59:57.246808','2020-08-21 11:59:57.246808'),(16,'$2a$12$8EmR4gIdiovUtJdaTeTBpuVZUp5EbsP5nAV2AfSxSk9ioekJ7JjZu',NULL,NULL,0,NULL,NULL,NULL,NULL,'Kittie','Armstrong',NULL,NULL,'Admin4@Nolan.com',400,NULL,'4e4d02cf7eb7759939c2211fd51c012c42c1f872057a26d56c6bafb6c136',NULL,NULL,'2020-08-21 11:59:57.438871','2020-08-21 11:59:57.438871'),(17,'$2a$12$EWY5iQ/l1Mz/rGFYOSQGT.Uqqdje4cCVPrCqcFTS4y7j3iopssY32',NULL,NULL,0,NULL,NULL,NULL,NULL,'Wade','Harris',NULL,NULL,'Nurse5@Nolan.com',200,NULL,'503bc66667273b52cd436f0563e41e1cfe2246a95fb388f1a8d5b1fdc176',NULL,NULL,'2020-08-21 11:59:57.628518','2020-08-21 11:59:57.628518'),(18,'$2a$12$szsHHQr1ri1Hzy0rFm2IE.5ZfXrVuGaHDb4PJ1/HuGXQzck6UqEJ.',NULL,NULL,0,NULL,NULL,NULL,NULL,'Hyun','Johnson',NULL,NULL,'CanaryAdmin6@Nolan.com',1000,NULL,'31a46de642821598ac70272beb2b78e18ec9b8d4c90bb096d3727d62de75',NULL,NULL,'2020-08-21 11:59:57.821527','2020-08-21 11:59:57.821527'),(19,'$2a$12$rq9oNG2KooHEsBMBLD5VzuEHi.IimtEqVslAHaojnM5nIviiT/TdW',NULL,NULL,0,NULL,NULL,NULL,NULL,'Abel','Will',NULL,NULL,'Nurse7@Nolan.com',200,NULL,'8b359d6cddc07179e220c30a4c0cb36f6986434f0728e261a2f2bc094804',NULL,NULL,'2020-08-21 11:59:58.022188','2020-08-21 11:59:58.022188'),(20,'$2a$12$oZAjExwKL6u34wm61FisoO9el7Xifhi56t7qapbPQ/Gz48epZys/2',NULL,NULL,0,NULL,NULL,NULL,NULL,'Delphia','Ratke',NULL,NULL,'Nurse8@Nolan.com',200,NULL,'15ab004fcbd9a7d5e8906346cca719f55e58b4be807e9613e56540269ce4',NULL,NULL,'2020-08-21 11:59:58.212633','2020-08-21 11:59:58.212633'),(21,'$2a$12$olgsQcd12AjUK.roUBMd7uXQpXIRAm37QarCO2v/B6pXrLBpkVoRe',NULL,NULL,0,NULL,NULL,NULL,NULL,'Victor','Medhurst',NULL,NULL,'Admin9@Nolan.com',400,NULL,'3cc523a6d86cacb7a84c0a1bba3893290a31e5ea1b847e3b3517b29f0831',NULL,NULL,'2020-08-21 11:59:58.404980','2020-08-21 11:59:58.404980'),(22,'$2a$12$lIbWmsOkaCGgjD2kttboWO/ac9pZLFHg.BvMYyBgy0SZX59TICOhu',NULL,NULL,0,NULL,NULL,NULL,NULL,'Homer','Schuppe',NULL,NULL,'Therapist0@Bogisich-Schneider.com',100,NULL,'7c23308b44aa0741dbd6b6ca25cee85bf7aa7d9e30a0ff7f5c7257d6b321',NULL,NULL,'2020-08-21 11:59:58.593880','2020-08-21 11:59:58.593880'),(23,'$2a$12$XHNsU77oHeU6BIVC6zVmPuuxvGKOwryIJckVwVegrzzq9OjKAqKWe',NULL,NULL,0,NULL,NULL,NULL,NULL,'Keenan','Schuppe',NULL,NULL,'Therapist1@Bogisich-Schneider.com',100,NULL,'aae08a9094a123d76aa78ae81daf0147b20e0c4b0157ec05fbb13ab83aa0',NULL,NULL,'2020-08-21 11:59:58.783576','2020-08-21 11:59:58.783576'),(24,'$2a$12$kLAw.C7/ynOQf/MYK/FqzOdjb6ZFOQCXg29ulrOgL054aTghK2fOC',NULL,NULL,0,NULL,NULL,NULL,NULL,'Tawanda','Hansen',NULL,NULL,'Doctor2@Bogisich-Schneider.com',300,NULL,'01004e2594d4eb7474b106ff7e43371f327fb412bad60348a1e0302f6071',NULL,NULL,'2020-08-21 11:59:58.972193','2020-08-21 11:59:58.972193'),(25,'$2a$12$fBitU1mDk3NrHBnpfU8w1uKZsC5hewz.cfI2uYYAujzARUAuOymqG',NULL,NULL,0,NULL,NULL,NULL,NULL,'Donald','Hettinger',NULL,NULL,'Therapist3@Bogisich-Schneider.com',100,NULL,'4db4ca002931fb22d53e688b7ac7d9cd634341639a528ae13e4c0391debf',NULL,NULL,'2020-08-21 11:59:59.165227','2020-08-21 11:59:59.165227'),(26,'$2a$12$XdTVVudCq5A/dAyGDRvO2.iEZ19eU1eib2xmwVfg4ELJdzKpHTY9i',NULL,NULL,0,NULL,NULL,NULL,NULL,'Marlin','Heidenreich',NULL,NULL,'Therapist4@Bogisich-Schneider.com',100,NULL,'9e71991c9ed9a53d41dd2e222176fd78c6c3579dcff474884680876b9417',NULL,NULL,'2020-08-21 11:59:59.356376','2020-08-21 11:59:59.356376'),(27,'$2a$12$re4kiI4qjgQyXMtDhGOT4uH7pDKVvsycweVxgZ2GeNgASBJiTr1om',NULL,NULL,0,NULL,NULL,NULL,NULL,'Dominique','Goodwin',NULL,NULL,'Admin5@Bogisich-Schneider.com',400,NULL,'b207a3813c548fc5c7544d1209d56718deb14cbba432177e023a58a7ef02',NULL,NULL,'2020-08-21 11:59:59.550050','2020-08-21 11:59:59.550050'),(28,'$2a$12$G38HzPA8Ec4ewoJPsLrh0e5/xF4oysH.WqMDYF6sEQz4X1HWVhwa6',NULL,NULL,0,NULL,NULL,NULL,NULL,'Dominique','Haag',NULL,NULL,'Doctor6@Bogisich-Schneider.com',300,NULL,'cbb1fc27643f88c7b9fb517b8a3640efd71865e3b00666324588635f94ed',NULL,NULL,'2020-08-21 11:59:59.740489','2020-08-21 11:59:59.740489'),(29,'$2a$12$MBA0tco80dZg2E9RBQ6TWe4CaIGOA/AdhpurmzDfp/OIEqTuoyMXy',NULL,NULL,0,NULL,NULL,NULL,NULL,'Larhonda','Green',NULL,NULL,'Doctor7@Bogisich-Schneider.com',300,NULL,'7031044ae240a9afcdebb3baa18b90a0e0091d6a59b15fc28b0e2218e905',NULL,NULL,'2020-08-21 11:59:59.930627','2020-08-21 11:59:59.930627'),(30,'$2a$12$93ee.KsRZsTRX6YVgWtvv.iJdf/UMpWSLeWhybYk3jpiihOK9PJTy',NULL,NULL,0,NULL,NULL,NULL,NULL,'Raul','Stanton',NULL,NULL,'Therapist8@Bogisich-Schneider.com',100,NULL,'757fb590c1e2e3b3226c1bf1cf40755b6fa435cb2760b8a36643d4ec23bd',NULL,NULL,'2020-08-21 12:00:00.122139','2020-08-21 12:00:00.122139'),(31,'$2a$12$rlmDhSWWSX/89vAaMM7yAuVV5rc.UpnEqXlftieRPu5wASd9ETkyO',NULL,NULL,0,NULL,NULL,NULL,NULL,'Deann','Sauer',NULL,NULL,'Nurse9@Bogisich-Schneider.com',200,NULL,'b5f47d671193ef3e9d6d9e20661d51608d8e7278e3916b4707c9bc673e8c',NULL,NULL,'2020-08-21 12:00:00.316480','2020-08-21 12:00:00.316480'),(32,'$2a$12$OXEg4NEOgol3l6tX5Wx6a.Ug7kOds5cS0psw/EWjYfpBzjniCvRp.',NULL,NULL,0,NULL,NULL,NULL,NULL,'Raphael','Gulgowski',NULL,NULL,'Doctor0@Conn-Kuphal.com',300,NULL,'3bd7cfb9b8eaf9c6c99aaf8762a635af51ce0ae9efcf5006ee58452d8bc6',NULL,NULL,'2020-08-21 12:00:00.507864','2020-08-21 12:00:00.507864'),(33,'$2a$12$zmdfIKdZYu/cX/H2gh7KguOKkgbobFJjn8R7aKmAYszYKbnkO.tzG',NULL,NULL,0,NULL,NULL,NULL,NULL,'Rudolph','Wehner',NULL,NULL,'Admin1@Conn-Kuphal.com',400,NULL,'0b11f345ef5c947d52abced3d496176afbdc5af88c6619f64aa8d3430d67',NULL,NULL,'2020-08-21 12:00:00.701572','2020-08-21 12:00:00.701572'),(34,'$2a$12$pDowIGbRzumqFE9IXWPObeRup3ftQfzA/4eX7NhrHKKRUUR6ClsFe',NULL,NULL,0,NULL,NULL,NULL,NULL,'Randy','O\'Connell',NULL,NULL,'Therapist2@Conn-Kuphal.com',100,NULL,'18644ebc5261b626b9b909623ddad209011f6873c7130b21cd1c3fab183a',NULL,NULL,'2020-08-21 12:00:00.892534','2020-08-21 12:00:00.892534'),(35,'$2a$12$RPV6BgIuZeOOjf/i841jBuumtdxL2VLt8bwAWPtDVOY6W1vlZnCye',NULL,NULL,0,NULL,NULL,NULL,NULL,'Emmett','Spencer',NULL,NULL,'Therapist3@Conn-Kuphal.com',100,NULL,'6f0c7642571846f854d158c78fcba3fe5c2d96af262afa13584f3b0ff72b',NULL,NULL,'2020-08-21 12:00:01.090943','2020-08-21 12:00:01.090943'),(36,'$2a$12$iCHuDC.Sb94gQWij3rIc8.NwPBBDUQ67WJuBhqhvdeO2a2E2avjqq',NULL,NULL,0,NULL,NULL,NULL,NULL,'Darren','Stracke',NULL,NULL,'Nurse4@Conn-Kuphal.com',200,NULL,'2e2e67f3f37b0169f99b40680ab3c1b6ab94fca33d6b84c54669546e994d',NULL,NULL,'2020-08-21 12:00:01.283726','2020-08-21 12:00:01.283726'),(37,'$2a$12$L3PxPy4D7mUj2dkJFpTzXu39536RYTdc/abAwafuo2nuBV4jDhYg2',NULL,NULL,0,NULL,NULL,NULL,NULL,'Rolf','Gerlach',NULL,NULL,'CanaryAdmin5@Conn-Kuphal.com',1000,NULL,'94904bde18a7e7e7ee2703963590eac7c163c6ece34162305aadbe222286',NULL,NULL,'2020-08-21 12:00:01.475495','2020-08-21 12:00:01.475495'),(38,'$2a$12$Y68jH1l0y9k2e/UgBFDgvO/LHXplg4RxFkxTP8XuBOMpmS9WJwajO',NULL,NULL,0,NULL,NULL,NULL,NULL,'Gail','Koepp',NULL,NULL,'Doctor6@Conn-Kuphal.com',300,NULL,'8e63d99171c3f89b4774b508c0762f078b6c03b0c06f86096b5a56397350',NULL,NULL,'2020-08-21 12:00:01.665026','2020-08-21 12:00:01.665026'),(39,'$2a$12$3R5Ib90jbJ2HxTlfSyinMesHEm5Ay7S076WyQWOfuJYfhUZBAZqem',NULL,NULL,0,NULL,NULL,NULL,NULL,'Alec','Metz',NULL,NULL,'CanaryAdmin7@Conn-Kuphal.com',1000,NULL,'ea67f1a8c93d9711c10af007071b9749ed8509f348c317e960d51e37d5da',NULL,NULL,'2020-08-21 12:00:01.853978','2020-08-21 12:00:01.853978'),(40,'$2a$12$rcbW9PjpOQVu.tsqTjPojOh4pjQSgS6yZwJFh.YY4d3AetxVRbpHe',NULL,NULL,0,NULL,NULL,NULL,NULL,'Gus','Kozey',NULL,NULL,'CanaryAdmin8@Conn-Kuphal.com',1000,NULL,'8845e516f4d5665d86c12e98cdde773ec8638db045aa920d21ea22f2e49b',NULL,NULL,'2020-08-21 12:00:02.043148','2020-08-21 12:00:02.043148'),(41,'$2a$12$1HXo4NB8vSUJMpUz7DQJ..EVy4qoil4qUMwtrox3xBIgo081dBNPq',NULL,NULL,0,NULL,NULL,NULL,NULL,'Kirstie','Jacobi',NULL,NULL,'CanaryAdmin9@Conn-Kuphal.com',1000,NULL,'8de57b68e11bd3acdef896490366c91641c8d19b29ef7f5a6c909ce563f0',NULL,NULL,'2020-08-21 12:00:02.235246','2020-08-21 12:00:02.235246'),(42,'$2a$12$DtpxDYTy1umE7BRzX/PbguOOpEJHHSxbm9JhXi7VT.tVKaWxiJIb.',NULL,NULL,0,NULL,NULL,NULL,NULL,'Florencio','Brekke',NULL,NULL,'Doctor0@Dooley.com',300,NULL,'608fc111b36b3e125f5648b3a29a9cd4684e2527d11acea6cc8d70253b6a',NULL,NULL,'2020-08-21 12:00:02.427001','2020-08-21 12:00:02.427001'),(43,'$2a$12$F73/gMZULTIqplqcx1cknea9QC.X3UOnM.lgZaLQ/vTGMq9KuC83y',NULL,NULL,0,NULL,NULL,NULL,NULL,'Elliot','Runolfsdottir',NULL,NULL,'CanaryAdmin1@Dooley.com',1000,NULL,'b71c1a39273751f737bc5e86d5c036ff12b92e83bef0ccfe135cb84c8ff7',NULL,NULL,'2020-08-21 12:00:02.617619','2020-08-21 12:00:02.617619'),(44,'$2a$12$NaInDsJn4XKQElyvaHUCy.Bxo1i8tzdzqMydx724EvlF5x45PtZke',NULL,NULL,0,NULL,NULL,NULL,NULL,'Siu','Kunde',NULL,NULL,'Nurse2@Dooley.com',200,NULL,'bb0417585a6f138e2cb8245efb3d339e679b110befac9086cff1699c51aa',NULL,NULL,'2020-08-21 12:00:02.806900','2020-08-21 12:00:02.806900'),(45,'$2a$12$bjU07fjvPOwh1ZKu1gvHPutduh8BnwH0h8yXyA3pf41X5kFxZvJqS',NULL,NULL,0,NULL,NULL,NULL,NULL,'Bibi','Kilback',NULL,NULL,'Doctor3@Dooley.com',300,NULL,'22d4c3c7d167f0283eddcc165d9c262cb4b8435ff0935c6b14e462d1baaa',NULL,NULL,'2020-08-21 12:00:02.998780','2020-08-21 12:00:02.998780'),(46,'$2a$12$hEPvhgRuGx2sU0hRvIZRzO.C3L6trnjaoH0rbI8CHgBmA6gQuu7yi',NULL,NULL,0,NULL,NULL,NULL,NULL,'Vernice','Zemlak',NULL,NULL,'Doctor4@Dooley.com',300,NULL,'b5ce97647a4f7b765872a685ce395a9ce7deeb2c538ac16c29aae0b7dc76',NULL,NULL,'2020-08-21 12:00:03.188556','2020-08-21 12:00:03.188556'),(47,'$2a$12$SfMaqMV4qxu8DDU.jr9hBuHAza2fg/bPksjB2Cy/gvtiGEZ3gBZGS',NULL,NULL,0,NULL,NULL,NULL,NULL,'Donnell','Ernser',NULL,NULL,'Doctor5@Dooley.com',300,NULL,'04c602bb922d363ceb8d5969795ec21da3387a0ae65f27a778b633bbb0b0',NULL,NULL,'2020-08-21 12:00:03.380598','2020-08-21 12:00:03.380598'),(48,'$2a$12$piCdCv.AiW37W0TjyYe1C.Gi8SAO774/UkQwv6VSCERTBwF..npb6',NULL,NULL,0,NULL,NULL,NULL,NULL,'Wilson','MacGyver',NULL,NULL,'Therapist6@Dooley.com',100,NULL,'c3eabb0bea44d9afd97116bdb6ced240bf6972a1fee4d8722f31ee9c4404',NULL,NULL,'2020-08-21 12:00:03.570509','2020-08-21 12:00:03.570509'),(49,'$2a$12$tBb9VYdfvJmfJe2Y4e5fee66Qc.Qid20MPnCFq2MSh7OSDWmGtdcm',NULL,NULL,0,NULL,NULL,NULL,NULL,'Charlie','Mitchell',NULL,NULL,'Admin7@Dooley.com',400,NULL,'65f0bced0659584e2a48d9d759dfc189e05edc35912c512022a5d8b1f1e8',NULL,NULL,'2020-08-21 12:00:03.761292','2020-08-21 12:00:03.761292'),(50,'$2a$12$yxJvtW0a6Sjqd/1QudHrBeR36tSajRFExYbiX324Yttpiktd41vHC',NULL,NULL,0,NULL,NULL,NULL,NULL,'Christiane','Jacobs',NULL,NULL,'Admin8@Dooley.com',400,NULL,'9ef5c430d4b9fbe9f6a5f161aa9e5791da0ee85dcc1b9a3cc6cc179726a6',NULL,NULL,'2020-08-21 12:00:03.950756','2020-08-21 12:00:03.950756'),(51,'$2a$12$4yUra/KfsYTpdliaSzy3LerTdToaQkeVugP61YfHHjVvNV6JgI/HC',NULL,NULL,0,NULL,NULL,NULL,NULL,'Glayds','Pollich',NULL,NULL,'Doctor9@Dooley.com',300,NULL,'f693431aeee5d7ecd58b90f1c6c642ac9fa4e5bcef3df47d88d7745813b5',NULL,NULL,'2020-08-21 12:00:04.152096','2020-08-21 12:00:04.152096');
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

-- Dump completed on 2020-08-21  6:00:04
