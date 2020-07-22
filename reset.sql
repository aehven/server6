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
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2020-07-22 19:51:22.305895','2020-07-22 19:51:22.305895'),('schema_sha1','322f5867575b4efacbe4e01e1b4a16d482c17a13','2020-07-22 19:51:22.311941','2020-07-22 19:51:22.311941');
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
INSERT INTO `organizations` VALUES (1,0,'Daugherty Inc',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,6,0,0,'2020-07-22 19:51:24.458721','2020-07-22 19:51:24.493247'),(2,1,'Jakubowski, Konopelski and Hansen',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,2,3,1,0,'2020-07-22 19:51:24.466292','2020-07-22 19:51:24.473836'),(3,1,'Spencer-Kling',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,4,5,1,0,'2020-07-22 19:51:24.486270','2020-07-22 19:51:24.493247'),(4,0,'Gerhold, Adams and Weimann',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,12,0,0,'2020-07-22 19:51:24.504339','2020-07-22 19:51:24.534172'),(5,1,'Mante-Koss',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,8,9,1,0,'2020-07-22 19:51:24.511522','2020-07-22 19:51:24.518288'),(6,1,'Gutkowski Group',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,10,11,1,0,'2020-07-22 19:51:24.527936','2020-07-22 19:51:24.534172'),(7,0,'Christiansen-Champlin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,18,0,0,'2020-07-22 19:51:24.542907','2020-07-22 19:51:24.569584'),(8,1,'Hermann Group',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,14,15,1,0,'2020-07-22 19:51:24.548432','2020-07-22 19:51:24.554206'),(9,1,'Kemmer-Pouros',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,16,17,1,0,'2020-07-22 19:51:24.563067','2020-07-22 19:51:24.569584'),(10,0,'Rice-Renner',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,24,0,0,'2020-07-22 19:51:24.579788','2020-07-22 19:51:24.609486'),(11,1,'Gaylord LLC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,20,21,1,0,'2020-07-22 19:51:24.586590','2020-07-22 19:51:24.593017'),(12,1,'Beatty-Klein',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,22,23,1,0,'2020-07-22 19:51:24.602764','2020-07-22 19:51:24.609486'),(13,0,'Reynolds LLC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,25,30,0,0,'2020-07-22 19:51:24.619373','2020-07-22 19:51:24.646772'),(14,1,'Hilpert-Schaden',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,26,27,1,0,'2020-07-22 19:51:24.625259','2020-07-22 19:51:24.631592'),(15,1,'Sporer-Nader',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,28,29,1,0,'2020-07-22 19:51:24.640957','2020-07-22 19:51:24.646772');
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
INSERT INTO `organizations_patients` VALUES (1,13,1),(2,1,2),(3,13,3),(4,13,4),(5,4,5),(6,10,6),(7,1,7),(8,1,8),(9,7,9),(10,7,10),(11,10,11),(12,13,12),(13,7,13),(14,13,14),(15,10,15),(16,7,16),(17,7,17),(18,10,18),(19,4,19),(20,4,20),(21,1,21),(22,13,22),(23,4,23),(24,7,24),(25,1,25),(26,7,26),(27,7,27),(28,10,28),(29,10,29),(30,13,30);
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
INSERT INTO `organizations_users` VALUES (1,1,2),(2,14,2),(3,1,3),(4,3,3),(5,1,4),(6,5,4),(7,1,5),(8,11,5),(9,1,6),(10,3,6),(11,1,7),(12,5,7),(13,1,8),(14,5,8),(15,1,9),(16,14,9),(17,1,10),(18,9,10),(19,1,11),(20,9,11),(21,4,12),(22,9,12),(23,4,13),(24,5,13),(25,4,14),(26,12,14),(27,4,15),(28,8,15),(29,4,16),(30,15,16),(31,4,17),(32,9,17),(33,4,18),(34,12,18),(35,4,19),(36,9,19),(37,4,20),(38,8,20),(39,4,21),(40,9,21),(41,7,22),(42,2,22),(43,7,23),(44,6,23),(45,7,24),(46,2,24),(47,7,25),(48,8,25),(49,7,26),(50,3,26),(51,7,27),(52,5,27),(53,7,28),(54,3,28),(55,7,29),(56,14,29),(57,7,30),(58,11,30),(59,7,31),(60,6,31),(61,10,32),(62,12,32),(63,10,33),(64,5,33),(65,10,34),(66,5,34),(67,10,35),(68,3,35),(69,10,36),(70,8,36),(71,10,37),(72,2,37),(73,10,38),(74,6,38),(75,10,39),(76,15,39),(77,10,40),(78,6,40),(79,10,41),(80,6,41),(81,13,42),(82,9,42),(83,13,43),(84,9,43),(85,13,44),(86,8,44),(87,13,45),(88,9,45),(89,13,46),(90,12,46),(91,13,47),(92,3,47),(93,13,48),(94,11,48),(95,13,49),(96,5,49),(97,13,50),(98,15,50),(99,13,51),(100,15,51);
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
INSERT INTO `patients` VALUES (1,'Nila','Grady','hilda_mcclure@schamberger-hoeger.net','262.826.8977 x705','4683 Mao Landing','Apt. 901','New Terresaburgh','California','68765','USA','1934-05-01 00:00:00','2020-05-15 00:00:00'),(2,'Milton','Rau','quiana@smitham-reichert.biz','1-246-229-4089 x61064','943 Dooley Club','Apt. 594','East Vernice','Illinois','02289','USA','1964-06-02 00:00:00','2020-03-24 00:00:00'),(3,'Yanira','Wisozk','octavio.murazik@abshire.info','1-739-206-7949 x8836','695 Eduardo Rest','Apt. 344','North Katistad','Wisconsin','23496-3630','USA','1971-12-26 00:00:00','2020-01-31 00:00:00'),(4,'Tressie','Lehner','catina@kuphal-bosco.biz','1-634-343-8410 x89906','3282 Johnathon Prairie','Suite 839','East Joanchester','South Dakota','10894-6620','USA','1940-10-25 00:00:00','2020-04-11 00:00:00'),(5,'Ron','Hayes','addie_beier@johnston.com','(221) 034-1292 x86100','684 Renner Forge','Suite 695','Treuteltown','New Jersey','49061-0137','USA','1943-03-26 00:00:00','2020-04-10 00:00:00'),(6,'Lincoln','Dicki','edmund_reichel@jacobson.org','1-739-518-5430 x53935','2897 Legros Dam','Suite 570','Ebonyborough','Florida','73616-1495','USA','1978-11-10 00:00:00','2020-05-04 00:00:00'),(7,'Shaunna','Hamill','mariann_hudson@ledner.biz','305-997-7306 x9823','3345 Numbers Tunnel','Apt. 540','Krajcikberg','Kentucky','59677','USA','1954-01-17 00:00:00','2020-02-28 00:00:00'),(8,'Gus','Reilly','talitha@waters-heaney.info','960.253.3770 x2732','495 Nader Canyon','Suite 660','South Marilu','Hawaii','62964-4896','USA','1931-11-30 00:00:00','2020-02-25 00:00:00'),(9,'Fletcher','Streich','bruce@farrell-hilpert.info','640-573-3086','42281 Odell Squares','Apt. 450','Connport','Tennessee','96375-9728','USA','1951-05-29 00:00:00','2020-05-23 00:00:00'),(10,'Warner','Erdman','zachariah@dibbert.name','765.385.4277 x080','6540 Rasheeda Radial','Suite 913','West Virgiefurt','Tennessee','70499-7226','USA','1981-05-13 00:00:00','2020-02-19 00:00:00'),(11,'Morton','Ward','wai@hintz-padberg.org','514-484-1303 x36988','9989 Roderick Lock','Suite 450','West Brant','Louisiana','83183','USA','1986-01-19 00:00:00','2020-03-09 00:00:00'),(12,'Shandi','Hermann','tyesha@bradtke.biz','(451) 744-8692 x5158','1555 Hintz Passage','Apt. 720','Schummhaven','Alaska','64182','USA','1964-06-30 00:00:00','2020-05-22 00:00:00'),(13,'Veda','Cormier','emeline_johnston@crona.io','1-151-906-7491 x10688','517 Nicolas Squares','Apt. 248','East Coy','Arizona','52196-0103','USA','1933-05-29 00:00:00','2020-06-07 00:00:00'),(14,'Lorretta','Deckow','josh_heller@flatley.net','(436) 315-3053','24122 Botsford Walk','Suite 372','Mohammedfort','Illinois','64584','USA','1959-10-18 00:00:00','2020-03-12 00:00:00'),(15,'Emmanuel','Heaney','abraham@wolf.net','561-308-6317 x453','48456 Everett Plaza','Suite 484','Shelleymouth','Oklahoma','57879','USA','1992-08-21 00:00:00','2020-06-22 00:00:00'),(16,'Gilbert','Roberts','neely@champlin-cronin.io','946.510.7047 x72329','102 Rippin Extension','Apt. 893','New Augusta','Louisiana','41808','USA','1994-01-28 00:00:00','2020-04-17 00:00:00'),(17,'Laree','Treutel','randolph_wilderman@rice.com','(155) 144-0407 x7753','42439 Marcus Causeway','Apt. 832','Hamillborough','Utah','90201','USA','1945-03-05 00:00:00','2020-02-07 00:00:00'),(18,'Roger','Sawayn','moises@kunze.biz','610.660.9743 x6029','36968 Nettie Pike','Apt. 437','New Elinore','Indiana','79360','USA','1982-09-16 00:00:00','2020-03-31 00:00:00'),(19,'Marian','Marquardt','loren_sporer@volkman-gutkowski.name','440-199-1133 x032','284 Emard Terrace','Suite 501','Emikochester','Maryland','55107','USA','1980-04-23 00:00:00','2020-02-18 00:00:00'),(20,'Olin','Vandervort','antoine@anderson.biz','510.130.9284 x580','788 Verna Radial','Suite 460','Bauchmouth','Wisconsin','49839','USA','1960-12-22 00:00:00','2020-03-10 00:00:00'),(21,'Todd','Emard','erik.parisian@sipes.co','671-960-1654 x514','22631 Wilda Forest','Suite 103','Cameronfort','Minnesota','75821-7438','USA','1999-12-13 00:00:00','2020-04-30 00:00:00'),(22,'Bernice','Pollich','arden_bosco@vandervort.info','372-618-3492 x4143','9186 Trang Radial','Suite 927','Oscarburgh','South Carolina','91196','USA','1998-04-13 00:00:00','2020-01-29 00:00:00'),(23,'Christia','Batz','sang.homenick@jerde.io','641.685.8981 x6328','150 Stevie Meadows','Suite 624','Stammhaven','Mississippi','66546','USA','1939-10-27 00:00:00','2020-02-28 00:00:00'),(24,'Edyth','McLaughlin','lenna@heaney-yundt.co','386-036-2546 x37607','13088 Stephany Parkways','Apt. 695','North Johnieberg','Minnesota','64130','USA','1966-06-11 00:00:00','2020-02-17 00:00:00'),(25,'Reynaldo','Zboncak','augustine@towne.net','473.440.0793 x0730','9281 Swift Isle','Suite 870','Sanfordmouth','Vermont','91980','USA','1980-03-29 00:00:00','2020-04-01 00:00:00'),(26,'Danial','Marquardt','rosalina@greenfelder.biz','525.694.1594 x011','21481 Sanford Tunnel','Apt. 803','Sonjatown','Wisconsin','77214-8954','USA','1992-08-12 00:00:00','2020-03-13 00:00:00'),(27,'Shakira','Haag','denver.green@weissnat-ritchie.info','1-396-678-1280 x4452','26267 Daugherty Mission','Apt. 115','Emmerichport','Delaware','36368-3038','USA','1998-07-28 00:00:00','2020-03-01 00:00:00'),(28,'Nora','Pouros','coy_ankunding@bayer.info','(344) 732-1968 x939','841 Clyde Spur','Apt. 818','Kunzefurt','New York','91599-5454','USA','1990-02-11 00:00:00','2020-03-13 00:00:00'),(29,'Tristan','Stehr','gino_bashirian@schaden.co','(917) 013-6935 x26562','67955 Rohan Port','Apt. 160','Nolanmouth','Utah','19074-9965','USA','1970-03-30 00:00:00','2020-05-14 00:00:00'),(30,'Lucie','McLaughlin','quintin@kautzer.net','(947) 001-7434','812 Romeo Fork','Apt. 567','West Foster','Nebraska','42125','USA','1990-01-26 00:00:00','2020-05-07 00:00:00');
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
INSERT INTO `patients_users` VALUES (1,1,44),(2,2,5),(3,3,50),(4,4,47),(5,5,19),(6,6,40),(7,7,2),(8,8,9),(9,9,23),(10,10,23),(11,11,41),(12,12,48),(13,13,29),(14,14,48),(15,15,41),(16,16,26),(17,17,29),(18,18,40),(19,19,14),(20,20,14),(21,21,9),(22,22,48),(23,23,14),(24,24,26),(25,25,2),(26,26,23),(27,27,23),(28,28,40),(29,29,36),(30,30,42);
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
INSERT INTO `users` VALUES (1,'$2a$12$qkBt3TPVnP81KjHBdUMVxOMt2PC9/8AKkuyt5IFyH2/1Crbh3GCfa',NULL,NULL,0,NULL,NULL,NULL,NULL,'Roger','Waters',NULL,NULL,'admin@null.com',1000,NULL,'273065304fd458f6e7b8a2668240a4e72754d619c2ed043ce662f1e2d798',NULL,'2020-07-22 19:51:24.335647','2020-07-22 19:51:24.335647'),(2,'$2a$12$4Ha/ArtGUaVKOOibIa1hguWAAQ7ISlkg2bLj49jsGvyQ0Tar6xexG',NULL,NULL,0,NULL,NULL,NULL,NULL,'Terry','Pollich',NULL,NULL,'justin.murphy@jerde.co',300,NULL,'7450262699445ed2893980dc2a0d227efabff3955faee07eb53ce7176941',NULL,'2020-07-22 19:51:24.854923','2020-07-22 19:51:24.854923'),(3,'$2a$12$22MXpDbw9nBnOxN2DT/L1.17kbyd9q6KGk7wZ0PSA1d82/LKGgrn.',NULL,NULL,0,NULL,NULL,NULL,NULL,'Lynwood','Ryan',NULL,NULL,'rueben@shanahan-shanahan.info',200,NULL,'cb72620817bc89adda80d62352832f81982653bb0361745c9ef3192e13f4',NULL,'2020-07-22 19:51:25.058471','2020-07-22 19:51:25.058471'),(4,'$2a$12$29mzH71/1tbfMRifPHvF9ehU83hy2KU9MAR1oaoQm/ph2Humz/sUy',NULL,NULL,0,NULL,NULL,NULL,NULL,'Glinda','Parker',NULL,NULL,'sheree.kuphal@jast-rohan.co',100,NULL,'2d56f86e96aa1bf502996c1b27d2534d4ccf19110bd541a0e91e72af0123',NULL,'2020-07-22 19:51:25.251873','2020-07-22 19:51:25.251873'),(5,'$2a$12$vS3ULQLxSAlZKfFw5vuaJ.lgCXSaQ7NhuAC96hjS0HlRhf3hI9vfK',NULL,NULL,0,NULL,NULL,NULL,NULL,'Leatrice','McLaughlin',NULL,NULL,'damon@kuvalis.info',300,NULL,'f3cdb749220d5980fe2c81c2f303cac71d0589372c4a127d197208c8d1fa',NULL,'2020-07-22 19:51:25.455506','2020-07-22 19:51:25.455506'),(6,'$2a$12$/1U8gC715Z3D0/V9CUeMmeMeFCi74N4Q6ZfKgRTLbOyK7fqyhZq2O',NULL,NULL,0,NULL,NULL,NULL,NULL,'Mable','Batz',NULL,NULL,'clark_auer@champlin-thiel.info',1000,NULL,'2bcb4d42a360c26bd42d712e5d7af0c5dd703d49bccf3eb44344a58326ec',NULL,'2020-07-22 19:51:25.649067','2020-07-22 19:51:25.649067'),(7,'$2a$12$gyao3b8eMLNy5XS8fTXgLuX/7WQ9QSI.C3C9YE9VDYigwrvRzSS2a',NULL,NULL,0,NULL,NULL,NULL,NULL,'Deedra','King',NULL,NULL,'bobbi.ruecker@hessel-johnson.biz',200,NULL,'b9ea5104dac9665bebbac453adf0e5dc5c7aeb903bb2312965d22e132a18',NULL,'2020-07-22 19:51:25.843626','2020-07-22 19:51:25.843626'),(8,'$2a$12$hnWSNBSlTZNyYg4lEE8Z1esO3gccqPjI6C5WXPUyevwI41ZfBpAgK',NULL,NULL,0,NULL,NULL,NULL,NULL,'Raleigh','Willms',NULL,NULL,'arlene@kiehn.biz',1000,NULL,'65296dd0fd94af6091e371a210e4bd709f61905f4968461e39fa3f452004',NULL,'2020-07-22 19:51:26.035789','2020-07-22 19:51:26.035789'),(9,'$2a$12$ttdAeme6LUMqQj3AW23Q1ufaeS/0XVWWaqwLtTIU6BIiY.dwj906a',NULL,NULL,0,NULL,NULL,NULL,NULL,'Emmy','Carroll',NULL,NULL,'tanisha.turcotte@brakus-williamson.biz',300,NULL,'42acf50c36801d422433c2f57406461935d4e83dda1e78c8c765815d5754',NULL,'2020-07-22 19:51:26.229137','2020-07-22 19:51:26.229137'),(10,'$2a$12$c2/u.SLh3HYLikH/CG4fqOgIJWIGj37BjPzSX7ASvZM01tUGiHsme',NULL,NULL,0,NULL,NULL,NULL,NULL,'Kirby','Reichert',NULL,NULL,'fatimah.friesen@wehner.name',200,NULL,'6711d06e05a4f1c97532c4b909d6b27b1e305bab15f45f545f4ff57ddfd5',NULL,'2020-07-22 19:51:26.451063','2020-07-22 19:51:26.451063'),(11,'$2a$12$cN0SWg5EGiaJiEqyRPJAPuca9CkTeWaGNEgKjvXSFP5ip8l3VrZWK',NULL,NULL,0,NULL,NULL,NULL,NULL,'Lien','Gorczany',NULL,NULL,'racheal.schamberger@jerde.name',1000,NULL,'e57964d52a730a51d86932e23caf19f86f5900581369e66a21bcbfa10298',NULL,'2020-07-22 19:51:26.641702','2020-07-22 19:51:26.641702'),(12,'$2a$12$hRaEt.mhWhv2opiPLGgS1ObEvP7lqAADN/SApJCGCt4HJexQoUJpe',NULL,NULL,0,NULL,NULL,NULL,NULL,'Bob','Shields',NULL,NULL,'marlyn.renner@nicolas-mayer.info',1000,NULL,'b9a14fbde4d1cb771d48c87c308db65bfdfa8aa196b73ba1138b37a6ec87',NULL,'2020-07-22 19:51:26.826409','2020-07-22 19:51:26.826409'),(13,'$2a$12$csPD.ohKZdKTVUhrVx.JTOcngiZ2IoVxJ3.FuNUvxt.0Q0TrZfSwO',NULL,NULL,0,NULL,NULL,NULL,NULL,'Ashely','O\'Reilly',NULL,NULL,'carly_crooks@mcclure.org',200,NULL,'03e56561f81bc23b2bcdff21c9ec86c127612a43399fa93e0b5ca774910c',NULL,'2020-07-22 19:51:27.015985','2020-07-22 19:51:27.015985'),(14,'$2a$12$VBdtJfG5kzB6YDcIMLqaB.qw0.MtPEmw31sm4NC9mWgccJ3ILLtgC',NULL,NULL,0,NULL,NULL,NULL,NULL,'Julieta','Schneider',NULL,NULL,'dee@shields.co',300,NULL,'5cc590ec5e1ae1bdfe3e93d83041ee4809736f23aebc9d32a76270199243',NULL,'2020-07-22 19:51:27.205858','2020-07-22 19:51:27.205858'),(15,'$2a$12$evrp7qHSarmgYLj8JTrQv.rRVRkD28nGPl6sz3lOLdlKhOh5cTKo2',NULL,NULL,0,NULL,NULL,NULL,NULL,'Glennie','Lehner',NULL,NULL,'aiko.streich@bednar-klein.co',1000,NULL,'c36068829d90c4dbb00a2dfa3227a6ff65d8aae2d90df6386bfc87ead289',NULL,'2020-07-22 19:51:27.395859','2020-07-22 19:51:27.395859'),(16,'$2a$12$hUH47ozIvw8K.e4G10ZK5uTZt5roUFdf2sXs0FIlSQOZ2H6XxS1Mi',NULL,NULL,0,NULL,NULL,NULL,NULL,'Debera','Stiedemann',NULL,NULL,'terica_littel@grant.co',300,NULL,'5628ad3ecfb6ca4c143337bb77e8063be722cacc6e4e1d367487b7488a5a',NULL,'2020-07-22 19:51:27.588591','2020-07-22 19:51:27.588591'),(17,'$2a$12$kqQPjDg6GxEefP8JSdyp.ea9/IqdJdwYQOJ8iB3LeYg0/JC7IkZW6',NULL,NULL,0,NULL,NULL,NULL,NULL,'Mee','Shanahan',NULL,NULL,'quiana_dickens@ferry-jerde.io',100,NULL,'f29bb01030bbcd7c2a4e905a25aac53f4bd2337af67415e9c9a7bd28cd72',NULL,'2020-07-22 19:51:27.774455','2020-07-22 19:51:27.774455'),(18,'$2a$12$t4SH/HpZJKNV1GgwF0RCI.SpsQ3USdVhBcyLFOzIaP.dLsmFVhz5K',NULL,NULL,0,NULL,NULL,NULL,NULL,'Shakita','Hilll',NULL,NULL,'juliet_shanahan@rempel.co',200,NULL,'942c008df97880ac0e67600a3fbfa314d3f822f924687a769c2844471590',NULL,'2020-07-22 19:51:27.968822','2020-07-22 19:51:27.968822'),(19,'$2a$12$xu8yeJL2HJYHuHfIEHhNeeiOVAIYK426eRwGptqGKi7abUTF.Q8yq',NULL,NULL,0,NULL,NULL,NULL,NULL,'Kandis','Toy',NULL,NULL,'clint_feil@brown.info',300,NULL,'265ede2cfc1fccf4ba54c369d975e384ad27c15b046dd996150965b0c5e5',NULL,'2020-07-22 19:51:28.157236','2020-07-22 19:51:28.157236'),(20,'$2a$12$bVUeDI3NfKuU6dg7dpqeees56VCZky0JcnbZayeF1IpVcgX0EHqJe',NULL,NULL,0,NULL,NULL,NULL,NULL,'Connie','Rippin',NULL,NULL,'keila@price-pfannerstill.net',200,NULL,'13d4dcd55b635eb3dc2997c7a24af245c90255ab7cd917ecb206f98bfb82',NULL,'2020-07-22 19:51:28.342793','2020-07-22 19:51:28.342793'),(21,'$2a$12$0REGzH2ZqK05PAw6BY7XC.X9qA8y7hFODEnVR2eGp4mJ8pv1WGB86',NULL,NULL,0,NULL,NULL,NULL,NULL,'Renetta','Sanford',NULL,NULL,'mac@quigley.co',300,NULL,'406d5166e8fd6a5bd108cf58917c6abeff030a6790f07d9b4860a357d10f',NULL,'2020-07-22 19:51:28.539664','2020-07-22 19:51:28.539664'),(22,'$2a$12$dQyxtVR.0Aooi/2ZMlb6GO23OqhwqeLbbpZfWQXslUM3yuNSRRgXe',NULL,NULL,0,NULL,NULL,NULL,NULL,'Abbie','Friesen',NULL,NULL,'darrell.littel@huel.net',1000,NULL,'6666392a414c48626af5e2b9db30d0571c197f2f73b04c15e32c561bc022',NULL,'2020-07-22 19:51:28.732164','2020-07-22 19:51:28.732164'),(23,'$2a$12$c6jqPwzr2beFU5pWgidaYudKLIaVezaTMvl0unif0IBTJwUTLBXzm',NULL,NULL,0,NULL,NULL,NULL,NULL,'Brett','Herzog',NULL,NULL,'mckinley_daugherty@ohara.co',300,NULL,'d835f62b9f1537d02e0f6d34c3f41dff9e5b8378433ec1ba10bd1161079b',NULL,'2020-07-22 19:51:28.918559','2020-07-22 19:51:28.918559'),(24,'$2a$12$LKj.S43Hxnh.GM/eBlxwE.o5TxRPrlvICdLcO2Cx.v4podPZzG6FS',NULL,NULL,0,NULL,NULL,NULL,NULL,'Gerardo','Daugherty',NULL,NULL,'jay@goldner.info',1000,NULL,'97b155682636e2313c45fc4f821d361826f4d37d2960b3e7a19291d02ecf',NULL,'2020-07-22 19:51:29.110653','2020-07-22 19:51:29.110653'),(25,'$2a$12$PMwI8wLFfz5hR3zNBBmpgeM9baw5NQtRTP18sJxCcSXbkYgO9KQEq',NULL,NULL,0,NULL,NULL,NULL,NULL,'Jeremiah','Mayer',NULL,NULL,'frank.beier@bode-kessler.org',100,NULL,'407c814ec3008327373879636368f8081139327a37d6aae9f7f5e54d1d15',NULL,'2020-07-22 19:51:29.298832','2020-07-22 19:51:29.298832'),(26,'$2a$12$vGG15fdL2WNSRvm5rWoWy.vjpxBdvPE3JMlSXPSqLpoPuqlHhCEYm',NULL,NULL,0,NULL,NULL,NULL,NULL,'Neville','Halvorson',NULL,NULL,'rosendo.koss@lesch.org',300,NULL,'fe663ac99223e306cc84ade63094045e31504a92c780371bf3fdead2c780',NULL,'2020-07-22 19:51:29.498542','2020-07-22 19:51:29.498542'),(27,'$2a$12$Mp6NC1dVQc/lLAGY2TgA7.L6/BMj8jNNYSMc1nUpGCFN7X5y6lQF6',NULL,NULL,0,NULL,NULL,NULL,NULL,'Jarrett','Kuhn',NULL,NULL,'concetta.hilpert@lemke.com',300,NULL,'447432d46bbb386344f754cc011142080788f44c94f78bc22657ffb1b387',NULL,'2020-07-22 19:51:29.691678','2020-07-22 19:51:29.691678'),(28,'$2a$12$2ix/07xFdE4GDxVN9BaRSONq/Ytja6Dxr2AuF3kXKVQfnZ5li45GK',NULL,NULL,0,NULL,NULL,NULL,NULL,'Precious','Walsh',NULL,NULL,'kayleen@casper-leannon.com',1000,NULL,'8db9c1522db433c9cb0598d24a804e6c9220a096923c1ebce3a87cbbef4a',NULL,'2020-07-22 19:51:29.879644','2020-07-22 19:51:29.879644'),(29,'$2a$12$IqGr55HdoOmMrSiZkzpxOeoc2bgNku0gKWU5ZYdqY0j0.bRwr1.MW',NULL,NULL,0,NULL,NULL,NULL,NULL,'Jamaal','Blanda',NULL,NULL,'bryce.johnston@weimann.co',300,NULL,'0d522fc8b9f3f6f052e854c7a32c39e4d09fb9261bffe0d293a158a5c949',NULL,'2020-07-22 19:51:30.074274','2020-07-22 19:51:30.074274'),(30,'$2a$12$iwa69qitY3BTLbnnBc4q2.0WcdTaEALKynkJURx6jQSxrVsttL1y.',NULL,NULL,0,NULL,NULL,NULL,NULL,'Dian','Thompson',NULL,NULL,'domitila@jacobi.co',300,NULL,'775eaaa05c261649ff91f2f4a54742c6bc61221b4c16ffcd19315de3e92d',NULL,'2020-07-22 19:51:30.260507','2020-07-22 19:51:30.260507'),(31,'$2a$12$8Mqy8SGQz0ITHQ9CDXyb8uE67m6mtbYQIz56QUnXny8fS0Td1YFTm',NULL,NULL,0,NULL,NULL,NULL,NULL,'Roseline','Bradtke',NULL,NULL,'wonda_wolff@hodkiewicz-hammes.info',300,NULL,'341ca7030d4f91e000cad75c9d85176788c90e165c19599948867d5a39c9',NULL,'2020-07-22 19:51:30.453977','2020-07-22 19:51:30.453977'),(32,'$2a$12$09.LzahoTqdpQIHtT.jLUOyfDSPKcUmbIM/BBe1d1ratdZxHeF2Le',NULL,NULL,0,NULL,NULL,NULL,NULL,'Korey','Prohaska',NULL,NULL,'chantay.kautzer@schultz-deckow.net',300,NULL,'4a721fa4517ed56f3a3414eb80a6c5a33e6d0c2de9fb4d51b405461a0a5e',NULL,'2020-07-22 19:51:30.645903','2020-07-22 19:51:30.645903'),(33,'$2a$12$eo88tVTJd7EeJdUmaedwge28M4NalNDztzIAWuIWKqInZRBYzv6Vi',NULL,NULL,0,NULL,NULL,NULL,NULL,'Adriana','Goldner',NULL,NULL,'carleen_bechtelar@wisozk.info',200,NULL,'04090f403d09cae7cfccb82ce055d6724d221d33896df4a5a5c3737d14cd',NULL,'2020-07-22 19:51:30.831879','2020-07-22 19:51:30.831879'),(34,'$2a$12$2Qrkbb4hEDNpr4QllMDnkOT06PpPadS6pCk3h47tWh8eoAeR9fnJO',NULL,NULL,0,NULL,NULL,NULL,NULL,'Harley','Larson',NULL,NULL,'alfredo_crist@stokes.net',300,NULL,'26edc7d8258bc7275c7e7905f077734920b41aaf9cbeb73fb2b079aed79d',NULL,'2020-07-22 19:51:31.020435','2020-07-22 19:51:31.020435'),(35,'$2a$12$p9K53OuCG18Nzhisz0pLKOQPRWpqPG0oCOOKpLkCYxyP1KzpHl1iO',NULL,NULL,0,NULL,NULL,NULL,NULL,'Malinda','Erdman',NULL,NULL,'alana@gusikowski.name',200,NULL,'fc9fbd05982c8d727399a0a7ac394e2a144cc18f6b9e567953adac0b596e',NULL,'2020-07-22 19:51:31.206545','2020-07-22 19:51:31.206545'),(36,'$2a$12$uaCxpSNFADWU89qHx1OzRuaWE620LEIpNovtiB6geGoR1.1dnL6Xm',NULL,NULL,0,NULL,NULL,NULL,NULL,'Randy','Harvey',NULL,NULL,'dara@jacobs.io',300,NULL,'a967ff941715bf2a8c202072e67d2d0fdea15713197e7eecfb9965f636e9',NULL,'2020-07-22 19:51:31.393748','2020-07-22 19:51:31.393748'),(37,'$2a$12$8kE4Kg0v36TY1SG6wqXC8uZsvqOGLVqxsfmVxVVWYzzCd7xy8ycUu',NULL,NULL,0,NULL,NULL,NULL,NULL,'Roma','Ruecker',NULL,NULL,'karole.senger@weimann.name',100,NULL,'11e26aa9d6d480f752696d5685bb3afce2ec79f4e475fdf714bf3c5b6ced',NULL,'2020-07-22 19:51:31.589088','2020-07-22 19:51:31.589088'),(38,'$2a$12$cM2qoTENSCNIwap1n6.cIe45s9PXCFkRsP7vYsyU7syVZzFb2f2Se',NULL,NULL,0,NULL,NULL,NULL,NULL,'Isiah','Maggio',NULL,NULL,'temika_schinner@homenick.name',200,NULL,'a90b627598badd308a5e785eb73ea7511072fe281fb025b076438db7bb10',NULL,'2020-07-22 19:51:31.776027','2020-07-22 19:51:31.776027'),(39,'$2a$12$SbVC1Xn9tPwryxn2ENwSTOTH3ZldHl7FItcJHjEnKkbA8rPQxtu0W',NULL,NULL,0,NULL,NULL,NULL,NULL,'Moises','O\'Hara',NULL,NULL,'chelsey@mertz.org',100,NULL,'16592359ada1a646c0d7bf1e6a2c158dd9e72c753f2236b34f5cb7fab50a',NULL,'2020-07-22 19:51:31.971562','2020-07-22 19:51:31.971562'),(40,'$2a$12$nxm1Z4JWCwbV1.7jxekAOOf2tgQhzW5EFpwQfVjtfFJtrI3NjIBLq',NULL,NULL,0,NULL,NULL,NULL,NULL,'Christinia','Koss',NULL,NULL,'david_conroy@ferry.name',300,NULL,'7e08a9332f0ecfb2ca213bdfb51d8099ede88da5c12274c6d05d827aa5f3',NULL,'2020-07-22 19:51:32.159651','2020-07-22 19:51:32.159651'),(41,'$2a$12$NJi67jRGWuC.oY5fFvzSiOE7RCpZIIAG3sZ4Fe9Wo2SqKWv4VAI3i',NULL,NULL,0,NULL,NULL,NULL,NULL,'Debrah','Wisozk',NULL,NULL,'dannie@kling-gorczany.info',300,NULL,'c8d097ca99a6c298eefe5c4e54495d07fb2bb3f0576135ed5e8f37f25b15',NULL,'2020-07-22 19:51:32.355474','2020-07-22 19:51:32.355474'),(42,'$2a$12$bO8Gd0wNocW5Xy5OqOlotuzDJ31/CEmYx0IKNZ4.3kyautiFxmYlW',NULL,NULL,0,NULL,NULL,NULL,NULL,'Milagros','Breitenberg',NULL,NULL,'shanice@will-hettinger.com',300,NULL,'e52be6ea2a17fab26f4e4c07357bb171a19327763702702c0e364d4f0c50',NULL,'2020-07-22 19:51:32.550493','2020-07-22 19:51:32.550493'),(43,'$2a$12$XINrBJnwLoOiiWLQPjztDOoI/Z4vsUq1nrgG6/i42VWCQKxOVD0GS',NULL,NULL,0,NULL,NULL,NULL,NULL,'Aron','Koepp',NULL,NULL,'rod@king-franecki.net',1000,NULL,'5512996736fed5e2ef8f2dc746a96542a5c9ca0aeaf3f8439eef0e36516d',NULL,'2020-07-22 19:51:32.740797','2020-07-22 19:51:32.740797'),(44,'$2a$12$MRWcrzzQh4VZ5v0zNI31Aee0.4OWSLAVNrdpVf.kGdJ03KsXUeYFi',NULL,NULL,0,NULL,NULL,NULL,NULL,'Julietta','Ratke',NULL,NULL,'jc.murazik@heaney.name',300,NULL,'23457a88fda4713da01541c8795b3ce5fdf7cb1938dc4561e3c1f6d55b62',NULL,'2020-07-22 19:51:32.934724','2020-07-22 19:51:32.934724'),(45,'$2a$12$ypiAE2i1SxIhUA4Ygt4PTeczCCVflhEPmK.kh.ySGL8Zmt8byJjOS',NULL,NULL,0,NULL,NULL,NULL,NULL,'Terence','Dach',NULL,NULL,'leandro@leffler-hartmann.net',100,NULL,'6a8a5b5abd99f6d95725884c1e845e8e45cd60ccaacdcbd1d4ed546adbdb',NULL,'2020-07-22 19:51:33.123784','2020-07-22 19:51:33.123784'),(46,'$2a$12$pNp7bxcG0oPaoJcn8gjEWuXS67oXykkH8zKHQBBQ5NnCnbdG1BqJ2',NULL,NULL,0,NULL,NULL,NULL,NULL,'Jeramy','Cruickshank',NULL,NULL,'lannie@harvey-towne.org',200,NULL,'65204e77e704b1186958a683c9bdb4c163b5dc0accdb344477a95c9df083',NULL,'2020-07-22 19:51:33.334735','2020-07-22 19:51:33.334735'),(47,'$2a$12$8.B3YDmTxl6lbV4JnEeBjeJv4lFn1t6fx2oTBFNqqZgyv7zJ/7wW2',NULL,NULL,0,NULL,NULL,NULL,NULL,'Marchelle','Morar',NULL,NULL,'jose@bogan-pouros.org',300,NULL,'654aeb22122b9fd0803578440d8106ffaaf39333aa944b82aed26b03273d',NULL,'2020-07-22 19:51:33.531845','2020-07-22 19:51:33.531845'),(48,'$2a$12$oxwQV3AslHhJU8NO030sR.fAMNXaFonKrjSCiXH6pVZNj6BBdR0yq',NULL,NULL,0,NULL,NULL,NULL,NULL,'Charmain','Rodriguez',NULL,NULL,'natashia_prohaska@frami.net',300,NULL,'09308bbf0db018b8081220b82bd6d6184f051d2740fe83bc776169501697',NULL,'2020-07-22 19:51:33.727801','2020-07-22 19:51:33.727801'),(49,'$2a$12$6Vz8wGZEprvIj4sdH3PYJO7MiVGLz4mC45vxGPKeKHsaLLLhV112m',NULL,NULL,0,NULL,NULL,NULL,NULL,'Glen','Runte',NULL,NULL,'darron@mosciski.name',300,NULL,'79eeed9c1464b0e04e807928799c3eea7020a53d1733bd0920d6034f48ef',NULL,'2020-07-22 19:51:33.916570','2020-07-22 19:51:33.916570'),(50,'$2a$12$uuJYNCpm9T/PXChCG6.Ape6ftce1jim/nkEjYcN2zUEMJTfA4lmiC',NULL,NULL,0,NULL,NULL,NULL,NULL,'Melia','Lind',NULL,NULL,'karl@damore.org',300,NULL,'a815d36e30dbca01f2de79be37bc87aa47f543fd75288ba1feef1ffe8e4f',NULL,'2020-07-22 19:51:34.106674','2020-07-22 19:51:34.106674'),(51,'$2a$12$RLz0h6i8EcTCSRuyC8gej.bmbkHBCBwkErpRK4v.1sSY5P9qZjb.e',NULL,NULL,0,NULL,NULL,NULL,NULL,'Bambi','Muller',NULL,NULL,'germaine.watsica@fisher.io',200,NULL,'2472a7657b9a3bdca51227fb22ac87abaa64c8ed6ffe1cf809a297535018',NULL,'2020-07-22 19:51:34.293770','2020-07-22 19:51:34.293770');
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

-- Dump completed on 2020-07-22 13:51:34
