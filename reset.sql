-- MySQL dump 10.13  Distrib 5.7.28, for osx10.15 (x86_64)
--
-- Host: localhost    Database: generic_develop
-- ------------------------------------------------------
-- Server version	5.7.28

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
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2020-02-03 18:03:31.308989','2020-02-03 18:03:31.308989'),('schema_sha1','cc2506405fd2566bb122fa5fa63a1f8a9935b50d','2020-02-03 18:03:31.314666','2020-02-03 18:03:31.314666');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
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
  KEY `index_customers_on_depth` (`depth`),
  KEY `index_customers_on_lft` (`lft`),
  KEY `index_customers_on_name` (`name`),
  KEY `index_customers_on_parent_id` (`parent_id`),
  KEY `index_customers_on_rgt` (`rgt`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'The Three Broomsticks','Somewhere in Hogsmeade',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,4,0,0,'2020-02-03 18:03:33.169986','2020-02-03 18:03:33.963489'),(2,'The Brewery','Somewhere else in Hogsmeade',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,2,3,1,0,'2020-02-03 18:03:33.758049','2020-02-03 18:03:33.963489'),(3,'The Conservatory','Somewhere in Paris',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,6,0,0,'2020-02-03 18:03:33.980382','2020-02-03 18:03:33.980382'),(4,'Demos','Somewhere in Hogsmeade',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,8,0,0,'2020-02-03 18:03:34.189464','2020-02-03 18:03:34.189464');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
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
  `allow_password_change` tinyint(1) DEFAULT '0',
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `confirmation_token` varchar(255) DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `confirmation_sent_at` datetime DEFAULT NULL,
  `unconfirmed_email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `role` int(11) DEFAULT '100',
  `tac_agreed_at` datetime DEFAULT NULL,
  `unsubscribe_token` varchar(255) DEFAULT NULL,
  `unsubscribed_at` datetime DEFAULT NULL,
  `websocket_token` varchar(255) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_confirmation_token` (`confirmation_token`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`),
  UNIQUE KEY `index_users_on_websocket_token` (`websocket_token`),
  KEY `index_users_on_customer_id` (`customer_id`),
  KEY `index_users_on_unsubscribe_token` (`unsubscribe_token`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'$2a$12$87LQhupY1moIKuIf2joA4ORnYxC388.ruQ3X61J4Yc75v7V7.i/je',NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Roger','Waters',NULL,NULL,'admin@null.com',1000,NULL,'32d32cae060860ff9f6e00309800d835120591bc031eeaf6bf77db7cfda5',NULL,'753279f09100d1976e037c2251fdb2032ffb2993ccfce55537c2564f4cba',NULL,'2020-02-03 18:03:33.152324','2020-02-03 18:03:33.152324',NULL),(2,'$2a$12$zLakc9IqAGcXWl07f62M8.WXVjMBnd/lCFmfQdO79W9mxbNngwe/y',NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Dani','Litani',NULL,NULL,'supervisor_c_w_s@null.com',300,NULL,'45faf6c0166daa9994d2a616c87725686f69a111e9db924a19052334762e',NULL,'f6d63e4de04661164972c6fafe8844c24ef023b638a77df64c17509ed44c',NULL,'2020-02-03 18:03:33.369768','2020-02-03 18:03:33.369768',1),(3,'$2a$12$i1MLsQi.c0VGz12DvqCjyObnshzQ.WbLwopNLw2wWrj1b.q2l.vM.',NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Bryan','Adams',NULL,NULL,'manager_c_w_s@null.com',200,NULL,'e013a8d3493f118fc5665dd815cce6b1f04f3689036980c15fc8c7edd174',NULL,'5be0a5aa1141ea804512dbff1bd62902eecb27abf6bd72482a0287d8c361',NULL,'2020-02-03 18:03:33.563006','2020-02-03 18:03:33.563006',1),(4,'$2a$12$KLUERsQB.5wnoetHESWhZOWZIuk/DHrjQ8bWm9QUDou03zJGChXKC',NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Edie','Brickell',NULL,NULL,'regular_c_w_s@null.com',100,NULL,'0684843c520176d4484719bcf013ae2cacc54a6ce6116fbf23677124f151',NULL,'69aae14aab95195cef651c49acabe808b1c087e6ecde8db584e3640325b4',NULL,'2020-02-03 18:03:33.755187','2020-02-03 18:03:33.755187',1),(5,'$2a$12$d1rQuKT/AlIMVAg3B.JxQ.AjaRXFzclQKoSKHcgSJ951eB1R7ZLXC',NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Susanna','Hoffs',NULL,NULL,'regular_s@null.com',100,NULL,'e8bb72514d5f30c84196c373895f7e27d7d8e3a6be95329540bc5dfc31f9',NULL,'6411f27e10e698afabcadb83ac0e970032684eecd2548852985c5c732db8',NULL,'2020-02-03 18:03:33.952496','2020-02-03 18:03:33.952496',2),(6,'$2a$12$ux/Y.ZBcllZqy64/IgG3yuUGv0kg/W2LA9LTHaeHt3ZMPHfT/0/xC',NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Fred','Chopin',NULL,NULL,'manager_c_wo_s@null.com',200,NULL,'47155b38d5fab870f80273c9e25a339a5506b6b35f97e8dc4072a63e4539',NULL,'5e39758c16a7bd04946a7c21e52a46de928832e7132ccea90449f8df2568',NULL,'2020-02-03 18:03:34.181615','2020-02-03 18:03:34.181615',3),(7,'$2a$12$QvnyhAAgiryOms5epuASue7k0Fx3ccXDkan5HlyaDpFKsXaQpTm5S',NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Brandi','Carlile',NULL,NULL,'demo@null.com',100,NULL,'1f0d2ec20be4510cd20b4a506bb853ed9fec60d707fbbd7aded48d15db50',NULL,'8433c89265f7fcb920edc29d0bb6985d2ac4a9bafbb02e74047217cfd7de',NULL,'2020-02-03 18:03:34.391577','2020-02-03 18:03:34.391577',4);
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

-- Dump completed on 2020-02-03 11:03:34
