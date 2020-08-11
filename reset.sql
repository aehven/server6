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
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2020-08-11 23:38:34.480796','2020-08-11 23:38:34.480796'),('schema_sha1','322f5867575b4efacbe4e01e1b4a16d482c17a13','2020-08-11 23:38:34.487170','2020-08-11 23:38:34.487170');
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
INSERT INTO `organizations` VALUES (1,0,'Mraz and Sons',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,6,0,0,'2020-08-11 23:38:36.814709','2020-08-11 23:38:36.847379'),(2,1,'Streich Group',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,2,3,1,0,'2020-08-11 23:38:36.821936','2020-08-11 23:38:36.829380'),(3,1,'Quigley, Pouros and Farrell',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,4,5,1,0,'2020-08-11 23:38:36.840826','2020-08-11 23:38:36.847379'),(4,0,'Gerhold, Veum and Kihn',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,12,0,0,'2020-08-11 23:38:36.856976','2020-08-11 23:38:36.883130'),(5,1,'Halvorson-Carroll',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,8,9,1,0,'2020-08-11 23:38:36.862454','2020-08-11 23:38:36.867998'),(6,1,'Jaskolski and Sons',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,10,11,1,0,'2020-08-11 23:38:36.876583','2020-08-11 23:38:36.883130'),(7,0,'Hane, Zulauf and Wolf',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,18,0,0,'2020-08-11 23:38:36.892345','2020-08-11 23:38:36.935459'),(8,1,'Erdman, Beer and Schroeder',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,14,15,1,0,'2020-08-11 23:38:36.897949','2020-08-11 23:38:36.903422'),(9,1,'Gleichner, Feeney and Hudson',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,16,17,1,0,'2020-08-11 23:38:36.912072','2020-08-11 23:38:36.935459'),(10,0,'Frami, Morissette and Moore',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,24,0,0,'2020-08-11 23:38:36.945147','2020-08-11 23:38:36.971769'),(11,1,'Gleichner-Bergnaum',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,20,21,1,0,'2020-08-11 23:38:36.951228','2020-08-11 23:38:36.957531'),(12,1,'Heidenreich Group',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,22,23,1,0,'2020-08-11 23:38:36.966411','2020-08-11 23:38:36.971769'),(13,0,'Bogisich-Wiegand',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,25,30,0,0,'2020-08-11 23:38:36.979747','2020-08-11 23:38:37.006895'),(14,1,'Denesik-Reichert',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,26,27,1,0,'2020-08-11 23:38:36.985322','2020-08-11 23:38:36.991360'),(15,1,'Hegmann, Leffler and Purdy',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,28,29,1,0,'2020-08-11 23:38:37.000809','2020-08-11 23:38:37.006895');
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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizations_patients`
--

LOCK TABLES `organizations_patients` WRITE;
/*!40000 ALTER TABLE `organizations_patients` DISABLE KEYS */;
INSERT INTO `organizations_patients` VALUES (1,13,1),(2,13,2),(3,13,3),(4,13,4),(5,13,5),(6,13,6),(7,13,7),(8,13,8),(9,13,9),(10,13,10),(11,13,11),(12,13,12),(13,13,13),(14,13,14),(15,13,15),(16,13,16),(17,13,17),(18,13,18),(19,13,19),(20,13,20),(21,13,21),(22,13,22),(23,13,23),(24,13,24),(25,13,25),(26,13,26),(27,13,27),(28,13,28),(29,13,29),(30,13,30),(31,13,31);
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
INSERT INTO `organizations_users` VALUES (1,1,2),(2,2,2),(3,1,3),(4,8,3),(5,1,4),(6,12,4),(7,1,5),(8,11,5),(9,1,6),(10,12,6),(11,1,7),(12,5,7),(13,1,8),(14,2,8),(15,1,9),(16,5,9),(17,1,10),(18,3,10),(19,1,11),(20,15,11),(21,4,12),(22,6,12),(23,4,13),(24,12,13),(25,4,14),(26,9,14),(27,4,15),(28,8,15),(29,4,16),(30,3,16),(31,4,17),(32,11,17),(33,4,18),(34,3,18),(35,4,19),(36,6,19),(37,4,20),(38,9,20),(39,4,21),(40,3,21),(41,7,22),(42,2,22),(43,7,23),(44,3,23),(45,7,24),(46,11,24),(47,7,25),(48,15,25),(49,7,26),(50,5,26),(51,7,27),(52,5,27),(53,7,28),(54,11,28),(55,7,29),(56,12,29),(57,7,30),(58,12,30),(59,7,31),(60,5,31),(61,10,32),(62,3,32),(63,10,33),(64,9,33),(65,10,34),(66,8,34),(67,10,35),(68,11,35),(69,10,36),(70,5,36),(71,10,37),(72,2,37),(73,10,38),(74,3,38),(75,10,39),(76,15,39),(77,10,40),(78,6,40),(79,10,41),(80,15,41),(81,13,42),(82,8,42),(83,13,43),(84,6,43),(85,13,44),(86,14,44),(87,13,45),(88,15,45),(89,13,46),(90,8,46),(91,13,47),(92,9,47),(93,13,48),(94,9,48),(95,13,49),(96,15,49),(97,13,50),(98,3,50),(99,13,51),(100,15,51);
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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (1,'Antonio','Vivaldi','avivaldi@null.com','1234567890','Somplace nice','Uptown','Florence','Tuscany','12345','Itali','1678-03-04 00:00:00','2020-10-20 00:00:00'),(2,'Hung','Nienow','faustino@prosacco.com','(250) 397-4283 x61353','275 Pollich Vista','Apt. 688','Valport','Michigan','40804','USA','1945-07-21 00:00:00','2020-05-10 00:00:00'),(3,'Mariel','Buckridge','thora@adams.co','145.486.5563','3880 Numbers Mountains','Suite 959','West Nola','Florida','53170','USA','1992-10-11 00:00:00','2020-02-11 00:00:00'),(4,'Shanice','Johnson','francine@labadie-homenick.biz','474-752-2260 x496','8936 Wolf Parks','Suite 607','North Alishia','Arizona','38552','USA','1986-08-09 00:00:00','2020-07-04 00:00:00'),(5,'Luigi','Schultz','jetta_dare@gibson.io','853-323-6429','243 Strosin Throughway','Suite 123','Arnitastad','Montana','32740-5868','USA','1941-01-04 00:00:00','2020-03-28 00:00:00'),(6,'Aiko','Cremin','herschel_volkman@considine-haley.org','508-753-5313 x80288','50685 Klein Junction','Apt. 165','Hugomouth','North Dakota','44766','USA','1947-12-14 00:00:00','2020-02-19 00:00:00'),(7,'Casey','Schowalter','britta_wilderman@larkin.com','945.614.0777 x032','867 Bauch Isle','Apt. 536','Johnathanborough','Virginia','77646','USA','1946-02-03 00:00:00','2020-03-16 00:00:00'),(8,'Stacie','Crist','joy.stokes@parker.name','644.578.2081 x993','1215 Abram Crescent','Apt. 121','East Cordelia','Ohio','12507-5130','USA','1982-11-10 00:00:00','2020-04-10 00:00:00'),(9,'Bea','Yundt','roland@lockman.org','1-443-144-0290 x7469','8240 Trent Lodge','Suite 598','Laneshire','North Carolina','68311-9394','USA','1986-06-30 00:00:00','2020-04-01 00:00:00'),(10,'Hollis','Pollich','dewayne@crooks.biz','(944) 619-8985','61863 Junior Islands','Apt. 222','East Blythe','Maryland','40078','USA','1988-08-29 00:00:00','2020-02-18 00:00:00'),(11,'Florencio','Kreiger','bernardo@strosin-reilly.com','156.321.8056 x35383','448 Wisoky Bridge','Apt. 725','New Craigburgh','Tennessee','41275-9012','USA','1987-01-03 00:00:00','2020-02-28 00:00:00'),(12,'Olive','Marquardt','vi@fay.info','1-779-870-2580 x102','9830 Murazik River','Suite 707','East Raulbury','Kansas','22360','USA','1990-03-24 00:00:00','2020-03-06 00:00:00'),(13,'Kisha','VonRueden','inocencia@pollich-botsford.name','1-805-522-4040 x87646','8186 Braun Rapids','Suite 280','Lake Santos','Indiana','38477','USA','1967-12-18 00:00:00','2020-06-27 00:00:00'),(14,'Wilbert','Feest','anderson.lynch@treutel.biz','571.277.2286 x0269','89866 Nydia Canyon','Apt. 965','West Jodichester','Missouri','00965','USA','1941-04-12 00:00:00','2020-06-12 00:00:00'),(15,'Eloy','Funk','lashell@champlin.io','340.742.8071 x7010','1422 Batz Mission','Suite 333','East Eliasport','Illinois','12742-4017','USA','1987-04-09 00:00:00','2020-02-21 00:00:00'),(16,'Vernell','Olson','justin@kassulke-moen.name','(148) 054-8763 x87859','352 Maren Cape','Apt. 820','Turnerland','North Carolina','83988-2828','USA','1936-05-02 00:00:00','2020-06-21 00:00:00'),(17,'Duncan','Towne','victorina@predovic-gorczany.com','1-199-248-9543 x2797','54578 Verna Freeway','Apt. 992','New Delfina','Delaware','31989-6901','USA','1950-10-11 00:00:00','2020-07-05 00:00:00'),(18,'Adolfo','Keeling','eleonore@schinner.info','612-353-4002 x616','55180 Conrad Branch','Suite 237','North Greggstad','Indiana','58923','USA','1993-07-09 00:00:00','2020-05-17 00:00:00'),(19,'Lindsy','Schoen','gracie@blick.info','(339) 016-4280','448 Schroeder Gateway','Apt. 970','South Gisela','New York','21871','USA','1941-04-15 00:00:00','2020-03-03 00:00:00'),(20,'Cleora','Schulist','evangeline@schneider.name','771.121.8217 x0339','5769 Doyle Route','Apt. 341','Filibertoview','Kentucky','53430','USA','1969-06-18 00:00:00','2020-05-18 00:00:00'),(21,'Jessi','Kuphal','wesley@ferry.com','813-874-1778','8705 Schroeder Ford','Apt. 217','Saritastad','Massachusetts','06278-4292','USA','1993-04-19 00:00:00','2020-07-11 00:00:00'),(22,'Wiley','Bogisich','lady_gulgowski@schultz-gottlieb.co','365.449.4696 x71404','58982 Stacy Plains','Apt. 126','Port Brianborough','Virginia','40433-4290','USA','1961-07-19 00:00:00','2020-03-21 00:00:00'),(23,'Josephina','Carter','rufus@terry-herzog.biz','1-145-782-4307 x282','283 Kiesha Lights','Suite 549','North Ned','Vermont','81869','USA','1983-05-16 00:00:00','2020-03-28 00:00:00'),(24,'Bryon','Bartell','georgann@bosco.info','1-856-497-1431','4508 Cremin Place','Apt. 127','Port Shawanda','South Carolina','50202','USA','1932-10-09 00:00:00','2020-04-14 00:00:00'),(25,'Eldridge','Emard','kelly@block-macejkovic.com','(740) 531-2900 x6464','851 Flatley Ridge','Suite 891','Florancechester','Kentucky','38775-8756','USA','1998-07-18 00:00:00','2020-06-08 00:00:00'),(26,'Grant','Boyle','elbert@connelly.biz','1-535-624-6650 x05584','10485 Jesse Stravenue','Suite 319','Port Kennithfort','Illinois','60503','USA','1997-02-12 00:00:00','2020-06-23 00:00:00'),(27,'Glynda','Ryan','esteban@stamm.net','1-525-651-3714 x1002','391 Bobette Inlet','Apt. 375','Jaskolskiville','Colorado','43949-8729','USA','1966-04-22 00:00:00','2020-03-19 00:00:00'),(28,'Fannie','Sawayn','sofia@wolff.io','560.259.8012 x36146','273 Jacobs Fall','Apt. 400','South Freedamouth','Washington','87031','USA','1996-05-31 00:00:00','2020-05-29 00:00:00'),(29,'Brooks','Friesen','estefana@hartmann.info','(493) 935-6858 x6852','403 Rogahn Islands','Suite 858','New Myongmouth','New Jersey','17230-4771','USA','1932-07-17 00:00:00','2020-05-11 00:00:00'),(30,'Wilbert','Kerluke','maxie@olson.net','761-804-8392','21754 Greenfelder Locks','Suite 528','Santaport','Wyoming','26626','USA','1971-07-14 00:00:00','2020-02-11 00:00:00'),(31,'Malorie','Kuvalis','lee.kozey@nolan.info','307.226.3023 x27500','984 Rodrigo Trafficway','Apt. 184','Ryanville','Louisiana','12854','USA','1963-05-13 00:00:00','2020-05-22 00:00:00');
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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients_users`
--

