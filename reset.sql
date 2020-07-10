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
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2020-07-10 14:22:43.275867','2020-07-10 14:22:43.275867'),('schema_sha1','089ac717d72b467e1dd7b9ac9af115663434afd3','2020-07-10 14:22:43.282793','2020-07-10 14:22:43.282793');
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
INSERT INTO `organizations` VALUES (1,0,'Simonis, Orn and Kerluke',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,6,0,0,'2020-07-10 14:22:46.389596','2020-07-10 14:22:46.441944'),(2,1,'Veum Group',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,2,3,1,0,'2020-07-10 14:22:46.401907','2020-07-10 14:22:46.412835'),(3,1,'Collier Group',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,4,5,1,0,'2020-07-10 14:22:46.432055','2020-07-10 14:22:46.441944'),(4,0,'Fay, Rath and Bartoletti',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,12,0,0,'2020-07-10 14:22:46.456117','2020-07-10 14:22:46.497381'),(5,1,'Kulas-Tillman',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,8,9,1,0,'2020-07-10 14:22:46.465652','2020-07-10 14:22:46.475223'),(6,1,'Jast, Gulgowski and Aufderhar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,10,11,1,0,'2020-07-10 14:22:46.488753','2020-07-10 14:22:46.497381'),(7,0,'Koch-Simonis',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,18,0,0,'2020-07-10 14:22:46.509851','2020-07-10 14:22:46.547784'),(8,1,'Wunsch, Smith and Gleason',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,14,15,1,0,'2020-07-10 14:22:46.517868','2020-07-10 14:22:46.526483'),(9,1,'Ryan, Lebsack and Lindgren',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,16,17,1,0,'2020-07-10 14:22:46.539600','2020-07-10 14:22:46.547784'),(10,0,'Stehr-Leannon',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,24,0,0,'2020-07-10 14:22:46.559935','2020-07-10 14:22:46.598013'),(11,1,'O\'Kon-Rosenbaum',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,20,21,1,0,'2020-07-10 14:22:46.567920','2020-07-10 14:22:46.576328'),(12,1,'Ledner Group',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,22,23,1,0,'2020-07-10 14:22:46.589393','2020-07-10 14:22:46.598013'),(13,0,'Schoen-Turcotte',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,25,30,0,0,'2020-07-10 14:22:46.611575','2020-07-10 14:22:46.651451'),(14,1,'Treutel-Kuvalis',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,26,27,1,0,'2020-07-10 14:22:46.620181','2020-07-10 14:22:46.629109'),(15,1,'Hudson Inc',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,28,29,1,0,'2020-07-10 14:22:46.642331','2020-07-10 14:22:46.651451');
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
INSERT INTO `organizations_patients` VALUES (1,4,1),(2,7,2),(3,7,3),(4,13,4),(5,7,5),(6,10,6),(7,4,7),(8,7,8),(9,7,9),(10,7,10),(11,4,11),(12,4,12),(13,7,13),(14,7,14),(15,10,15),(16,4,16),(17,1,17),(18,10,18),(19,1,19),(20,4,20),(21,10,21),(22,4,22),(23,10,23),(24,10,24),(25,10,25),(26,10,26),(27,13,27),(28,13,28),(29,4,29),(30,7,30);
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
INSERT INTO `organizations_users` VALUES (1,1,2),(2,9,2),(3,1,3),(4,12,3),(5,1,4),(6,9,4),(7,1,5),(8,11,5),(9,1,6),(10,14,6),(11,1,7),(12,9,7),(13,1,8),(14,12,8),(15,1,9),(16,2,9),(17,1,10),(18,5,10),(19,1,11),(20,12,11),(21,4,12),(22,11,12),(23,4,13),(24,15,13),(25,4,14),(26,5,14),(27,4,15),(28,8,15),(29,4,16),(30,12,16),(31,4,17),(32,3,17),(33,4,18),(34,15,18),(35,4,19),(36,6,19),(37,4,20),(38,9,20),(39,4,21),(40,14,21),(41,7,22),(42,15,22),(43,7,23),(44,14,23),(45,7,24),(46,12,24),(47,7,25),(48,15,25),(49,7,26),(50,6,26),(51,7,27),(52,12,27),(53,7,28),(54,5,28),(55,7,29),(56,3,29),(57,7,30),(58,8,30),(59,7,31),(60,12,31),(61,10,32),(62,9,32),(63,10,33),(64,5,33),(65,10,34),(66,6,34),(67,10,35),(68,8,35),(69,10,36),(70,6,36),(71,10,37),(72,3,37),(73,10,38),(74,3,38),(75,10,39),(76,6,39),(77,10,40),(78,3,40),(79,10,41),(80,5,41),(81,13,42),(82,5,42),(83,13,43),(84,14,43),(85,13,44),(86,12,44),(87,13,45),(88,8,45),(89,13,46),(90,6,46),(91,13,47),(92,5,47),(93,13,48),(94,9,48),(95,13,49),(96,15,49),(97,13,50),(98,2,50),(99,13,51),(100,15,51);
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
INSERT INTO `patients` VALUES (1,'Allene','Hammes','emil.kuvalis@rutherford.net','1-637-650-2754 x9354','377 Kerluke Lake','Apt. 166','Hillshaven','Mississippi','37954-1815','USA','1953-03-08 00:00:00','2020-01-31 00:00:00'),(2,'Selene','Murphy','tomeka.tromp@lindgren.org','266.519.5303','558 Heidenreich Estate','Suite 818','East Carsonfort','California','95816','USA','1957-09-24 00:00:00','2020-05-19 00:00:00'),(3,'Emil','Reinger','stephine@kris-wehner.com','1-392-081-2546','566 Ernesto Dale','Suite 472','East Esteban','Maryland','67645','USA','1939-08-15 00:00:00','2020-01-29 00:00:00'),(4,'Kenny','Toy','jody@conroy.org','1-405-977-6755 x8949','6598 Rodger Extension','Apt. 636','Reneaburgh','Utah','37171-9389','USA','1961-09-24 00:00:00','2020-04-03 00:00:00'),(5,'Myrtis','Zieme','rocco_berge@dicki.com','938-368-6885 x4362','574 Danika Mission','Suite 698','Lake Bethann','Delaware','00700','USA','1962-11-10 00:00:00','2020-01-15 00:00:00'),(6,'Perry','Wilderman','donna_ziemann@gulgowski.org','663.032.3715 x7597','616 Era Pine','Suite 369','Oberbrunnerstad','New Jersey','12572','USA','1983-11-02 00:00:00','2020-04-12 00:00:00'),(7,'Hyun','Crona','herschel_hodkiewicz@thiel-nitzsche.co','(850) 512-9450 x46209','92893 Delbert Throughway','Suite 716','Anastaciaview','Washington','46225','USA','1942-01-29 00:00:00','2020-03-21 00:00:00'),(8,'Lonny','Hand','raelene@jenkins.net','619.264.6420 x21933','90899 Rickey Wall','Apt. 704','Erikshire','Maine','15422','USA','1973-03-19 00:00:00','2020-03-05 00:00:00'),(9,'Monica','Wisozk','daphine_cassin@flatley.biz','(422) 551-5448 x2620','943 Latrina Curve','Apt. 131','Rosetteport','Idaho','93712-7309','USA','1957-07-09 00:00:00','2020-03-24 00:00:00'),(10,'Minta','Osinski','ron_corwin@kilback-larkin.org','(699) 023-6117','8510 Zachary Shore','Apt. 295','South Micah','Colorado','60695-7583','USA','1950-04-04 00:00:00','2020-05-15 00:00:00'),(11,'Theodore','Anderson','jeramy@krajcik.net','138-192-4537 x18646','905 Emmett Ferry','Suite 356','Stokestown','Hawaii','38489','USA','1982-07-26 00:00:00','2020-02-14 00:00:00'),(12,'Cortez','Thompson','benedict.swaniawski@hand-monahan.io','323.636.1972 x296','96027 Irvin Ridges','Apt. 317','Port Floychester','Mississippi','72680-0223','USA','1995-04-28 00:00:00','2020-03-31 00:00:00'),(13,'Art','Mohr','ursula_swift@kiehn.name','(646) 772-7209 x153','654 Mia Stravenue','Apt. 513','Tyland','Virginia','98558-2028','USA','1930-10-13 00:00:00','2020-02-01 00:00:00'),(14,'Gregory','Kozey','odell@thiel.net','974.400.6194 x4827','96499 Kirby Island','Suite 954','West Basil','Missouri','00959','USA','1989-04-03 00:00:00','2020-03-28 00:00:00'),(15,'Mac','Smith','candace@boehm.biz','875-192-3677 x239','5449 Spinka Club','Apt. 284','New Burlton','Ohio','87955','USA','1938-11-28 00:00:00','2020-02-05 00:00:00'),(16,'Lenita','Klein','hsiu@dicki.net','394.758.1014','738 Bednar Port','Suite 645','Schambergerchester','Idaho','18569','USA','1984-12-01 00:00:00','2020-03-23 00:00:00'),(17,'Johanne','Spinka','blair.pacocha@kub-zieme.co','(839) 892-4480 x38604','5179 Dave Islands','Apt. 750','Lake Glennmouth','Delaware','32774','USA','1958-12-21 00:00:00','2020-02-06 00:00:00'),(18,'Leann','Kirlin','arlie.jacobson@cole.com','1-885-579-5405 x452','927 Joey Estate','Suite 593','West Moseburgh','Tennessee','45162','USA','1977-07-10 00:00:00','2020-06-02 00:00:00'),(19,'Hilario','King','leandro.auer@renner.biz','(116) 117-1345 x5334','9193 Bergstrom Run','Apt. 971','New Valentinabury','Louisiana','06007','USA','1956-07-29 00:00:00','2020-02-03 00:00:00'),(20,'Laura','Schuster','valentin@davis.net','992-010-2526 x373','90264 Mayert Flats','Apt. 618','Zemlakmouth','Utah','42607-0213','USA','1932-11-11 00:00:00','2020-04-07 00:00:00'),(21,'Brant','Ryan','edmundo@rosenbaum-schroeder.com','1-766-581-8564 x2960','3909 Beatty Stravenue','Suite 632','Lake Myrtlemouth','North Carolina','28281','USA','1974-09-30 00:00:00','2020-01-14 00:00:00'),(22,'Kathaleen','Ankunding','jules.bergnaum@howell-oberbrunner.info','881-651-4771 x7712','365 Bernard Curve','Suite 775','Clarencetown','Tennessee','20457','USA','1996-06-25 00:00:00','2020-02-29 00:00:00'),(23,'Bertie','Kreiger','shavonda.quigley@oberbrunner-bins.com','504.801.3975 x49551','88609 Schaefer Fords','Suite 650','North Joe','North Carolina','15188-2978','USA','1987-02-17 00:00:00','2020-02-13 00:00:00'),(24,'Alisa','Maggio','russ@brown-ratke.biz','1-133-242-2761 x29366','5258 Ratke Point','Apt. 986','Hilpertland','Louisiana','20170','USA','1934-04-10 00:00:00','2020-04-18 00:00:00'),(25,'Ernest','Harber','georgeann@considine.info','375-623-9786 x376','841 Crooks Camp','Suite 190','North Anastaciaborough','Michigan','13903-4335','USA','1970-10-25 00:00:00','2020-02-08 00:00:00'),(26,'Hui','Walter','daniella_weimann@quitzon.net','195.266.6421 x3241','30719 Michal Lakes','Suite 992','South Ferne','Delaware','36351-1863','USA','1993-05-26 00:00:00','2020-04-18 00:00:00'),(27,'Travis','Wilderman','brett_dooley@fay.org','(698) 517-2001 x9996','73779 Goldner Courts','Suite 493','West Fosterbury','New Hampshire','48063-0522','USA','1936-05-31 00:00:00','2020-03-22 00:00:00'),(28,'Abbey','Corwin','jarred@howe-bahringer.com','600-834-5556 x345','2357 Darby Fort','Apt. 650','Ricebury','Wisconsin','59348','USA','1939-11-24 00:00:00','2020-05-31 00:00:00'),(29,'Ali','Muller','chong@mraz-paucek.net','249.589.3620 x048','4042 Corwin Roads','Suite 883','West Sharellville','Illinois','07354','USA','1941-01-18 00:00:00','2020-02-28 00:00:00'),(30,'Garry','Miller','dan@russel-grady.co','295.353.1674 x18239','82234 Levi Passage','Apt. 865','Meridethport','Utah','68980','USA','1937-08-29 00:00:00','2020-06-06 00:00:00');
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
INSERT INTO `patients_users` VALUES (1,1,17),(2,2,24),(3,3,26),(4,4,50),(5,5,31),(6,6,33),(7,7,17),(8,8,22),(9,9,28),(10,10,24),(11,11,17),(12,12,20),(13,13,31),(14,14,31),(15,15,38),(16,16,17),(17,17,4),(18,18,33),(19,19,2),(20,20,15),(21,21,38),(22,22,15),(23,23,35),(24,24,33),(25,25,33),(26,26,37),(27,27,48),(28,28,46),(29,29,17),(30,30,24);
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
INSERT INTO `users` VALUES (1,'$2a$12$HGQ6C01ERIhUZ0AGmXQpa.4sxKaqWkAjbpumZriUbl4rPT8XDiojC',NULL,NULL,0,NULL,NULL,NULL,NULL,'Roger','Waters',NULL,NULL,'admin@null.com',1000,NULL,'a214b8fd1c6be7528f52a7526bd9c179687b061e4a56d91b8b8ae1d90771',NULL,'2020-07-10 14:22:46.130825','2020-07-10 14:22:46.130825'),(2,'$2a$12$TvrSmHEzJhJoScmxjv6CPuWb8yhVFpCEsLnxdIJQhkYox6gWJDpv6',NULL,NULL,0,NULL,NULL,NULL,NULL,'Clay','Nikolaus',NULL,NULL,'wilbur_toy@okeefe-brakus.org',300,NULL,'b6f0de7e412c5fc3f2f7621ceff613203f52f672dcc2d9dab51dbd1c765a',NULL,'2020-07-10 14:22:46.962371','2020-07-10 14:22:46.962371'),(3,'$2a$12$BObsE3Jk3Ztiv/wYOHzZQ.DKtRhxQSyXRJkETe1UruRHYQM/Itgha',NULL,NULL,0,NULL,NULL,NULL,NULL,'Jose','Kuhlman',NULL,NULL,'lillian@gulgowski-hahn.org',200,NULL,'7245ef15e18ab0112c5a8ff117001ee5850fe8441185a6c8841d7b82c04e',NULL,'2020-07-10 14:22:47.254873','2020-07-10 14:22:47.254873'),(4,'$2a$12$e1.VBafV1yBKkRdAkbp0Ce9wFmXYGGzun.fWjB69kerQWX0pzBdFm',NULL,NULL,0,NULL,NULL,NULL,NULL,'Harold','Pacocha',NULL,NULL,'sonja_paucek@gottlieb.net',300,NULL,'7878b867c3534cfb5978f1add6f67dc17b0b989f123bbb1bb42cab621397',NULL,'2020-07-10 14:22:47.542080','2020-07-10 14:22:47.542080'),(5,'$2a$12$VDpqPCD/WsFcBUnmoV5T2OxgJfVLJtTyqN0X.Q9HQLqcRCMzgri3W',NULL,NULL,0,NULL,NULL,NULL,NULL,'Adell','Howell',NULL,NULL,'sol.thompson@kunze-conroy.co',300,NULL,'707e7eb0545427999d1cb08c71830b9db3356b42a3561eb1aa290a2f835c',NULL,'2020-07-10 14:22:47.821202','2020-07-10 14:22:47.821202'),(6,'$2a$12$oHrpTEwzpifCXFX0YCrifOOvJPM49x1I6BBAMtgU2ZZFBkE1VPg2.',NULL,NULL,0,NULL,NULL,NULL,NULL,'Thad','Blick',NULL,NULL,'evan@schuppe.com',300,NULL,'f1721f5ebe0f200a2e529458bd42934d976a7c4c704a3ad77c2038a3c330',NULL,'2020-07-10 14:22:48.107500','2020-07-10 14:22:48.107500'),(7,'$2a$12$ZwdnWOVd.Yp3WcGAf3AjUuVxPpanSYt7W2DofViFH1ZzyqRq8ekLW',NULL,NULL,0,NULL,NULL,NULL,NULL,'Stefania','Streich',NULL,NULL,'winnie.rath@gaylord.co',200,NULL,'012b3e31ffc70b12238471271196bf6812611f3463fc930b66ea34702fba',NULL,'2020-07-10 14:22:48.395881','2020-07-10 14:22:48.395881'),(8,'$2a$12$q0h9eQpzh1TOafcUlpTH3OIi3Mf2VkjWtNpdC2wTPWD6JIs8/jHwa',NULL,NULL,0,NULL,NULL,NULL,NULL,'Clifford','Cummerata',NULL,NULL,'abe@dooley-hartmann.biz',200,NULL,'6c439587a9165fe3ea481ace78f46c2cf068c88c94e614d0bb0e754cbee3',NULL,'2020-07-10 14:22:48.681922','2020-07-10 14:22:48.681922'),(9,'$2a$12$JulX451S2602ZX5/vJ1X7eVHAp3J.ElPy9JKMb.BokYrkuC/0NXYC',NULL,NULL,0,NULL,NULL,NULL,NULL,'Maurine','Hayes',NULL,NULL,'tasha@robel.io',1000,NULL,'4441e5e7b9b8fd1e5884ab490e2ebd55693bfa09440ef21d0337beba0d5f',NULL,'2020-07-10 14:22:48.958102','2020-07-10 14:22:48.958102'),(10,'$2a$12$dxJoTeXekn2TxfF63RgMrO/ytuMWTr0Cr116V5zzRwLu.lZ/04Y5C',NULL,NULL,0,NULL,NULL,NULL,NULL,'Mohammad','Mraz',NULL,NULL,'brad_daniel@terry.io',200,NULL,'803fb68a6efab2488ea22844b615f03139e8aded88cbb4cafc7bb82c3c0b',NULL,'2020-07-10 14:22:49.276173','2020-07-10 14:22:49.276173'),(11,'$2a$12$0zOa/bEdKXZp2XrjXp8J0u.yWVIRW2eF2yxb0/Pzw5hW50YjXE0qa',NULL,NULL,0,NULL,NULL,NULL,NULL,'Louvenia','Gerhold',NULL,NULL,'torie@bahringer.biz',200,NULL,'878a2b2b55caf142a3065d88fd5072670686642f1e9ea68db748e699a59a',NULL,'2020-07-10 14:22:49.563554','2020-07-10 14:22:49.563554'),(12,'$2a$12$PFL/2ViYhhWKUy4JV1i5PO6qJMcSfiS9sKKvVKzWpeuwrJMfRcATe',NULL,NULL,0,NULL,NULL,NULL,NULL,'Renaldo','Reynolds',NULL,NULL,'lindsey.hackett@miller.co',100,NULL,'444934dc477e018dbb80845bc97be6fb9ff469e256bf1a575cffb2a06cd2',NULL,'2020-07-10 14:22:49.845337','2020-07-10 14:22:49.845337'),(13,'$2a$12$Gv4.bzC29slU5DnB/uH4B.SeXGA7dvIkjHYLX0oacNF774MKM4d22',NULL,NULL,0,NULL,NULL,NULL,NULL,'Stanley','Bogisich',NULL,NULL,'eldridge@miller.org',100,NULL,'63ffaddfc4c55c359fddd10368c10c1c07e5f8a97c3b6b5cb444ee4c2f00',NULL,'2020-07-10 14:22:50.117447','2020-07-10 14:22:50.117447'),(14,'$2a$12$wVQBlwLyplhSGHdYC6SsHumwLIHk8tGkJLeFtzwmro0O6rJSX.15a',NULL,NULL,0,NULL,NULL,NULL,NULL,'Myrtle','Grimes',NULL,NULL,'izetta.shields@luettgen.info',200,NULL,'447141781002c050abf58a4796de763a902e157d5745797b96aec534bf34',NULL,'2020-07-10 14:22:50.402434','2020-07-10 14:22:50.402434'),(15,'$2a$12$cbyCoYy6VbGzTwwd8ccDxumf/tgmDwCFgJuaubKkimb4qCU35kNoC',NULL,NULL,0,NULL,NULL,NULL,NULL,'Miguelina','Kling',NULL,NULL,'dorothea@boyer.name',300,NULL,'46a3ff240f8b9f5a49185ea695f3101f984a29bada9c7d8fa074dc987204',NULL,'2020-07-10 14:22:50.692827','2020-07-10 14:22:50.692827'),(16,'$2a$12$ZOxfWwRSmhjrmwpQcpKTp.0Hj28cUCsMGa7mW7Z2Er6uNKVFvxxqC',NULL,NULL,0,NULL,NULL,NULL,NULL,'Carmen','Romaguera',NULL,NULL,'allyson.ernser@wiza.net',100,NULL,'c05354a276cb909a23903dec62a2d8b87b73d6caf6325545a1fcbd4ddf28',NULL,'2020-07-10 14:22:50.971196','2020-07-10 14:22:50.971196'),(17,'$2a$12$.ZciSpZZYoJxEIE9EonJF.3o.ykcxljiIGSTQ7BmphhrEzMPIhtXm',NULL,NULL,0,NULL,NULL,NULL,NULL,'Frances','Oberbrunner',NULL,NULL,'mirella_jenkins@white.org',300,NULL,'ef90a4f390e344ef9aeb4de6221303581321ddb046ee73ba5121fa34b8e4',NULL,'2020-07-10 14:22:51.226907','2020-07-10 14:22:51.226907'),(18,'$2a$12$.noMADuhrxFD.4Ed93q0YeYDsyvF.PVq210hBpboWHX8psGpJaEXS',NULL,NULL,0,NULL,NULL,NULL,NULL,'Avery','Kilback',NULL,NULL,'catheryn@murazik.io',100,NULL,'a21b933d011f1a35969bfa25e97b357aea6ddb2073211b36da0d91d71f0f',NULL,'2020-07-10 14:22:51.414711','2020-07-10 14:22:51.414711'),(19,'$2a$12$iV62Ccv3WUaMRxqXlTRZQeaSJND5PP0K/aKlkuV.lJxsYrMSDU8I6',NULL,NULL,0,NULL,NULL,NULL,NULL,'Delisa','Douglas',NULL,NULL,'sean.schuppe@satterfield-reilly.info',300,NULL,'77d6b686f12e629fb6f49794d3224646c3c213d76a0660bc7dfac47aa0d0',NULL,'2020-07-10 14:22:51.603010','2020-07-10 14:22:51.603010'),(20,'$2a$12$8/x.u8FetUzDmXQpxWtEMe0v/xho.AFioh/ZmXCSp/j0.3lf3.3TK',NULL,NULL,0,NULL,NULL,NULL,NULL,'Sandy','Schumm',NULL,NULL,'elijah_paucek@dach.name',300,NULL,'94d2e1931c53c7d72484e684ee27ab736991597e59f0aa48e82b6131feb9',NULL,'2020-07-10 14:22:51.793399','2020-07-10 14:22:51.793399'),(21,'$2a$12$gQyYm4o.nSOP8SdGPNxENeR0MLvIY1JX1nYYPcxBNtsDdsY1jKr8S',NULL,NULL,0,NULL,NULL,NULL,NULL,'Kathern','Witting',NULL,NULL,'maya@bergstrom.net',300,NULL,'0fcfe9f5ec508ad9dbc8a0011903ab928dfafd622864538b9abda97846ab',NULL,'2020-07-10 14:22:51.981111','2020-07-10 14:22:51.981111'),(22,'$2a$12$B6hz1u1ZEkAVoI6dJp2LEuy12u1eOSIn5wyqKErB0XBFtfw/TWJLy',NULL,NULL,0,NULL,NULL,NULL,NULL,'Joaquin','Daugherty',NULL,NULL,'mercy.krajcik@ward.net',300,NULL,'ecf0bf7c433b9d7438e1a915d43cc14454409acba08f5305c0c2d64ed55b',NULL,'2020-07-10 14:22:52.167871','2020-07-10 14:22:52.167871'),(23,'$2a$12$0L0ODoofQ6EZNa4mfrZjHu/5PEJT7gJ4ioQt1gnZQiQowOqI9/LsO',NULL,NULL,0,NULL,NULL,NULL,NULL,'Bernie','Wunsch',NULL,NULL,'levi.weissnat@kuhn-fay.biz',200,NULL,'1250969517280dd665ab60f530b3fcf3a1aac0ea15ff518005dd40cf6834',NULL,'2020-07-10 14:22:52.356388','2020-07-10 14:22:52.356388'),(24,'$2a$12$SuLXPTIkkxnRT9.RAqZvc.q4niV8D0Ygi6IHzaHLRmtx8w5uy/Y4y',NULL,NULL,0,NULL,NULL,NULL,NULL,'Lauri','Lehner',NULL,NULL,'jonathan_considine@west.info',300,NULL,'75cac3922dcdb7316794e09517e229609767e8b065a0baf78c09d0c86239',NULL,'2020-07-10 14:22:52.577330','2020-07-10 14:22:52.577330'),(25,'$2a$12$.3E7H3/5grmqwI6TscUqIeM5Jb166Uh7HJ0KBjZa4bQUzwkzXsAO.',NULL,NULL,0,NULL,NULL,NULL,NULL,'Tristan','Nicolas',NULL,NULL,'connie.schultz@schultz.name',100,NULL,'c305ffb25ed1f36dc3b3e93f842a162bbb51c6197787d9f2381206a16c50',NULL,'2020-07-10 14:22:52.777684','2020-07-10 14:22:52.777684'),(26,'$2a$12$3dYHyq16F.Y7Jka3xYSVMu9gVBaA0IW4jON36T5vSW2gOca0vQy1q',NULL,NULL,0,NULL,NULL,NULL,NULL,'Waldo','VonRueden',NULL,NULL,'rudolph_auer@barton.com',300,NULL,'08403b5f9c0718e354e09d1372ad6da803428060bcc013ccc46c5893d146',NULL,'2020-07-10 14:22:52.985780','2020-07-10 14:22:52.985780'),(27,'$2a$12$SOKNnJx5k1JUhYdTYJZNquPeCVjN6TqD/n3z.DIlmK2tThRY2.e9i',NULL,NULL,0,NULL,NULL,NULL,NULL,'Raina','Kulas',NULL,NULL,'virginia.osinski@lockman-wehner.net',100,NULL,'d2ea8dc588ed182f2dcfd54a548346c57417ac73fe64a86f2dba6b1d3cf4',NULL,'2020-07-10 14:22:53.176002','2020-07-10 14:22:53.176002'),(28,'$2a$12$NEnvQCZYNp2OliePFGgvMu7/w0E3tB5QueB98TXSMxhNiyQ96FAxq',NULL,NULL,0,NULL,NULL,NULL,NULL,'Cletus','Fay',NULL,NULL,'tammy.jacobson@hackett-powlowski.org',300,NULL,'39a3904d54b2359bde256e617e0692e9ece7815ad5d9e7ed6598a2d75067',NULL,'2020-07-10 14:22:53.364358','2020-07-10 14:22:53.364358'),(29,'$2a$12$.NWEKm.aanKEnNqcHZiiS.UjOEueuArEE1Xa7oD3TDZXM146fBBGW',NULL,NULL,0,NULL,NULL,NULL,NULL,'Jerold','Huels',NULL,NULL,'daron@hartmann.co',100,NULL,'a2f779b9a79b44cbbfc74a68c6ffcb4c540cdb8e49e42aa4dc1680bd7478',NULL,'2020-07-10 14:22:53.552648','2020-07-10 14:22:53.552648'),(30,'$2a$12$mCCrLNffIo5L070OsDr./.IhavAdfPJbtB5p1OZYTDPtGrBY88t3a',NULL,NULL,0,NULL,NULL,NULL,NULL,'Orlando','Kuhlman',NULL,NULL,'jeramy_krajcik@wilderman-brown.co',300,NULL,'c7dfb18eb54347d06dccb75576844801d5347c520a2014b4ab67702989dd',NULL,'2020-07-10 14:22:53.741335','2020-07-10 14:22:53.741335'),(31,'$2a$12$s7ui.dIZVTfb3B7hH6mYa.eUFUX7BggJxduZCwlTOslk.xKJLq8Eq',NULL,NULL,0,NULL,NULL,NULL,NULL,'Antoine','Hodkiewicz',NULL,NULL,'adeline.shanahan@graham.com',300,NULL,'297a5ca809bdaa4a2938618afb4511a74f06c9f7097f44edfaed62db112a',NULL,'2020-07-10 14:22:53.929803','2020-07-10 14:22:53.929803'),(32,'$2a$12$Z.v88twilxU4fYo/0saacu5QFjojjv98mFaO0LaUg8sWN6a2M/vSO',NULL,NULL,0,NULL,NULL,NULL,NULL,'Milford','Sauer',NULL,NULL,'micah_hahn@rau-kunze.info',300,NULL,'b7d9673906594f54702f42fdaea7097e2f6704da2f7b48dedca513d7b901',NULL,'2020-07-10 14:22:54.122288','2020-07-10 14:22:54.122288'),(33,'$2a$12$IKSqljB72j4rs6CmT4nfRuzV0f/rFzu2zUo4d4C6SEI.MDyTYUlBG',NULL,NULL,0,NULL,NULL,NULL,NULL,'Carlos','Gislason',NULL,NULL,'erlene@howell.name',300,NULL,'31adb70f8fe7665efdaf40dc2fbf6bcecf3ae6e03ca0aed2c97d65b6a6b4',NULL,'2020-07-10 14:22:54.389049','2020-07-10 14:22:54.389049'),(34,'$2a$12$cTi3vOvR6mLQkkP.zu.LJOWSOF.ApumvKNVlD4K/rM/tcPBrseGM2',NULL,NULL,0,NULL,NULL,NULL,NULL,'Stefan','Rath',NULL,NULL,'chadwick_goldner@torp.org',300,NULL,'91eae26b5e8adb3d70f846312dcf37cc40625be7c05a9e4ed34e9ea0a6bc',NULL,'2020-07-10 14:22:54.670018','2020-07-10 14:22:54.670018'),(35,'$2a$12$fkNwstavYboqYnBN2k1L.ekMP5E972sOksONaQ22h4uHyCJ2s7g82',NULL,NULL,0,NULL,NULL,NULL,NULL,'Rodney','Rosenbaum',NULL,NULL,'val@erdman-larson.info',300,NULL,'d5c49421b7ac8cdf58e8946befcb12dda898cf270029f4ee7e8b23d60ab1',NULL,'2020-07-10 14:22:54.946255','2020-07-10 14:22:54.946255'),(36,'$2a$12$H.GylQrFDqUV12w2a0hRz.D6YmwYrrYvUeQauhop1O9jW.KLuu/xy',NULL,NULL,0,NULL,NULL,NULL,NULL,'Sam','Kutch',NULL,NULL,'tamiko@cole-watsica.com',100,NULL,'89ba3b3e5969efd21726546d84ff7c4af1bdd12c55c34c39cc60a5df1316',NULL,'2020-07-10 14:22:55.220832','2020-07-10 14:22:55.220832'),(37,'$2a$12$BZ3fMTVBD6tjJZ7sxnd0.ene0nz0.Hojijm12E9I6O/sEff3CCvB.',NULL,NULL,0,NULL,NULL,NULL,NULL,'Tabatha','Greenfelder',NULL,NULL,'bertram.heathcote@thiel.co',300,NULL,'b25da072cc3358d26117825b6b328e15a0afe1c45e88b94405d16bf7a062',NULL,'2020-07-10 14:22:55.496047','2020-07-10 14:22:55.496047'),(38,'$2a$12$4BqDve3iaUiKkoL0R8oNX.JRy2DaQ1VOOpltMYa6D/Pc5qsnsSU4q',NULL,NULL,0,NULL,NULL,NULL,NULL,'Bernie','Reinger',NULL,NULL,'troy@tillman.info',300,NULL,'8d484e5e51a48cf01e8cbcbc4f8dca84541bdd53e9ca7aa4ceb273a2131c',NULL,'2020-07-10 14:22:55.772201','2020-07-10 14:22:55.772201'),(39,'$2a$12$Nj5SvThJGBiS3P2OJ0zbrujbfh7aZRNTicMN0kgFYA6TmZ3CN3nRO',NULL,NULL,0,NULL,NULL,NULL,NULL,'Antonia','Turcotte',NULL,NULL,'val.wintheiser@dibbert.io',1000,NULL,'6d5750aa4d5de3a91715be8c6bf25c81daec6893d53cd4f54e0d25bffe7a',NULL,'2020-07-10 14:22:56.050909','2020-07-10 14:22:56.050909'),(40,'$2a$12$pU8j7ds/78O1YWi4If9/EOWtgic4tVPIGg1g1rGmx3e/P52kX2HPS',NULL,NULL,0,NULL,NULL,NULL,NULL,'Sandie','Friesen',NULL,NULL,'leopoldo.beier@abbott.co',100,NULL,'f72c69ab825228b7024cc397731ec9c0daa9b7f7211a0b832dec3b107209',NULL,'2020-07-10 14:22:56.324968','2020-07-10 14:22:56.324968'),(41,'$2a$12$BO6zMwAbeXw62pyM9gnLTeYJoQ0nZ3he.UEPQKpsi4bSmup8L08N2',NULL,NULL,0,NULL,NULL,NULL,NULL,'Holly','Rodriguez',NULL,NULL,'bernie_klein@marvin.name',100,NULL,'b0443cd73fada4f657e4c7dcf5ad88bc6e839b29d10fce84e73319565d91',NULL,'2020-07-10 14:22:56.604863','2020-07-10 14:22:56.604863'),(42,'$2a$12$JJd1FGqp2rUfLPofx2M9DOrFQhd9c.RbgynSLUX0A9hcKB2oKO8i2',NULL,NULL,0,NULL,NULL,NULL,NULL,'Shirleen','Corkery',NULL,NULL,'lanell.rippin@vonrueden.co',200,NULL,'8487a106b9217f4a8f44a88c3e86745adbe87ef8982ea3a5d26bf13af5c0',NULL,'2020-07-10 14:22:56.885452','2020-07-10 14:22:56.885452'),(43,'$2a$12$cWcGhqkPpnHdnCNpLZTr9.6SSKgzvuDJHtyfwUy5oF6PjcyLF17SW',NULL,NULL,0,NULL,NULL,NULL,NULL,'Dallas','Pouros',NULL,NULL,'latonia_konopelski@mcclure.info',200,NULL,'5e09b73e40c67c3f6c8225c4a22761240b1b091a088d44a116e90daa23ff',NULL,'2020-07-10 14:22:57.164956','2020-07-10 14:22:57.164956'),(44,'$2a$12$QNhKgBSgJaXiRYj2vvG5fuxcrVl2f2cFJ01hSwwCIefDkv9Et.vom',NULL,NULL,0,NULL,NULL,NULL,NULL,'Joette','Jerde',NULL,NULL,'lyndia_kessler@schultz-smitham.net',200,NULL,'59b89640d3720822a8cd25e34b9d04fa9935e7d932038dc48ba08c70f4bc',NULL,'2020-07-10 14:22:57.439171','2020-07-10 14:22:57.439171'),(45,'$2a$12$0ZlxgUGCm2ntImtsqnTbXec8NM9SnK0Fha9iPVsyjCpoIYYNg6Z6e',NULL,NULL,0,NULL,NULL,NULL,NULL,'Mason','Bechtelar',NULL,NULL,'mohammad@kiehn-schamberger.io',300,NULL,'d1b5bed6e7022ba14478a085d6f545e311f703e77ace34279a46c1c1a1f2',NULL,'2020-07-10 14:22:57.716777','2020-07-10 14:22:57.716777'),(46,'$2a$12$oYRZ/CmHRJoPsE/2HCNXi.u/ELOyYyauVhyIhck3iWo8ZYbGxW6qK',NULL,NULL,0,NULL,NULL,NULL,NULL,'Bret','Rohan',NULL,NULL,'alpha@crona.co',300,NULL,'2ad0474feacbc55594a0e77d9c3295f8441bec1b88ac5f68341098fd5dab',NULL,'2020-07-10 14:22:58.026457','2020-07-10 14:22:58.026457'),(47,'$2a$12$7dhJAWE7hJlvmQYoL.Zs0uo1rFpZ/D.W9nLKAqzqxP47sAV3QhcuS',NULL,NULL,0,NULL,NULL,NULL,NULL,'Lynn','Koepp',NULL,NULL,'darla_strosin@kuphal.org',200,NULL,'00128ded0f352fc4875bcbbd527d151924a23877793a029ad941c3f28400',NULL,'2020-07-10 14:22:58.306824','2020-07-10 14:22:58.306824'),(48,'$2a$12$iaRXI4HtA8obS2AJNqpGJ.GxTXurJzn7BiBNUKDt9Dnsrh1TWmfSa',NULL,NULL,0,NULL,NULL,NULL,NULL,'Svetlana','Runte',NULL,NULL,'lucina@stoltenberg.net',300,NULL,'96f59f29fe5481169c99176f9265e12c1a831216aeebd1f1f13f806792fa',NULL,'2020-07-10 14:22:58.581217','2020-07-10 14:22:58.581217'),(49,'$2a$12$.6EdxDARivHcKKY/FUHOkeWlFiQbhUaqDWcSPpEuOeZ1sq.fcqCIi',NULL,NULL,0,NULL,NULL,NULL,NULL,'Norman','Becker',NULL,NULL,'isobel@harber.name',100,NULL,'01f0151a3526b862e766cd85e50aa2a0b1bd39075bc93c3937f917e84ae0',NULL,'2020-07-10 14:22:58.857496','2020-07-10 14:22:58.857496'),(50,'$2a$12$9aIBa3efGQ2KfvtEeqqkAeKU6Mvm3A0w02RzzYcut3QrWafw8PlMi',NULL,NULL,0,NULL,NULL,NULL,NULL,'Jillian','Emmerich',NULL,NULL,'dann@wunsch.name',300,NULL,'9ef5f1b0a8a325b6f862750c0859a6d2fe28fd771a538da7e9fb59986182',NULL,'2020-07-10 14:22:59.136156','2020-07-10 14:22:59.136156'),(51,'$2a$12$3g2skqwbwQ80eKjJExMGjefnBF1o5F1W4Wcgx0Mt8o9.p6l7xDmyO',NULL,NULL,0,NULL,NULL,NULL,NULL,'Clint','Sanford',NULL,NULL,'darren@koch.net',200,NULL,'cfbdeac07bcc91a3ecd44f89f4d7c9dcb1012bedbed20835dab344ec9670',NULL,'2020-07-10 14:22:59.412168','2020-07-10 14:22:59.412168');
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

-- Dump completed on 2020-07-10  8:23:00
