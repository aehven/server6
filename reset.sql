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
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2020-08-20 20:17:47.888818','2020-08-20 20:17:47.888818'),('schema_sha1','c66159d035771ae62ae66108ff02f1c6d0a91f9d','2020-08-20 20:17:47.894364','2020-08-20 20:17:47.894364');
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
INSERT INTO `organizations` VALUES (1,0,'Zieme-Mitchell',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,6,0,0,'2020-08-20 20:17:50.119864','2020-08-20 20:17:50.163800'),(2,1,'Bartoletti, Pfeffer and Hauck',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,2,3,1,0,'2020-08-20 20:17:50.138679','2020-08-20 20:17:50.146255'),(3,1,'Barton LLC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,4,5,1,0,'2020-08-20 20:17:50.157534','2020-08-20 20:17:50.163800'),(4,0,'Wilderman Group',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,12,0,0,'2020-08-20 20:17:50.172694','2020-08-20 20:17:50.199242'),(5,1,'Yost-Wunsch',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,8,9,1,0,'2020-08-20 20:17:50.178404','2020-08-20 20:17:50.184524'),(6,1,'Bashirian and Sons',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,10,11,1,0,'2020-08-20 20:17:50.193557','2020-08-20 20:17:50.199242'),(7,0,'Reilly-Bergstrom',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,18,0,0,'2020-08-20 20:17:50.207805','2020-08-20 20:17:50.254917'),(8,1,'Leuschke, Moore and Lind',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,14,15,1,0,'2020-08-20 20:17:50.213342','2020-08-20 20:17:50.219643'),(9,1,'Lubowitz-Gutmann',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,16,17,1,0,'2020-08-20 20:17:50.248484','2020-08-20 20:17:50.254917'),(10,0,'Hickle, Hilpert and Bashirian',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,24,0,0,'2020-08-20 20:17:50.264348','2020-08-20 20:17:50.291104'),(11,1,'Grady, Quitzon and Runolfsson',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,20,21,1,0,'2020-08-20 20:17:50.271262','2020-08-20 20:17:50.277300'),(12,1,'Bashirian and Sons',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,22,23,1,0,'2020-08-20 20:17:50.285802','2020-08-20 20:17:50.291104'),(13,0,'Hilll-Carroll',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,25,30,0,0,'2020-08-20 20:17:50.299817','2020-08-20 20:17:50.324363'),(14,1,'Beer-Gaylord',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,26,27,1,0,'2020-08-20 20:17:50.305468','2020-08-20 20:17:50.310714'),(15,1,'Hyatt-Labadie',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,28,29,1,0,'2020-08-20 20:17:50.319010','2020-08-20 20:17:50.324363');
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
INSERT INTO `organizations_users` VALUES (1,1,2),(2,14,2),(3,1,3),(4,8,3),(5,1,4),(6,9,4),(7,1,5),(8,14,5),(9,1,6),(10,2,6),(11,1,7),(12,14,7),(13,1,8),(14,2,8),(15,1,9),(16,11,9),(17,1,10),(18,15,10),(19,1,11),(20,2,11),(21,4,12),(22,9,12),(23,4,13),(24,15,13),(25,4,14),(26,9,14),(27,4,15),(28,9,15),(29,4,16),(30,3,16),(31,4,17),(32,6,17),(33,4,18),(34,14,18),(35,4,19),(36,14,19),(37,4,20),(38,3,20),(39,4,21),(40,11,21),(41,7,22),(42,8,22),(43,7,23),(44,11,23),(45,7,24),(46,12,24),(47,7,25),(48,12,25),(49,7,26),(50,9,26),(51,7,27),(52,12,27),(53,7,28),(54,11,28),(55,7,29),(56,8,29),(57,7,30),(58,15,30),(59,7,31),(60,2,31),(61,10,32),(62,5,32),(63,10,33),(64,9,33),(65,10,34),(66,11,34),(67,10,35),(68,14,35),(69,10,36),(70,9,36),(71,10,37),(72,11,37),(73,10,38),(74,2,38),(75,10,39),(76,5,39),(77,10,40),(78,12,40),(79,10,41),(80,3,41),(81,13,42),(82,8,42),(83,13,43),(84,5,43),(85,13,44),(86,11,44),(87,13,45),(88,8,45),(89,13,46),(90,5,46),(91,13,47),(92,8,47),(93,13,48),(94,9,48),(95,13,49),(96,5,49),(97,13,50),(98,12,50),(99,13,51),(100,6,51);
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
INSERT INTO `patients` VALUES (1,'Antonio','Vivaldi','avivaldi@null.com','1234567890','Somplace nice','Uptown','Florence','Tuscany','12345','Itali','1678-03-04 00:00:00','2020-10-20 00:00:00',7),(2,'Harvey','Herzog','rayford.feest@dickinson.net','602.253.2786 x867','38269 Franecki Valleys','Suite 315','Port Aleaseborough','Virginia','50916','USA','1978-12-02 00:00:00','2020-06-08 00:00:00',10),(3,'Dorothy','Powlowski','sidney_nikolaus@schultz-reynolds.org','(569) 670-6947 x46279','374 Bins Burgs','Suite 175','Sherilyntown','New Jersey','27931','USA','1998-05-13 00:00:00','2020-07-14 00:00:00',14),(4,'Brianne','Wiza','les_corkery@cormier.org','1-635-807-4654 x221','7281 Geoffrey Burg','Suite 763','Efrenshire','Massachusetts','55228-1318','USA','1980-11-06 00:00:00','2020-05-11 00:00:00',3),(5,'Susann','Wehner','francina@kuhn.io','908-043-2798 x5378','45386 Tromp Islands','Suite 439','Damianport','Alaska','47296','USA','1959-11-09 00:00:00','2020-02-26 00:00:00',8),(6,'Thea','Collins','louisa_kiehn@hackett.name','502.571.1299 x22199','71009 Erin Extensions','Suite 367','Port Hai','Virginia','06539','USA','1991-10-20 00:00:00','2020-06-21 00:00:00',2),(7,'Cole','Hintz','ava_dibbert@ritchie.biz','796-483-7968 x01375','1536 Charlene Square','Apt. 806','Bernierberg','New Mexico','23514-2652','USA','1983-03-07 00:00:00','2020-05-05 00:00:00',1),(8,'Tamra','Towne','madelyn_little@denesik.info','785.123.9740','83795 Haag Lights','Apt. 566','East Roxie','Montana','40413','USA','1949-08-14 00:00:00','2020-05-28 00:00:00',14),(9,'Gino','Gleichner','billie_turner@bayer.com','(167) 455-5358 x27728','967 Albert Stream','Apt. 950','Macejkovicburgh','Tennessee','13411','USA','1963-10-29 00:00:00','2020-02-22 00:00:00',13),(10,'Han','Fadel','dean_orn@parker-leannon.info','(555) 879-8245','3697 Walker Prairie','Suite 725','Lake Lacyfort','Arizona','61730','USA','1980-12-22 00:00:00','2020-02-21 00:00:00',3),(11,'Elenore','Rath','phyliss_dooley@ryan.io','835.843.2160 x19896','350 West Courts','Suite 224','Port Shanell','Tennessee','57387-6559','USA','1956-10-31 00:00:00','2020-04-16 00:00:00',9),(12,'Brady','Hagenes','charity@mraz.com','666.737.0789','84929 Daniel Tunnel','Suite 165','New Grady','Georgia','52155-2309','USA','1999-11-13 00:00:00','2020-03-22 00:00:00',5),(13,'Dawn','Pfannerstill','fernanda.macgyver@kuphal.co','740-912-6200','923 Santo Walks','Suite 243','Ebertshire','North Dakota','19019','USA','1938-03-26 00:00:00','2020-03-26 00:00:00',1),(14,'Samuel','Frami','herschel.oconnell@cassin.co','1-355-793-6088 x5032','714 Jeanna Cove','Apt. 336','Abeside','West Virginia','61175-9529','USA','1963-10-30 00:00:00','2020-02-26 00:00:00',5),(15,'Alyce','Daugherty','merrilee@rogahn.net','119.153.7717 x470','6092 Zenaida Canyon','Apt. 296','West Lanniemouth','Nevada','24628','USA','1966-05-08 00:00:00','2020-07-18 00:00:00',1),(16,'Benjamin','Ritchie','mica.huel@witting.name','1-303-205-0398 x0291','4353 Cletus Valleys','Apt. 989','New Marquisshire','Washington','34212','USA','1963-04-10 00:00:00','2020-05-20 00:00:00',2),(17,'Nigel','Rosenbaum','rebbeca@treutel.net','432.732.9464 x4780','61960 Leif Divide','Apt. 576','Rashidaside','Delaware','33479-7979','USA','1981-10-30 00:00:00','2020-03-26 00:00:00',11),(18,'Irwin','Hartmann','chasidy@kutch.io','(739) 281-0813 x1435','56417 Fadel Forge','Suite 196','North Gennaville','Wyoming','73868-7655','USA','1941-07-26 00:00:00','2020-03-03 00:00:00',1),(19,'Oneida','Weber','ema_friesen@oreilly.org','942-138-9404 x164','17223 Bechtelar Drive','Suite 295','North Rozella','Vermont','47880','USA','1959-06-09 00:00:00','2020-04-21 00:00:00',5),(20,'Lashawna','Sawayn','kermit@sipes.org','430.792.3034 x660','985 Jaskolski Harbor','Suite 240','West Monserrate','Oklahoma','30700','USA','1972-01-07 00:00:00','2020-02-20 00:00:00',8),(21,'Hollis','Predovic','bulah@kreiger-jaskolski.name','1-723-732-3987','3834 Erdman Falls','Apt. 892','Peteberg','Nebraska','79221-2083','USA','1974-02-16 00:00:00','2020-05-06 00:00:00',12),(22,'Weldon','Pacocha','maryrose@bauch.io','512.907.2331','924 Homer Stravenue','Apt. 635','Lindsayhaven','Delaware','55671-7935','USA','1976-01-19 00:00:00','2020-04-20 00:00:00',10),(23,'Norene','Beatty','melodee.mraz@farrell-dietrich.io','386.364.7048 x9026','93136 Alejandro Common','Apt. 659','Port Fred','Nevada','70753','USA','1965-08-28 00:00:00','2020-05-09 00:00:00',9),(24,'Fermina','Shanahan','rosette@orn.org','477.382.8811 x9538','176 Joy Fields','Suite 386','Lake Sethburgh','Oklahoma','17462-6058','USA','1958-03-07 00:00:00','2020-06-22 00:00:00',12),(25,'Armand','Powlowski','arica@kuhic.net','732-504-3883 x499','65991 Marvin Junction','Apt. 879','Lake Sau','Illinois','03738-8703','USA','1965-02-24 00:00:00','2020-05-03 00:00:00',2),(26,'Glennie','Turner','william_batz@orn.co','(161) 660-1253 x07064','54208 Bergnaum Shoals','Apt. 172','Corwinstad','Maryland','70539','USA','1949-08-30 00:00:00','2020-04-06 00:00:00',6),(27,'Leona','Hilpert','wilson@kreiger.com','(908) 282-7971','6102 Harriette Squares','Apt. 991','East Dennisemouth','Washington','62694-5849','USA','1959-11-02 00:00:00','2020-07-02 00:00:00',6),(28,'Brent','Walker','wilbert@conn.net','340-001-8093 x0797','6243 Rosario Grove','Suite 708','Lefflerside','Vermont','34910-6675','USA','1946-11-24 00:00:00','2020-06-29 00:00:00',13),(29,'Jolene','Stamm','devon.bahringer@ritchie.io','386-606-0960','97271 Morgan Flat','Suite 373','Port Angelfort','Alabama','07918-2186','USA','1962-10-13 00:00:00','2020-04-20 00:00:00',13),(30,'Boyd','Denesik','alphonse.conroy@tremblay-mccullough.info','(589) 319-9091 x278','10488 Leannon Crescent','Suite 566','East Santiagoland','Kansas','18539','USA','1974-01-16 00:00:00','2020-04-30 00:00:00',4),(31,'Christal','Berge','evon@hahn.name','(451) 721-1802 x292','261 Mikel Bypass','Apt. 228','Herzogside','New Jersey','84691-6122','USA','1937-12-08 00:00:00','2020-05-29 00:00:00',2);
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
INSERT INTO `patients_users` VALUES (1,1,24);
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
INSERT INTO `users` VALUES (1,'$2a$12$3nxd2mufU.dPZ4vzGYP6LOMO.X6Bz.4rb7M2RFspE/D7NGeAS43pC',NULL,NULL,0,NULL,NULL,NULL,NULL,'Roger','Waters',NULL,NULL,'admin@null.com',1000,NULL,'36517a6a14cf4eee4beccaff07b87100b84e1316ea1cdbe3ae38cca227cb',NULL,'2020-08-20 20:17:49.874553','2020-08-20 20:17:49.874553'),(2,'$2a$12$7ZA7xOxhFGtv0kdUw9sMAebgLQQ.IwdrO478XO445J9HxW0w/ML66',NULL,NULL,0,NULL,NULL,NULL,NULL,'Willena','Murazik',NULL,NULL,'Nurse0@Zieme-Mitchell.com',200,NULL,'6ac9e53c46c92874cfc5bc837d248dfc0b0ba8cbfc31bc2c0578d25602a4',NULL,'2020-08-20 20:17:50.536835','2020-08-20 20:17:50.536835'),(3,'$2a$12$zJlEDxFJBfkhNJUb4vfGc.eqJAtp8M4wl7xprth5IzLs2jqAknmkO',NULL,NULL,0,NULL,NULL,NULL,NULL,'Angelena','Marvin',NULL,NULL,'CanaryAdmin1@Zieme-Mitchell.com',1000,NULL,'183b4c9d1245ab95066bd98b714a940a5a269e5d030a5b2deac348a4285c',NULL,'2020-08-20 20:17:50.742149','2020-08-20 20:17:50.742149'),(4,'$2a$12$Q.ftY0SzjYtXiCmPhQ4B1OgrtCnOH.N5PM7cA46rAWAy3sEaWdmSi',NULL,NULL,0,NULL,NULL,NULL,NULL,'Louise','Durgan',NULL,NULL,'CanaryAdmin2@Zieme-Mitchell.com',1000,NULL,'46b22eded457bc2b35bac6686a269fee50edf9a4758f8da6196b50c7d647',NULL,'2020-08-20 20:17:50.934292','2020-08-20 20:17:50.934292'),(5,'$2a$12$1Bkfb62kOz/pcgYX058kwuZm3RjzRtiz2hlyInkw02SWhUPzTbVfe',NULL,NULL,0,NULL,NULL,NULL,NULL,'Eliseo','Schuppe',NULL,NULL,'Therapist3@Zieme-Mitchell.com',100,NULL,'de7ca865a2cdc0ca1869979958bfad741f8e98bf3fc9c137cd2e1a9317bb',NULL,'2020-08-20 20:17:51.124230','2020-08-20 20:17:51.124230'),(6,'$2a$12$lfP73F/JZ4x4NbHOHdVJO.mb4xAcSBcMs3lgaAulPpUvdI9D4zo3O',NULL,NULL,0,NULL,NULL,NULL,NULL,'Darren','Lemke',NULL,NULL,'CanaryAdmin4@Zieme-Mitchell.com',1000,NULL,'b3b577aa1f9e69190a5a974f04032ab501f00baba87b529e06ebbc8c2671',NULL,'2020-08-20 20:17:51.316926','2020-08-20 20:17:51.316926'),(7,'$2a$12$ut8d.5QEzMkuBZ50LG7gYO9fhyAw41xlfB40ff61CoOEUdZlzY7cu',NULL,NULL,0,NULL,NULL,NULL,NULL,'German','Koch',NULL,NULL,'Admin5@Zieme-Mitchell.com',400,NULL,'55240539d50d944891e7b54df452a0292695430cc518919d5a2e6bce7c4a',NULL,'2020-08-20 20:17:51.510173','2020-08-20 20:17:51.510173'),(8,'$2a$12$heAU2Oq6E9O9s5./wZ52v.4OUAhkfEuCmCt7avIXj1ypeRc2P2RYC',NULL,NULL,0,NULL,NULL,NULL,NULL,'Kieth','Doyle',NULL,NULL,'Doctor6@Zieme-Mitchell.com',300,NULL,'cb6105c0dc0234c0018138f2e5d8f6cb077fb063da93b17e3f5dca27d266',NULL,'2020-08-20 20:17:51.703796','2020-08-20 20:17:51.703796'),(9,'$2a$12$emQoHmOiEMA1zTLo8B1esO9yjGwY./cPbmHcPPhlR3GFFNK9mvpTm',NULL,NULL,0,NULL,NULL,NULL,NULL,'Alina','Little',NULL,NULL,'CanaryAdmin7@Zieme-Mitchell.com',1000,NULL,'126f13c49a36604151c3924b9f06875f82ad21f0eebf3ae13711beda9704',NULL,'2020-08-20 20:17:51.897761','2020-08-20 20:17:51.897761'),(10,'$2a$12$0ETHGAnYp77Xm5XFv2ocjeTGIEGsrGlUL/LIT9bH6GiBt1slMsvpy',NULL,NULL,0,NULL,NULL,NULL,NULL,'Vernon','Gaylord',NULL,NULL,'CanaryAdmin8@Zieme-Mitchell.com',1000,NULL,'930c100bb3f1dd571a0540dac230affaf4f53687dcfa11c1bc33f59df718',NULL,'2020-08-20 20:17:52.085986','2020-08-20 20:17:52.085986'),(11,'$2a$12$c6RXxyBMPUTTejzo59VFC.Xm4FCNihdmIar8En9dPDkBmWkdRg4gq',NULL,NULL,0,NULL,NULL,NULL,NULL,'Emile','Stokes',NULL,NULL,'CanaryAdmin9@Zieme-Mitchell.com',1000,NULL,'fd3bd685231cba38c0504d28e567ef34c94c09c62a00e6ec2b3c84ab68b8',NULL,'2020-08-20 20:17:52.273180','2020-08-20 20:17:52.273180'),(12,'$2a$12$8ufDRb/Z6XPvGq/3qzR3lOSSSq3hRtdIl7KDYk7hBtL3In9hckTkG',NULL,NULL,0,NULL,NULL,NULL,NULL,'Lesley','Altenwerth',NULL,NULL,'Nurse0@Wilderman.com',200,NULL,'4c777c467da347721c0451031367bf7fae524ca8526a649a3efbe2f5147a',NULL,'2020-08-20 20:17:52.462993','2020-08-20 20:17:52.462993'),(13,'$2a$12$3spXkU92y2h3ah5PyP7Ece.2NPh5LHxEVcsGSQju1CttqSgmJ63KK',NULL,NULL,0,NULL,NULL,NULL,NULL,'Salvador','Heathcote',NULL,NULL,'Admin1@Wilderman.com',400,NULL,'35b1651f43af58074bd5de1eb8259735cbf057b0acfe3eccd46e5ca40bd5',NULL,'2020-08-20 20:17:52.655348','2020-08-20 20:17:52.655348'),(14,'$2a$12$594AWPVpHc5AWefAgqyS1OhIlPocleh/fQC9V2sNQaVYhfkT339ZC',NULL,NULL,0,NULL,NULL,NULL,NULL,'Cameron','Monahan',NULL,NULL,'Admin2@Wilderman.com',400,NULL,'ef706e82afc48cf496b59a7e49b1b7e5486b5cb80bf737f8fb457e410b2e',NULL,'2020-08-20 20:17:52.846625','2020-08-20 20:17:52.846625'),(15,'$2a$12$1DaB5TWJDEHtWrNKsI1oUOiAv2YwQR4x7PsYj7yeVSiQ3WOAlKFCe',NULL,NULL,0,NULL,NULL,NULL,NULL,'Broderick','Bogisich',NULL,NULL,'Nurse3@Wilderman.com',200,NULL,'fc627c9d515b8bb3fe3b8baca9971dd31357e2746f0b549708283325e2d7',NULL,'2020-08-20 20:17:53.033706','2020-08-20 20:17:53.033706'),(16,'$2a$12$soBqTK8z4wsHE82eRwbgc.wqT4SIY9J.gB/L9ufL.Go8Z7gHspqoe',NULL,NULL,0,NULL,NULL,NULL,NULL,'Merle','Kohler',NULL,NULL,'Therapist4@Wilderman.com',100,NULL,'bf423970a35c5275fffa5f23bd901cb8b524465bb26a8dbe68e6b0b2bfb5',NULL,'2020-08-20 20:17:53.221152','2020-08-20 20:17:53.221152'),(17,'$2a$12$5ulbt3CphK7LOZDsV5dAn.apirANsZyzucmfaaCe5prwXSXrx/UlK',NULL,NULL,0,NULL,NULL,NULL,NULL,'Floy','Huel',NULL,NULL,'Doctor5@Wilderman.com',300,NULL,'32d66f7d28fe001c34dc769cc7b2e13058885bebf68aab6487dc60c763e2',NULL,'2020-08-20 20:17:53.409825','2020-08-20 20:17:53.409825'),(18,'$2a$12$MTc.ICMkVRDido391E6eUeuNKwlDm2t.pjp6E7rA3tUfbAveGvJAy',NULL,NULL,0,NULL,NULL,NULL,NULL,'Clelia','Nitzsche',NULL,NULL,'Therapist6@Wilderman.com',100,NULL,'9170013f9f80bfaf93229eeaaec3edf27a302bd6cb2a71e54925e97ffdc4',NULL,'2020-08-20 20:17:53.604769','2020-08-20 20:17:53.604769'),(19,'$2a$12$fxcH2uPYo6Xy1xyWJTC0VuRWsd0J/0KC/0u8LCWJ3hA8Jh.GZi53a',NULL,NULL,0,NULL,NULL,NULL,NULL,'Shani','Hand',NULL,NULL,'Admin7@Wilderman.com',400,NULL,'bf87b0cbb6c36f6121de29cdd8621da963bd8f4218775ab37a2ae5fa96d9',NULL,'2020-08-20 20:17:53.804712','2020-08-20 20:17:53.804712'),(20,'$2a$12$sMZgJQ10XYEaks2wNwr3DeFGf.edx97L8umdpnPsDdzi1U7snfSOy',NULL,NULL,0,NULL,NULL,NULL,NULL,'Wilber','Jacobs',NULL,NULL,'Admin8@Wilderman.com',400,NULL,'cafc69d5d66417d34fd06ad7a5a414aa5ff597585b2209e06120297c9a1f',NULL,'2020-08-20 20:17:53.992391','2020-08-20 20:17:53.992391'),(21,'$2a$12$Y1Qi2PcbcHrdsgMoSfwEn.ofcXVHe.WRuJVmrwxoHpXTWL88vr44S',NULL,NULL,0,NULL,NULL,NULL,NULL,'Claude','Breitenberg',NULL,NULL,'Admin9@Wilderman.com',400,NULL,'f81cbda02f99ca725eae41954fbc00e47fee765cce6df9dfbe27ececf104',NULL,'2020-08-20 20:17:54.178992','2020-08-20 20:17:54.178992'),(22,'$2a$12$kQPc6d.q4US9DkFb198aNuDvsAgwU6UglnsgwhtOPPMJozdUXxbe6',NULL,NULL,0,NULL,NULL,NULL,NULL,'Lydia','Parker',NULL,NULL,'Admin0@Reilly-Bergstrom.com',400,NULL,'c89ae6c60f94a08d54fdd89ae185e40a0e2945b386bb54c769f52422c401',NULL,'2020-08-20 20:17:54.366941','2020-08-20 20:17:54.366941'),(23,'$2a$12$57Gch4IWgtiUstZ05wucYu/MGv3Uy5lCVg83LMzYRuuEMJr1UYAnq',NULL,NULL,0,NULL,NULL,NULL,NULL,'Lenard','Auer',NULL,NULL,'Doctor1@Reilly-Bergstrom.com',300,NULL,'1ea5d36ca6d2d10e1267a83b8eb01c07290b73692fb3066d1b70f9222fdf',NULL,'2020-08-20 20:17:54.562574','2020-08-20 20:17:54.562574'),(24,'$2a$12$i.i.BxHboMu54cmwbCxUje2Zbf5xkkGOjXBm7kKGQmAwHTp2Ianx2',NULL,NULL,0,NULL,NULL,NULL,NULL,'Leo','Zemlak',NULL,NULL,'Doctor2@Reilly-Bergstrom.com',300,NULL,'adf0983d24112ac55c8fb63515149e2f35f67f3c76cf36c4a0405dfa6bdb',NULL,'2020-08-20 20:17:54.752267','2020-08-20 20:17:54.752267'),(25,'$2a$12$j/ucDsUB2wgGLnXZSoHqHOBgh01VpApIyAQ9fGQldFlbN5OmZWLcy',NULL,NULL,0,NULL,NULL,NULL,NULL,'Cory','Roob',NULL,NULL,'Therapist3@Reilly-Bergstrom.com',100,NULL,'3f31ef5910122866b2d9a5e7f26573f4de931af9298ded79d16c437e8d6f',NULL,'2020-08-20 20:17:54.941917','2020-08-20 20:17:54.941917'),(26,'$2a$12$MKtm5HImV/EOtbwO16pCG.ijm2AUlbGPVSleBK1ceNzWBRrEXcTfS',NULL,NULL,0,NULL,NULL,NULL,NULL,'Rhett','Crona',NULL,NULL,'Nurse4@Reilly-Bergstrom.com',200,NULL,'8953e549d8f64ad239095d633e463f8e1183d4b28cc954f80a2093940d4c',NULL,'2020-08-20 20:17:55.130483','2020-08-20 20:17:55.130483'),(27,'$2a$12$5PDuTTBRr5JM/8zSk778q.38FAN6F9nZlnlq7hahQ0HrJObAZNNki',NULL,NULL,0,NULL,NULL,NULL,NULL,'Roseline','Ryan',NULL,NULL,'Doctor5@Reilly-Bergstrom.com',300,NULL,'cf138163bd7f0262f0418959587e07aaf90e5cbe7d66cf8b7fd4bcb02985',NULL,'2020-08-20 20:17:55.321129','2020-08-20 20:17:55.321129'),(28,'$2a$12$yILASjpsygvx1F/6deRAJu6OSQoxMye9SRLmkLacQapT3TWYn3awS',NULL,NULL,0,NULL,NULL,NULL,NULL,'Randal','Konopelski',NULL,NULL,'CanaryAdmin6@Reilly-Bergstrom.com',1000,NULL,'df326145bc53ff1ab8aa8e2eff7e5661d5eeab59d7c4b9a3df8d7d6c6bfb',NULL,'2020-08-20 20:17:55.512393','2020-08-20 20:17:55.512393'),(29,'$2a$12$MBfHEv3htSjWRiXoJl0zHOmmenFdN/wseYVjVyvvJUaUc0mCahd4a',NULL,NULL,0,NULL,NULL,NULL,NULL,'Ira','Dickinson',NULL,NULL,'Nurse7@Reilly-Bergstrom.com',200,NULL,'afb7fec391b329b6ed8d6cc1e6f1e5a624faac696bdb58b87676c2ecd8bd',NULL,'2020-08-20 20:17:55.702423','2020-08-20 20:17:55.702423'),(30,'$2a$12$x80cAPLW90SNq/zod9vMG./O09l0SuGC/FchsIjtOtH7qJcBrAVze',NULL,NULL,0,NULL,NULL,NULL,NULL,'Mervin','Beahan',NULL,NULL,'CanaryAdmin8@Reilly-Bergstrom.com',1000,NULL,'5816c0095b8362795bdabd0c23c39655a48ff1867b3172dff168e25b752a',NULL,'2020-08-20 20:17:55.889721','2020-08-20 20:17:55.889721'),(31,'$2a$12$T3oLnwULnmxdx03XMth4M.7F4MzBxnxFUJ8qkRKbi5YCQRUOvJJ8.',NULL,NULL,0,NULL,NULL,NULL,NULL,'Ronald','Klocko',NULL,NULL,'Nurse9@Reilly-Bergstrom.com',200,NULL,'3b72bc4e41558909c7b96c489584d4fe9b19767dacadcbf4786e1aed3d31',NULL,'2020-08-20 20:17:56.082988','2020-08-20 20:17:56.082988'),(32,'$2a$12$FJsdkUFchmb64ayPtLg/5ezBLaNaqYFO67hho9CLipUzoTlOIZf/q',NULL,NULL,0,NULL,NULL,NULL,NULL,'Boris','Olson',NULL,NULL,'Therapist0@Hickle.com',100,NULL,'cf1b5338191ab2304c8908e7d02bc2b2d51bdc2e4d742b73fa4dc6530843',NULL,'2020-08-20 20:17:56.271314','2020-08-20 20:17:56.271314'),(33,'$2a$12$AK0ubAEMZ/qKP/iEJRS5leP3CK904mLCnSybg4Ah2rJuPQ2RbofsS',NULL,NULL,0,NULL,NULL,NULL,NULL,'Rena','Conroy',NULL,NULL,'Nurse1@Hickle.com',200,NULL,'5006b42d50154d8b74abb0f36696cc3bd75ec7f35c861804b518456e803c',NULL,'2020-08-20 20:17:56.465161','2020-08-20 20:17:56.465161'),(34,'$2a$12$ZuS1HRZqrhvKu84vuv7CZ.GH15hF63KNOV7XOtg/ScIhzEyl9xgL2',NULL,NULL,0,NULL,NULL,NULL,NULL,'Franklin','Schulist',NULL,NULL,'CanaryAdmin2@Hickle.com',1000,NULL,'a5a92c9d778ceb889facc35b80887ae9e8fdfa925d8a666ce010ee7b49d2',NULL,'2020-08-20 20:17:56.657362','2020-08-20 20:17:56.657362'),(35,'$2a$12$6caLDiC1jwmFvROqvGiB/.6MRhkxc.RjaTI2.8xeDgdz2xsmPIv8K',NULL,NULL,0,NULL,NULL,NULL,NULL,'Tracy','Legros',NULL,NULL,'Doctor3@Hickle.com',300,NULL,'b6fda57028e3f7620048431510fd0f1c1fdc9581663934ebab975c62b0d1',NULL,'2020-08-20 20:17:56.858274','2020-08-20 20:17:56.858274'),(36,'$2a$12$MeiBJoVGdB6ukxd.sjXfreIlYNgl1k5sdIi.QLc.HHE3sSb/0OFwK',NULL,NULL,0,NULL,NULL,NULL,NULL,'Leone','Price',NULL,NULL,'CanaryAdmin4@Hickle.com',1000,NULL,'393cb1583e2456d06dda7e4f98e6db659f33c0ba44c5506bdbbf0c3b4ed5',NULL,'2020-08-20 20:17:57.047100','2020-08-20 20:17:57.047100'),(37,'$2a$12$rL.fQBc8I.hTRu6mn9CRfe..Qgj3qAyysFKZryFZNEDmHMyPV207q',NULL,NULL,0,NULL,NULL,NULL,NULL,'Estelle','Botsford',NULL,NULL,'Doctor5@Hickle.com',300,NULL,'67542e3003a20137eb331c997d1bfdbaa4071785cdca01405333093995c3',NULL,'2020-08-20 20:17:57.234096','2020-08-20 20:17:57.234096'),(38,'$2a$12$SHEBSd6DzGPZMsbgoowng.UxqloKb1vcqxnuFjt7Pussbdfy6gAe2',NULL,NULL,0,NULL,NULL,NULL,NULL,'Max','Kuphal',NULL,NULL,'Admin6@Hickle.com',400,NULL,'5283e84bd5bf5bdde6581d0582316cd126a13bd6f7673b312214d9927f6f',NULL,'2020-08-20 20:17:57.421766','2020-08-20 20:17:57.421766'),(39,'$2a$12$MPQA9u.pL6aFqNWodyPmL.v063hldqKxfF9T8o3BTzfhKK4cAFPHe',NULL,NULL,0,NULL,NULL,NULL,NULL,'Guillermo','Nicolas',NULL,NULL,'Nurse7@Hickle.com',200,NULL,'bfa1a566f8caa5807e82d460fda6d96f924387172192c09d9ec63a5afa6f',NULL,'2020-08-20 20:17:57.617965','2020-08-20 20:17:57.617965'),(40,'$2a$12$lDWdtm4ObyDS7B967wiE.O7EbWKbWYCCLmxyuTRV93y5625SToh82',NULL,NULL,0,NULL,NULL,NULL,NULL,'Santo','Hirthe',NULL,NULL,'Admin8@Hickle.com',400,NULL,'470478d8bfcf0f432f56ae6420bbc7a3eaecc1f7c2bd1849c6d8cd2e799f',NULL,'2020-08-20 20:17:57.810480','2020-08-20 20:17:57.810480'),(41,'$2a$12$VstHfNxpj1/ebXudkfwL9O.vScwyzJu3whrrIS4ggY4OJXrjyAmMe',NULL,NULL,0,NULL,NULL,NULL,NULL,'Nick','Hand',NULL,NULL,'Doctor9@Hickle.com',300,NULL,'312a71c53b679135a8c79e46f387b5c189f2f82ded274f614fd94dbd8ed8',NULL,'2020-08-20 20:17:57.998115','2020-08-20 20:17:57.998115'),(42,'$2a$12$tlcX4H3i65zmLHgYXTE1w.r9kkoodlzOcQv38nwj/oMw7H7UBguV.',NULL,NULL,0,NULL,NULL,NULL,NULL,'Walter','Pfeffer',NULL,NULL,'Nurse0@Hilll-Carroll.com',200,NULL,'f7f94e4fab243e0d9c227a166b18a1682d19ecb8810b5129a8ce09ab26ef',NULL,'2020-08-20 20:17:58.185346','2020-08-20 20:17:58.185346'),(43,'$2a$12$wRRizreXPgkzujYRPFD5q.fdlxIRTffjA67HEMPFpNQXGLchJW.f6',NULL,NULL,0,NULL,NULL,NULL,NULL,'Leilani','Bins',NULL,NULL,'Therapist1@Hilll-Carroll.com',100,NULL,'681079698fcab848a6c743857f775b2cbcb9b8f43611241e51e89c1240e0',NULL,'2020-08-20 20:17:58.374603','2020-08-20 20:17:58.374603'),(44,'$2a$12$UL9unCPnTFW9XVfPE9Jh5OPYMB.uORH1p92dIXq4uVBoD35wQpfJW',NULL,NULL,0,NULL,NULL,NULL,NULL,'Almeta','Herzog',NULL,NULL,'Admin2@Hilll-Carroll.com',400,NULL,'2a6a539a3df5f42bdaafb39f064c73ae745734a7e2d0fe8b11ccde56237c',NULL,'2020-08-20 20:17:58.566438','2020-08-20 20:17:58.566438'),(45,'$2a$12$k36YKl5Q6HJpZIG4af1sVOPUiO73GZSAUe.eFdEYZ419JSk9K5ive',NULL,NULL,0,NULL,NULL,NULL,NULL,'Granville','O\'Kon',NULL,NULL,'Therapist3@Hilll-Carroll.com',100,NULL,'565cb9773a3f8de8979e7359e56e4673f67f2d854ae4717a18eb10ea57a8',NULL,'2020-08-20 20:17:58.760333','2020-08-20 20:17:58.760333'),(46,'$2a$12$tL.UU7CoE7JVP/Dj4W7oFOKf/G/qT10FcJRYirFp9EJS7R7lJma/u',NULL,NULL,0,NULL,NULL,NULL,NULL,'Glen','Schaden',NULL,NULL,'Nurse4@Hilll-Carroll.com',200,NULL,'f516eed6aca4c562e3ef36a04e4bc8da7a03ecfa6325d0c6be5bd88cfad0',NULL,'2020-08-20 20:17:58.950510','2020-08-20 20:17:58.950510'),(47,'$2a$12$KsF2i/yhIKC/nBJlgVZG3u3U86JPa9HCn6QrJYAEAbmhdeyHg6Ple',NULL,NULL,0,NULL,NULL,NULL,NULL,'Dominic','Anderson',NULL,NULL,'Therapist5@Hilll-Carroll.com',100,NULL,'0ec4ef631b7c6251f40b074930b52138f91848106af9db1fc47f9af7f353',NULL,'2020-08-20 20:17:59.136447','2020-08-20 20:17:59.136447'),(48,'$2a$12$cHE0b5974zAdkKDq5clwX.lOy4YGvLByr6QIz2uQAsuIPiCtMVXLC',NULL,NULL,0,NULL,NULL,NULL,NULL,'Malinda','Thiel',NULL,NULL,'CanaryAdmin6@Hilll-Carroll.com',1000,NULL,'e3a87ced80694c3d4ca5bd2022653b53071a4a5898f94ebcb3d76333c575',NULL,'2020-08-20 20:17:59.326091','2020-08-20 20:17:59.326091'),(49,'$2a$12$YydyqBxXNWhSnB9nWGq3D.R1M3M37S6R390I9YunmY7IRRGcNEAze',NULL,NULL,0,NULL,NULL,NULL,NULL,'Christal','Pollich',NULL,NULL,'Doctor7@Hilll-Carroll.com',300,NULL,'996ded0f6aa24442250660032d261be667dc40317fd7d638621144d338b8',NULL,'2020-08-20 20:17:59.521384','2020-08-20 20:17:59.521384'),(50,'$2a$12$wvJRE14O/DdyPivwXG7HwuBB6EIxti8dt7Vdh1wE23SgpgoOc5uFC',NULL,NULL,0,NULL,NULL,NULL,NULL,'Guadalupe','Runolfsdottir',NULL,NULL,'Therapist8@Hilll-Carroll.com',100,NULL,'bbc9b687bee1a4600d10f7700e84a81a4d08931ef19306c088fff08bbe7a',NULL,'2020-08-20 20:17:59.713137','2020-08-20 20:17:59.713137'),(51,'$2a$12$YcxcfH.a8qYrR9WyK49VUesapApbJsp0H7Fgg2uPHzk3Dq6su0fKe',NULL,NULL,0,NULL,NULL,NULL,NULL,'Otto','Lebsack',NULL,NULL,'Therapist9@Hilll-Carroll.com',100,NULL,'e3aec6a79bceae21a61f4376cf5139f525492357eda0447fd06e44567cd5',NULL,'2020-08-20 20:17:59.911608','2020-08-20 20:17:59.911608');
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

-- Dump completed on 2020-08-20 14:18:00
