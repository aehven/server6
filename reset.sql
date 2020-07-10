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
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2020-07-10 17:29:10.110741','2020-07-10 17:29:10.110741'),('schema_sha1','089ac717d72b467e1dd7b9ac9af115663434afd3','2020-07-10 17:29:10.118745','2020-07-10 17:29:10.118745');
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
INSERT INTO `organizations` VALUES (1,0,'Kling Inc',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,6,0,0,'2020-07-10 17:29:12.832386','2020-07-10 17:29:12.874442'),(2,1,'Ortiz, White and Dibbert',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,2,3,1,0,'2020-07-10 17:29:12.839687','2020-07-10 17:29:12.848094'),(3,1,'Sauer, Littel and Leuschke',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,4,5,1,0,'2020-07-10 17:29:12.864595','2020-07-10 17:29:12.874442'),(4,0,'Walter Group',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,12,0,0,'2020-07-10 17:29:12.887443','2020-07-10 17:29:12.928430'),(5,1,'Dickinson, Fay and DuBuque',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,8,9,1,0,'2020-07-10 17:29:12.896672','2020-07-10 17:29:12.906537'),(6,1,'Kutch, West and Nolan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,10,11,1,0,'2020-07-10 17:29:12.919604','2020-07-10 17:29:12.928430'),(7,0,'Jones, Moen and Nitzsche',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,18,0,0,'2020-07-10 17:29:12.941259','2020-07-10 17:29:12.980285'),(8,1,'Kuvalis-Bernhard',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,14,15,1,0,'2020-07-10 17:29:12.949660','2020-07-10 17:29:12.958899'),(9,1,'Sanford, Robel and Herzog',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,16,17,1,0,'2020-07-10 17:29:12.972078','2020-07-10 17:29:12.980285'),(10,0,'Moore, Wunsch and Nader',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,24,0,0,'2020-07-10 17:29:12.993150','2020-07-10 17:29:13.030948'),(11,1,'Schaefer LLC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,20,21,1,0,'2020-07-10 17:29:13.001200','2020-07-10 17:29:13.009802'),(12,1,'Gusikowski-Nikolaus',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,22,23,1,0,'2020-07-10 17:29:13.022454','2020-07-10 17:29:13.030948'),(13,0,'Rodriguez-Bashirian',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,25,30,0,0,'2020-07-10 17:29:13.044058','2020-07-10 17:29:13.082259'),(14,1,'Schaefer-Herzog',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,26,27,1,0,'2020-07-10 17:29:13.052083','2020-07-10 17:29:13.061129'),(15,1,'Daugherty-Daugherty',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,28,29,1,0,'2020-07-10 17:29:13.073375','2020-07-10 17:29:13.082259');
/*!40000 ALTER TABLE `organizations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizations_patients`
--

DROP TABLE IF EXISTS `organizations_patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organizations_patients` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `organization_id` bigint(20) DEFAULT NULL,
  `patient_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_organizations_patients_on_organization_id` (`organization_id`),
  KEY `index_organizations_patients_on_patient_id` (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizations_patients`
--

LOCK TABLES `organizations_patients` WRITE;
/*!40000 ALTER TABLE `organizations_patients` DISABLE KEYS */;
INSERT INTO `organizations_patients` VALUES (1,10,1),(2,10,2),(3,4,3),(4,4,4),(5,4,5),(6,10,6),(7,13,7),(8,1,8),(9,7,9),(10,4,10),(11,10,11),(12,13,12),(13,10,13),(14,7,14),(15,4,15),(16,7,16),(17,4,17),(18,1,18),(19,4,19),(20,13,20),(21,1,21),(22,7,22),(23,7,23),(24,4,24),(25,4,25),(26,4,26),(27,1,27),(28,1,28),(29,4,29),(30,1,30);
/*!40000 ALTER TABLE `organizations_patients` ENABLE KEYS */;
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
INSERT INTO `organizations_users` VALUES (1,1,2),(2,15,2),(3,1,3),(4,2,3),(5,1,4),(6,6,4),(7,1,5),(8,14,5),(9,1,6),(10,2,6),(11,1,7),(12,9,7),(13,1,8),(14,12,8),(15,1,9),(16,15,9),(17,1,10),(18,5,10),(19,1,11),(20,6,11),(21,4,12),(22,3,12),(23,4,13),(24,9,13),(25,4,14),(26,12,14),(27,4,15),(28,5,15),(29,4,16),(30,8,16),(31,4,17),(32,8,17),(33,4,18),(34,14,18),(35,4,19),(36,9,19),(37,4,20),(38,14,20),(39,4,21),(40,5,21),(41,7,22),(42,8,22),(43,7,23),(44,15,23),(45,7,24),(46,15,24),(47,7,25),(48,15,25),(49,7,26),(50,8,26),(51,7,27),(52,5,27),(53,7,28),(54,3,28),(55,7,29),(56,6,29),(57,7,30),(58,3,30),(59,7,31),(60,12,31),(61,10,32),(62,14,32),(63,10,33),(64,8,33),(65,10,34),(66,11,34),(67,10,35),(68,15,35),(69,10,36),(70,14,36),(71,10,37),(72,11,37),(73,10,38),(74,9,38),(75,10,39),(76,9,39),(77,10,40),(78,6,40),(79,10,41),(80,5,41),(81,13,42),(82,12,42),(83,13,43),(84,3,43),(85,13,44),(86,8,44),(87,13,45),(88,9,45),(89,13,46),(90,5,46),(91,13,47),(92,8,47),(93,13,48),(94,2,48),(95,13,49),(96,14,49),(97,13,50),(98,14,50),(99,13,51),(100,5,51);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (1,'Carry','Will','gaston_steuber@harvey.com','169.492.1783 x86754','646 Ziemann Circles','Apt. 919','Deeburgh','Rhode Island','42654','USA','1942-10-23 00:00:00','2020-05-11 00:00:00'),(2,'Marcelina','Carter','jamal@hermiston-mueller.com','1-718-881-1923 x369','1185 Sherie Plains','Apt. 475','Thadland','Alaska','66514-6374','USA','1967-07-02 00:00:00','2020-04-16 00:00:00'),(3,'Jackie','Mann','jenee@ankunding.org','1-870-876-0305','1553 Doreen Plains','Suite 537','Dareport','Michigan','17714','USA','1984-11-01 00:00:00','2020-01-21 00:00:00'),(4,'Tana','Stoltenberg','oliver_vonrueden@murray-jerde.name','1-873-405-2107','58490 Zane Neck','Apt. 471','East Blair','Texas','19553-3774','USA','1941-10-17 00:00:00','2020-02-02 00:00:00'),(5,'Carson','Runte','jenny.reilly@king.org','405-369-9280 x8566','199 Nannette Route','Apt. 200','North Lanetteburgh','Montana','84546','USA','1999-10-07 00:00:00','2020-03-29 00:00:00'),(6,'Helene','Walsh','curt@lueilwitz.name','942.723.2359 x13417','66347 Queen Turnpike','Apt. 731','North Genevashire','Colorado','59362-5095','USA','1999-09-23 00:00:00','2020-04-17 00:00:00'),(7,'Simon','Kirlin','theron_mann@senger-witting.co','980-589-5916 x001','5201 Jong Isle','Suite 734','Port Ozellfort','Idaho','06400-4037','USA','1939-10-09 00:00:00','2020-06-10 00:00:00'),(8,'Janee','Rath','neil@paucek-klein.com','1-965-138-6073 x143','81251 Bayer Ramp','Suite 123','Lorindatown','Nevada','74937-0181','USA','1981-06-04 00:00:00','2020-01-30 00:00:00'),(9,'Chana','Mueller','madlyn.lindgren@kling-trantow.info','1-211-527-2500','10545 Hoeger Ways','Suite 985','West Melody','Illinois','57168-9283','USA','1991-02-14 00:00:00','2020-02-20 00:00:00'),(10,'Mickey','Schimmel','joan.bogan@schiller-okon.net','(578) 787-6990 x53592','398 Bahringer Forest','Apt. 362','East Joelburgh','South Dakota','57962-0245','USA','1995-08-02 00:00:00','2020-05-07 00:00:00'),(11,'Iliana','Weimann','debby@dibbert-parisian.net','134-643-4860','65423 Cameron Center','Apt. 582','South Fredrickview','New Hampshire','06250-8784','USA','1989-10-11 00:00:00','2020-02-20 00:00:00'),(12,'Modesto','Nikolaus','basil_schimmel@wisozk.io','1-610-168-4602 x5014','5349 Tamela Square','Suite 297','Lelandhaven','Massachusetts','51962-3551','USA','1933-11-12 00:00:00','2020-03-29 00:00:00'),(13,'Ettie','Moore','jamey@bosco.org','1-647-263-4544 x4152','27135 Johns Pass','Apt. 989','Arronfurt','Georgia','84835-6540','USA','1981-07-29 00:00:00','2020-02-18 00:00:00'),(14,'Maybell','Mills','marco@williamson.io','(917) 376-5016','3070 Cary Inlet','Suite 623','Lowebury','Mississippi','01867','USA','1938-02-15 00:00:00','2020-02-26 00:00:00'),(15,'Zora','Quitzon','ivan@fritsch-okeefe.org','692-567-1692 x8654','4372 Cummerata Center','Apt. 919','Cummeratafurt','North Dakota','46070-9769','USA','1975-12-11 00:00:00','2020-04-14 00:00:00'),(16,'Georgina','Ebert','sally@gerlach.com','985.058.8513','330 Carita Square','Apt. 773','South Wilfredo','Kentucky','08584-3958','USA','1984-11-16 00:00:00','2020-01-23 00:00:00'),(17,'Josphine','Mayert','chas_lang@ruecker-kozey.biz','1-198-353-4731','86613 Matthew Run','Apt. 129','Rippinstad','Rhode Island','54937','USA','1943-05-14 00:00:00','2020-03-09 00:00:00'),(18,'Edward','Borer','nathanial@littel-kiehn.net','603-162-0808 x768','74509 Ritchie Lock','Suite 878','Lake Lilibury','New York','31054','USA','1962-11-29 00:00:00','2020-03-05 00:00:00'),(19,'Mafalda','Volkman','omer@hackett.net','(375) 463-8452 x1349','84555 Julio Knoll','Apt. 528','West Leola','Alabama','29063-4014','USA','1972-05-22 00:00:00','2020-04-29 00:00:00'),(20,'Charles','Greenfelder','keshia_leuschke@oreilly.com','(822) 594-3655 x9070','81372 Dee Loop','Suite 492','Shanekahaven','Nevada','31699-2171','USA','1984-09-08 00:00:00','2020-04-28 00:00:00'),(21,'Keshia','Schaefer','lili_fritsch@hills.biz','(964) 217-1294 x697','9457 Jeffrey Roads','Suite 790','North Kenny','Alabama','22444','USA','1945-10-06 00:00:00','2020-01-30 00:00:00'),(22,'Layla','Lakin','staci_kessler@damore-huels.io','443-543-2858 x09962','96133 Francesca Green','Apt. 114','Goyettetown','Nevada','88859-0530','USA','1934-08-17 00:00:00','2020-02-27 00:00:00'),(23,'Erich','Brekke','danielle@kerluke-dietrich.com','(705) 358-0610 x95499','7302 Wiza Shoal','Suite 722','East Jaspermouth','Michigan','39151','USA','1931-09-08 00:00:00','2020-01-13 00:00:00'),(24,'Illa','Schmeler','rozella.gutmann@nitzsche.name','1-310-332-4789 x6046','282 Wyman Manors','Apt. 207','Simonafort','South Carolina','08584-4439','USA','1977-01-15 00:00:00','2020-05-24 00:00:00'),(25,'Hui','Kautzer','reynalda@langosh-halvorson.com','645.001.3895 x88258','889 Aileen Pike','Apt. 860','North Adrianna','Rhode Island','44150','USA','1982-02-07 00:00:00','2020-05-14 00:00:00'),(26,'Virgen','Schroeder','camille.hoeger@buckridge.net','779.434.0817 x58352','24861 Cleora Lodge','Suite 274','West Parisshire','North Carolina','65272-6193','USA','1965-04-14 00:00:00','2020-05-12 00:00:00'),(27,'Candance','Predovic','chad@gleason.org','432.365.0242 x0120','790 Hector Parkway','Suite 647','Erlindahaven','North Dakota','04886-5661','USA','1937-05-08 00:00:00','2020-05-08 00:00:00'),(28,'Kasey','Dietrich','soraya_macgyver@wiegand-bauch.info','529.217.7823 x0113','35488 Schuppe Port','Suite 974','Mosciskifurt','Arizona','65881','USA','1984-11-20 00:00:00','2020-02-10 00:00:00'),(29,'Latoria','Pollich','karri.hintz@predovic.io','272-534-5132 x928','430 Guy Field','Suite 917','South Edmund','Kansas','49214-1873','USA','1952-08-04 00:00:00','2020-05-18 00:00:00'),(30,'Maurice','Doyle','santo@romaguera.com','(551) 542-4121 x40422','25387 Marcene Greens','Suite 719','South Sergio','Idaho','70127','USA','1990-06-14 00:00:00','2020-03-31 00:00:00');
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients_users`
--

LOCK TABLES `patients_users` WRITE;
/*!40000 ALTER TABLE `patients_users` DISABLE KEYS */;
INSERT INTO `patients_users` VALUES (1,1,36),(2,2,35),(3,3,14),(4,4,19),(5,5,19),(6,6,36),(7,7,44),(8,8,8),(9,9,31),(10,10,19),(11,11,35),(12,12,45),(13,13,35),(14,14,26),(15,15,19),(16,16,31),(17,17,14),(18,18,2),(19,19,20),(20,20,45),(21,21,11),(22,22,26),(23,23,30),(24,24,20),(25,25,12),(26,26,21),(27,27,10),(28,28,8),(29,29,14),(30,30,10);
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
INSERT INTO `test_plans_tests` VALUES (1,1,1,10),(2,3,1,15),(3,5,1,20),(4,4,1,25);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests`
--

