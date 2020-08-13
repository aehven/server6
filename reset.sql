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
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2020-08-13 22:27:16.760193','2020-08-13 22:27:16.760193'),('schema_sha1','322f5867575b4efacbe4e01e1b4a16d482c17a13','2020-08-13 22:27:16.765480','2020-08-13 22:27:16.765480');
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
INSERT INTO `organizations` VALUES (1,0,'Klein, Abshire and Murphy',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,6,0,0,'2020-08-13 22:27:18.961615','2020-08-13 22:27:19.004886'),(2,1,'Lynch Group',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,2,3,1,0,'2020-08-13 22:27:18.970019','2020-08-13 22:27:18.979118'),(3,1,'Franecki, Wehner and King',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,4,5,1,0,'2020-08-13 22:27:18.996207','2020-08-13 22:27:19.004886'),(4,0,'Pacocha, Rohan and Fahey',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,12,0,0,'2020-08-13 22:27:19.015218','2020-08-13 22:27:19.048047'),(5,1,'Bergstrom, Schowalter and Boehm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,8,9,1,0,'2020-08-13 22:27:19.021724','2020-08-13 22:27:19.028465'),(6,1,'Bode-Kutch',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,10,11,1,0,'2020-08-13 22:27:19.038735','2020-08-13 22:27:19.048047'),(7,0,'Lockman-MacGyver',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,18,0,0,'2020-08-13 22:27:19.058991','2020-08-13 22:27:19.112512'),(8,1,'Bins LLC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,14,15,1,0,'2020-08-13 22:27:19.066944','2020-08-13 22:27:19.074121'),(9,1,'Powlowski-Buckridge',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,16,17,1,0,'2020-08-13 22:27:19.105146','2020-08-13 22:27:19.112512'),(10,0,'Zulauf, Haag and Schmitt',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,24,0,0,'2020-08-13 22:27:19.123328','2020-08-13 22:27:19.157248'),(11,1,'Price-Yundt',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,20,21,1,0,'2020-08-13 22:27:19.129875','2020-08-13 22:27:19.136683'),(12,1,'Gutmann-Huel',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,22,23,1,0,'2020-08-13 22:27:19.149880','2020-08-13 22:27:19.157248'),(13,0,'Fay-Mann',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,25,30,0,0,'2020-08-13 22:27:19.166991','2020-08-13 22:27:19.196675'),(14,1,'Borer LLC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,26,27,1,0,'2020-08-13 22:27:19.173008','2020-08-13 22:27:19.179159'),(15,1,'Waelchi Group',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,28,29,1,0,'2020-08-13 22:27:19.188609','2020-08-13 22:27:19.196675');
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
INSERT INTO `organizations_users` VALUES (1,1,2),(2,3,2),(3,1,3),(4,6,3),(5,1,4),(6,15,4),(7,1,5),(8,2,5),(9,1,6),(10,9,6),(11,1,7),(12,8,7),(13,1,8),(14,5,8),(15,1,9),(16,3,9),(17,1,10),(18,3,10),(19,1,11),(20,14,11),(21,4,12),(22,3,12),(23,4,13),(24,9,13),(25,4,14),(26,5,14),(27,4,15),(28,9,15),(29,4,16),(30,11,16),(31,4,17),(32,14,17),(33,4,18),(34,11,18),(35,4,19),(36,3,19),(37,4,20),(38,3,20),(39,4,21),(40,3,21),(41,7,22),(42,11,22),(43,7,23),(44,9,23),(45,7,24),(46,15,24),(47,7,25),(48,6,25),(49,7,26),(50,8,26),(51,7,27),(52,11,27),(53,7,28),(54,15,28),(55,7,29),(56,5,29),(57,7,30),(58,6,30),(59,7,31),(60,2,31),(61,10,32),(62,8,32),(63,10,33),(64,8,33),(65,10,34),(66,3,34),(67,10,35),(68,15,35),(69,10,36),(70,11,36),(71,10,37),(72,14,37),(73,10,38),(74,9,38),(75,10,39),(76,3,39),(77,10,40),(78,15,40),(79,10,41),(80,9,41),(81,13,42),(82,8,42),(83,13,43),(84,12,43),(85,13,44),(86,11,44),(87,13,45),(88,9,45),(89,13,46),(90,15,46),(91,13,47),(92,3,47),(93,13,48),(94,3,48),(95,13,49),(96,14,49),(97,13,50),(98,5,50),(99,13,51),(100,9,51);
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
INSERT INTO `patients` VALUES (1,'Antonio','Vivaldi','avivaldi@null.com','1234567890','Somplace nice','Uptown','Florence','Tuscany','12345','Itali','1678-03-04 00:00:00','2020-10-20 00:00:00'),(2,'Efren','Koelpin','fernando_labadie@senger.com','941.606.1590','535 Willms Walks','Apt. 164','Morarshire','Delaware','19667-4340','USA','1939-08-10 00:00:00','2020-06-11 00:00:00'),(3,'Lovie','Abernathy','leonardo@bernhard.co','(587) 729-5096 x58970','268 Laci Isle','Suite 241','South Roxana','Florida','36419-1269','USA','1976-05-08 00:00:00','2020-03-09 00:00:00'),(4,'Madelaine','Prosacco','josh.kautzer@weissnat.net','614.251.4565 x64143','182 Olinda Lights','Suite 694','New Gertude','Alaska','10413-5365','USA','1944-08-30 00:00:00','2020-05-03 00:00:00'),(5,'Marty','Johns','philip@west.org','863.620.2374 x3008','2736 Mosciski Mission','Apt. 153','Turnerton','North Dakota','90391','USA','1949-03-06 00:00:00','2020-05-16 00:00:00'),(6,'William','Welch','jody_dooley@schmeler.net','1-438-526-9376 x902','72148 Hahn Points','Apt. 469','Nadeneshire','New Hampshire','81800-0382','USA','1993-12-23 00:00:00','2020-03-09 00:00:00'),(7,'Ervin','Larson','monte@hilll.org','914.690.6962 x713','1245 Deckow Glen','Apt. 678','Russelton','Georgia','45800','USA','1990-10-29 00:00:00','2020-05-03 00:00:00'),(8,'Dexter','Kirlin','rosena@cummings.info','680-548-8691 x770','4107 Corwin Highway','Apt. 800','Lednerborough','Iowa','75590','USA','1985-10-10 00:00:00','2020-04-11 00:00:00'),(9,'Cordie','Bechtelar','princess_smith@dickens.biz','1-822-571-6944 x125','5416 Elvin Turnpike','Apt. 210','Wisozkfurt','Alaska','35410-6070','USA','1935-01-05 00:00:00','2020-05-07 00:00:00'),(10,'Telma','Sanford','karlyn_abbott@mosciski.org','(725) 957-4386','9582 Moore Centers','Suite 433','Lake Virgil','North Carolina','81690-1750','USA','1982-04-14 00:00:00','2020-06-02 00:00:00'),(11,'Tanja','Denesik','oda@bashirian.biz','873.314.6429','65976 Turcotte Spurs','Apt. 316','West Ilianaburgh','New York','55170','USA','1964-08-30 00:00:00','2020-03-11 00:00:00'),(12,'Elias','Larkin','sharla@waelchi.io','(122) 752-3143 x3899','41102 Murray Forge','Apt. 725','North Renettamouth','Alaska','90945','USA','1946-12-13 00:00:00','2020-07-08 00:00:00'),(13,'Robin','Fadel','roscoe@crona.co','(230) 873-2282','970 Krajcik Throughway','Apt. 747','West Johnnie','Indiana','81905-1963','USA','1955-10-18 00:00:00','2020-05-23 00:00:00'),(14,'Keturah','Hudson','marguerite@quitzon.co','815-424-8717 x3805','33112 Auer Pine','Suite 636','Satterfieldstad','Colorado','30819','USA','1983-07-23 00:00:00','2020-04-11 00:00:00'),(15,'Lauren','Williamson','joellen@ziemann-bode.co','(729) 228-8235 x0905','1055 Keven Loop','Suite 838','Ritchieville','Illinois','63341','USA','1993-12-13 00:00:00','2020-04-10 00:00:00'),(16,'Cary','Zieme','maybelle@bailey.io','1-774-011-4853 x816','15914 Leonard Creek','Apt. 815','Bodeview','Pennsylvania','10373','USA','1994-03-11 00:00:00','2020-02-20 00:00:00'),(17,'Pearly','Green','kirstin@murray.biz','291.808.2694 x6509','35380 Kenyetta Light','Apt. 721','West Fletcherville','Missouri','34346','USA','1932-05-31 00:00:00','2020-03-03 00:00:00'),(18,'George','Dooley','maye@pouros.net','453-829-4311 x9040','20637 Suzanne Plain','Apt. 657','Port Brittton','North Dakota','78411','USA','1965-11-17 00:00:00','2020-03-25 00:00:00'),(19,'Debra','Block','lenny@haley-ullrich.io','1-886-816-6351 x6058','7928 Barbera Field','Suite 648','Norrisville','Hawaii','43535','USA','1968-04-30 00:00:00','2020-05-07 00:00:00'),(20,'Renna','Parisian','catalina_moen@cremin-bartell.name','128-756-2361 x06918','2687 Jones Junction','Apt. 424','Walkerfort','Minnesota','28897','USA','1970-08-12 00:00:00','2020-06-03 00:00:00'),(21,'Seth','Smith','millard@adams.com','525.387.6872 x6614','31473 Cruickshank Unions','Apt. 142','Port Keneth','Texas','86797-7408','USA','1949-01-08 00:00:00','2020-04-02 00:00:00'),(22,'Arturo','Wintheiser','anitra@harris.name','1-843-542-8404','720 Donte Union','Apt. 889','East Fredtown','Hawaii','74834','USA','1944-05-05 00:00:00','2020-03-07 00:00:00'),(23,'Rosella','Glover','olevia@keeling.co','(633) 913-2759 x80333','285 Ellsworth Falls','Apt. 660','Jongborough','North Carolina','39628-5248','USA','1973-07-07 00:00:00','2020-05-04 00:00:00'),(24,'Charlie','Simonis','merle_crooks@gottlieb.org','(307) 221-4129 x2378','794 Emmett River','Suite 486','South Glen','Hawaii','87603','USA','1944-10-03 00:00:00','2020-02-28 00:00:00'),(25,'Azzie','Larson','ivan_brown@marks.io','(470) 283-8650','4414 Boehm Forks','Apt. 898','Cronaview','Wisconsin','55043','USA','1931-10-23 00:00:00','2020-07-06 00:00:00'),(26,'Dallas','Konopelski','leo@kohler.co','997.240.0096','110 Kulas Well','Apt. 772','Ryanfurt','Alabama','74126-2028','USA','1971-12-06 00:00:00','2020-02-20 00:00:00'),(27,'Millard','Schultz','linnea.wolf@schmidt.org','796-856-5803 x1258','51906 Angelina Drive','Suite 153','East Guillermina','Texas','90863','USA','1991-12-12 00:00:00','2020-04-09 00:00:00'),(28,'Johnathon','West','stasia.denesik@volkman.com','696.730.1389 x223','894 Will Mall','Suite 327','South Sherikaborough','Alabama','31349-8218','USA','1934-07-12 00:00:00','2020-07-13 00:00:00'),(29,'Foster','Marquardt','santos_white@hackett-nicolas.net','545-645-6237 x980','372 Deshawn Pike','Suite 237','Bradtketown','Ohio','31492','USA','1964-01-29 00:00:00','2020-06-22 00:00:00'),(30,'Odelia','Mann','jarod@breitenberg-white.net','313-246-9600 x21445','1509 Stoltenberg Canyon','Apt. 843','South Bambifort','Utah','51176','USA','1942-12-21 00:00:00','2020-04-19 00:00:00'),(31,'Willy','Jerde','gerri_rowe@breitenberg.com','938-766-6962','29499 Price Squares','Apt. 551','Scottbury','Nevada','12403-7344','USA','1971-03-23 00:00:00','2020-03-25 00:00:00');
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
INSERT INTO `patients_users` VALUES (1,1,46),(2,2,46),(3,3,46),(4,4,46),(5,5,46),(6,6,46),(7,7,46),(8,8,46),(9,9,46),(10,10,46),(11,11,46),(12,12,46),(13,13,46),(14,14,46),(15,15,46),(16,16,46),(17,17,46),(18,18,46),(19,19,46),(20,20,46),(21,21,46),(22,22,46),(23,23,46),(24,24,46),(25,25,46),(26,26,46),(27,27,46),(28,28,46),(29,29,46),(30,30,46),(31,31,46);
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
INSERT INTO `users` VALUES (1,'$2a$12$0ESh4fnPaQM8.UTVOqihX.1g8lrhX1FMgN358FB5kD4dXPHvN2Qb.',NULL,NULL,0,NULL,NULL,NULL,NULL,'Roger','Waters',NULL,NULL,'admin@null.com',1000,NULL,'b0a50c7b7fe9663f5d449198d5d49f2db38b23433b4288c7d734e836cbe0',NULL,'2020-08-13 22:27:18.767707','2020-08-13 22:27:18.767707'),(2,'$2a$12$uVmAn95Q/V06zCGX5uNJXuGdmaHtpiOSk45AEpbTLSADaebkdiKmG',NULL,NULL,0,NULL,NULL,NULL,NULL,'Mathew','Senger',NULL,NULL,'Therapist0@Klein.com',100,NULL,'2185df647ffd7609b0681eec805e23c65a80e56c11c36a3b0267cea53a23',NULL,'2020-08-13 22:27:19.414113','2020-08-13 22:27:19.414113'),(3,'$2a$12$jaui33WJ/LeJC22Iz78FyeCFaPVjbGV80cRt.cZOu5HeFzeVve0.y',NULL,NULL,0,NULL,NULL,NULL,NULL,'Brook','Cronin',NULL,NULL,'CanaryAdmin1@Klein.com',1000,NULL,'4f1de78bcf48d7b75d71f4eb81885bf40b1a27b485a54ff40284c42fc8e6',NULL,'2020-08-13 22:27:19.636278','2020-08-13 22:27:19.636278'),(4,'$2a$12$P3rb0hb89V2HprUcoR5eQeoaXo8XI5KyP7ixCaSZjvRTqN9zUMfhq',NULL,NULL,0,NULL,NULL,NULL,NULL,'Frank','Prosacco',NULL,NULL,'Admin2@Klein.com',400,NULL,'f40275188717acf11896a5470597cf0569d79eccdc4c102ee51037307112',NULL,'2020-08-13 22:27:19.837075','2020-08-13 22:27:19.837075'),(5,'$2a$12$runN/VyJLaf61bpC.VYC3.fKg/Te5u06CxdvYNtiCK107Ibd4JaDC',NULL,NULL,0,NULL,NULL,NULL,NULL,'Donald','Runolfsdottir',NULL,NULL,'Admin3@Klein.com',400,NULL,'561177fae7c18c14211944e926e5a1b40243391ec1dcf8749ad70ce3992e',NULL,'2020-08-13 22:27:20.037844','2020-08-13 22:27:20.037844'),(6,'$2a$12$n8/AzXUElceEP.FD0X0oiu5bPgUWU0nfkZQvxssAcK.t7yYUCHO5K',NULL,NULL,0,NULL,NULL,NULL,NULL,'Johnnie','Pfeffer',NULL,NULL,'Nurse4@Klein.com',200,NULL,'3bd7fe84b118d6b32468c11127f2fcf1adb40640ca316d67167abdcef24a',NULL,'2020-08-13 22:27:20.233875','2020-08-13 22:27:20.233875'),(7,'$2a$12$NgJ9jQr1XJusaSqaa1h10OLopMYEmWL/CDTw5HxMqQuYzyKS4JtPq',NULL,NULL,0,NULL,NULL,NULL,NULL,'Armando','Olson',NULL,NULL,'Nurse5@Klein.com',200,NULL,'918a9399588711729ecbc1d9d8cf65dd1f10e5ae019a34909eff4a7ed583',NULL,'2020-08-13 22:27:20.428081','2020-08-13 22:27:20.428081'),(8,'$2a$12$l1XkUhSmm2w7zz62qb5V9.rfmAetIMXn2UZD6ucD2irz/Y8v/nanq',NULL,NULL,0,NULL,NULL,NULL,NULL,'Candis','Stoltenberg',NULL,NULL,'Therapist6@Klein.com',100,NULL,'dc62d90de8a386b0b678272bc2b7d4b51fb8ef2493344218f634858b3428',NULL,'2020-08-13 22:27:20.618447','2020-08-13 22:27:20.618447'),(9,'$2a$12$I2BYKRPgqz37X.zkTQF3HefoPk7OLYjcMYAAA8NY1X/NF4taU44dy',NULL,NULL,0,NULL,NULL,NULL,NULL,'Ora','Bailey',NULL,NULL,'Admin7@Klein.com',400,NULL,'fd7edda1a652316506ebe9517e753e9cb6a2481a19f7627e460ccf4bf1d8',NULL,'2020-08-13 22:27:20.808793','2020-08-13 22:27:20.808793'),(10,'$2a$12$U8lFX.z.nm34sGF0LL/3zucf/kC04VkXktIT1armVinQNr4vRnjJy',NULL,NULL,0,NULL,NULL,NULL,NULL,'Reggie','Zulauf',NULL,NULL,'Therapist8@Klein.com',100,NULL,'9a29dad11c30cb442154a70ef8d4ed357a119fc246f8aaa8b15c26398e01',NULL,'2020-08-13 22:27:21.009406','2020-08-13 22:27:21.009406'),(11,'$2a$12$8Gk8dJ62xSm9Z3j7NeGx4.Y4EhehF.mQbAPjj1C8p2YjFjF/sc9jO',NULL,NULL,0,NULL,NULL,NULL,NULL,'Loren','Gutkowski',NULL,NULL,'CanaryAdmin9@Klein.com',1000,NULL,'5a0a8e8643d3ead3ebeb15b09152d8fbd49b1b08ca9d22945dd16b63dcdf',NULL,'2020-08-13 22:27:21.199691','2020-08-13 22:27:21.199691'),(12,'$2a$12$rswUtl3i7ma9dt3CDd6X9.28He.fBYCjS4TslKhS3ttqkqshZi5PC',NULL,NULL,0,NULL,NULL,NULL,NULL,'Edwardo','Koch',NULL,NULL,'Doctor0@Pacocha.com',300,NULL,'2ad41dcef6412852c7f5861d6cac5bd51509975cd83cdbc2117dde7d9cc9',NULL,'2020-08-13 22:27:21.392353','2020-08-13 22:27:21.392353'),(13,'$2a$12$zkoawvIAKlsBhk43wij1D.VlHUfmlDAkYsAOYs0E0bRbj4bko5MI.',NULL,NULL,0,NULL,NULL,NULL,NULL,'Jacqueline','Price',NULL,NULL,'Doctor1@Pacocha.com',300,NULL,'c8073066ede2df87ac57142c9f0652410b45fb27dc321fcea4c9104dba58',NULL,'2020-08-13 22:27:21.586377','2020-08-13 22:27:21.586377'),(14,'$2a$12$ZoIjOOMo8t6gxQV.x9zja.jOZ8jxZ.I26kqL.HEJzbTX9lDkmPJAu',NULL,NULL,0,NULL,NULL,NULL,NULL,'Marcelina','Marquardt',NULL,NULL,'Therapist2@Pacocha.com',100,NULL,'a776dd87dc43fde64d2724640e6e1a47c8cc54c5f6187e7196d105795507',NULL,'2020-08-13 22:27:21.779888','2020-08-13 22:27:21.779888'),(15,'$2a$12$u7khJ2JTwvhTDwvN62B.eu/rNUMSGqjsse2ANEgt8jI6e3GtFEuX2',NULL,NULL,0,NULL,NULL,NULL,NULL,'Gwyn','Spencer',NULL,NULL,'Nurse3@Pacocha.com',200,NULL,'a0840ccbd6d7cb5ba16397ec18cebe9fec092adfdea16e4dbed4095a3ff5',NULL,'2020-08-13 22:27:21.973684','2020-08-13 22:27:21.973684'),(16,'$2a$12$LJMVrxwN.Stf7DNC.eorQetsDVm5ILhhLOCGlYBAgIbfSpheWMPAq',NULL,NULL,0,NULL,NULL,NULL,NULL,'Chere','Hansen',NULL,NULL,'Nurse4@Pacocha.com',200,NULL,'d0edcd19741b43ec74e54c2b527d427ac0a30b8b31eb171f16b1877a1d9a',NULL,'2020-08-13 22:27:22.167268','2020-08-13 22:27:22.167268'),(17,'$2a$12$lVRZaXjFh8ywqOOg5luBxO1iX0jC2bl2KdDtfUh3aA3fVNgWYfzcS',NULL,NULL,0,NULL,NULL,NULL,NULL,'Bong','Hahn',NULL,NULL,'Therapist5@Pacocha.com',100,NULL,'73fe593c291b62ed65833643e862344799caeea6658b001be60473353ce5',NULL,'2020-08-13 22:27:22.362916','2020-08-13 22:27:22.362916'),(18,'$2a$12$aL3MeW4fXvhgiy19WDG5cOr10AUVAGTPNgoxx8xZ70BzikE2FE1mW',NULL,NULL,0,NULL,NULL,NULL,NULL,'Keely','O\'Kon',NULL,NULL,'Admin6@Pacocha.com',400,NULL,'c2545d677855f9b8f6ed65f6b6f971623e54abd4276b17ebae4c4c48e04d',NULL,'2020-08-13 22:27:22.567069','2020-08-13 22:27:22.567069'),(19,'$2a$12$0CB8WuHH7Htqw9uAB/9vJOBMP8BZeLK9QsoQtj1Izxx.iVVyln.WG',NULL,NULL,0,NULL,NULL,NULL,NULL,'Joni','Schmeler',NULL,NULL,'Doctor7@Pacocha.com',300,NULL,'9f22d17eb6c830266df7e7c3434063bc013bc6dbdc1aad0a55390ede4c3f',NULL,'2020-08-13 22:27:22.788744','2020-08-13 22:27:22.788744'),(20,'$2a$12$Btzp2xPgoExrO1dH7KzaK.f2c2BZWX4FgLuhTTH3aJgSamdIglClu',NULL,NULL,0,NULL,NULL,NULL,NULL,'Nobuko','Ledner',NULL,NULL,'Nurse8@Pacocha.com',200,NULL,'ac4f42a19d6157c9ec3d8b0d3e37cd6b47099e6b2b7379c108cae329ecb3',NULL,'2020-08-13 22:27:22.990216','2020-08-13 22:27:22.990216'),(21,'$2a$12$2ywrEWwUtjqLIJFlAdUB2uR6WM2l8qaeZhLnYgaxUdSVxljSSPhlG',NULL,NULL,0,NULL,NULL,NULL,NULL,'Natalie','Ziemann',NULL,NULL,'Doctor9@Pacocha.com',300,NULL,'999d331db94cce07523977b9788371f233256ecd0b0028e7e35dc33303b2',NULL,'2020-08-13 22:27:23.182060','2020-08-13 22:27:23.182060'),(22,'$2a$12$sLhXt0VYNO/jU/U6DZDx.u95rOR8PDnHd9aWAUmmJ9wjQ2naJkYhO',NULL,NULL,0,NULL,NULL,NULL,NULL,'Mose','Herman',NULL,NULL,'Therapist0@Lockman-MacGyver.com',100,NULL,'313efeb5b853d02770ffab7a0c3eae0da1860e1120e014207ff793458615',NULL,'2020-08-13 22:27:23.378252','2020-08-13 22:27:23.378252'),(23,'$2a$12$EVBmHGVF1WgKXf8/UWgtROq6uKjVtADtbBw6hA7pMaiRnj6tjjO1C',NULL,NULL,0,NULL,NULL,NULL,NULL,'Marry','Upton',NULL,NULL,'CanaryAdmin1@Lockman-MacGyver.com',1000,NULL,'95ee687477cb58fccc7afbbd676eb41679fd393afd7844760113e38b743d',NULL,'2020-08-13 22:27:23.572364','2020-08-13 22:27:23.572364'),(24,'$2a$12$x3aGZnetYbGmcgAafQ9MV.58PgJowtQh9X2nPtfFO0RQQ4OPEDq.G',NULL,NULL,0,NULL,NULL,NULL,NULL,'Donella','Stokes',NULL,NULL,'CanaryAdmin2@Lockman-MacGyver.com',1000,NULL,'cfb173c46208a4a8d71add673c4a2f7cbbcadad7de71ae59a1ff4e6fabdf',NULL,'2020-08-13 22:27:23.763992','2020-08-13 22:27:23.763992'),(25,'$2a$12$tmjX.KRCgVmNA9B.O9QY1.yuSI28L0Wgs99eaWzyZohPEcc.ZzMSq',NULL,NULL,0,NULL,NULL,NULL,NULL,'Holley','Bauch',NULL,NULL,'Nurse3@Lockman-MacGyver.com',200,NULL,'12594022776ad86f84d3ff3a3c40e2b9e91c589f7cb5a78129c748a00c5f',NULL,'2020-08-13 22:27:23.954622','2020-08-13 22:27:23.954622'),(26,'$2a$12$OZNbJoEYgsTQi9h1LAY7L.sGgJ4dMXWZg2WpdhudsO2MFV8TIqkcu',NULL,NULL,0,NULL,NULL,NULL,NULL,'Cordell','Dickinson',NULL,NULL,'Nurse4@Lockman-MacGyver.com',200,NULL,'10b9f7b9dfae3c4f1c8fc1fd8a88f9de62137fe684b2806355ca0c68ee68',NULL,'2020-08-13 22:27:24.147705','2020-08-13 22:27:24.147705'),(27,'$2a$12$0JTo01gmJYWO22BtmY9iMuoXD6XT1jlCdCGPjijNKRh71IgTD8x1m',NULL,NULL,0,NULL,NULL,NULL,NULL,'Jimmie','Von',NULL,NULL,'Admin5@Lockman-MacGyver.com',400,NULL,'d4eca60b120523c96846f055488e48da32d546cdc4e908036887e44bf830',NULL,'2020-08-13 22:27:24.338386','2020-08-13 22:27:24.338386'),(28,'$2a$12$.fZjcJ9jE4PYqZHtSbvGVels9xDhGthng9x80OKjUdmyiB.7oLGGK',NULL,NULL,0,NULL,NULL,NULL,NULL,'Darin','Murphy',NULL,NULL,'Admin6@Lockman-MacGyver.com',400,NULL,'3bb2a1f3409020ced922b57f395120c16cf9cb465d20e84ec78f5aa1b79c',NULL,'2020-08-13 22:27:24.534050','2020-08-13 22:27:24.534050'),(29,'$2a$12$9DbKA6i7SxHSX3wVX9L3uuazEVUyIThSxi7b2q8IVlRAwtdmeVyVC',NULL,NULL,0,NULL,NULL,NULL,NULL,'Mavis','Jakubowski',NULL,NULL,'Admin7@Lockman-MacGyver.com',400,NULL,'1c1ed37d42addf5b6354b2422b8e9ea4d4ddb9f4d0c2e8bfe7e2f6d1dd49',NULL,'2020-08-13 22:27:24.727112','2020-08-13 22:27:24.727112'),(30,'$2a$12$tv5/GB4E2Uvc8NT2QzOpreeUz/qWWXBdZdjNfOI4n44N5qUEnIX7y',NULL,NULL,0,NULL,NULL,NULL,NULL,'Mica','Ondricka',NULL,NULL,'CanaryAdmin8@Lockman-MacGyver.com',1000,NULL,'f134be770d6e7cfc444c44c4a3428051affac8d5ce920b77f481652c7d7d',NULL,'2020-08-13 22:27:24.917108','2020-08-13 22:27:24.917108'),(31,'$2a$12$22G8uqpcpFJQaSBDeswsueu/Esq9v00M4B9UeFFJZlFHJbEwHUZtO',NULL,NULL,0,NULL,NULL,NULL,NULL,'Bud','Hilpert',NULL,NULL,'Nurse9@Lockman-MacGyver.com',200,NULL,'91ecd615bc1bd7f8fde1a901227e1bf205855551870766796b24c0d8b22e',NULL,'2020-08-13 22:27:25.112678','2020-08-13 22:27:25.112678'),(32,'$2a$12$4/4HXupKxFPUVHMhohNGtu8w.s3Z6EdQowt3T9xaWLWXEHD5blwa.',NULL,NULL,0,NULL,NULL,NULL,NULL,'Yvonne','Zemlak',NULL,NULL,'Nurse0@Zulauf.com',200,NULL,'b151f637fd24dc1d26106352b174d3d7fc11475e338f74ab6a118ef30086',NULL,'2020-08-13 22:27:25.307800','2020-08-13 22:27:25.307800'),(33,'$2a$12$zu7A4vloun8rrmo/D1OI5ez1rQgQSjx0vpq2hndD/yMXIHk3XlMkO',NULL,NULL,0,NULL,NULL,NULL,NULL,'Dexter','Lind',NULL,NULL,'Admin1@Zulauf.com',400,NULL,'b1c537f65a582dd025ca21e61c32389138838cb739651dd7fdf3ead71d84',NULL,'2020-08-13 22:27:25.502005','2020-08-13 22:27:25.502005'),(34,'$2a$12$JHuUpLDNM01NsjEW7pmND.UlOplbxXKKRjzSgYIJeKlqOuBKt7zJ.',NULL,NULL,0,NULL,NULL,NULL,NULL,'Julia','Rolfson',NULL,NULL,'Admin2@Zulauf.com',400,NULL,'b4d9c4271d3a21ad105188d5ff978aae279027b848bafb126542ade077fe',NULL,'2020-08-13 22:27:25.700434','2020-08-13 22:27:25.700434'),(35,'$2a$12$2s6RviLKwjyYYWDqWanXdeLte/TQkS12CzmgPqlJ/N6MvcjUIXxb.',NULL,NULL,0,NULL,NULL,NULL,NULL,'Frieda','Blanda',NULL,NULL,'Admin3@Zulauf.com',400,NULL,'c293c371bceeffecad45fe302cbdd991ff3999edb398abb882b574a269df',NULL,'2020-08-13 22:27:25.909853','2020-08-13 22:27:25.909853'),(36,'$2a$12$bco5fa8tij7sr2gINzDb9.qRzlirN.tI5HPbko.F3a0eytiohqrCe',NULL,NULL,0,NULL,NULL,NULL,NULL,'Alexis','Adams',NULL,NULL,'Therapist4@Zulauf.com',100,NULL,'5cc758ce337c325e04d38c1d0a85fe136c7b6f9eb3e32dd80a07ecc11fed',NULL,'2020-08-13 22:27:26.109680','2020-08-13 22:27:26.109680'),(37,'$2a$12$lGdCF5pQflSquT4e92Ej0eid8t2WvaAMSMSBtEEedSUAgahHLDQwq',NULL,NULL,0,NULL,NULL,NULL,NULL,'Gwendolyn','Schowalter',NULL,NULL,'CanaryAdmin5@Zulauf.com',1000,NULL,'b7af3750c595810c44443e50479989b33a1f90996da7a6190b67e2d49f6d',NULL,'2020-08-13 22:27:26.321455','2020-08-13 22:27:26.321455'),(38,'$2a$12$38tmymD2URxii9Lt5WcxoeV3nzGNMkycZpLVmQeUi162QhG9MXRfS',NULL,NULL,0,NULL,NULL,NULL,NULL,'Enrique','Gleason',NULL,NULL,'Nurse6@Zulauf.com',200,NULL,'63df811f2cf704e557c0a9e563ee4dfaab2b15c7f77c590c1c0062a629fe',NULL,'2020-08-13 22:27:26.550289','2020-08-13 22:27:26.550289'),(39,'$2a$12$Rkns8R3u96N7.w/nlD3s3ep5mPJqHJsAQFIrObQxK5OsVGkWpJGi2',NULL,NULL,0,NULL,NULL,NULL,NULL,'Jaime','Bogisich',NULL,NULL,'Nurse7@Zulauf.com',200,NULL,'891a78ab2bef5abc7d555885026b468fbe034e45f061830d87617e375828',NULL,'2020-08-13 22:27:26.762817','2020-08-13 22:27:26.762817'),(40,'$2a$12$LDuvY4zU..6LDgiNJnfSfOCJsqvRtIK5q0/jRo2I2dGQtMQeH5iTC',NULL,NULL,0,NULL,NULL,NULL,NULL,'Jolene','Kautzer',NULL,NULL,'Doctor8@Zulauf.com',300,NULL,'e744435ddde6f8309169e464c03885ea17ddf8da7d56a1b756af3ae15eb6',NULL,'2020-08-13 22:27:26.976155','2020-08-13 22:27:26.976155'),(41,'$2a$12$dU8MdEV3q2Mb/UPUyyBVveJk0M/VoqrB2NJdeOVt4RPohiYChED1e',NULL,NULL,0,NULL,NULL,NULL,NULL,'Enid','Gislason',NULL,NULL,'Therapist9@Zulauf.com',100,NULL,'70bd3bd93b84d70f72b736acebb84c79c6161243f5fcd37312f6122b06d2',NULL,'2020-08-13 22:27:27.192303','2020-08-13 22:27:27.192303'),(42,'$2a$12$XmFQ41.0vc/Ox9wCZ0L1i.ZxwVx83Y333o6pp0rWdKv7jvFwunw0S',NULL,NULL,0,NULL,NULL,NULL,NULL,'Jay','Bode',NULL,NULL,'Therapist0@Fay-Mann.com',100,NULL,'c6df9a399a62c19eb33968eb2aee2a1ab144afe96a710422fc419933c36d',NULL,'2020-08-13 22:27:27.397117','2020-08-13 22:27:27.397117'),(43,'$2a$12$NVhf6vJNM1HxDaGcyMPuy.rxvRjsVUrCiNWdgReSv8oNSitnBHXbG',NULL,NULL,0,NULL,NULL,NULL,NULL,'Bernarda','Bernhard',NULL,NULL,'CanaryAdmin1@Fay-Mann.com',1000,NULL,'475c64dbbb3ad93cc7d8baa13546107bebf702a91a7db0bfb35db939ba5d',NULL,'2020-08-13 22:27:27.615820','2020-08-13 22:27:27.615820'),(44,'$2a$12$t6C1NdWSJlfK2dpmarOHw.BYGS8tGTdsROi6mM9FqGcqrmVKxthrW',NULL,NULL,0,NULL,NULL,NULL,NULL,'Carmelita','Veum',NULL,NULL,'Doctor2@Fay-Mann.com',300,NULL,'9ab1997656530636d01c4db6cc0d489bb00fdb25be5621d01fc0cf0a50c6',NULL,'2020-08-13 22:27:27.829991','2020-08-13 22:27:27.829991'),(45,'$2a$12$jAEzweJX2Po7rafkC0h14OEOlqTHCu7uoi1xgZOfX/9x3t5zmFAmi',NULL,NULL,0,NULL,NULL,NULL,NULL,'Elna','Douglas',NULL,NULL,'Nurse3@Fay-Mann.com',200,NULL,'e5754289e971f9eafc8ad51feb342015c317ca30327bf5e521b4ff3ff070',NULL,'2020-08-13 22:27:28.048100','2020-08-13 22:27:28.048100'),(46,'$2a$12$uKZL4yohHDsQsDzkizUtge.4p3PA9PfG/xa.sOxtrNK6U20o5a5Yy',NULL,NULL,0,NULL,NULL,NULL,NULL,'Ethelyn','Cormier',NULL,NULL,'Doctor4@Fay-Mann.com',300,NULL,'bddabc0c3c3cd7ee41096d0a292de7097ca4154d6264ecdadc32883aad6e',NULL,'2020-08-13 22:27:28.259627','2020-08-13 22:27:28.259627'),(47,'$2a$12$g/pFaOJxW7TLt29Yxkmm5ueXJ/OHH4K6/Z/WWWFpr/c0ynvTXPaLa',NULL,NULL,0,NULL,NULL,NULL,NULL,'Lizeth','Larkin',NULL,NULL,'CanaryAdmin5@Fay-Mann.com',1000,NULL,'7c6487d878e3aa040a6fa0a3c1081207a4717994901b8633f349f217a1de',NULL,'2020-08-13 22:27:28.459803','2020-08-13 22:27:28.459803'),(48,'$2a$12$s8uMZYNNevwTu7V3isATnuZQ0NYBBzYXunoUjTuWSqIb8pWPnl0LG',NULL,NULL,0,NULL,NULL,NULL,NULL,'Corinne','Stoltenberg',NULL,NULL,'Nurse6@Fay-Mann.com',200,NULL,'a4a2f75de7fc9ca9c7d0dcf28501ed6027c00f3f2d2b52db7fb75f9f8953',NULL,'2020-08-13 22:27:28.659970','2020-08-13 22:27:28.659970'),(49,'$2a$12$dZGQBR5al0XLAUHAaL6.a.5i82mFIeuSd5MVU4Xs9jWeetwKVjK7m',NULL,NULL,0,NULL,NULL,NULL,NULL,'Fermina','Mueller',NULL,NULL,'CanaryAdmin7@Fay-Mann.com',1000,NULL,'5242533da77e8c1ed6afd562e2cc2977f9d857b1b904faebd563436de6e6',NULL,'2020-08-13 22:27:28.875077','2020-08-13 22:27:28.875077'),(50,'$2a$12$BiT/cBZZBYnS2572LrBGme3fHwKfUAw3ko.Y4LIZoR2xn1H7bXhPa',NULL,NULL,0,NULL,NULL,NULL,NULL,'Elisha','McKenzie',NULL,NULL,'Admin8@Fay-Mann.com',400,NULL,'c5e82d2b481ee13dc5b775364a65316556ba077852bc808e0960ce2e8a31',NULL,'2020-08-13 22:27:29.105599','2020-08-13 22:27:29.105599'),(51,'$2a$12$kTyTp5tQ/ze5Qvr/dIuRn.ykeYxgJq/1Rn0569BozYDL11VrNRHgy',NULL,NULL,0,NULL,NULL,NULL,NULL,'Ivey','Satterfield',NULL,NULL,'Nurse9@Fay-Mann.com',200,NULL,'7628e3216eb4b8aed3372fa9ef02790df8e2eda622e5195437f3a5f69e46',NULL,'2020-08-13 22:27:29.343865','2020-08-13 22:27:29.343865');
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

-- Dump completed on 2020-08-13 16:27:29
