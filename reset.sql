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
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2020-07-10 00:03:16.800531','2020-07-10 00:03:16.800531'),('schema_sha1','ea88946334da53bc30f2745bb0d052cbd6e21fcc','2020-07-10 00:03:16.808165','2020-07-10 00:03:16.808165');
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
INSERT INTO `organizations` VALUES (1,0,'Barrows-Fadel',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,6,0,0,'2020-07-10 00:03:19.522736','2020-07-10 00:03:19.565296'),(2,1,'Rice LLC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,2,3,1,0,'2020-07-10 00:03:19.531097','2020-07-10 00:03:19.539060'),(3,1,'Moore-Effertz',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,4,5,1,0,'2020-07-10 00:03:19.556947','2020-07-10 00:03:19.565296'),(4,0,'Mann-Adams',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,12,0,0,'2020-07-10 00:03:19.576464','2020-07-10 00:03:19.606913'),(5,1,'Okuneva, Armstrong and Dach',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,8,9,1,0,'2020-07-10 00:03:19.582919','2020-07-10 00:03:19.589859'),(6,1,'Barrows and Sons',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,10,11,1,0,'2020-07-10 00:03:19.600374','2020-07-10 00:03:19.606913'),(7,0,'Considine, Dare and Kris',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,18,0,0,'2020-07-10 00:03:19.615811','2020-07-10 00:03:19.645889'),(8,1,'Boyer-Ebert',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,14,15,1,0,'2020-07-10 00:03:19.621197','2020-07-10 00:03:19.627306'),(9,1,'VonRueden Group',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,16,17,1,0,'2020-07-10 00:03:19.638029','2020-07-10 00:03:19.645889'),(10,0,'Hartmann, Crooks and Treutel',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,24,0,0,'2020-07-10 00:03:19.656276','2020-07-10 00:03:19.693117'),(11,1,'Schaden, Kuphal and Mayer',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,20,21,1,0,'2020-07-10 00:03:19.663091','2020-07-10 00:03:19.671578'),(12,1,'Keeling-Brown',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,22,23,1,0,'2020-07-10 00:03:19.684522','2020-07-10 00:03:19.693117'),(13,0,'Towne-Leannon',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,25,30,0,0,'2020-07-10 00:03:19.707410','2020-07-10 00:03:19.760251'),(14,1,'Rowe LLC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,26,27,1,0,'2020-07-10 00:03:19.714684','2020-07-10 00:03:19.721201'),(15,1,'Jacobson, Johns and Marquardt',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,28,29,1,0,'2020-07-10 00:03:19.753752','2020-07-10 00:03:19.760251');
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
INSERT INTO `organizations_users` VALUES (1,1,2),(2,8,2),(3,1,3),(4,11,3),(5,1,4),(6,3,4),(7,1,5),(8,15,5),(9,1,6),(10,2,6),(11,1,7),(12,3,7),(13,1,8),(14,14,8),(15,1,9),(16,2,9),(17,1,10),(18,9,10),(19,1,11),(20,6,11),(21,4,12),(22,15,12),(23,4,13),(24,5,13),(25,4,14),(26,2,14),(27,4,15),(28,5,15),(29,4,16),(30,3,16),(31,4,17),(32,15,17),(33,4,18),(34,9,18),(35,4,19),(36,12,19),(37,4,20),(38,2,20),(39,4,21),(40,6,21),(41,7,22),(42,2,22),(43,7,23),(44,2,23),(45,7,24),(46,11,24),(47,7,25),(48,12,25),(49,7,26),(50,2,26),(51,7,27),(52,3,27),(53,7,28),(54,2,28),(55,7,29),(56,6,29),(57,7,30),(58,11,30),(59,7,31),(60,5,31),(61,10,32),(62,2,32),(63,10,33),(64,15,33),(65,10,34),(66,15,34),(67,10,35),(68,8,35),(69,10,36),(70,8,36),(71,10,37),(72,15,37),(73,10,38),(74,5,38),(75,10,39),(76,15,39),(77,10,40),(78,11,40),(79,10,41),(80,3,41),(81,13,42),(82,2,42),(83,13,43),(84,11,43),(85,13,44),(86,15,44),(87,13,45),(88,3,45),(89,13,46),(90,2,46),(91,13,47),(92,9,47),(93,13,48),(94,8,48),(95,13,49),(96,5,49),(97,13,50),(98,5,50),(99,13,51),(100,11,51);
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
INSERT INTO `users` VALUES (1,'$2a$12$46wEYI6yfELMxgfW3KcYxOoV1C974CikapcIVyICYTbNi6vhI9GcK',NULL,NULL,0,NULL,NULL,NULL,NULL,'Roger','Waters',NULL,NULL,'admin@null.com',1000,NULL,'0e5fd0ab1fa89539fd0500c0e2c15c8bb7ff20e877bf5c62c775e30c16ab',NULL,'2020-07-10 00:03:19.359444','2020-07-10 00:03:19.359444'),(2,'$2a$12$pNtgS9NWrDpMGz.yAMg2WuYuYbAPVM0pQ1n5cAjVwr2z/kGuXFNwW',NULL,NULL,0,NULL,NULL,NULL,NULL,'Leilani','Torp',NULL,NULL,'stephen.schmidt@von.net',300,NULL,'c49e8e9d56220d7b1fa704097965745e882a027df7f172a11555269b21f7',NULL,'2020-07-10 00:03:19.979235','2020-07-10 00:03:19.979235'),(3,'$2a$12$WOtYi0C4X8c5hO0kcV07euqiKVM7KbKj6T3IGJ/nsXGnthKtLJ9bK',NULL,NULL,0,NULL,NULL,NULL,NULL,'Sana','Marquardt',NULL,NULL,'jimmy_parisian@franecki-raynor.biz',200,NULL,'6624474a3aa6d124a21d70d4042cc9683c7748dbf451532a89c252d2e59c',NULL,'2020-07-10 00:03:20.178384','2020-07-10 00:03:20.178384'),(4,'$2a$12$aURkJex7KaEEwNvYSFj2POh9v1kQnzu.IU1VmiS6pMLEExXO7K8ty',NULL,NULL,0,NULL,NULL,NULL,NULL,'William','Treutel',NULL,NULL,'zachary@okon.com',200,NULL,'7e0820b4e22e11966e425a6f27a93a6df4db151a82bb851a8b94d947b079',NULL,'2020-07-10 00:03:20.372418','2020-07-10 00:03:20.372418'),(5,'$2a$12$7O5zENBHyu2k0HhrgVB/Seov3aMaSfFlDZonrETqstapkWKFsfi1y',NULL,NULL,0,NULL,NULL,NULL,NULL,'Hayley','Bartell',NULL,NULL,'lupe.yost@beer-johnson.net',100,NULL,'79d038536a2158c4a81e27f7034e7c4ce611a53a373b15b15071010165ad',NULL,'2020-07-10 00:03:20.562427','2020-07-10 00:03:20.562427'),(6,'$2a$12$bwPNMRqx.wXef7T1Lkjp7ulixoQDthzqtCzVH6dx/6.1Yc7X5Vqai',NULL,NULL,0,NULL,NULL,NULL,NULL,'Danyell','Krajcik',NULL,NULL,'jamar@ferry.biz',300,NULL,'c0029b17c57306d2fd6d7fcf0985632b612b062890a918297f1a4f5a4344',NULL,'2020-07-10 00:03:20.750154','2020-07-10 00:03:20.750154'),(7,'$2a$12$a2Wn.NDnoKgwK3ZmZvSDY.Jg8AjRGuWSl6nHRfuGsNDvyuCtwK1Q6',NULL,NULL,0,NULL,NULL,NULL,NULL,'Serena','Rau',NULL,NULL,'isela@parisian.io',300,NULL,'a8819a465373d4ffc888094d4a02436d0c8c57c5dcf1531faf50813f5358',NULL,'2020-07-10 00:03:20.948778','2020-07-10 00:03:20.948778'),(8,'$2a$12$eBhpz8VZd80GrB.OXPlFHu2bU05acdqtL/ysGfDGfkMBRrX10qS5K',NULL,NULL,0,NULL,NULL,NULL,NULL,'Bobbie','Abshire',NULL,NULL,'miesha@mcglynn.name',200,NULL,'913582ab890aeac15cb99fc9fd441e137cd45aa43160712dbb7c13d0fe39',NULL,'2020-07-10 00:03:21.140028','2020-07-10 00:03:21.140028'),(9,'$2a$12$dEORnFUWLPLqZpIkyytrXugnX2PLsB1kJCNh/RBVh0e/cnfx.aIRK',NULL,NULL,0,NULL,NULL,NULL,NULL,'Foster','Schowalter',NULL,NULL,'ethan@green-veum.io',200,NULL,'bfbd46da239c9bf49e073f4bc21601d81cd0ee97501600ec5648f76e4c06',NULL,'2020-07-10 00:03:21.330762','2020-07-10 00:03:21.330762'),(10,'$2a$12$E.kc4kbezlVqPx4k/Gd4AuSjKGXVvX72QFlZD8W93CgF1GhAjQygK',NULL,NULL,0,NULL,NULL,NULL,NULL,'Mana','Collier',NULL,NULL,'bambi.dicki@adams.co',200,NULL,'a792da0be0b1e52819f5124cdff184f08fe7df78c7f28d9608de4f16f45f',NULL,'2020-07-10 00:03:21.604512','2020-07-10 00:03:21.604512'),(11,'$2a$12$3J9.6vCEWvbrgmcNp78wN.dHa4BQXYI3Fdvf6QScbb3q0IjXV0kRe',NULL,NULL,0,NULL,NULL,NULL,NULL,'Anita','Morissette',NULL,NULL,'myriam@wisoky-heaney.info',200,NULL,'71b5f132e987e89724d0625f375d58e2c4dff7de785fc8d7df8dcb1481ce',NULL,'2020-07-10 00:03:21.884256','2020-07-10 00:03:21.884256'),(12,'$2a$12$A6T7f5VabYKviS/stYHXweQX3CVaItcsREhTjNMsgrVk.eN7LQvAG',NULL,NULL,0,NULL,NULL,NULL,NULL,'Emanuel','Conroy',NULL,NULL,'lilla_rempel@sawayn.biz',200,NULL,'13e4503ca0c706f276b6158727bb72a2a0369dac2bd9b6c58fa0e5fd6260',NULL,'2020-07-10 00:03:22.163232','2020-07-10 00:03:22.163232'),(13,'$2a$12$Oa8wIIJiVlol1ARnEsi7q.tPeB843FbgelaWskWk/h4C6zhoH8jNW',NULL,NULL,0,NULL,NULL,NULL,NULL,'Aldo','Kshlerin',NULL,NULL,'jo_erdman@kling-willms.com',200,NULL,'6cf3c205e304c90b883183cdee51030580567d04cbca20eb1f764c61d21d',NULL,'2020-07-10 00:03:22.438017','2020-07-10 00:03:22.438017'),(14,'$2a$12$tbWQ0dCuG4xZAz0ZhDLYo.E9RxAefwxkOnaOYfSCBHO4CgLQqgFoa',NULL,NULL,0,NULL,NULL,NULL,NULL,'Jennell','Hand',NULL,NULL,'hung_fritsch@brown.name',300,NULL,'07200053087fb9cbdcd6da8dbe5b56b6619b22d5ecf65bb0ab9594eac377',NULL,'2020-07-10 00:03:22.717614','2020-07-10 00:03:22.717614'),(15,'$2a$12$tkYIrX02fujKgaXyop.m1OgGwadXrehvCSO4Wzu5QxObMMAGIi2gK',NULL,NULL,0,NULL,NULL,NULL,NULL,'Johnny','Feil',NULL,NULL,'eloy.bruen@pouros.com',100,NULL,'4ebb0472d128e8c6179d88db8e04633f070dc55714f421e7768156fde264',NULL,'2020-07-10 00:03:22.996682','2020-07-10 00:03:22.996682'),(16,'$2a$12$aGHEwa8MslkqRok775wR1uU.yie5LVDDrArCBALUbbxbdEipCtliq',NULL,NULL,0,NULL,NULL,NULL,NULL,'Agatha','Jenkins',NULL,NULL,'janett@flatley.org',200,NULL,'9d644697490b25d69cb0a142564faf1b7240b33069ddea7b3a4307034e3e',NULL,'2020-07-10 00:03:23.279408','2020-07-10 00:03:23.279408'),(17,'$2a$12$ohwfQtzgoYsy3hvt2xtcQ.vDKUvrUPjj4lJ53yPSi10hWYDdDYzy.',NULL,NULL,0,NULL,NULL,NULL,NULL,'Eugene','Bednar',NULL,NULL,'celsa_gislason@kertzmann.name',100,NULL,'08bc32c43e1758c1ab71f351f8b95f214e9ac44f893d2adf29741085e7f9',NULL,'2020-07-10 00:03:23.552964','2020-07-10 00:03:23.552964'),(18,'$2a$12$lOZGk2e6p4lgEiD7/TR6XOK5X1ygjaKz2YoNi9WDCV.rweTnkTquK',NULL,NULL,0,NULL,NULL,NULL,NULL,'Gaylord','Davis',NULL,NULL,'milan@marvin.io',100,NULL,'2f2218fa8cfa781e3cc44a664f54104d90419a72516d2fdb4d2807c9583d',NULL,'2020-07-10 00:03:23.833506','2020-07-10 00:03:23.833506'),(19,'$2a$12$hAEpY5S9fKSvWccLXtat6O7L6o6/mN3gs1yucrs/IqGTsC1uIK9mS',NULL,NULL,0,NULL,NULL,NULL,NULL,'Palmer','Mayer',NULL,NULL,'kelvin@dickens.name',1000,NULL,'68b8948b2662f4592b7f16f5b4bafe48036a453a956d9c43eaf92bfb1647',NULL,'2020-07-10 00:03:24.114671','2020-07-10 00:03:24.114671'),(20,'$2a$12$rT2x6eJ25tgPVrJtUvRGTugSzhZar5cwq35l9jea6JHG9MF/KVLKG',NULL,NULL,0,NULL,NULL,NULL,NULL,'Lacy','O\'Hara',NULL,NULL,'saul@zieme.io',300,NULL,'1319a8420c114333a34cf4ae08f08512ab5d89d4ef866c1e60de66f8eeb0',NULL,'2020-07-10 00:03:24.394554','2020-07-10 00:03:24.394554'),(21,'$2a$12$F13xp1oMRgQT8Hr14MxOOeYvn3/6fE/fBp4N8E.mnOmmzkl6wrhwG',NULL,NULL,0,NULL,NULL,NULL,NULL,'Shayna','Davis',NULL,NULL,'phebe_ernser@davis-kerluke.name',1000,NULL,'148541b7674e5d716d225a87637d0f71b313db1bdf4334af5c0b89923934',NULL,'2020-07-10 00:03:24.666043','2020-07-10 00:03:24.666043'),(22,'$2a$12$B4sin5v.uync0Wqle.dDTOzBRR0reMICBhehHNtmX81F/G.WIqh7S',NULL,NULL,0,NULL,NULL,NULL,NULL,'Nicol','Goyette',NULL,NULL,'lemuel@heaney.com',100,NULL,'f30ef11e9f1794961657d75db2bccd206fd65c5b6b3c04346d170f2a334e',NULL,'2020-07-10 00:03:24.947613','2020-07-10 00:03:24.947613'),(23,'$2a$12$evYpK8jUxsDpqzvUIbgoje76hnY.xWNEsS/XWB3/2K5mXLu6fyiXC',NULL,NULL,0,NULL,NULL,NULL,NULL,'Terry','Kessler',NULL,NULL,'ladonna@dubuque.io',200,NULL,'950958b3b556834d6dc220bd5d2f9cf68139b8784ec1ad0b99d90feead27',NULL,'2020-07-10 00:03:25.246329','2020-07-10 00:03:25.246329'),(24,'$2a$12$ebsxSHhSY68wobf4N9YWBu2h5rXkDQJ0BfO7r24XnvVB/XQYCNT7S',NULL,NULL,0,NULL,NULL,NULL,NULL,'Shantell','Metz',NULL,NULL,'deandre.witting@koelpin-moen.name',200,NULL,'ec2a1d010c43acc62103f045be2b1dfc89bd4406de2ec85a7c2dcbe5e803',NULL,'2020-07-10 00:03:25.529850','2020-07-10 00:03:25.529850'),(25,'$2a$12$CJvASoaoV7UK2NHWlYIxb.RIP3gTiZV7F3hzFaRKNaePG6BlxV98C',NULL,NULL,0,NULL,NULL,NULL,NULL,'Florencio','Nader',NULL,NULL,'ross_block@fritsch.name',1000,NULL,'408f621f9a274c05304a050490c91a604fb0e78274bde2852a2d9e00a4b6',NULL,'2020-07-10 00:03:25.804372','2020-07-10 00:03:25.804372'),(26,'$2a$12$MG1WyCKxxDvO8dTJvbiMl.2eC9w606cglHJfl/Rza64bZSI5Ua2OO',NULL,NULL,0,NULL,NULL,NULL,NULL,'Toshia','Kuvalis',NULL,NULL,'fletcher.schmidt@murphy-waters.name',300,NULL,'c08d5a4a7473140ac8cf51e47517633bb869f162cf1188adf393a7847dd4',NULL,'2020-07-10 00:03:26.083289','2020-07-10 00:03:26.083289'),(27,'$2a$12$ytQRfQj9UjT5UICPvW2ySeRQxHBnb1VlNliceBAXyt82eNcdanJwq',NULL,NULL,0,NULL,NULL,NULL,NULL,'Sherry','Wintheiser',NULL,NULL,'nova_nicolas@pouros-tremblay.org',200,NULL,'3d7c718f9299834e32dcd97fb1e50a89aae7826384743f4995758ed1d98c',NULL,'2020-07-10 00:03:26.363001','2020-07-10 00:03:26.363001'),(28,'$2a$12$xU/pU1B9V/sipcFPYXYblue0c45yiSjlI0LYTCXCHY.rtgvsV1JhO',NULL,NULL,0,NULL,NULL,NULL,NULL,'Lesha','Yost',NULL,NULL,'bennie@beier.co',100,NULL,'b7dc05e8a5180ff5da7f518f6889efc155bce2062a32cfc7dba1f0d1b007',NULL,'2020-07-10 00:03:26.641533','2020-07-10 00:03:26.641533'),(29,'$2a$12$f9nynHgvJtcg4g.JP/lrjereJLMnHiA9fqaghWkbZlxnQzp7nXg7q',NULL,NULL,0,NULL,NULL,NULL,NULL,'Laila','Hartmann',NULL,NULL,'royal.abernathy@wilderman.info',100,NULL,'9681a79d622cfe530d870af6067aa4b02f1e3751319a0cd0e813e3929b98',NULL,'2020-07-10 00:03:26.913456','2020-07-10 00:03:26.913456'),(30,'$2a$12$zKY31AssJUjzFchha8NRMO5bjDc4qSmDqPi7vMBNnb9oEjLH6e0S.',NULL,NULL,0,NULL,NULL,NULL,NULL,'Robbie','Erdman',NULL,NULL,'maxie@weimann.info',300,NULL,'f36d7ba6e3426eb84da3c2dabe08fe85fa32e337cc2f2b1ab82604785e70',NULL,'2020-07-10 00:03:27.205892','2020-07-10 00:03:27.205892'),(31,'$2a$12$JrM/LCc90vkIwBiRn3Xnzu/ObjUQIgPtWtgX0a/KqOUpjBrT7nskC',NULL,NULL,0,NULL,NULL,NULL,NULL,'Corrinne','Orn',NULL,NULL,'gia.wisozk@cassin.io',1000,NULL,'97cfa8bc9044cc85950b99be5edf63874d97d143b971634816471230a876',NULL,'2020-07-10 00:03:27.495669','2020-07-10 00:03:27.495669'),(32,'$2a$12$lyrElsDrXL/u2tWp2m0XsukwPHT.7O0gc94B9PuRUEVAa12AvbNNq',NULL,NULL,0,NULL,NULL,NULL,NULL,'Lavonia','Olson',NULL,NULL,'beata@turner.biz',200,NULL,'ce2a184e65cd63020c66bb43aee5c97c665d6475128ec111311bb4053b1b',NULL,'2020-07-10 00:03:27.778052','2020-07-10 00:03:27.778052'),(33,'$2a$12$psv9WIPmm./WfTaP5tyqGOdHpgh/t2i1ayMOceKlWdQMAuyAKPG0q',NULL,NULL,0,NULL,NULL,NULL,NULL,'Kris','Robel',NULL,NULL,'tad_vandervort@padberg.org',1000,NULL,'1cf345551256f3afa7d9331d281d4081af2b92813f1691733ecc8c000586',NULL,'2020-07-10 00:03:28.056429','2020-07-10 00:03:28.056429'),(34,'$2a$12$XxfMrrTAG0jUTOLfodFVAeEDKWKnrHdPHqQUOKCfF023.HX0GSLZG',NULL,NULL,0,NULL,NULL,NULL,NULL,'Arlie','Bins',NULL,NULL,'jackson_considine@schowalter.io',1000,NULL,'cec27826b8cfd94e39229554f12c5a732f60665db4229fd45168f4e449b6',NULL,'2020-07-10 00:03:28.340818','2020-07-10 00:03:28.340818'),(35,'$2a$12$rEyHTwt8PkAiVfi5aXkM4ut2MIopzDiHeFLEOSNWIKUs0Q6htXF/q',NULL,NULL,0,NULL,NULL,NULL,NULL,'Melody','Schamberger',NULL,NULL,'arlinda_romaguera@corkery-hilll.org',1000,NULL,'1e573e713ec4fe876496ef83a979ddd9e101206ae3e8d3e99febb9ac82c8',NULL,'2020-07-10 00:03:28.618194','2020-07-10 00:03:28.618194'),(36,'$2a$12$uO47GGKLV3V6d.pG9Lu/ZOEeZ4.9PfJs5AEgGw53EHdWWkXHunPLK',NULL,NULL,0,NULL,NULL,NULL,NULL,'Mammie','Heathcote',NULL,NULL,'kenneth.larkin@haley-fisher.info',200,NULL,'0298b5912d155167ff95cc39ea86cef47e8d08d76f359355508ac542341f',NULL,'2020-07-10 00:03:28.894840','2020-07-10 00:03:28.894840'),(37,'$2a$12$RzaP3.gLg7P.XCc0pIZ3z.2/iRoXzB5/6d5NpcMHrJcIF7p9jMHC.',NULL,NULL,0,NULL,NULL,NULL,NULL,'Jacquelyn','Collier',NULL,NULL,'gary@walter-hahn.name',200,NULL,'01c15c11d40f93be5dd1e58529439644530cb723e34ab786591dd8315370',NULL,'2020-07-10 00:03:29.176177','2020-07-10 00:03:29.176177'),(38,'$2a$12$6NwKqEQvzNXmYSF3isxfU.udE6gXxnUi75aNoIIBlA2KqdJDQ.OGK',NULL,NULL,0,NULL,NULL,NULL,NULL,'Deane','Conroy',NULL,NULL,'marica@ward.com',100,NULL,'57a351bbbb25a2d184ec39b1e4930b77f0e50170c6dd107467d04ba9f22d',NULL,'2020-07-10 00:03:29.459123','2020-07-10 00:03:29.459123'),(39,'$2a$12$eeDatAOV45dLUwJMSKwg/OgxCNjvxuY9dYRFTlWAP./Nc4o1gXDGW',NULL,NULL,0,NULL,NULL,NULL,NULL,'Cody','Armstrong',NULL,NULL,'emilio_watsica@witting.co',200,NULL,'38afaddaa56cdbc125b89b5b80881090499a1f9c33f6c202c49734961d1a',NULL,'2020-07-10 00:03:29.736409','2020-07-10 00:03:29.736409'),(40,'$2a$12$VU.PiObo8kouMdkxijERLO16BsX55kUwGrZGW0AC1Z.obaFt/zFNK',NULL,NULL,0,NULL,NULL,NULL,NULL,'Lauri','Hoeger',NULL,NULL,'patricia_ritchie@goodwin.name',100,NULL,'8c6452d2e3aa03e11ac2d505754b100f74d91bf8a25d7c77a6350b16d99c',NULL,'2020-07-10 00:03:30.012969','2020-07-10 00:03:30.012969'),(41,'$2a$12$sixWmIHpixw4NqHQd/poyek/naoMNw0IsTz7Tg35wA4jVifdiHCBq',NULL,NULL,0,NULL,NULL,NULL,NULL,'Karyn','Senger',NULL,NULL,'estell@aufderhar.io',300,NULL,'1b2eacdaed840b513d267d7f8283b43bf6d80b619b63bb8afde98e82f9dd',NULL,'2020-07-10 00:03:30.297213','2020-07-10 00:03:30.297213'),(42,'$2a$12$MMsja/PJDz8QwieIMvxAzuxH9O5rTCzNq5Gh6blJu85kWqGDy7vQ6',NULL,NULL,0,NULL,NULL,NULL,NULL,'Mitsuko','Willms',NULL,NULL,'mario@bauch.biz',100,NULL,'994d3bd8cadb4d0cd42142592bab67a05e8f6cc9a3b286111d93b1162d5e',NULL,'2020-07-10 00:03:30.584151','2020-07-10 00:03:30.584151'),(43,'$2a$12$ew.4JY5nt3AcrpSvfEr/ZObWfwqFIZ1JK7nQZYZlEkY45OcMh8I8q',NULL,NULL,0,NULL,NULL,NULL,NULL,'Kenton','Purdy',NULL,NULL,'pablo@mayert.co',300,NULL,'3691f7b810f1ca4ae3c0b927ed95197fd093d4028697077d23eb85b12202',NULL,'2020-07-10 00:03:30.871635','2020-07-10 00:03:30.871635'),(44,'$2a$12$QLJx3U1qmnawRj7t7jL85.Y40RpVpUQtuaBpkhd0zInPU3wGipIpu',NULL,NULL,0,NULL,NULL,NULL,NULL,'Quinn','Olson',NULL,NULL,'josue@grant.com',1000,NULL,'5a8d6cca2e3c5f2cf56a06ed26e2770f8d139d543d41e5d1694d3fb75e92',NULL,'2020-07-10 00:03:31.147098','2020-07-10 00:03:31.147098'),(45,'$2a$12$Ip0nCGDT3pDhQvMpkUOUNu2PmnwC9CLfEscjYjPym2fEI8emcTSSu',NULL,NULL,0,NULL,NULL,NULL,NULL,'Yoshiko','Hudson',NULL,NULL,'pilar@lehner.net',100,NULL,'025bd72523d562b50fa0748e95b612449dd83543d83b4c746f767fb4568d',NULL,'2020-07-10 00:03:31.432073','2020-07-10 00:03:31.432073'),(46,'$2a$12$oZBA.x6NnKySF46KWotgp.nr70EAnIiMH.CYYcx1zjzN7PEJDDnDy',NULL,NULL,0,NULL,NULL,NULL,NULL,'Adalberto','Zemlak',NULL,NULL,'mckenzie_buckridge@crooks.com',100,NULL,'113b14d9eb034a18934d7f63c3b8dfda8d803c0889369e416d634522b4ca',NULL,'2020-07-10 00:03:31.712984','2020-07-10 00:03:31.712984'),(47,'$2a$12$8euUXtsmK8AP72Lbfm2.xuCCZWHxhTAJVtb5SKrCQigV2fJ2ZuuUa',NULL,NULL,0,NULL,NULL,NULL,NULL,'Velvet','Koss',NULL,NULL,'brenda_ortiz@tremblay.biz',100,NULL,'84c5e52d1b43d1ff67523b5da6766c0dc2c7040010f2bcc3a3e1bf0914a8',NULL,'2020-07-10 00:03:31.994028','2020-07-10 00:03:31.994028'),(48,'$2a$12$Nw1V.UgSKPJl/DfZt5wSOu.R3ZcmXDoWij/wcfR5nwL29YR9S7GAC',NULL,NULL,0,NULL,NULL,NULL,NULL,'Brittney','Swaniawski',NULL,NULL,'tressa.auer@welch-wintheiser.org',300,NULL,'1606fbfef38c7f866b94f58e246cf3fa53041aa59f5a18472d438fb5416a',NULL,'2020-07-10 00:03:32.271913','2020-07-10 00:03:32.271913'),(49,'$2a$12$9mxrSiuioDmYIi4Y/oq5xupDE5f3UC7UT4c1pJzyuuQ6KfucdlVh2',NULL,NULL,0,NULL,NULL,NULL,NULL,'Warren','Turner',NULL,NULL,'theo.casper@kihn.info',200,NULL,'7bd83cedd8e2d12ceab643122a679eab7882392d14e71d6783bba2454743',NULL,'2020-07-10 00:03:32.590061','2020-07-10 00:03:32.590061'),(50,'$2a$12$7JQ/yUrnpiFQ.3qBZse0i.H8ck0KevfCmewx4JZ8.7LsNFtJNgB6u',NULL,NULL,0,NULL,NULL,NULL,NULL,'Eunice','Block',NULL,NULL,'lonnie.auer@thompson.io',300,NULL,'6fabd33834074ab5f7f37ae1acda87d9b110df1cac2bbeec158cb041a083',NULL,'2020-07-10 00:03:32.880585','2020-07-10 00:03:32.880585'),(51,'$2a$12$pqPBg8CEZfLxW8J84HGcwOOao0KUUdujML23kmoca6htEdl7Wz/N.',NULL,NULL,0,NULL,NULL,NULL,NULL,'Chi','Kerluke',NULL,NULL,'monte@davis.net',200,NULL,'af1663b202b1d0df6fb8cf768c80c31fbdb48fc92be71a2dbc070be16b15',NULL,'2020-07-10 00:03:33.167784','2020-07-10 00:03:33.167784');
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

-- Dump completed on 2020-07-09 18:03:33