LOCK TABLES `patients_users` WRITE;
/*!40000 ALTER TABLE `patients_users` DISABLE KEYS */;
INSERT INTO `patients_users` VALUES (1,1,48),(2,2,48),(3,3,48),(4,4,48),(5,5,48),(6,6,48),(7,7,48),(8,8,48),(9,9,48),(10,10,48),(11,11,48),(12,12,48),(13,13,48),(14,14,48),(15,15,48),(16,16,48),(17,17,48),(18,18,48),(19,19,48),(20,20,48),(21,21,48),(22,22,48),(23,23,48),(24,24,48),(25,25,48),(26,26,48),(27,27,48),(28,28,48),(29,29,48),(30,30,48),(31,31,48);
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
INSERT INTO `users` VALUES (1,'$2a$12$zjE1lKDnvt4Y5MnDrhXOu.WGH2e7zaG85pErq4qq54SIAqUwC9APC',NULL,NULL,0,NULL,NULL,NULL,NULL,'Roger','Waters',NULL,NULL,'admin@null.com',1000,NULL,'9f04c47f82ceb7f8f6162f09d071758bd6629f5bf6770dc9452e8075ed2a',NULL,'2020-08-11 23:38:36.587379','2020-08-11 23:38:36.587379'),(2,'$2a$12$QMUkYnyeAa5XjWJdTqks.eMBjTElTHJ2M0PNr4W9iZIAzlsca09hW',NULL,NULL,0,NULL,NULL,NULL,NULL,'Fernande','Koepp',NULL,NULL,'sanford.mertz@hettinger.com',100,NULL,'109a273c5fb6609902aa5dbbdf60e70abbe06d66d67a3ba4c72bc96f6ce1',NULL,'2020-08-11 23:38:37.216422','2020-08-11 23:38:37.216422'),(3,'$2a$12$GHk.tPNP4Cj0lspm6mw58ew15.VIRwNbuqMR/oqIaIphPMSon6hlK',NULL,NULL,0,NULL,NULL,NULL,NULL,'Earlie','Bradtke',NULL,NULL,'silas_williamson@weimann-schmidt.com',100,NULL,'17e9ad9f08e1d087a0c7b7b64823c8b515d69e76fc421c75cc73ffb2c6fc',NULL,'2020-08-11 23:38:37.412195','2020-08-11 23:38:37.412195'),(4,'$2a$12$L2wx0G3kBylJ23atXhBO/.2K0hHhYpLL5AdaD86Ti6H2KsLFtkxje',NULL,NULL,0,NULL,NULL,NULL,NULL,'Randee','Cormier',NULL,NULL,'norbert_padberg@schinner.io',1000,NULL,'49d6881d287c547d4313518af54d7ac68593668a94b6f8a31c6ac307ba3a',NULL,'2020-08-11 23:38:37.604659','2020-08-11 23:38:37.604659'),(5,'$2a$12$C9rCxQ3BNUmRRLAbVzVfIuAMWV.12soO8PE2e5OnnspwpH1YH6fq.',NULL,NULL,0,NULL,NULL,NULL,NULL,'Marlo','Ernser',NULL,NULL,'latonia_yost@oconner.org',100,NULL,'3052c3ba1cc166fe0bc6cc25ca88860d315541c662da6c1467eb505c4f6f',NULL,'2020-08-11 23:38:37.793700','2020-08-11 23:38:37.793700'),(6,'$2a$12$QypkkXWjveFiOE2mBqPzgO2kDh2m.BQv8y3wfDUEzmmN3/JC/rKuu',NULL,NULL,0,NULL,NULL,NULL,NULL,'Edgar','Abbott',NULL,NULL,'tawnya@quitzon.info',200,NULL,'2d94ded12806fd221e635f8b4151c15939d311f63d274e56ec379971abb5',NULL,'2020-08-11 23:38:37.993394','2020-08-11 23:38:37.993394'),(7,'$2a$12$ySqI5IEN8igBnUN/TWMS1ewhW3CokbDCADo42jH7HdURzMAyoKsAK',NULL,NULL,0,NULL,NULL,NULL,NULL,'Cary','Kutch',NULL,NULL,'liana@runolfsson-hartmann.name',300,NULL,'72f9612ebcba71420757d863149718adfd32117aff2409b00931123ff79d',NULL,'2020-08-11 23:38:38.179372','2020-08-11 23:38:38.179372'),(8,'$2a$12$P7d.OgN9H9Tk2qG/Rm9q9..XzVBA5aTOo3Cy3GjeRw..L3bPWhEZe',NULL,NULL,0,NULL,NULL,NULL,NULL,'Earnest','Lind',NULL,NULL,'delfina_heidenreich@brakus.com',200,NULL,'6ae7296aa59041c62aa409e09078eb15d405e6681551b66bff32372dc794',NULL,'2020-08-11 23:38:38.377493','2020-08-11 23:38:38.377493'),(9,'$2a$12$IHlvyBNgFwn74s1HHBUwPuyKSyDhhCnpOMWjhz59Lkdlxclz2/TMu',NULL,NULL,0,NULL,NULL,NULL,NULL,'Hassan','Kertzmann',NULL,NULL,'stephenie@will-stanton.net',1000,NULL,'6be8e4b0b129b277fa4c0c8030aee63145f0cdfb914ef5209c5523183713',NULL,'2020-08-11 23:38:38.567854','2020-08-11 23:38:38.567854'),(10,'$2a$12$kUdwGSbTJYf40LXCiTqjU.qlONmAPq5kn868kW1qXUYkqHwqLVrLm',NULL,NULL,0,NULL,NULL,NULL,NULL,'Alex','Huels',NULL,NULL,'enola@gutkowski.biz',1000,NULL,'92b2d7382d36d23c99e5584dd609699884438fb187dd69b1d0d6326d731a',NULL,'2020-08-11 23:38:38.764344','2020-08-11 23:38:38.764344'),(11,'$2a$12$wjyT7CoWvbbHTGFzUd29yeKsb5XkQGvCtRSSysZCBbOkDIasiqum.',NULL,NULL,0,NULL,NULL,NULL,NULL,'Laurel','Graham',NULL,NULL,'ivonne@jast.org',300,NULL,'9cedef9b28d73ce7c14fd304b5c29804d9654990afb3513772dd35540708',NULL,'2020-08-11 23:38:38.958079','2020-08-11 23:38:38.958079'),(12,'$2a$12$gn1tHlc5r/yTe7O7.WdYIOlHxIbURoaZp4pMQRECGV7eymWH7esR6',NULL,NULL,0,NULL,NULL,NULL,NULL,'Reita','Hartmann',NULL,NULL,'erick@durgan.net',1000,NULL,'e115bd739bc5126e350752e66dd31a5c4d5fe4aed04a7a0afc2a7c731847',NULL,'2020-08-11 23:38:39.150354','2020-08-11 23:38:39.150354'),(13,'$2a$12$hLBWyQGWyQiZpFxveK6Pc.XiUYXPFq6g4zfjZJ62xl..PjJ6zfsu2',NULL,NULL,0,NULL,NULL,NULL,NULL,'Gussie','Green',NULL,NULL,'haley@aufderhar-runolfsson.biz',300,NULL,'6338a765ec0e4b43c3847ad1724ea5da23dfea25304f16b3b2d69db89f69',NULL,'2020-08-11 23:38:39.344867','2020-08-11 23:38:39.344867'),(14,'$2a$12$H2SrtzXt8R5D.aBE8HOm7.byG5iQUiVeL10bHYKRBye3YBDDFZwCy',NULL,NULL,0,NULL,NULL,NULL,NULL,'Marceline','Abbott',NULL,NULL,'angel.hahn@mayert-lehner.name',300,NULL,'5f62750dbe2d6e33ba14449a165a7ce84be83fe9f743090f8fe1a9c73ed5',NULL,'2020-08-11 23:38:39.538726','2020-08-11 23:38:39.538726'),(15,'$2a$12$mk6kw4ISCYVrtYe170NemukQvjMAFvXnbtC/HZzIPia8MRqX1o6/q',NULL,NULL,0,NULL,NULL,NULL,NULL,'Rosanna','Hermann',NULL,NULL,'coleman@terry.net',1000,NULL,'97319355113158d38129ce4f1d4c8873588d99093907dc2968a5cff37931',NULL,'2020-08-11 23:38:39.733334','2020-08-11 23:38:39.733334'),(16,'$2a$12$C8SOtjB0gpUWlynT/9Zw7OgbPEPlsAxkomQhoKfgdO2kWYJrFrWhi',NULL,NULL,0,NULL,NULL,NULL,NULL,'Gerald','Lueilwitz',NULL,NULL,'abel@oconner.io',300,NULL,'f765908b025431fb8d6abe510e78304c5593c477f29245991782fff55b8a',NULL,'2020-08-11 23:38:39.918547','2020-08-11 23:38:39.918547'),(17,'$2a$12$/2UIqTrnBts87.0A/G4aQ.oMluHvzNXT9pD8Dbf0aX00flu0kYgBy',NULL,NULL,0,NULL,NULL,NULL,NULL,'Lawanna','Glover',NULL,NULL,'dione@rolfson.org',300,NULL,'9c85ef1c0069519f4a0c24b20a11c6d077bba1ee799527c07685f2488715',NULL,'2020-08-11 23:38:40.108955','2020-08-11 23:38:40.108955'),(18,'$2a$12$QZ1HmQagcmaHz6YrrBJ6HuEW6Y6gFYAkhEvvSyPt7UVQygThJd6L6',NULL,NULL,0,NULL,NULL,NULL,NULL,'Danna','Altenwerth',NULL,NULL,'kasey@herzog-bosco.biz',1000,NULL,'bdc22ec9332b22bd3a603f4dd64bc5dd9370bf13e6add2d7dbbb968a6279',NULL,'2020-08-11 23:38:40.296297','2020-08-11 23:38:40.296297'),(19,'$2a$12$8K4S5EQSn/1TIx24Q3YIc.k44Ryf329FP979s.iYfg7JVNCcu/5RS',NULL,NULL,0,NULL,NULL,NULL,NULL,'Tracy','Hegmann',NULL,NULL,'luis.langosh@koelpin.io',200,NULL,'725b16e7560d5ddd1fbc0aab1764b94c743c555c51553be4a175c9124a20',NULL,'2020-08-11 23:38:40.495398','2020-08-11 23:38:40.495398'),(20,'$2a$12$/MBWabFAstk.3QubFoawZOWN4VHEMFb68tKWXHzuTHywHaJOhjzHW',NULL,NULL,0,NULL,NULL,NULL,NULL,'Dyan','Klein',NULL,NULL,'tracy_lang@leannon-kemmer.com',300,NULL,'16c0868b48d7db2eea8608f05f3f6515a5ca49c6e6d2043a839a60f96c95',NULL,'2020-08-11 23:38:40.689856','2020-08-11 23:38:40.689856'),(21,'$2a$12$DJEYGCPBILDqGBmE/y88yOUKYBuchbcVIeExpRtt2ZZofRzfRnLZa',NULL,NULL,0,NULL,NULL,NULL,NULL,'Gilbert','Wilkinson',NULL,NULL,'filiberto@konopelski.org',1000,NULL,'f177f50008525d93fad9c722175b4c2ac69b468617bb4d5215cd2c10e095',NULL,'2020-08-11 23:38:40.881990','2020-08-11 23:38:40.881990'),(22,'$2a$12$mWK/DyatX1VAN43yoIN5ceJA.u94q4M3KsvR0jhxthyB3cW/0/WBi',NULL,NULL,0,NULL,NULL,NULL,NULL,'Leonila','Hessel',NULL,NULL,'cletus.walter@ruecker-swift.co',1000,NULL,'2bf55f5cafb6f4ea2f3a7cfa0a828f3baa13dabf1475e4f3e3380454b1f0',NULL,'2020-08-11 23:38:41.082309','2020-08-11 23:38:41.082309'),(23,'$2a$12$JlBDUbosO6QIaAbUkzzMFuvad/wHetJDbR4bQaRbgUEhZd1/SAZwu',NULL,NULL,0,NULL,NULL,NULL,NULL,'Tommie','Gulgowski',NULL,NULL,'alberto@mueller.com',100,NULL,'5d951bbfec994b2c444b63478e0f9f91cd1bc94dd6f0d854d504b604f8ad',NULL,'2020-08-11 23:38:41.290709','2020-08-11 23:38:41.290709'),(24,'$2a$12$Gg6KmyCT2GbsCQd/507gQOtjI2SUCoeClkLahtdDK/W/uStZdvPie',NULL,NULL,0,NULL,NULL,NULL,NULL,'Owen','Kulas',NULL,NULL,'devin@trantow-bogan.com',100,NULL,'2d043dd64370c6b84a82bf3b5f45318ca9e74cbce91eeb017b55c9f8da49',NULL,'2020-08-11 23:38:41.493143','2020-08-11 23:38:41.493143'),(25,'$2a$12$/13iy5WVkPk072YNZB1Pge7RZch3TFQbOghCLZARQk2hanIW5Gw9u',NULL,NULL,0,NULL,NULL,NULL,NULL,'Zackary','Monahan',NULL,NULL,'kari_rippin@hessel.io',1000,NULL,'d7d0fdd243d414c26fdfa7dda1813e731c7fe3d17ecf0e62eb70ffc43e29',NULL,'2020-08-11 23:38:41.686914','2020-08-11 23:38:41.686914'),(26,'$2a$12$f9xT.ZtZJElbP.cH.nc28.dhp58kqhnHEyrOW9Kof9/B2LKB087Vi',NULL,NULL,0,NULL,NULL,NULL,NULL,'Deidre','O\'Kon',NULL,NULL,'nelson_gleichner@glover.net',300,NULL,'0a8c3ff9e4996394b749158ef31785f0180f98d4883c8708bf559df7fcc6',NULL,'2020-08-11 23:38:41.875756','2020-08-11 23:38:41.875756'),(27,'$2a$12$bwqTwJADp.t3ulhY5vNCauRM0Doy/7RvQvPRYCIG1ttkZEgmTt4Hm',NULL,NULL,0,NULL,NULL,NULL,NULL,'Loyd','Brekke',NULL,NULL,'dacia@weissnat-dibbert.com',300,NULL,'a38a95fe4520d02966c8a069801cf494da0c466a02038cb692ae50930d4c',NULL,'2020-08-11 23:38:42.060314','2020-08-11 23:38:42.060314'),(28,'$2a$12$8dpGmaAgMtfjDw1fZvM4/OdhqP3MDZNfmm7p/0j5qnl6OBynZRRL6',NULL,NULL,0,NULL,NULL,NULL,NULL,'Emory','Rau',NULL,NULL,'xiomara@hills.net',200,NULL,'ffc35753201f4456929223e76426db6f0baae01f95ba71f0f57118e35f5f',NULL,'2020-08-11 23:38:42.250932','2020-08-11 23:38:42.250932'),(29,'$2a$12$pzcYopgVt3XJO69kF2kfe.7MDwfU7pfsw7VB8wCF3yNK07rZVdoOu',NULL,NULL,0,NULL,NULL,NULL,NULL,'Bryon','Daugherty',NULL,NULL,'winston.russel@mckenzie.net',200,NULL,'b5a26a0a7fa2560eb96c940901860cbb55e6589434cf50c50201b31fe02c',NULL,'2020-08-11 23:38:42.444007','2020-08-11 23:38:42.444007'),(30,'$2a$12$.lsQekVgkQN1UIhEZ.JWFOgqxaNCURitfjSiarD8tJbUUribatqF.',NULL,NULL,0,NULL,NULL,NULL,NULL,'Vincenzo','Kassulke',NULL,NULL,'julieann.ratke@cummerata.io',200,NULL,'e2cd8df2785c8024fac7affe24cbbd2be40a61facf225ed89540db625188',NULL,'2020-08-11 23:38:42.644642','2020-08-11 23:38:42.644642'),(31,'$2a$12$Mxvv5bEKNJgWhV3HB4gZKe86OZ4Tl2Cj7BYYGSizqGyOnYtWsj0Ui',NULL,NULL,0,NULL,NULL,NULL,NULL,'Adriane','Torphy',NULL,NULL,'georgeanna.ebert@hodkiewicz-rohan.name',200,NULL,'816823b5ca374e95bb672d2f47415862809a7d5f602a51bf08fb38389ed2',NULL,'2020-08-11 23:38:42.837548','2020-08-11 23:38:42.837548'),(32,'$2a$12$OHZHhrWNfjjISKprVv6p8.VSrotdnN.9TNtqeDbhphT683I0nqFae',NULL,NULL,0,NULL,NULL,NULL,NULL,'Elida','Bartoletti',NULL,NULL,'efren_welch@reinger.name',300,NULL,'82def495ae17a8c7c8379260f0ab57f333d6b0885d239904b7f8174eed0f',NULL,'2020-08-11 23:38:43.032673','2020-08-11 23:38:43.032673'),(33,'$2a$12$rHKIjwNW1X5yKrCxi9ZrWe6yVr0m.DZuoi2WeAW9fc.e04WtKubhe',NULL,NULL,0,NULL,NULL,NULL,NULL,'Aja','Pollich',NULL,NULL,'fabian.turner@jacobi.io',300,NULL,'dcd287033a72d29122f68d147a70a2eeccdf8d6a1f90fb4c50f8fc64c0e3',NULL,'2020-08-11 23:38:43.227289','2020-08-11 23:38:43.227289'),(34,'$2a$12$BvmO7E1.CWmeu.Yl3If9P.RXulspdZEuaIf92pub1oF4y4jwKB7F.',NULL,NULL,0,NULL,NULL,NULL,NULL,'Jene','Howell',NULL,NULL,'bruce@terry.net',100,NULL,'944797e77ad45498f0194edd7b886b3c29bc7c8fe7e6305086752d8f980b',NULL,'2020-08-11 23:38:43.424982','2020-08-11 23:38:43.424982'),(35,'$2a$12$4O0PQvUn1rCfJISN.QSgDOJgUmxncPRIPwmsQlxnz1gGRwa9/Mz36',NULL,NULL,0,NULL,NULL,NULL,NULL,'Clarence','Fahey',NULL,NULL,'treena@swaniawski.org',300,NULL,'601666001db269d4bb0d479197d65093adf6f1dcc41351d769dfd299bea8',NULL,'2020-08-11 23:38:43.633268','2020-08-11 23:38:43.633268'),(36,'$2a$12$9KV6np2HAf.QlO6pxg3wLeks/7V/57fTv0ENqvJqRH5eViqmVPFD.',NULL,NULL,0,NULL,NULL,NULL,NULL,'Darius','Ebert',NULL,NULL,'justin@sawayn-moen.net',300,NULL,'53d197fa7730c7f55029e8f6bf90927147545b2fd8cc1a45011827b59731',NULL,'2020-08-11 23:38:43.830695','2020-08-11 23:38:43.830695'),(37,'$2a$12$oJL3xKpXwbPQo.qWbkUi1u1WcKwB03OwxKQv1YiQX8DT8WIMSBNCm',NULL,NULL,0,NULL,NULL,NULL,NULL,'Hsiu','McClure',NULL,NULL,'micheal_simonis@rau.co',100,NULL,'3653d9443b99bf1f3b68c74ef55f6b48b69d419d14c489b7d67be684ff3f',NULL,'2020-08-11 23:38:44.025992','2020-08-11 23:38:44.025992'),(38,'$2a$12$PKZoK6VhfGXm49ZrSN04q.WZH/GEJuCF1iotXQBD0dKtgfS8bufWq',NULL,NULL,0,NULL,NULL,NULL,NULL,'Frederic','Shields',NULL,NULL,'danyell@murphy.biz',200,NULL,'dfde34ff36f4e1b780473445393d3b54b7f719837a069dac70a0dceceefe',NULL,'2020-08-11 23:38:44.219599','2020-08-11 23:38:44.219599'),(39,'$2a$12$sLYnecaZyi42awGGRbjH3.C2rvhKo.j2LekTauUP56LF3NybaZCDm',NULL,NULL,0,NULL,NULL,NULL,NULL,'Rhett','Swaniawski',NULL,NULL,'loria@wisoky.net',100,NULL,'71050e8cc7f949a4a9c89e8d61e440cec41843b50ebbcfe5615dadfcfdbe',NULL,'2020-08-11 23:38:44.416411','2020-08-11 23:38:44.416411'),(40,'$2a$12$9uzvCSLUPWTbDBja6qRVieS2SWaaiRd9f3EinpdtRewZHXaeCbLLq',NULL,NULL,0,NULL,NULL,NULL,NULL,'Wayne','Windler',NULL,NULL,'filiberto_feil@buckridge.com',100,NULL,'e01a9c4f7fe55e44627541de7fdd1e4f591f927dfa1eb833f66ef8599f33',NULL,'2020-08-11 23:38:44.627202','2020-08-11 23:38:44.627202'),(41,'$2a$12$wH3B3lHUC/VEfqBeC1L7ze8g/9cQN0qJhz6jS7eO3jt7pr9ZNVshu',NULL,NULL,0,NULL,NULL,NULL,NULL,'Alec','Okuneva',NULL,NULL,'anderson_dietrich@dickens.com',300,NULL,'88a7f090a2a21907343b7cff0bd832b4e74e0ba410fb776922d10bc85794',NULL,'2020-08-11 23:38:44.820400','2020-08-11 23:38:44.820400'),(42,'$2a$12$5hkS0O48pPRuPq7MKMBAu.qjAC0CWtCa0lxhaIk6Niv9.briG42.O',NULL,NULL,0,NULL,NULL,NULL,NULL,'Una','Gaylord',NULL,NULL,'joey@wuckert.org',200,NULL,'611985b5b26065642755ce5ff26fe25a913e7bc67a7abd683a48c2eb4882',NULL,'2020-08-11 23:38:45.007404','2020-08-11 23:38:45.007404'),(43,'$2a$12$/PSOBNXOPD7QSmoCVpfoWuwBzTskMrediYG5WiACx7J87JdNE7u0e',NULL,NULL,0,NULL,NULL,NULL,NULL,'Raphael','Feest',NULL,NULL,'antoine.raynor@keeling.com',100,NULL,'a4ba7079d3a4d8cf8a04eb6d356b847bd27fb7432b7d9d63806cff795c35',NULL,'2020-08-11 23:38:45.198175','2020-08-11 23:38:45.198175'),(44,'$2a$12$zlo7emhuZeIijTL//2eZl.UTQ0Y0fbdGa1oggCwwc1ZuqvkqDOeke',NULL,NULL,0,NULL,NULL,NULL,NULL,'Terence','Miller',NULL,NULL,'dwight@osinski.net',200,NULL,'e6079b88fca2b4a3fadbd5b252edf7e504a0ab82d6d60761953cc500dce3',NULL,'2020-08-11 23:38:45.391289','2020-08-11 23:38:45.391289'),(45,'$2a$12$f6oShRBLQxpNzWppNh0OB.HwW1zAJHpDT5gqluI.kkth2AcQEfPCC',NULL,NULL,0,NULL,NULL,NULL,NULL,'Sidney','Goodwin',NULL,NULL,'jay@grant.biz',300,NULL,'2b724d3678495560eceb8f07de97bba043d92e4fcf589420cd28b1b807a9',NULL,'2020-08-11 23:38:45.583971','2020-08-11 23:38:45.583971'),(46,'$2a$12$deGG72LSi2GWJ7mvqzHzlOdLgos3Joc8GwrbkdcEPEtUGk.VQosn2',NULL,NULL,0,NULL,NULL,NULL,NULL,'Enoch','Emmerich',NULL,NULL,'bennie.pollich@muller.io',200,NULL,'231d2ab0743eb13c025b86b2bcaa972c90191e9b4480507dbe4f596a0208',NULL,'2020-08-11 23:38:45.779652','2020-08-11 23:38:45.779652'),(47,'$2a$12$PlGtYyFUsRKGWEIRmMrZruVoBhbTm.6huZ1OJ8OFdx5h3HEsahwF6',NULL,NULL,0,NULL,NULL,NULL,NULL,'Verena','Marks',NULL,NULL,'clemente@rath.org',200,NULL,'f68e8091caddb556d6abff50f7e046cc5632abc03f573916324591d07dfc',NULL,'2020-08-11 23:38:45.971688','2020-08-11 23:38:45.971688'),(48,'$2a$12$IuyKwyHLiQqJ1H5hvcQXuOjE5UtOXl6C7kpmnQDNazn/0Ar3UhiMe',NULL,NULL,0,NULL,NULL,NULL,NULL,'Manuela','Will',NULL,NULL,'lillie@gorczany.net',300,NULL,'43c39cd16751598628734980438ed0473e8310400d05a4698fb3dca17dc8',NULL,'2020-08-11 23:38:46.164149','2020-08-11 23:38:46.164149'),(49,'$2a$12$Xqf6ZNSxnn5va0/9.YuMD.VLA/Dyno9sScN15lOPogUlSnvtO5v06',NULL,NULL,0,NULL,NULL,NULL,NULL,'Elisabeth','Bayer',NULL,NULL,'lucile_moen@gerhold.name',200,NULL,'f116cf44bde4e0326494c60d0cd8d4452220c4bacbc30cc9229c08ada6ab',NULL,'2020-08-11 23:38:46.358841','2020-08-11 23:38:46.358841'),(50,'$2a$12$gQNyLbvGkBGDsW0DktL9kup3fpFwvRgpsuSKZhBXZ.dAEEFREKc6q',NULL,NULL,0,NULL,NULL,NULL,NULL,'Moses','Yost',NULL,NULL,'ashli.moore@wehner.io',100,NULL,'60885728cae3c956533feb92470731effa8ffb8b6662f46e52d3420e5de0',NULL,'2020-08-11 23:38:46.553259','2020-08-11 23:38:46.553259'),(51,'$2a$12$ODiLZTyaBk32xNh4f3s6AOZaxDWDWbQovTyYw2pAevMHXCePVE06q',NULL,NULL,0,NULL,NULL,NULL,NULL,'Clarence','Feest',NULL,NULL,'amber.price@friesen-wolf.com',1000,NULL,'9b6d58bf0b926ba66ed7c88177d919161f07fc7c286c3109810b95e51edf',NULL,'2020-08-11 23:38:46.746329','2020-08-11 23:38:46.746329');
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

-- Dump completed on 2020-08-11 17:38:47
