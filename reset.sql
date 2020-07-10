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
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2020-07-10 14:23:47.393083','2020-07-10 14:23:47.393083'),('schema_sha1','ea88946334da53bc30f2745bb0d052cbd6e21fcc','2020-07-10 14:23:47.401091','2020-07-10 14:23:47.401091');
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
INSERT INTO `organizations` VALUES (1,0,'Doyle and Sons',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,6,0,0,'2020-07-10 14:23:50.325716','2020-07-10 14:23:50.366484'),(2,1,'Adams, Smitham and Schneider',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,2,3,1,0,'2020-07-10 14:23:50.334473','2020-07-10 14:23:50.343573'),(3,1,'Little, Aufderhar and Kihn',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,4,5,1,0,'2020-07-10 14:23:50.358121','2020-07-10 14:23:50.366484'),(4,0,'Willms, Hyatt and Baumbach',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,12,0,0,'2020-07-10 14:23:50.378694','2020-07-10 14:23:50.416805'),(5,1,'Kessler, Ebert and Hettinger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,8,9,1,0,'2020-07-10 14:23:50.386634','2020-07-10 14:23:50.395116'),(6,1,'Weissnat-Block',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,10,11,1,0,'2020-07-10 14:23:50.408340','2020-07-10 14:23:50.416805'),(7,0,'Johnston, Collier and Sawayn',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,18,0,0,'2020-07-10 14:23:50.428990','2020-07-10 14:23:50.465598'),(8,1,'Gerhold, Mayert and Sawayn',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,14,15,1,0,'2020-07-10 14:23:50.436892','2020-07-10 14:23:50.445360'),(9,1,'Funk-Pollich',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,16,17,1,0,'2020-07-10 14:23:50.457655','2020-07-10 14:23:50.465598'),(10,0,'Renner, Lehner and O\'Reilly',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,24,0,0,'2020-07-10 14:23:50.477629','2020-07-10 14:23:50.514664'),(11,1,'Gutkowski Group',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,20,21,1,0,'2020-07-10 14:23:50.485247','2020-07-10 14:23:50.493427'),(12,1,'Goyette, Zboncak and Gerhold',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,22,23,1,0,'2020-07-10 14:23:50.506200','2020-07-10 14:23:50.514664'),(13,0,'Borer, Mosciski and Gerhold',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,25,30,0,0,'2020-07-10 14:23:50.526507','2020-07-10 14:23:50.564745'),(14,1,'Kertzmann, Wintheiser and Hane',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,26,27,1,0,'2020-07-10 14:23:50.534549','2020-07-10 14:23:50.543150'),(15,1,'Hintz-Beer',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,28,29,1,0,'2020-07-10 14:23:50.556237','2020-07-10 14:23:50.564745');
/*!40000 ALTER TABLE `organizations` ENABLE KEYS */;
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
INSERT INTO `organizations_users` VALUES (1,1,2),(2,5,2),(3,1,3),(4,2,3),(5,1,4),(6,3,4),(7,1,5),(8,9,5),(9,1,6),(10,2,6),(11,1,7),(12,6,7),(13,1,8),(14,6,8),(15,1,9),(16,8,9),(17,1,10),(18,8,10),(19,1,11),(20,2,11),(21,4,12),(22,6,12),(23,4,13),(24,2,13),(25,4,14),(26,11,14),(27,4,15),(28,8,15),(29,4,16),(30,5,16),(31,4,17),(32,14,17),(33,4,18),(34,5,18),(35,4,19),(36,15,19),(37,4,20),(38,6,20),(39,4,21),(40,11,21),(41,7,22),(42,5,22),(43,7,23),(44,6,23),(45,7,24),(46,2,24),(47,7,25),(48,6,25),(49,7,26),(50,14,26),(51,7,27),(52,9,27),(53,7,28),(54,9,28),(55,7,29),(56,5,29),(57,7,30),(58,6,30),(59,7,31),(60,3,31),(61,10,32),(62,14,32),(63,10,33),(64,3,33),(65,10,34),(66,8,34),(67,10,35),(68,15,35),(69,10,36),(70,14,36),(71,10,37),(72,14,37),(73,10,38),(74,12,38),(75,10,39),(76,9,39),(77,10,40),(78,15,40),(79,10,41),(80,3,41),(81,13,42),(82,9,42),(83,13,43),(84,8,43),(85,13,44),(86,11,44),(87,13,45),(88,11,45),(89,13,46),(90,9,46),(91,13,47),(92,6,47),(93,13,48),(94,3,48),(95,13,49),(96,2,49),(97,13,50),(98,8,50),(99,13,51),(100,8,51);
/*!40000 ALTER TABLE `organizations_users` ENABLE KEYS */;
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
INSERT INTO `schema_migrations` VALUES ('20180813213222'),('20180825191605'),('20180829210029'),('20180911204656'),('20180916215300'),('20180919225441');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
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
INSERT INTO `users` VALUES (1,'$2a$12$5X9iqqaDP5k.mW7ahvm20.xmVwdvJgoblkl5R8MhPOoaVEIGJCDeW',NULL,NULL,0,NULL,NULL,NULL,NULL,'Roger','Waters',NULL,NULL,'admin@null.com',1000,NULL,'b642ce5faec4832234b836e0a4b4e3dd0455d83f5a3a8ee7005c1bb60566',NULL,'2020-07-10 14:23:50.167269','2020-07-10 14:23:50.167269'),(2,'$2a$12$RW9aGDMQGLvsr5.vHYwtc.waVmthJWanbKT3IEmkGRg84eLVUg3Ge',NULL,NULL,0,NULL,NULL,NULL,NULL,'Candace','Stark',NULL,NULL,'alvaro@farrell.net',1000,NULL,'03006afc11616ba92c7e3e2a985f584cedd576a57e5004f26badd16b8f78',NULL,'2020-07-10 14:23:50.854296','2020-07-10 14:23:50.854296'),(3,'$2a$12$GS5aJM7Rz6W76l8gvfPp3OW6p5xv33y.YJU995AuMsBOO26TO5pN2',NULL,NULL,0,NULL,NULL,NULL,NULL,'Gerald','Mosciski',NULL,NULL,'sylvie_waelchi@rolfson.info',300,NULL,'7c65609d486e4fef513c9b240bb6e483f0ba8b06effc3cace916e4c68abc',NULL,'2020-07-10 14:23:51.135807','2020-07-10 14:23:51.135807'),(4,'$2a$12$j/1hqBH3f8msUeC6Y/r/IuUetNPcAo1v6uXElgzn0sfInYWAkBCrC',NULL,NULL,0,NULL,NULL,NULL,NULL,'Ernest','Rohan',NULL,NULL,'jazmin@abshire.info',1000,NULL,'40675f3cb474ff3fe94589ca81bd1261abb1e2478552804afe44432a31b4',NULL,'2020-07-10 14:23:51.422529','2020-07-10 14:23:51.422529'),(5,'$2a$12$5hi3mIfuQENDR486TeYmd.4u75GUeXJM.U.dXyB6SWgxF.IukW45W',NULL,NULL,0,NULL,NULL,NULL,NULL,'Gerald','Bernhard',NULL,NULL,'broderick@auer.com',100,NULL,'e8eda5205a2fbccb8f99a292859d80f2c3ace69ba4787ede564254ef5750',NULL,'2020-07-10 14:23:51.712434','2020-07-10 14:23:51.712434'),(6,'$2a$12$7YGwJIIC07Hdm9N8WwRsdub/.68wGb3UGu8LHG8m1ikfSpoGZyPjS',NULL,NULL,0,NULL,NULL,NULL,NULL,'Luvenia','Abshire',NULL,NULL,'roy@vandervort-barrows.com',200,NULL,'157d40e0ab11ffe7cc7b9b65309dfe27dc36bd3a3531a9fefe27f2b212c5',NULL,'2020-07-10 14:23:51.995175','2020-07-10 14:23:51.995175'),(7,'$2a$12$1Mm1bPSZkdeSmqpwXHOnJOVTleSl.YJjO4u/lx.zwmNmAMZxJPM66',NULL,NULL,0,NULL,NULL,NULL,NULL,'Arnoldo','Romaguera',NULL,NULL,'lynna.mccullough@fritsch.name',1000,NULL,'4b95503bf70e2fccf03b8dc5f3b896f556b8ca63dbb80f67a4f8d4dce8c6',NULL,'2020-07-10 14:23:52.280167','2020-07-10 14:23:52.280167'),(8,'$2a$12$hGzhoeb47M4B/iQn6BxsA.GL2nG30jrsI6de/P72inIiKrOwvHE0u',NULL,NULL,0,NULL,NULL,NULL,NULL,'Randal','Goldner',NULL,NULL,'mozella.bode@bartoletti-hilll.name',1000,NULL,'1ca4be5b5f733ca4fce9b98c1f7aae2cdfdc17e45674fae15954f15a7897',NULL,'2020-07-10 14:23:52.571321','2020-07-10 14:23:52.571321'),(9,'$2a$12$ra1uWOp.aAu7ZWbiGr7Yae6ZiLexZDPvmuhGc9OKtbJGYwt7y2pJS',NULL,NULL,0,NULL,NULL,NULL,NULL,'Jade','Dicki',NULL,NULL,'nanci@carter.info',100,NULL,'3c45b58687867d5f15482e9d687451efdc1cd1a726d2cbdc3bd5a7de2413',NULL,'2020-07-10 14:23:52.850124','2020-07-10 14:23:52.850124'),(10,'$2a$12$KqX/Gk2f6p4YBDCt8pjeKOUNfE0unMujZyKg43K9.LP0fh8EZBf/.',NULL,NULL,0,NULL,NULL,NULL,NULL,'Chuck','Miller',NULL,NULL,'edmond@spinka-kunze.name',300,NULL,'111c739078f43c33efbd7fa78c1e8b3f7378eb7f7c32d62e565d092ea73a',NULL,'2020-07-10 14:23:53.161632','2020-07-10 14:23:53.161632'),(11,'$2a$12$RCh.tmiGOeMj4SpND.1h/.eQzYMh3z.uzw6yUHqsL1RLvbH8N3CTW',NULL,NULL,0,NULL,NULL,NULL,NULL,'Hubert','Baumbach',NULL,NULL,'alan.sporer@emard.com',1000,NULL,'6486bd2b2fe17327c741df6752fb5d02454ba2e0e1cdf485d9baa9cb6bd3',NULL,'2020-07-10 14:23:53.451339','2020-07-10 14:23:53.451339'),(12,'$2a$12$ltgE/3oJGmlSPzDRkiERaebzJMS9fjzYbVH3dR5I1V2LKxlJ7xNsq',NULL,NULL,0,NULL,NULL,NULL,NULL,'Patrick','Harris',NULL,NULL,'darwin@balistreri.net',300,NULL,'d22da87f682e625c8e176e122fc69e700cbc017b49802b011647299cd800',NULL,'2020-07-10 14:23:53.738702','2020-07-10 14:23:53.738702'),(13,'$2a$12$whHwyhrDizcyd8FCU6BKaOn.DpUQbIVeN/k39K3gghDupihyBT32C',NULL,NULL,0,NULL,NULL,NULL,NULL,'Idella','Roob',NULL,NULL,'darin_balistreri@sauer.com',200,NULL,'e008e753b66efabcf83a1b80fe574b8ff9daa42b9c7aa644e6e08ba21359',NULL,'2020-07-10 14:23:54.023341','2020-07-10 14:23:54.023341'),(14,'$2a$12$FSknT9RfN6I8jzKzpg/TdOEn17jAbg2WYJTd.qHl.iR0covZFeXuS',NULL,NULL,0,NULL,NULL,NULL,NULL,'Rashad','O\'Kon',NULL,NULL,'tisha_murray@grimes.info',100,NULL,'0e2273aad12474f4db23376a2569bb64e0786f23fc19bc8e403a6cb279d3',NULL,'2020-07-10 14:23:54.299302','2020-07-10 14:23:54.299302'),(15,'$2a$12$qMKLGmnYjidjJlFHD3BGZ.u03me1UyOfJ2EcSeLritqDcqlVZbRB.',NULL,NULL,0,NULL,NULL,NULL,NULL,'Vivian','Sporer',NULL,NULL,'esteban_jacobi@mueller-bode.net',1000,NULL,'1b259f83b1034268fde4be732e5cec895fe99cf30fec2f4cf0714531b480',NULL,'2020-07-10 14:23:54.569397','2020-07-10 14:23:54.569397'),(16,'$2a$12$xmdXG8ei5MKXWqU47dhsdOn/UTfQUVuGaa6ZGm6SFhghRjfbcrELa',NULL,NULL,0,NULL,NULL,NULL,NULL,'Lawerence','Stehr',NULL,NULL,'danna@kling.net',200,NULL,'ba5edbd21681335cd537167e2108571244d4d632cc18cd81076a556097fe',NULL,'2020-07-10 14:23:54.774509','2020-07-10 14:23:54.774509'),(17,'$2a$12$ofxktU8aC673gavE9ve.auBfg8jhF.PzRxc4yglFJWDxQlyjiMRgq',NULL,NULL,0,NULL,NULL,NULL,NULL,'Aubrey','Reichert',NULL,NULL,'nicholas@schmitt.io',300,NULL,'da59eb56cccd8f20e2e8dc1dd1dc52f2a5d2486e1671c7d67ecaeb153311',NULL,'2020-07-10 14:23:54.966165','2020-07-10 14:23:54.966165'),(18,'$2a$12$x.7jQjlacJCSJlOAz2PmpO/0miTxUkuAPPyJXacg7rfMkuAQmbZN6',NULL,NULL,0,NULL,NULL,NULL,NULL,'Theron','Greenfelder',NULL,NULL,'lorraine@okeefe.info',1000,NULL,'ab316509914577183d2fe133b3e289229fe70ef44e5308804d83a6238166',NULL,'2020-07-10 14:23:55.153674','2020-07-10 14:23:55.153674'),(19,'$2a$12$45g3czUeTC2LhhgkOY97i.qDOouKuufa4Ze3YjyjYMBn4hkkOGp6i',NULL,NULL,0,NULL,NULL,NULL,NULL,'Aileen','Goyette',NULL,NULL,'johnathon@casper.co',300,NULL,'0e4b072f63dca3e6c12cc9085e1adea6bee4434987b50bd5f031654f2079',NULL,'2020-07-10 14:23:55.340715','2020-07-10 14:23:55.340715'),(20,'$2a$12$x47HSD6BwjZWMd/eSBL2eOczEOL8Zk.rE9B7mbq9zVhG9TpU7xfby',NULL,NULL,0,NULL,NULL,NULL,NULL,'Luna','Spinka',NULL,NULL,'laurie@turcotte-kohler.org',100,NULL,'0a10980f120b1dd3d51f1e16c8e22efb1389f082e61d607b4ab0fac71de7',NULL,'2020-07-10 14:23:55.526530','2020-07-10 14:23:55.526530'),(21,'$2a$12$Dly1KkOgw5c70xoaJU09FOjP/6nr3SCeqfz13OeZ4A5Knomu.9SkC',NULL,NULL,0,NULL,NULL,NULL,NULL,'Darrick','Blick',NULL,NULL,'merri@huel.io',200,NULL,'0ff85b8ffa6e3cc04629a8e8f2a1f8b3c2080865729982ccb49f0cbb4d9e',NULL,'2020-07-10 14:23:55.714671','2020-07-10 14:23:55.714671'),(22,'$2a$12$HFmsh1dKsgfCY0tICAsI5OXCJfxPBEihP0KNCAKeTanWyNYdY7mgC',NULL,NULL,0,NULL,NULL,NULL,NULL,'Fredia','Kris',NULL,NULL,'clementina@dietrich.net',100,NULL,'70ab7de2dfa410a81aaa44073e1aec98b3274cc787c323ada0fda2d41497',NULL,'2020-07-10 14:23:55.911004','2020-07-10 14:23:55.911004'),(23,'$2a$12$R9DNJEYjH4NAe62iWZfJGehYBX4/8hLakmSdf0Qu9Fr7OQ1vc7Rsm',NULL,NULL,0,NULL,NULL,NULL,NULL,'Nova','Effertz',NULL,NULL,'wilson@lynch.co',300,NULL,'aa9d5fd5eb309a71f07b3c19a61bfdf2715d068cba34ad1ff044935ec3db',NULL,'2020-07-10 14:23:56.097078','2020-07-10 14:23:56.097078'),(24,'$2a$12$VCK14Cwfw8O2.gWOTGrI1eDzpQLhRsimUz6YvDy74cfkw6FrBN.CK',NULL,NULL,0,NULL,NULL,NULL,NULL,'Hien','MacGyver',NULL,NULL,'jude@gaylord.com',300,NULL,'68ccb553ebcb93e02730fe33d5ae3d52b01d4e83aeaa8d3a66fe68159a2c',NULL,'2020-07-10 14:23:56.284399','2020-07-10 14:23:56.284399'),(25,'$2a$12$cLl6AtNzLXmJT5UQfo5NhuZ4/ZtzY.Y.BFiJUCbIXBG8tv7lt5cfS',NULL,NULL,0,NULL,NULL,NULL,NULL,'Riva','Pfannerstill',NULL,NULL,'sharyl_kling@beahan.biz',100,NULL,'343e72c7d63fce9f76f02739b2dc853d6512d151227c3c9f39beb3eb71dd',NULL,'2020-07-10 14:23:56.470292','2020-07-10 14:23:56.470292'),(26,'$2a$12$GDsyogKn6ceacz7LMf59W.CjRin/JMS2enkaS7WrSMhvNOqmPPQve',NULL,NULL,0,NULL,NULL,NULL,NULL,'Demarcus','Wyman',NULL,NULL,'jannette_padberg@ferry.name',1000,NULL,'aa2d6f49ec347751ccf0a93c3f737f7c11991da56b86976ae7dd808db6ca',NULL,'2020-07-10 14:23:56.655843','2020-07-10 14:23:56.655843'),(27,'$2a$12$Rn9MdCFR1jLpHhdJNbtQY.VoU/I3HMAbgrGKbzssnWyHyeDY1IeiC',NULL,NULL,0,NULL,NULL,NULL,NULL,'Aaron','Weber',NULL,NULL,'brittani_block@murazik.co',300,NULL,'38222ba3d50578b492ee90d3eed6cc6b3d2f796aaee8761a6788b36a0042',NULL,'2020-07-10 14:23:56.850977','2020-07-10 14:23:56.850977'),(28,'$2a$12$6XddOxqH7h/F7SsosbDOceBRhpH7zY5lthtVsfck4SaFhR9NOMP5y',NULL,NULL,0,NULL,NULL,NULL,NULL,'Clara','Waters',NULL,NULL,'jeana_kovacek@quigley.info',100,NULL,'a16093b409b63cf67563152194fb625fc739f2f74774d889fa38050d030e',NULL,'2020-07-10 14:23:57.041196','2020-07-10 14:23:57.041196'),(29,'$2a$12$xcmErxY/LnNPFReSI8wLseHEEFD70jtKDoSxjcHd/WmOk9T9vRexS',NULL,NULL,0,NULL,NULL,NULL,NULL,'Jake','Langworth',NULL,NULL,'minerva@hartmann.biz',1000,NULL,'f09a0bbff07be8c8e923791289e95691cf8692fb842dee936682ace931c5',NULL,'2020-07-10 14:23:57.223931','2020-07-10 14:23:57.223931'),(30,'$2a$12$z3K2D15V6EZYvUQc0qs4L.4xZTKd/cO0SOwz/5azvREJJTR856Hau',NULL,NULL,0,NULL,NULL,NULL,NULL,'Rob','Kulas',NULL,NULL,'ione.smith@ondricka.net',300,NULL,'7a206c4f34c7a6ed8342a6e643ce76d203eb09e165c20f55c7fd9195482d',NULL,'2020-07-10 14:23:57.417932','2020-07-10 14:23:57.417932'),(31,'$2a$12$7E9hLwg0Gi748JJgO5MCkOvpDSPpiughbim1LvT2CIaYJR.btPX36',NULL,NULL,0,NULL,NULL,NULL,NULL,'Antonio','Halvorson',NULL,NULL,'mercedes_connelly@huel-grimes.org',300,NULL,'106471e3c09384f8f5efa02dc58e72c6734b2c38d1813b87293599fe3e90',NULL,'2020-07-10 14:23:57.634861','2020-07-10 14:23:57.634861'),(32,'$2a$12$gOQiKm9oJDFqSC9KqAplweCBdY8loLyazrwnaPJw3j0/zUiRNFs3C',NULL,NULL,0,NULL,NULL,NULL,NULL,'Mariella','Abbott',NULL,NULL,'benny@pollich.io',100,NULL,'d44cc2beea376a6ce5e4cd02166e5539e689def1025f3dbb59975240e2ed',NULL,'2020-07-10 14:23:57.910454','2020-07-10 14:23:57.910454'),(33,'$2a$12$5kB1Pma3E23GLBFKc.wRWeF6M4oeYiqTHSVoQmPxWyIsbOkz/zW0K',NULL,NULL,0,NULL,NULL,NULL,NULL,'Moon','Fay',NULL,NULL,'kelli@wunsch.net',1000,NULL,'71f834b82d42cc73112ade733d99924ea4898e3cb7f2ffc8337adcb96c9d',NULL,'2020-07-10 14:23:58.191423','2020-07-10 14:23:58.191423'),(34,'$2a$12$bs/fIQS/FRf1nSdFuHAsiO.KnNeaoDB9F/8lfH65rOhdA/IHQR/ne',NULL,NULL,0,NULL,NULL,NULL,NULL,'Mauricio','Kshlerin',NULL,NULL,'lani.purdy@dickinson.biz',100,NULL,'4c065d0ffdbb5699bab0496b05095ae091df112a99bcfd241a5984a3a25b',NULL,'2020-07-10 14:23:58.465945','2020-07-10 14:23:58.465945'),(35,'$2a$12$yziC7mZ1xzzRSrMgRNiJ3O9EerTdCi2ipOQxLUDCXeXMUEHgwrZrm',NULL,NULL,0,NULL,NULL,NULL,NULL,'Lue','Corkery',NULL,NULL,'gilberto_jacobs@fritsch.co',200,NULL,'1fd9326ace8597b9a76e2cdbb3bda3812039c32871d6eae3b7443fa884e2',NULL,'2020-07-10 14:23:58.741419','2020-07-10 14:23:58.741419'),(36,'$2a$12$bynHTesWeA30cJh0nPPtA.eQlvQMri5ywhZey6.LPnQvQh.eFEbKq',NULL,NULL,0,NULL,NULL,NULL,NULL,'Marquita','Lakin',NULL,NULL,'mertie_nitzsche@bashirian.com',1000,NULL,'dac61d575d447260b5c1e4c49445baaeeef075f74cb60418a66d5f45a155',NULL,'2020-07-10 14:23:59.014622','2020-07-10 14:23:59.014622'),(37,'$2a$12$NyXMSRU72GUe5Rl5eGxyBOAPOk3q2byF8I9yZpykwcepXuCfVl0KW',NULL,NULL,0,NULL,NULL,NULL,NULL,'Ghislaine','Streich',NULL,NULL,'coleen@huels.org',1000,NULL,'3187be098031b1fe8bfefc4b19c72d85a842cf788ddd6b24d75e6307326e',NULL,'2020-07-10 14:23:59.291559','2020-07-10 14:23:59.291559'),(38,'$2a$12$E9jE.GBWwuRuv1hy4V.O1.Ti5AjqU/ivtySZP9Pr6FcxlOOR3MqUa',NULL,NULL,0,NULL,NULL,NULL,NULL,'Francesca','Rice',NULL,NULL,'dyan@roob-prohaska.info',100,NULL,'05e6907ce655606691585f245f672f3662aeb545c40f22d61ccd72485a23',NULL,'2020-07-10 14:23:59.565656','2020-07-10 14:23:59.565656'),(39,'$2a$12$.xC2U5H20CTjBldWl63xlevoe2AekPRnPczBamgJ.7HhmwxHE53te',NULL,NULL,0,NULL,NULL,NULL,NULL,'Frederic','Haley',NULL,NULL,'alene.rolfson@hessel.info',300,NULL,'aaf95b14adfac3a8a2ad290545e8cc7eb59e7421ecc0a7782a3f0152daa6',NULL,'2020-07-10 14:23:59.838776','2020-07-10 14:23:59.838776'),(40,'$2a$12$qot76MekDdJrYAWaAl.kpu35kSYUQFXouP2EVygzgkDd9eyctHPoq',NULL,NULL,0,NULL,NULL,NULL,NULL,'Elease','VonRueden',NULL,NULL,'kevin_jacobs@sauer.co',100,NULL,'d751a50606599fd9dfbe79dc6f4943855fd1ac8a02a31f4315049f0e64ee',NULL,'2020-07-10 14:24:00.114304','2020-07-10 14:24:00.114304'),(41,'$2a$12$lK1/Xe4.lmkfhiUrpzRPDuwmMrFUK1Q5JCXiMKgGYsxKbD9lrsn.y',NULL,NULL,0,NULL,NULL,NULL,NULL,'Abdul','Feil',NULL,NULL,'reggie_hoppe@feil.co',100,NULL,'6b384e2e799526f074e6ca209207b92c841641fad6c6b9ebb27980026365',NULL,'2020-07-10 14:24:00.394231','2020-07-10 14:24:00.394231'),(42,'$2a$12$Ymf4Jb3jpdbD.SsDrerJA.fbWd2Fj/Ij1pHRDuC9bGNO3qrmjAn1e',NULL,NULL,0,NULL,NULL,NULL,NULL,'Gerald','Lynch',NULL,NULL,'alba_denesik@marquardt.com',100,NULL,'c2c6ace7ce79879b0d937fe4450d3fd961876a9bef35bd9348abe0eefc0a',NULL,'2020-07-10 14:24:00.668386','2020-07-10 14:24:00.668386'),(43,'$2a$12$jccDkRbLSiLmqCbJDrG40OCIsY.PrGaJQFw52M86D4yx1lkG1s7Ku',NULL,NULL,0,NULL,NULL,NULL,NULL,'Margery','Conn',NULL,NULL,'titus@wisozk.name',200,NULL,'a9221ccd05bf40df4c8f9379e3d6e3b22600a7fcfd43cbe8614dbfb8c92d',NULL,'2020-07-10 14:24:00.946863','2020-07-10 14:24:00.946863'),(44,'$2a$12$72yzW69yGiBVnxiHu8G.dOElJ0mhj.YPLwx6.lZekxhk5LzZMMToK',NULL,NULL,0,NULL,NULL,NULL,NULL,'Jerome','Stanton',NULL,NULL,'tod@cormier.info',1000,NULL,'3670465a8450b91f6f64343902bfa0a8c002de441ddb9520b55ef6d667cc',NULL,'2020-07-10 14:24:01.225810','2020-07-10 14:24:01.225810'),(45,'$2a$12$xe5KnOCS83hF4HSU4roNQeEdi73GhGytS2d8fb1z5HLtk3cfTuhvq',NULL,NULL,0,NULL,NULL,NULL,NULL,'Lovie','O\'Conner',NULL,NULL,'britni.littel@willms-waelchi.io',100,NULL,'e9c033ee5e806b0b05d0d6013a77067969bcbbd88ad0fd771e68fdb473a6',NULL,'2020-07-10 14:24:01.504394','2020-07-10 14:24:01.504394'),(46,'$2a$12$41SXqZlCS3QnlPS2UT27uOYtO8luwWHoIzUOK1AzgT3c16N9IYAGS',NULL,NULL,0,NULL,NULL,NULL,NULL,'Chung','Purdy',NULL,NULL,'emmanuel_ortiz@fahey-ullrich.net',100,NULL,'213671741cdd375f8b9083eba582b27bd9e3b681ebf1740ff2aeb4357dad',NULL,'2020-07-10 14:24:01.804731','2020-07-10 14:24:01.804731'),(47,'$2a$12$m9RFoy5u52JBMVmJ03RTGuy5t.UWPNUCv6C5eNFrJ3CgWCtDNddP2',NULL,NULL,0,NULL,NULL,NULL,NULL,'Percy','Keeling',NULL,NULL,'adrienne@botsford-dach.io',200,NULL,'eb7fc5feefc118ebb8868084f7970d1eafde9c2ef2d301543f10dcd09b43',NULL,'2020-07-10 14:24:02.085003','2020-07-10 14:24:02.085003'),(48,'$2a$12$AzDJaaequuw/M1s6dRgxoeN4yiJEjTqvJT7cp6tbFYRVtKFlYq186',NULL,NULL,0,NULL,NULL,NULL,NULL,'Mark','Hagenes',NULL,NULL,'hubert.thompson@keeling.name',100,NULL,'1300668e008585494e3ced172a3d75ab66c5f539316ae65db788dd4c8ae9',NULL,'2020-07-10 14:24:02.362301','2020-07-10 14:24:02.362301'),(49,'$2a$12$1I1KIwSE0t9/wvLQwK/S8e1vhblLmMSrva.ijqIhAuucszzPF70lS',NULL,NULL,0,NULL,NULL,NULL,NULL,'Joaquin','Nicolas',NULL,NULL,'rosendo_wiegand@conn.io',200,NULL,'6c3e04691c79472b8dc56d929e4d5f1a41b2ff15a2709ad500b3cd8335a9',NULL,'2020-07-10 14:24:02.639456','2020-07-10 14:24:02.639456'),(50,'$2a$12$NZOTMWDze8rwGBdXAbz2JuImPjh8A8cRVsEfunY6sFSXCApMMVQTS',NULL,NULL,0,NULL,NULL,NULL,NULL,'Luana','Towne',NULL,NULL,'gabriel_price@schulist.info',200,NULL,'663735daa2f6e9b57b7d224673a06bba5408e21c3551e736a9b511363f7d',NULL,'2020-07-10 14:24:02.913027','2020-07-10 14:24:02.913027'),(51,'$2a$12$Dk0EimmJWfMrWUvFYFz1puX1drsXJUvUyk9gk3.EcuBmmxOMjJV9m',NULL,NULL,0,NULL,NULL,NULL,NULL,'Risa','Altenwerth',NULL,NULL,'alex@hirthe.org',100,NULL,'14e12ec89bb006a5558ded9a6a03663a6f6160e8f102c3ff3579d512ce46',NULL,'2020-07-10 14:24:03.191145','2020-07-10 14:24:03.191145');
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

-- Dump completed on 2020-07-10  8:24:03