LOCK TABLES `tests` WRITE;
/*!40000 ALTER TABLE `tests` DISABLE KEYS */;
INSERT INTO `tests` VALUES (1,'Squats'),(2,'Walking'),(3,'Jumping Jacks'),(4,'Lunges'),(5,'Stairs Up'),(6,'Stairs Down'),(7,'Stairs');
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
INSERT INTO `users` VALUES (1,'$2a$12$Yw/Zz/hVbZF9jTBRHYlkhen1DpOchB5xBwcFqzRtk.AeiKvd1NLL6',NULL,NULL,0,NULL,NULL,NULL,NULL,'Roger','Waters',NULL,NULL,'admin@null.com',1000,NULL,'fffe79b18c841dbf2aa752f1ceac468aa499275ccaba10543693d0e454a0',NULL,'2020-07-10 17:29:12.621746','2020-07-10 17:29:12.621746'),(2,'$2a$12$ombPm9Vnv3hFx.IY85ESnu83Z0H8tuAr3cpZ1WOYECohVicuKKgHC',NULL,NULL,0,NULL,NULL,NULL,NULL,'Carey','Kautzer',NULL,NULL,'erick_gerlach@zulauf.biz',300,NULL,'afee06d605a5c6d775e48dc706eb8d5c58269a899db6f5127b956444cd8c',NULL,'2020-07-10 17:29:13.345525','2020-07-10 17:29:13.345525'),(3,'$2a$12$3HswLvO3hPg/ftzb32JJ2..VfJf08w1OthnV2hksGm6ks13DJsNFG',NULL,NULL,0,NULL,NULL,NULL,NULL,'Brynn','Brekke',NULL,NULL,'karen_kirlin@oberbrunner.net',100,NULL,'ebe5403267f76c463986ad2a7f562a66bff3f9d208e18ab86be9a40d5a0f',NULL,'2020-07-10 17:29:13.593209','2020-07-10 17:29:13.593209'),(4,'$2a$12$aZ5cYGLSiNIcFL9av3SWEOcx7OfIUbUp7YI6TOhf2XAGC.r5On0je',NULL,NULL,0,NULL,NULL,NULL,NULL,'Zola','Wisoky',NULL,NULL,'rudolph.harris@cormier-reichel.info',1000,NULL,'27ce18edfc7e97ba3cea8efe08c4fcbfe490e8cb103c553193e6060d5ab0',NULL,'2020-07-10 17:29:13.842511','2020-07-10 17:29:13.842511'),(5,'$2a$12$Czf2ymu3e3jqLtOuG1Hw5OpxkSbCTMTwy2pL4YhfsgsnI9Z6bD4da',NULL,NULL,0,NULL,NULL,NULL,NULL,'Freeman','Pfeffer',NULL,NULL,'scotty_blanda@sauer.co',1000,NULL,'6ca6316e8eb4feb87a3b6b6b1602d37a904f50d74e5c37707c314fd3fab6',NULL,'2020-07-10 17:29:14.096692','2020-07-10 17:29:14.096692'),(6,'$2a$12$MRWMxt2ueoBHpMURZ9TEXeewxhKQBjw/QKHCaVqJhiDP9udnbTovW',NULL,NULL,0,NULL,NULL,NULL,NULL,'Erinn','Willms',NULL,NULL,'philomena@kerluke-halvorson.net',200,NULL,'a781abb0ab4c8204e60fb8d7fc105b558c1962790a38bf498e1267270216',NULL,'2020-07-10 17:29:14.334708','2020-07-10 17:29:14.334708'),(7,'$2a$12$qAkqV7JLFL7gAJX6h8e0h.MY53ldjDigsOTZBDNR8NV2knYbIs5A.',NULL,NULL,0,NULL,NULL,NULL,NULL,'Stefani','Buckridge',NULL,NULL,'venita_shanahan@gaylord.com',100,NULL,'1502493ad9396b6d417cfb38d43e9cbd28feecf3044399e583b135daaab0',NULL,'2020-07-10 17:29:14.584292','2020-07-10 17:29:14.584292'),(8,'$2a$12$Xigm5he1jP5/Acy/NvolgOol26I1aRNTmwLatRI3sVdBvG4OSxCZi',NULL,NULL,0,NULL,NULL,NULL,NULL,'Avery','Wisoky',NULL,NULL,'nathan@bogan-satterfield.name',300,NULL,'09d5bdc993418abfb0d798d4af4e860e68af7384dc964f101b6e9f56398d',NULL,'2020-07-10 17:29:14.818717','2020-07-10 17:29:14.818717'),(9,'$2a$12$kqEDGXLJ16islf/xTYME7u4Cy87OeTMC.toCV8jkmzbRh1wCQ2Tiq',NULL,NULL,0,NULL,NULL,NULL,NULL,'Griselda','Larson',NULL,NULL,'florencia.koss@streich-becker.com',300,NULL,'d1a2b0f795ab21209e20215e10092441f16b1ae48f46345815d0cf399627',NULL,'2020-07-10 17:29:15.056722','2020-07-10 17:29:15.056722'),(10,'$2a$12$Wr9yoTigFpp9Rb/6kOJtyO9V/WWoNBg..CyZrzENlyBm1U3Tb8Olm',NULL,NULL,0,NULL,NULL,NULL,NULL,'Marcel','Beatty',NULL,NULL,'jeanice.pagac@rohan-roberts.net',300,NULL,'b312e0e8f9efa836a76308ff2e0682b710285fd5001a9e81a0e31671126a',NULL,'2020-07-10 17:29:15.318816','2020-07-10 17:29:15.318816'),(11,'$2a$12$gcHlk2/Is0L9yAUwPqMx9.8fCMFdDz20iZG04DV6FTGSUztp8Joie',NULL,NULL,0,NULL,NULL,NULL,NULL,'Caroline','Zieme',NULL,NULL,'sallie_hettinger@erdman.biz',300,NULL,'40ae3d04bfb4d8e12d89a89939ba0dd69476e317f750e6e0e125b80a1a44',NULL,'2020-07-10 17:29:15.558588','2020-07-10 17:29:15.558588'),(12,'$2a$12$.IY6Qjhjm6yjsiwtc/bwUex4H1kf38akNrk.KMlUfz8.WbAtVpbnK',NULL,NULL,0,NULL,NULL,NULL,NULL,'Loris','Koepp',NULL,NULL,'irving_heller@schiller.name',300,NULL,'392d5af3ff584b6b3b801e8e036dc09cc4ecc12aa53a0bb1edc7f86785ed',NULL,'2020-07-10 17:29:15.793102','2020-07-10 17:29:15.793102'),(13,'$2a$12$eOka7mpJG.B5n/aqav709uNgTUnB4/hk36EaBE6RoDdH9pGdV9itO',NULL,NULL,0,NULL,NULL,NULL,NULL,'Brinda','Dooley',NULL,NULL,'erin.ohara@langosh-kuhic.org',100,NULL,'a522beb7324d46c9c1aaacbf325bbb1f6e98e32e33b2e144ed3bc2c89d9e',NULL,'2020-07-10 17:29:16.037105','2020-07-10 17:29:16.037105'),(14,'$2a$12$UZkrEYKM5cj50SqmOrUW0eKaJW0MhyU94d6GanvicPeYG0AHbsNzu',NULL,NULL,0,NULL,NULL,NULL,NULL,'Hipolito','Lueilwitz',NULL,NULL,'orpha@buckridge-jacobi.biz',300,NULL,'f428a0c9bb140dc59c4191f452dd0a1078e92c4a1ded36ac926f28dd686a',NULL,'2020-07-10 17:29:16.268790','2020-07-10 17:29:16.268790'),(15,'$2a$12$kusZh5Maa0jaDWF7x9IFkObI5ZxHJ23mNdMcHizmF1W/J6Or7MHTS',NULL,NULL,0,NULL,NULL,NULL,NULL,'Bennett','Crona',NULL,NULL,'dede@stiedemann-vonrueden.com',1000,NULL,'660b201e53c73e08afb2fce3e8c0d9bb6dd1468852dea34c1f0c5c937320',NULL,'2020-07-10 17:29:16.502455','2020-07-10 17:29:16.502455'),(16,'$2a$12$8Pj2Au/qAUF4hhuMct/twurf28eP0xBB8mmOvMgwMhSeW98Dl9SHO',NULL,NULL,0,NULL,NULL,NULL,NULL,'Rupert','Herman',NULL,NULL,'delmer@johnson.biz',100,NULL,'871f9c6b4a3e5e9145ddc577f7c671876350b51f5e0901c409a02fe18b27',NULL,'2020-07-10 17:29:16.727876','2020-07-10 17:29:16.727876'),(17,'$2a$12$QpOcLg6m.BVR7ZPInTGvqebJ2/OE5STrKp7j6pVmGYHSDI9hOuJb.',NULL,NULL,0,NULL,NULL,NULL,NULL,'Maegan','Powlowski',NULL,NULL,'joe.ledner@purdy.com',300,NULL,'8efed45742b09be4d221b4df30bbab4c53687863d17f4a69c18065f1d037',NULL,'2020-07-10 17:29:16.957548','2020-07-10 17:29:16.957548'),(18,'$2a$12$zm28QAAFZ2q46dw8.Wprv.fb1JcRFYdd3k7G6ol/nRTpaC/qP25Su',NULL,NULL,0,NULL,NULL,NULL,NULL,'Laurie','Green',NULL,NULL,'mavis@auer.info',300,NULL,'a9c2496c2db53c99e7697c900d1cce9e98f9435a41347f0018341ec4f9f6',NULL,'2020-07-10 17:29:17.191024','2020-07-10 17:29:17.191024'),(19,'$2a$12$dGgrCt0HWG1n3GjbJ.27m.uGGz/WSk5JeitgKDDLOpYgCQD7xB4Ci',NULL,NULL,0,NULL,NULL,NULL,NULL,'Alyce','Walter',NULL,NULL,'rashad@schumm-wisozk.biz',300,NULL,'839a540435f42dbfafb014b0d54d2b3b9cef24aed324eaa5f88d74e6c65d',NULL,'2020-07-10 17:29:17.411644','2020-07-10 17:29:17.411644'),(20,'$2a$12$IpdQYP2m7waS.6SHyhBQgu7oJUbd/KAKXajunGH5GbPiXYqi6J.jC',NULL,NULL,0,NULL,NULL,NULL,NULL,'Harlan','Bartell',NULL,NULL,'lizabeth@welch-batz.biz',300,NULL,'f9cdc71ceb3de129146e603cbaeb572cccbbd8dc69095525607f91f7dc55',NULL,'2020-07-10 17:29:17.631014','2020-07-10 17:29:17.631014'),(21,'$2a$12$0eLqlR7I7T0IIRPCDMQ5p.EGCU7juJto3u.lD.uxseTZtjgmSDqaa',NULL,NULL,0,NULL,NULL,NULL,NULL,'Simon','Ryan',NULL,NULL,'sharell.cronin@hansen.co',300,NULL,'9c09ee5dc238887530c9a2bfc06c4ef90108cb35279bcc344605b6601c78',NULL,'2020-07-10 17:29:17.865648','2020-07-10 17:29:17.865648'),(22,'$2a$12$as7.gWCtghI183O7toqLv.0.rMQxF5l6BKTF3HhLeh2swkhVBKLSG',NULL,NULL,0,NULL,NULL,NULL,NULL,'Dominque','Hessel',NULL,NULL,'annetta@morissette-wolf.info',200,NULL,'096d1967b810b8da1f4262814f2235e24a1f2449524b7bb4f826d8c07414',NULL,'2020-07-10 17:29:18.110339','2020-07-10 17:29:18.110339'),(23,'$2a$12$jjKsPMrVRiOrmrdkUKHdg.6qRZHYYJ0Fz4Y6fhSpMGQ70Y52ZJWZO',NULL,NULL,0,NULL,NULL,NULL,NULL,'Rocco','Johns',NULL,NULL,'willis.halvorson@spinka.com',200,NULL,'78a81334cc487bf775285f915fe84160ca6c4778b54bdc911e63605ec6b7',NULL,'2020-07-10 17:29:18.340156','2020-07-10 17:29:18.340156'),(24,'$2a$12$Idp0xPIpiCUKPxMuvbMkAOc9Z7yiYSPAVIsS9IfEmyNYblvTg8iiC',NULL,NULL,0,NULL,NULL,NULL,NULL,'Denice','Welch',NULL,NULL,'oswaldo@heidenreich.net',1000,NULL,'1be50787e13eda4553117a95da2bb02576abc37f2537f6b1239ee46c7399',NULL,'2020-07-10 17:29:18.567252','2020-07-10 17:29:18.567252'),(25,'$2a$12$4GIlrKIiRmBJNW8ymp0rK.L/pgoIeTt5wvhiqgNwMN2U2B10HQvxK',NULL,NULL,0,NULL,NULL,NULL,NULL,'Alberto','Luettgen',NULL,NULL,'merle@stiedemann.io',200,NULL,'36f197bc71a9f372a526673793ba33d2a2671f59f80db3f67a210957103f',NULL,'2020-07-10 17:29:18.800545','2020-07-10 17:29:18.800545'),(26,'$2a$12$z//e8E9VRI4k/e/ui.Ex0e3XTcr9Ig6O4lfzI2IXHO71hwKjtQHVS',NULL,NULL,0,NULL,NULL,NULL,NULL,'Jonas','Carter',NULL,NULL,'jamel.volkman@leannon.com',300,NULL,'87d6914422d0c4644df210af51d33d8f41e36b5e37d73d836558000bf8a4',NULL,'2020-07-10 17:29:19.040936','2020-07-10 17:29:19.040936'),(27,'$2a$12$RIUfgU4RlMLFPJ/hV/24QuNJvhZR4SSM6QuPfKEBXz9reaQVaICi.',NULL,NULL,0,NULL,NULL,NULL,NULL,'Rodrick','Rutherford',NULL,NULL,'nia@hartmann.com',100,NULL,'b32f0ebc954a9d0050d36610fe20089805f45e7c56badcef4d5c40c0a5d3',NULL,'2020-07-10 17:29:19.284660','2020-07-10 17:29:19.284660'),(28,'$2a$12$fYUv.QgEjtGOmrkUmvTdFOUFY/ija6s2ZTE9rs0NBJRmv6/OteO7C',NULL,NULL,0,NULL,NULL,NULL,NULL,'Ozzie','Yundt',NULL,NULL,'fabian@okuneva.com',300,NULL,'7bf1c85574755964fbb77ca8e6819515fb444b5bf23618830e96db96e5e8',NULL,'2020-07-10 17:29:19.517186','2020-07-10 17:29:19.517186'),(29,'$2a$12$yVi2BcQkCgeVt1u/4.fSA.n7gsFE/U0SNnmklz0wVZdERmk5yCgca',NULL,NULL,0,NULL,NULL,NULL,NULL,'Myriam','Kovacek',NULL,NULL,'fidel.hyatt@langosh.io',1000,NULL,'861e58a87cfa9cba3b73d67662040e2fe157f862de81b403add779c2a1f5',NULL,'2020-07-10 17:29:19.751993','2020-07-10 17:29:19.751993'),(30,'$2a$12$rqZJmdNwxDgfNZotFYhhE.eMCr9lPGVgeV9.Ms6p8PHbo7FKmiZca',NULL,NULL,0,NULL,NULL,NULL,NULL,'Stephen','Wolff',NULL,NULL,'season@west.biz',300,NULL,'23db842ef8dbad1b121edc6d44094c984de0b188a6a3ba1b49ff692e143d',NULL,'2020-07-10 17:29:19.991857','2020-07-10 17:29:19.991857'),(31,'$2a$12$ms4GrsHOWEa6TOlqGrlEDeDtotyagIwvrNICKzoo0nBbjD54hx4Qe',NULL,NULL,0,NULL,NULL,NULL,NULL,'Merrill','Harber',NULL,NULL,'moshe@roob.org',300,NULL,'82cd29f5035247d6beb3bb7415c25ef5ff302b37190395366fb26e8b6501',NULL,'2020-07-10 17:29:20.236130','2020-07-10 17:29:20.236130'),(32,'$2a$12$AfYAFLBa9BmIuQx0VX2I8um9lKXW9/4JinDLi8JbIe1bmthl1mmJm',NULL,NULL,0,NULL,NULL,NULL,NULL,'Antone','Fritsch',NULL,NULL,'cedric_little@haag-jast.info',300,NULL,'408c2cfcfa8896fa5e89877c08958a3b4028f7b9b49d494604931cd946db',NULL,'2020-07-10 17:29:20.452704','2020-07-10 17:29:20.452704'),(33,'$2a$12$xkCoNgWCgrVsMLZRpPg/KencV.ZspLQmP1eoK/67ukelOu2.x./su',NULL,NULL,0,NULL,NULL,NULL,NULL,'Mayola','Parker',NULL,NULL,'jacqueline.schiller@davis.com',100,NULL,'8c6079b39349e2168ddd378fbe162e6ebe5d81ea776fd74f4b2f6ead3f66',NULL,'2020-07-10 17:29:20.660416','2020-07-10 17:29:20.660416'),(34,'$2a$12$rqbk4L2P19jxN8LJfDLb..xkCf7.iOC/AlH8JArrWFRPO8tkM4sMu',NULL,NULL,0,NULL,NULL,NULL,NULL,'Apryl','Reichel',NULL,NULL,'chester.davis@casper.name',100,NULL,'9eed062cce4130945462e7a93d275ad1e689d9a6a54ef980f19d7daa9522',NULL,'2020-07-10 17:29:20.885880','2020-07-10 17:29:20.885880'),(35,'$2a$12$3GqoxwNsm1.TaKb7m0lshObUF1CfldSVqecQMQ.8GvaC1zU5.Wfu6',NULL,NULL,0,NULL,NULL,NULL,NULL,'Ellan','Thiel',NULL,NULL,'gene_little@torphy.com',300,NULL,'d5181e7dcb78a4a27ec11d0c2f1cda6bc4a1ec1dc6a6daf9afa28600853c',NULL,'2020-07-10 17:29:21.116185','2020-07-10 17:29:21.116185'),(36,'$2a$12$QFeVcmDG9B7SWCtAe0bNDeL54VvW/JzqcO7LIOmzmGTl.owFXINZW',NULL,NULL,0,NULL,NULL,NULL,NULL,'Robt','Lind',NULL,NULL,'francis@hudson.name',300,NULL,'c0b58408b05c590a0552f84ad9e549b736c6dc7ef950739f050028cdd0a4',NULL,'2020-07-10 17:29:21.355294','2020-07-10 17:29:21.355294'),(37,'$2a$12$Rycf25lqy7x0lJHkadJaN.2EoQIlBl8F1YQZWioFEKq.yqqQsgk.K',NULL,NULL,0,NULL,NULL,NULL,NULL,'Chad','Halvorson',NULL,NULL,'flo_krajcik@jakubowski-terry.com',1000,NULL,'9399d4819477b83f59e8052d30d432806601b0703a14d4f287dd2b68b119',NULL,'2020-07-10 17:29:21.575824','2020-07-10 17:29:21.575824'),(38,'$2a$12$j1a6PL8GARMxxAEJmMiGpOweAx7G/mkJ7tSMhSOuP9XgMxf9Q16j.',NULL,NULL,0,NULL,NULL,NULL,NULL,'Carson','Spencer',NULL,NULL,'richie@konopelski.org',100,NULL,'f63f2c10947f9deb6312b4b0c1b0d8e54ebb6473249ad9e23ec41407af0d',NULL,'2020-07-10 17:29:21.791111','2020-07-10 17:29:21.791111'),(39,'$2a$12$algOgTuYeWnKV0u6KpgWAu14saiPqvbwck1zOQj0E3ktdFx3Iq2N6',NULL,NULL,0,NULL,NULL,NULL,NULL,'Shakia','Johnston',NULL,NULL,'richie.stamm@pacocha.co',1000,NULL,'381c295c2acf4be58c1c0444ccc93dca0faab9794052ecc374ff8d97de5e',NULL,'2020-07-10 17:29:22.020842','2020-07-10 17:29:22.020842'),(40,'$2a$12$FpLdJdWTsCp4QDl1ilSq9OHeq1G9xhuDvaQDSYuqPSZnFMt9YZDG6',NULL,NULL,0,NULL,NULL,NULL,NULL,'Kent','Waters',NULL,NULL,'rodolfo@carter.co',100,NULL,'beee2aa9e3b882a13a10757a6a9a4f80a61dff1e958e42a7ddb4121a20e3',NULL,'2020-07-10 17:29:22.253338','2020-07-10 17:29:22.253338'),(41,'$2a$12$6VXudYGMAmFU3Jjwa6xwMem5kEtHfFc3ryWqn5g/1VjS1B9uJ3CZu',NULL,NULL,0,NULL,NULL,NULL,NULL,'Maranda','Kemmer',NULL,NULL,'felix@dubuque.com',200,NULL,'436c22dcf947f55061bf733f8ee9f7d63694800f43fd6ffe4ef7ad267837',NULL,'2020-07-10 17:29:22.486585','2020-07-10 17:29:22.486585'),(42,'$2a$12$TPNx7oAV.7MlZYOhW28WbeIBWusul0E6qqB4trMQ1CWEvKo.aWrkC',NULL,NULL,0,NULL,NULL,NULL,NULL,'Dana','Borer',NULL,NULL,'carmelo_larson@leffler-kling.info',300,NULL,'2e027c32ee9a4aef749b3257cda352db0b9f69f0df07b9116fa8f2c39c54',NULL,'2020-07-10 17:29:22.686890','2020-07-10 17:29:22.686890'),(43,'$2a$12$XV25ba3srVz1S9ZftW8hbeSfqwwQNK6OrQEdeG034S81yL2CIcLdK',NULL,NULL,0,NULL,NULL,NULL,NULL,'Randell','Wolff',NULL,NULL,'philip.monahan@corwin.biz',100,NULL,'0113d4d49a63fdd24d8ddb6baeb178388b008e83abe1e448aebfe311deb1',NULL,'2020-07-10 17:29:22.885437','2020-07-10 17:29:22.885437'),(44,'$2a$12$KAu6pJE2Z2vV43ii0T20cuPjKoaWTVuUDDQS9v5KL5rI4ZIDZHeEO',NULL,NULL,0,NULL,NULL,NULL,NULL,'Roxann','Hagenes',NULL,NULL,'pearlene@oreilly-rohan.co',300,NULL,'704cc530fb861dcfd5b0a465ce6bda6615eec0fd952123fea387c6c1d0ce',NULL,'2020-07-10 17:29:23.083762','2020-07-10 17:29:23.083762'),(45,'$2a$12$/gekOcX/xgbNsJXEbeMISeoyUVH9fvY6tbTUst2c2V1JZ6hC.pttO',NULL,NULL,0,NULL,NULL,NULL,NULL,'Jewell','Howe',NULL,NULL,'ashanti.gerlach@streich-borer.info',300,NULL,'c937fd13467ff18a6736925313eab6b48c9f84c9df88c0f1597047c02752',NULL,'2020-07-10 17:29:23.281597','2020-07-10 17:29:23.281597'),(46,'$2a$12$w95IycaN9L3S8bvTj/i7CO6zh4ct06LcvMrwV/2yxx6W9Xw15uZ9a',NULL,NULL,0,NULL,NULL,NULL,NULL,'Donnie','Powlowski',NULL,NULL,'michal@nienow-romaguera.org',200,NULL,'943545143036f03e752e9556709cc6cf2a543ae55ced8888f51a924ca3df',NULL,'2020-07-10 17:29:23.504492','2020-07-10 17:29:23.504492'),(47,'$2a$12$f8EiujqCvio6uhI0SfOCQegvm5VZHjq4YGR2/SAUbPUDlzKZDnb1e',NULL,NULL,0,NULL,NULL,NULL,NULL,'Malik','Kuhn',NULL,NULL,'sima.reilly@johnston.biz',300,NULL,'0a10c13ca8ba18d906d74e85b3363c3fe14996ca28ea864813a663b472ab',NULL,'2020-07-10 17:29:23.703788','2020-07-10 17:29:23.703788'),(48,'$2a$12$NU3G5LfPGaA/YDwFzOPKOurLJg.4Z/Kv5it2oxjYz8BxnsA7MRRFy',NULL,NULL,0,NULL,NULL,NULL,NULL,'Art','Hudson',NULL,NULL,'rhiannon@gutmann-dickinson.com',200,NULL,'45f9995ce5fe083958a1d4baa8268c478d9ed677bf0b344097eaa1b3d386',NULL,'2020-07-10 17:29:23.904279','2020-07-10 17:29:23.904279'),(49,'$2a$12$t/ICAE2yut0mS7oKcCK7KOj8hHrTKo/TfaJZqfYoiiNwm2iTPhLna',NULL,NULL,0,NULL,NULL,NULL,NULL,'Berenice','Dibbert',NULL,NULL,'ela@treutel-durgan.com',1000,NULL,'8d490605cc9bb2e58117c9898c9ff0df69e03e3d2277511e0092bf836106',NULL,'2020-07-10 17:29:24.104455','2020-07-10 17:29:24.104455'),(50,'$2a$12$EW6PIa87HonsozvChVF35eL38jfWmJ2HTnC.g9n1.qH.RSlxApjV6',NULL,NULL,0,NULL,NULL,NULL,NULL,'Antionette','Davis',NULL,NULL,'devon@harvey.biz',100,NULL,'1df8c38a3ccd0503c77b29888a6218eb853e7d235650a8fb4a223d4bfad5',NULL,'2020-07-10 17:29:24.302133','2020-07-10 17:29:24.302133'),(51,'$2a$12$CWeE8fepqD4UTaLwomkLjOJ9j5Qp61QTdw5f.NtNZlMiSshqt4py.',NULL,NULL,0,NULL,NULL,NULL,NULL,'Shannon','Thompson',NULL,NULL,'jospeh@kuhn.org',200,NULL,'bf6d339859bbd88c013910d5be4dcde4eaf76e527e72d250bbf22f319ff4',NULL,'2020-07-10 17:29:24.502318','2020-07-10 17:29:24.502318');
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

-- Dump completed on 2020-07-10 11:29:24
