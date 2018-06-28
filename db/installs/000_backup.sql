-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: localhost    Database: ksiaki
-- ------------------------------------------------------
-- Server version	5.7.22

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
-- Table structure for table `_accounts`
--

DROP TABLE IF EXISTS `_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_accounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `birthday` date DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `postcode` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `contest_agreement` tinyint(1) DEFAULT NULL,
  `marketing_agreement` tinyint(1) DEFAULT NULL,
  `notifications_agreement` tinyint(1) DEFAULT NULL,
  `statute_agreement` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(10) DEFAULT '0',
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(10) DEFAULT '0',
  `marked_as_deleted_at` datetime DEFAULT NULL,
  `marked_as_deleted_by` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61272 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Konta uÅ¼ytkownikÃ³w';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_accounts`
--
-- WHERE:  1 limit 100

LOCK TABLES `_accounts` WRITE;
/*!40000 ALTER TABLE `_accounts` DISABLE KEYS */;
INSERT INTO `_accounts` (`id`, `user_id`, `gender`, `birthday`, `address`, `postcode`, `city`, `contest_agreement`, `marketing_agreement`, `notifications_agreement`, `statute_agreement`, `created_at`, `created_by`, `updated_at`, `updated_by`, `marked_as_deleted_at`, `marked_as_deleted_by`) VALUES (1,1,1,'1985-01-01','a','a','a',NULL,NULL,NULL,NULL,'2012-08-18 15:01:31',0,NULL,0,NULL,0),(2,37,1,'1984-01-01','Żeromskiego 12','01-888','Warszawa',NULL,NULL,NULL,NULL,'2012-08-29 11:04:01',0,NULL,0,NULL,0),(3,55,1,'1986-01-01','','','',NULL,NULL,NULL,NULL,'2012-09-07 11:06:07',0,NULL,0,NULL,0),(4,56,2,'1997-03-02','','','',NULL,NULL,NULL,NULL,'2012-09-07 11:08:01',0,NULL,0,NULL,0),(5,68,1,'2000-01-01','ja','040404','ja',NULL,NULL,NULL,NULL,'2012-09-20 08:59:29',0,NULL,0,NULL,0),(6,71,1,'2003-01-01','a','22','ww',NULL,NULL,NULL,NULL,'2012-09-20 13:35:19',0,NULL,0,NULL,0),(7,72,1,'2000-11-04','','','',NULL,NULL,NULL,NULL,'2012-09-20 13:39:43',0,NULL,0,NULL,0),(8,73,2,'1988-04-05','Warszawa','00-758','Warszawa',NULL,NULL,NULL,NULL,'2012-09-20 13:59:27',0,NULL,0,NULL,0),(9,75,1,'2000-01-01','A','02-123','warszawa',NULL,NULL,NULL,NULL,'2012-09-20 20:21:46',0,NULL,0,NULL,0),(10,84,1,'2000-01-01','racławicka 1/14','02-601','Warszawa',NULL,NULL,NULL,NULL,'2012-09-22 03:53:12',0,NULL,0,NULL,0),(11,85,1,'2000-03-02','jedność 45a/7','22-100 ','chełm',NULL,NULL,NULL,NULL,'2012-09-22 06:14:44',0,NULL,0,NULL,0),(12,86,1,'2004-01-01','w','0','olsztyn',NULL,NULL,NULL,NULL,'2012-09-22 06:44:33',0,NULL,0,NULL,0),(13,87,1,'2002-09-01','Piułsudskiego','39-100-Ropczyce','Ropczyce',NULL,NULL,NULL,NULL,'2012-09-22 07:32:31',0,NULL,0,NULL,0),(14,88,1,'2002-09-01','Piułsudskiego','39-100-Ropczyce','Ropczyce',NULL,NULL,NULL,NULL,'2012-09-22 07:35:25',0,NULL,0,NULL,0),(15,89,1,'1999-02-13','1-go Maja 1/1','48-370','Paczków',NULL,NULL,NULL,NULL,'2012-09-22 08:38:25',0,NULL,0,NULL,0),(16,90,2,'1972-01-25','al. stanów zjednoczonych 51','04-028','warszawa',NULL,NULL,NULL,NULL,'2012-09-22 09:34:06',0,NULL,0,NULL,0),(17,91,1,'2000-01-01','rj','rj','Warszawa',NULL,NULL,NULL,NULL,'2012-09-22 10:17:32',0,NULL,0,NULL,0),(18,92,1,'2001-07-06','Gniewczyna Tryniecka 138','37-203','Gniewczyna Łańcucka',NULL,NULL,NULL,NULL,'2012-09-22 10:37:28',0,NULL,0,NULL,0),(19,93,1,'2005-05-22','11 listopada 38/28','62-510','Konin',NULL,NULL,NULL,NULL,'2012-09-22 11:28:39',0,NULL,0,NULL,0),(20,94,1,'2005-09-30','ul. Wigury 18a/28','63-400','Ostrów Wlkp',NULL,NULL,NULL,NULL,'2012-09-22 12:28:19',0,NULL,0,NULL,0),(21,95,1,'2000-11-25','ul. lotnicza 11a/2','82-300','elbląg',NULL,NULL,NULL,NULL,'2012-09-22 13:43:11',0,NULL,0,NULL,0),(22,96,1,'2004-08-26','Balin, ul.Kolbego 3a','32-500 ','Chrzanów',NULL,NULL,NULL,NULL,'2012-09-22 14:43:27',0,NULL,0,NULL,0),(23,97,1,'2004-09-13','sienkiewicza 8','59-500','wilków',NULL,NULL,NULL,NULL,'2012-09-22 14:48:28',0,NULL,0,NULL,0),(24,98,1,'2003-05-25','ul. Franciszka Ratajczaka 4 Śniaty','64-050','wielichowo',NULL,NULL,NULL,NULL,'2012-09-22 15:00:46',0,NULL,0,NULL,0),(25,99,1,'2006-11-12','Zamenhoffa 32/3','64-920','Piła',NULL,NULL,NULL,NULL,'2012-09-22 16:10:21',0,NULL,0,NULL,0),(26,100,1,'2003-12-18','Os.Wł.Łokietka 12/25','61-616','Poznan',NULL,NULL,NULL,NULL,'2012-09-22 16:25:16',0,NULL,0,NULL,0),(27,101,1,'2003-03-31','ul.Spacerowa 56','44-251','Rybnik',NULL,NULL,NULL,NULL,'2012-09-22 17:29:43',0,NULL,0,NULL,0),(28,102,1,'2004-05-20','Podbipięty 9 m.63','92-440','Łódź',NULL,NULL,NULL,NULL,'2012-09-22 18:04:45',0,NULL,0,NULL,0),(29,103,2,'2002-08-02','Braci Polskich 15','31-998','Kraków',NULL,NULL,NULL,NULL,'2012-09-22 18:35:01',0,NULL,0,NULL,0),(30,104,2,'2002-08-02','Braci Polskich 15','31-998','Kraków',NULL,NULL,NULL,NULL,'2012-09-22 18:45:39',0,NULL,0,NULL,0),(31,105,1,'2003-05-20','tzcewska 37a','51-429','wrocław',NULL,NULL,NULL,NULL,'2012-09-22 19:10:41',0,NULL,0,NULL,0),(32,106,1,'2007-02-16','ul. Gniewska 22/4','81-047','Gdynia',NULL,NULL,NULL,NULL,'2012-09-22 20:36:00',0,NULL,0,NULL,0),(33,107,1,'2005-07-10','ul.Szylinga 42a','30-433','Kraków',NULL,NULL,NULL,NULL,'2012-09-23 07:19:53',0,NULL,0,NULL,0),(34,108,2,'1998-03-27','Szyllinga 42a','30-433','Kraków',NULL,NULL,NULL,NULL,'2012-09-23 07:33:42',0,NULL,0,NULL,0),(35,109,2,'1999-11-25','ul.Szyllinga42a','30-433','Kraków',NULL,NULL,NULL,NULL,'2012-09-23 08:02:16',0,NULL,0,NULL,0),(36,110,1,'2002-09-16','ul.dolna 11','67-200','Głogów',NULL,NULL,NULL,NULL,'2012-09-23 10:05:42',0,NULL,0,NULL,0),(37,111,1,'2004-11-30','D.Musnickiego 24/26','66-400','Gorzów Wlkp.',NULL,NULL,NULL,NULL,'2012-09-23 10:19:20',0,NULL,0,NULL,0),(38,112,1,'2004-11-30','D.Musnickiego 24/26','66-400','Gorzów Wlkp.',NULL,NULL,NULL,NULL,'2012-09-23 10:25:26',0,NULL,0,NULL,0),(39,113,1,'2004-06-23','leśniczówka 11','32-600','poręba wielka',NULL,NULL,NULL,NULL,'2012-09-23 10:36:46',0,NULL,0,NULL,0),(40,114,1,'2003-10-10','Otfinów 43','33-250','Otfinów',NULL,NULL,NULL,NULL,'2012-09-23 12:07:39',0,NULL,0,NULL,0),(41,115,2,'1998-06-22','ul. Korkowa 13/18','03-254','Warszawa',NULL,NULL,NULL,NULL,'2012-09-23 12:31:59',0,NULL,0,NULL,0),(42,116,1,'2000-02-21','Ostra 5a','62-090','Kiekrz',NULL,NULL,NULL,NULL,'2012-09-23 13:15:51',0,NULL,0,NULL,0),(43,117,1,'2000-12-08','T.B.Żeleńskiego 34/9','85-858','Bydgoszcz',NULL,NULL,NULL,NULL,'2012-09-23 14:18:27',0,NULL,0,NULL,0),(44,118,2,'1997-09-10','Kołobrzeska 42E/90','80-394','Gdańsk',NULL,NULL,NULL,NULL,'2012-09-23 14:55:26',0,NULL,0,NULL,0),(45,119,1,'2006-03-19','Wróblewskiego 134/34','90-035','Łódź',NULL,NULL,NULL,NULL,'2012-09-23 15:52:26',0,NULL,0,NULL,0),(46,120,1,'1998-06-28','mamaprzemka@o2.pl','22-400','zamość',NULL,NULL,NULL,NULL,'2012-09-23 16:23:39',0,NULL,0,NULL,0),(47,121,2,'2002-02-13','69/2b','48-140 branice','Posucice',NULL,NULL,NULL,NULL,'2012-09-23 16:52:01',0,NULL,0,NULL,0),(48,122,1,'2004-04-28','przednoście 13','55-300','przedmoście ',NULL,NULL,NULL,NULL,'2012-09-23 17:07:45',0,NULL,0,NULL,0),(49,123,1,'2004-01-10','ul.Gen.De.Gaulle `a 16m.5','80-261','Gdańsk',NULL,NULL,NULL,NULL,'2012-09-23 17:28:19',0,NULL,0,NULL,0),(50,124,1,'2005-06-18','Wyczółkowskiego 24/6','66-400','Gorzów Wielkopolski',NULL,NULL,NULL,NULL,'2012-09-23 17:59:44',0,NULL,0,NULL,0),(51,125,1,'1999-03-04','ul. Lipnowska 31i','87-100','Toruń',NULL,NULL,NULL,NULL,'2012-09-23 19:08:36',0,NULL,0,NULL,0),(52,126,1,'2000-04-16','Stawigudzka 10/30','10-687','Olsztyn',NULL,NULL,NULL,NULL,'2012-09-23 19:32:43',0,NULL,0,NULL,0),(53,127,1,'2004-03-05','osiedle Wysokie 1/57','31-818 ','Kraków',NULL,NULL,NULL,NULL,'2012-09-23 20:00:02',0,NULL,0,NULL,0),(54,128,1,'2002-04-24','ul.Krzyżowa 4/2','86-010 ','Koronowo',NULL,NULL,NULL,NULL,'2012-09-24 07:51:27',0,NULL,0,NULL,0),(55,129,2,'2004-10-21','a','01-856','Warszawa',NULL,NULL,NULL,NULL,'2012-09-24 08:59:02',0,NULL,0,NULL,0),(56,130,2,'2000-01-07','ul. Madalińskiego 96/98','02-506','Warszawa',NULL,NULL,NULL,NULL,'2012-09-24 08:59:29',0,NULL,0,NULL,0),(57,131,2,'2005-04-06','Waryńskiego 2/7','41-250','Czeladź',NULL,NULL,NULL,NULL,'2012-09-24 09:11:02',0,NULL,0,NULL,0),(58,132,1,'2003-04-19','Kwiatowa 43e/3','66-400','Gorzów Wlkp.',NULL,NULL,NULL,NULL,'2012-09-24 10:44:35',0,NULL,0,NULL,0),(59,133,1,'1996-07-12','Staszica 1/53','08-530','Dęblin',NULL,NULL,NULL,NULL,'2012-09-24 12:41:34',0,NULL,0,NULL,0),(60,134,1,'2000-04-20','os.700-lecia 2/4','44-240','Żory',NULL,NULL,NULL,NULL,'2012-09-24 12:48:07',0,NULL,0,NULL,0),(61,135,2,'1996-08-22','Pustkowie Północ 4','63-500','Ostrzeszów',NULL,NULL,NULL,NULL,'2012-09-24 13:28:45',0,NULL,0,NULL,0),(62,136,2,'1988-06-29','Króla Maciusia 13/34','03-252','Warszawa',NULL,NULL,NULL,NULL,'2012-09-24 13:30:18',0,NULL,0,NULL,0),(63,137,1,'2000-03-10','Tatrzańska 13','59-220','Legnica',NULL,NULL,NULL,NULL,'2012-09-24 13:51:09',0,NULL,0,NULL,0),(64,138,1,'1999-08-26','lotnicza 1/60','21-500','Biała Podlska',NULL,NULL,NULL,NULL,'2012-09-24 14:21:26',0,NULL,0,NULL,0),(65,139,1,'2007-04-30','ul.Bielska 51a m.9a','09-400','Płock',NULL,NULL,NULL,NULL,'2012-09-24 14:48:34',0,NULL,0,NULL,0),(66,140,1,'2004-10-15','3go maja 56/7','41-800','Zabrze',NULL,NULL,NULL,NULL,'2012-09-24 15:05:17',0,NULL,0,NULL,0),(67,141,1,'2004-11-23','brylowska 35/4','01-216','warszawa',NULL,NULL,NULL,NULL,'2012-09-24 15:31:56',0,NULL,0,NULL,0),(68,142,1,'2005-04-24','wilcza 4/6','11-400','kętzryn',NULL,NULL,NULL,NULL,'2012-09-24 15:55:25',0,NULL,0,NULL,0),(69,143,1,'2005-10-20','ul.Żurawia 26a/48','11-041','Olsztyn',NULL,NULL,NULL,NULL,'2012-09-24 16:14:47',0,NULL,0,NULL,0),(70,144,1,'2004-03-11','Bogusławskiego 16/37','01-923','Warszawa',NULL,NULL,NULL,NULL,'2012-09-24 16:20:00',0,NULL,0,NULL,0),(71,145,1,'2001-03-19','Al.Wojska Polskiego 120 m 15','42-200','Częstochowa',NULL,NULL,NULL,NULL,'2012-09-24 16:26:26',0,NULL,0,NULL,0),(72,146,1,'2005-05-22','skargi 6a/19','67-100','Nowa Sól',NULL,NULL,NULL,NULL,'2012-09-24 16:32:29',0,NULL,0,NULL,0),(73,147,1,'2002-07-01','Kopernika 7/1','11-600','Węgorzewo',NULL,NULL,NULL,NULL,'2012-09-24 16:48:22',0,NULL,0,NULL,0),(74,148,1,'2006-01-02','ul.obrońców pokoju 6','05-430','Celestynów',NULL,NULL,NULL,NULL,'2012-09-24 17:08:14',0,NULL,0,NULL,0),(75,149,1,'2005-12-22','ul.leśna 62 ','63-430','RACZYCE',NULL,NULL,NULL,NULL,'2012-09-24 17:48:11',0,NULL,0,NULL,0),(76,150,1,'2004-12-01','Niemcewicza 3/59','24-100','Puławy',NULL,NULL,NULL,NULL,'2012-09-24 20:07:33',0,NULL,0,NULL,0),(77,151,2,'1991-01-06','Kolorowa 3','58-540','Karpacz',NULL,NULL,NULL,NULL,'2012-09-24 20:48:01',0,NULL,0,NULL,0),(78,152,1,'2004-02-11','Zamojska 7','68-200','Żary',NULL,NULL,NULL,NULL,'2012-09-25 07:15:55',0,NULL,0,NULL,0),(79,153,2,'2004-06-01','ul Rysia 7/9 m 10','97-300','Piotrków Tryb.',NULL,NULL,NULL,NULL,'2012-09-25 08:44:14',0,NULL,0,NULL,0),(80,154,1,'1992-08-18','Zielona 20','43-370','Szczyrk',NULL,NULL,NULL,NULL,'2012-09-25 09:08:57',0,NULL,0,NULL,0),(81,155,1,'2008-09-22','3go maja','41800','Zabrze',NULL,NULL,NULL,NULL,'2012-09-25 09:23:47',0,NULL,0,NULL,0),(82,156,1,'2001-12-30','ul.Szymanowskiego 14/10','87-100','Toruń',NULL,NULL,NULL,NULL,'2012-09-25 10:26:33',0,NULL,0,NULL,0),(83,157,1,'2002-03-02','9c/1','69-220','Smogóry',NULL,NULL,NULL,NULL,'2012-09-25 13:41:16',0,NULL,0,NULL,0),(84,158,1,'2002-10-11','pomorska 17/8','10-699','olsztyn',NULL,NULL,NULL,NULL,'2012-09-25 14:25:37',0,NULL,0,NULL,0),(85,159,1,'2005-04-11','Dębowo 3','09-200','Sierpc',NULL,NULL,NULL,NULL,'2012-09-25 14:31:09',0,NULL,0,NULL,0),(86,160,1,'2002-06-20','ul. Topolowa 42','64-530 ','Kaźmierz',NULL,NULL,NULL,NULL,'2012-09-25 15:12:56',0,NULL,0,NULL,0),(87,161,1,'2002-03-26','Romera 34','91-165','Łódź',NULL,NULL,NULL,NULL,'2012-09-25 15:20:57',0,NULL,0,NULL,0),(88,162,1,'2004-01-07','targowa 10b/44','97-300','piotrków trybunalski',NULL,NULL,NULL,NULL,'2012-09-25 15:29:25',0,NULL,0,NULL,0),(89,163,1,'2006-04-19','Kolejowa 43/1','72-500','Międzyzdroje',NULL,NULL,NULL,NULL,'2012-09-25 15:29:46',0,NULL,0,NULL,0),(90,164,1,'2002-05-23','Rydza Smigłego 42/40','93-281','Łódż',NULL,NULL,NULL,NULL,'2012-09-25 16:38:30',0,NULL,0,NULL,0),(91,165,1,'2004-02-10','ul. Limanowskiego 24','42-400','Zawiercie',NULL,NULL,NULL,NULL,'2012-09-25 17:14:16',0,NULL,0,NULL,0),(92,166,1,'2004-09-02','ul. Jadźwingów  m. ','02-692','Warszawa',NULL,NULL,NULL,NULL,'2012-09-25 17:38:59',0,NULL,0,NULL,0),(93,168,1,'2002-01-02','Ligota Ul krotoszyńska 29.','63-440','Raszków',NULL,NULL,NULL,NULL,'2012-09-25 18:02:30',0,NULL,0,NULL,0),(94,169,1,'2000-01-01','Krasińskiego 19/9','74-101','Gryfino',NULL,NULL,NULL,NULL,'2012-09-25 19:22:55',0,NULL,0,NULL,0),(95,170,1,'2004-10-26','Mickiewicza 40','97-300','Piotrków Tryb.',NULL,NULL,NULL,NULL,'2012-09-25 19:26:47',0,NULL,0,NULL,0),(96,171,1,'2007-02-14','powstańców wielkopolskich 9a/23','85-090','bydgoszcz',NULL,NULL,NULL,NULL,'2012-09-26 07:22:26',0,NULL,0,NULL,0),(97,173,1,'2004-04-26','wojska polskiego 15/2','78-100','Kołobrzeg',NULL,NULL,NULL,NULL,'2012-09-26 07:57:05',0,NULL,0,NULL,0),(98,174,1,'1993-12-15','Staffa 28 m. 24','95-100','Zgierz',NULL,NULL,NULL,NULL,'2012-09-26 08:00:59',0,NULL,0,NULL,0),(99,175,1,'2006-01-29','ul.Armii Krajowej 39a/2','58-302','Wałbrzych',NULL,NULL,NULL,NULL,'2012-09-26 08:20:15',0,NULL,0,NULL,0),(100,176,1,'2003-10-21','Kościuszki 178/5','50-437','Wrocław',NULL,NULL,NULL,NULL,'2012-09-26 09:10:31',0,NULL,0,NULL,0);
/*!40000 ALTER TABLE `_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_backgrounds`
--

DROP TABLE IF EXISTS `_backgrounds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_backgrounds` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `image_url` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `link_url` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `placement` varchar(255) COLLATE utf8_polish_ci DEFAULT '/',
  `background_color` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `details_color` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `begins_at` datetime DEFAULT NULL,
  `ends_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(10) DEFAULT '0',
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(10) DEFAULT '0',
  `marked_as_deleted_at` datetime DEFAULT NULL,
  `marked_as_deleted_by` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='TÅ‚a reklamowe';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_backgrounds`
--
-- WHERE:  1 limit 100

LOCK TABLES `_backgrounds` WRITE;
/*!40000 ALTER TABLE `_backgrounds` DISABLE KEYS */;
INSERT INTO `_backgrounds` (`id`, `name`, `image_url`, `link_url`, `placement`, `background_color`, `details_color`, `is_active`, `begins_at`, `ends_at`, `created_at`, `created_by`, `updated_at`, `updated_by`, `marked_as_deleted_at`, `marked_as_deleted_by`) VALUES (7,'KochamMleko','https://cdn.takemefrom.com/backgrounds/1530018021-tapeta_mleko 2.jpg','https://kochammleko.pl','/','#ffffff','#000000',1,'1970-01-01 00:00:00','2222-01-01 00:00:00','2018-06-14 15:19:41',2,'2018-06-26 15:00:22',2,NULL,0),(8,'Kuba Guzik','http://cdn.takemefrom.com/backgrounds/1529935549-tapeta_sg.jpg','https://www.facebook.com/KinoToPrzygoda%20/?ref=bookmarks','/konkursy','#ffffff','#000000',0,'2018-06-25 16:04:00','2018-07-09 16:04:00','2018-06-25 14:05:31',2,'2018-06-25 16:05:49',2,'2018-06-26 09:14:13',2),(10,'Kuba Guzik','http://cdn.takemefrom.com/backgrounds/1529997487-tapeta_sg.jpg','https://www.facebook.com/KinoToPrzygoda%20/','/konkursy','#000','#fff',0,'2018-06-26 09:17:05','2018-07-10 09:17:05','2018-06-26 07:18:07',2,NULL,0,'2018-06-26 09:19:24',2),(15,'Kuba Guzik','https://cdn.takemefrom.com/backgrounds/1530014855-tapeta_konkursy Kuba Guzik 2.jpg','https://facebook.com/KinoToPrzygoda','/konkursy','#ffffff','#000000',1,'2018-06-26 14:01:00','2018-07-10 14:01:00','2018-06-26 12:04:36',2,'2018-06-26 14:07:35',2,NULL,0),(16,'test','https://cdn.takemefrom.com/backgrounds/1530176632-tapeta blue gradient.png','https://konkursiaki.pl','/%','#ffffff','#000000',1,'2018-06-27 15:35:00','2018-07-11 15:35:00','2018-06-27 13:37:38',1778,'2018-06-28 11:03:53',1778,NULL,0);
/*!40000 ALTER TABLE `_backgrounds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_boxes`
--

DROP TABLE IF EXISTS `_boxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_boxes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `image_url` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `link_url` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `begins_at` datetime DEFAULT NULL,
  `ends_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(10) DEFAULT '0',
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(10) DEFAULT '0',
  `marked_as_deleted_at` datetime DEFAULT NULL,
  `marked_as_deleted_by` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Boxy';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_boxes`
--
-- WHERE:  1 limit 100

LOCK TABLES `_boxes` WRITE;
/*!40000 ALTER TABLE `_boxes` DISABLE KEYS */;
INSERT INTO `_boxes` (`id`, `name`, `image_url`, `link_url`, `is_active`, `begins_at`, `ends_at`, `created_at`, `created_by`, `updated_at`, `updated_by`, `marked_as_deleted_at`, `marked_as_deleted_by`) VALUES (1,'Pierwszy box','/uploads/boxes/box-1.jpg','http://onet.pl',1,'2018-01-31 00:00:00','2028-09-30 00:00:00','2008-09-30 00:00:00',0,'2009-09-30 00:00:00',0,'2018-06-14 16:16:08',2),(2,'Drugi box','/uploads/boxes/box-2.jpg','http://wp.pl',1,'2018-09-30 00:00:00','2019-09-30 00:00:00','2006-09-30 00:00:00',0,'2008-09-30 00:00:00',0,'2018-06-14 16:16:10',2),(3,'Trzeci box','/uploads/boxes/box-3.jpg','http://wp.pl',1,'2018-09-30 00:00:00','2019-09-30 00:00:00','2006-09-30 00:00:00',0,'2008-09-30 00:00:00',0,'2018-06-14 16:16:12',2),(4,'Czwarty box','/uploads/boxes/box-4.jpg','http://wp.pl',1,'2018-09-30 00:00:00','2019-09-30 00:00:00','2006-09-30 00:00:00',0,'2008-09-30 00:00:00',0,'2018-06-14 16:16:14',2),(5,'Piąty box','/uploads/boxes/box-3.jpg','http://wp.pl',1,'2018-09-30 00:00:00','2019-09-30 00:00:00','2006-09-30 00:00:00',0,'2008-09-30 00:00:00',0,'2018-06-14 16:16:16',2),(6,'Szósty box','/uploads/boxes/box-2.jpg','http://wp.pl',1,'2018-09-30 00:00:00','2019-09-30 00:00:00','2006-09-30 00:00:00',0,'2008-09-30 00:00:00',0,'2018-06-14 16:16:19',2),(7,'LEGO Jurassic World','http://cdn.takemefrom.com/boxes/LEGO-Jurassic1[18]_265x265px.jpg','/bohater/lego-jurassic-world',1,'1970-01-01 00:00:00','2222-01-01 00:00:00','2018-06-14 16:17:20',0,NULL,0,NULL,0),(8,'Finger Cube','http://cdn.takemefrom.com/boxes/1530000280-Baner_CNm3[18]_265x265px_2.jpg','/bohater/cartoon-network',1,'1970-01-01 00:00:00','2222-01-01 00:00:00','2018-06-14 16:18:16',0,NULL,0,NULL,0),(9,'LEGO Batman','http://cdn.takemefrom.com/boxes/LEGOBatman2[18]_265x265px.jpg','/bohater/lego-batman',1,'1970-01-01 00:00:00','2222-01-01 00:00:00','2018-06-14 16:19:05',0,NULL,0,NULL,0),(10,'Scooby Doo','http://cdn.takemefrom.com/boxes/1530000293-SDm6[18]_265x265px_2.jpg','/bohater/scooby-doo',1,'1970-01-01 00:00:00','2222-01-01 00:00:00','2018-06-14 16:19:33',0,NULL,0,NULL,0);
/*!40000 ALTER TABLE `_boxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_caretakers`
--

DROP TABLE IF EXISTS `_caretakers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_caretakers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `surname` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '0',
  `activation_hash` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `activated_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(10) DEFAULT '0',
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(10) DEFAULT '0',
  `marked_as_deleted_at` datetime DEFAULT NULL,
  `marked_as_deleted_by` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61271 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Rodzice uÅ¼ytkownikÃ³w';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_caretakers`
--
-- WHERE:  1 limit 100

LOCK TABLES `_caretakers` WRITE;
/*!40000 ALTER TABLE `_caretakers` DISABLE KEYS */;
INSERT INTO `_caretakers` (`id`, `user_id`, `name`, `surname`, `email`, `is_active`, `activation_hash`, `activated_at`, `created_at`, `created_by`, `updated_at`, `updated_by`, `marked_as_deleted_at`, `marked_as_deleted_by`) VALUES (1,1,'asd','asd','rafal.dlugolecki@teamlab.pl',1,NULL,NULL,'2012-08-18 15:01:31',0,NULL,0,NULL,0),(2,37,'asd','asd','asd@wp.pl',1,NULL,NULL,'2012-08-29 11:04:01',0,NULL,0,NULL,0),(4,56,'Jan','Kowalski','jan.kowalski@gasd.sadgld',1,NULL,NULL,'2012-09-07 11:08:01',0,NULL,0,NULL,0),(5,68,'tata','mama','mama@mama.pl',1,NULL,NULL,'2012-09-20 08:59:29',0,NULL,0,NULL,0),(6,71,'w','w','a.przesmycki@msz.com.pl',1,NULL,NULL,'2012-09-20 13:35:19',0,NULL,0,NULL,0),(7,72,'ania','BG','a.blaszczyk-gawrys@msz.com.pl',1,NULL,NULL,'2012-09-20 13:39:43',0,NULL,0,NULL,0),(9,75,'Adam','Ludwiński','info@ludwinski.net',1,NULL,NULL,'2012-09-20 20:21:46',0,NULL,0,NULL,0),(10,84,'Adam','Joanna','jzl@message.pl',1,NULL,NULL,'2012-09-22 03:53:12',0,NULL,0,NULL,0),(11,85,'aneta','pitak','apitak777@wp.pl',1,NULL,NULL,'2012-09-22 06:14:44',0,NULL,0,NULL,0),(12,86,'wacław','kucharski','a.przesmycki@msz.com.pl',1,NULL,NULL,'2012-09-22 06:44:33',0,NULL,0,NULL,0),(13,87,'Wiesia','Stokłosa','stoklosaw@wp.pl',1,NULL,NULL,'2012-09-22 07:32:31',0,NULL,0,NULL,0),(14,88,'Wiesia','Stokłosa','stoklosaw@wp.pl',1,NULL,NULL,'2012-09-22 07:35:25',0,NULL,0,NULL,0),(15,89,'Renata','Kupczak','capri2@neostrada.pl',1,NULL,NULL,'2012-09-22 08:38:25',0,NULL,0,NULL,0),(17,91,'rj','rj','r.jasinski@msz.com.pl',1,NULL,NULL,'2012-09-22 10:17:32',0,NULL,0,NULL,0),(18,92,'Lucyna','Kulpa','lucynakulpa@o2.pl',1,NULL,NULL,'2012-09-22 10:37:28',0,NULL,0,NULL,0),(19,93,'Ela','Rynkowska','e_lka-1981@o2.pl',1,NULL,NULL,'2012-09-22 11:28:39',0,NULL,0,NULL,0),(20,94,'Anna','Jankowiak','anjan72@wp.pl',1,NULL,NULL,'2012-09-22 12:28:19',0,NULL,0,NULL,0),(21,95,'karolina','gawałkiewicz','karowud@poczta.onet.pl',1,NULL,NULL,'2012-09-22 13:43:11',0,NULL,0,NULL,0),(22,96,'Katarzyna ','Bylica','bylicakolbego@amorki.pl',1,NULL,NULL,'2012-09-22 14:43:27',0,NULL,0,NULL,0),(23,97,'ilona','chodor','iki67@wp.pl',1,NULL,NULL,'2012-09-22 14:48:28',0,NULL,0,NULL,0),(24,98,'Honorata','Skoracka ','gerber73@vp.pl',1,NULL,NULL,'2012-09-22 15:00:46',0,NULL,0,NULL,0),(25,99,'Marcin','Grela','dlugi1979@o2.pl',1,NULL,NULL,'2012-09-22 16:10:21',0,NULL,0,NULL,0),(26,100,'Kamila','Kaminska','angel2003@op.pl',1,NULL,NULL,'2012-09-22 16:25:16',0,NULL,0,NULL,0),(27,101,'Joanna','Szmigiel','Sylwia26@buziaczek.pl',1,NULL,NULL,'2012-09-22 17:29:43',0,NULL,0,NULL,0),(28,102,'Kamila','Bińczyk','kami.b@op.pl',1,NULL,NULL,'2012-09-22 18:04:45',0,NULL,0,NULL,0),(29,103,'Joanna','Goryczko','joannagoryczko@op.pl',1,NULL,NULL,'2012-09-22 18:35:01',0,NULL,0,NULL,0),(30,104,'Joanna','Goryczko','joannagoryczko@op.pl',1,NULL,NULL,'2012-09-22 18:45:39',0,NULL,0,NULL,0),(31,105,'Artur','Heluszka','arturhelluszka@poczta.onet.pl',1,NULL,NULL,'2012-09-22 19:10:41',0,NULL,0,NULL,0),(32,106,'Iwona','Radomska','iwonarad2@interia.pl',1,NULL,NULL,'2012-09-22 20:36:00',0,NULL,0,NULL,0),(33,107,'Anna','Pyrek','piotr@jugo.k-ow.net',1,NULL,NULL,'2012-09-23 07:19:53',0,NULL,0,NULL,0),(34,108,'Anna','Pyrek','anna.pyrek@onet.com.pl',1,NULL,NULL,'2012-09-23 07:33:42',0,NULL,0,NULL,0),(35,109,'Piotr','Pyrek','piotr@jugo.k-ow.net',1,NULL,NULL,'2012-09-23 08:02:16',0,NULL,0,NULL,0),(36,110,'Ela','Osora','ela158@interia.eu',1,NULL,NULL,'2012-09-23 10:05:42',0,NULL,0,NULL,0),(37,111,'Piotr','Hiszpański','pajak00@wp.pl',1,NULL,NULL,'2012-09-23 10:19:20',0,NULL,0,NULL,0),(38,112,'Piotr','Hiszpański','pajak00@wp.pl',1,NULL,NULL,'2012-09-23 10:25:26',0,NULL,0,NULL,0),(39,113,'Jacek','szczerbowski','jacek1977_77@02.pl',1,NULL,NULL,'2012-09-23 10:36:46',0,NULL,0,NULL,0),(40,114,'magdalena','piwowarczyk','magpiw@op.pl',1,NULL,NULL,'2012-09-23 12:07:39',0,NULL,0,NULL,0),(41,115,'Kasia','Krzemińska','ola98r@wp.pl',1,NULL,NULL,'2012-09-23 12:31:59',0,NULL,0,NULL,0),(42,116,'Rafał','Hojkowski','rhojkowski@wp.pl',1,NULL,NULL,'2012-09-23 13:15:51',0,NULL,0,NULL,0),(43,117,'Joanna','Szmyd','j_szmyd@o2.pl',1,NULL,NULL,'2012-09-23 14:18:27',0,NULL,0,NULL,0),(44,118,'Monika','Mateusiak','wiksa1997@wp.pl',1,NULL,NULL,'2012-09-23 14:55:26',0,NULL,0,NULL,0),(45,119,'Magda','Szadkowska','190306@wp.pl',1,NULL,NULL,'2012-09-23 15:52:26',0,NULL,0,NULL,0),(46,120,'Andrzej','Bernach','mamaprzemka@o2.pl',1,NULL,NULL,'2012-09-23 16:23:39',0,NULL,0,NULL,0),(47,121,'Agnieszka','Kałwa','agnieszka1081@o2.pl',1,NULL,NULL,'2012-09-23 16:52:01',0,NULL,0,NULL,0),(48,122,'mariusz','bardecki','pbardecki@interia.pl',1,NULL,NULL,'2012-09-23 17:07:45',0,NULL,0,NULL,0),(49,123,'Sylwia','Romańczuk','swmm@op.pl',1,NULL,NULL,'2012-09-23 17:28:19',0,NULL,0,NULL,0),(50,124,'Edyta','Farbotko','ed25far@poczta.onet.pl',1,NULL,NULL,'2012-09-23 17:59:44',0,NULL,0,NULL,0),(51,125,'Adrian','Pawlowski','Piper1000@wp.pl',1,NULL,NULL,'2012-09-23 19:08:36',0,NULL,0,NULL,0),(52,126,'Cezary','Śledziewski','Csf@poczta.onet.pl',1,NULL,NULL,'2012-09-23 19:32:43',0,NULL,0,NULL,0),(53,127,'Milena','Mlicka-Kaczmarek','milena.mlicka@gmail.com',1,NULL,NULL,'2012-09-23 20:00:02',0,NULL,0,NULL,0),(54,128,'agnieszka','szczukowska','agaszczukowska@onet.eu',1,NULL,NULL,'2012-09-24 07:51:27',0,NULL,0,NULL,0),(55,129,'Janina','Nowak','monig5@wp.pl',1,NULL,NULL,'2012-09-24 08:59:02',0,NULL,0,NULL,0),(56,130,'Małgorzata','Szaska','margosiak@wp.pl',1,NULL,NULL,'2012-09-24 08:59:29',0,NULL,0,NULL,0),(57,131,'Robert','Ligęza','m.kucharska8@chello.pl',1,NULL,NULL,'2012-09-24 09:11:02',0,NULL,0,NULL,0),(58,132,'Barbara','Ilmak','aisabi@op.pl',1,NULL,NULL,'2012-09-24 10:44:35',0,NULL,0,NULL,0),(59,133,'Paweł','Pataj','gpataj@interia.pl',1,NULL,NULL,'2012-09-24 12:41:34',0,NULL,0,NULL,0),(60,134,'Tomek','Nowak','tomzyk@poczta.onet.pl',1,NULL,NULL,'2012-09-24 12:48:07',0,NULL,0,NULL,0),(61,135,'Dorota','Osiecka','dorotaosiecka@interia.pl',1,NULL,NULL,'2012-09-24 13:28:45',0,NULL,0,NULL,0),(62,136,'a','a','aannaa7@wp.pl',1,NULL,NULL,'2012-09-24 13:30:18',0,NULL,0,NULL,0),(63,137,'Grzegorz','Wełyczko','wiewe777@wp.pl',1,NULL,NULL,'2012-09-24 13:51:09',0,NULL,0,NULL,0),(64,138,'MARIA','KIJ','bartek19926@o2.pl',1,NULL,NULL,'2012-09-24 14:21:26',0,NULL,0,NULL,0),(65,139,'Rafał','Pawłowski','aro9@o2.pl',1,NULL,NULL,'2012-09-24 14:48:34',0,NULL,0,NULL,0),(66,140,'Małgorzata','Walter-Pietrzyca','goya1979@interia.eu',1,NULL,NULL,'2012-09-24 15:05:17',0,NULL,0,NULL,0),(67,141,'dorota','królikowska','dora.k@poczta.onet.pl',1,NULL,NULL,'2012-09-24 15:31:56',0,NULL,0,NULL,0),(68,142,'beata','kulesza','bpkula2@wp.pl',1,NULL,NULL,'2012-09-24 15:55:25',0,NULL,0,NULL,0),(69,143,'DAWID','SZCZYPIŃSKI','dszczypinski@wp.pl',1,NULL,NULL,'2012-09-24 16:14:47',0,NULL,0,NULL,0),(70,144,'Ewa','Jasińska - Woźniak','jwewa@wp.pl',1,NULL,NULL,'2012-09-24 16:20:00',0,NULL,0,NULL,0),(71,145,'Artur','Soluch','slony2010@interia.pl',1,NULL,NULL,'2012-09-24 16:26:26',0,NULL,0,NULL,0),(72,146,'Bozena','Szymczak','szymczakbozena@wp.pl',1,NULL,NULL,'2012-09-24 16:32:29',0,NULL,0,NULL,0),(73,147,'Elżbieta','Świtulska','lizzie@wp.pl',1,NULL,NULL,'2012-09-24 16:48:22',0,NULL,0,NULL,0),(74,148,'Anna','Plewka','plewkaanna@gmail.com',1,NULL,NULL,'2012-09-24 17:08:14',0,NULL,0,NULL,0),(75,149,'EDYTA','LASKOWSKA','edytalaskowska4@wp.pl',1,NULL,NULL,'2012-09-24 17:48:11',0,NULL,0,NULL,0),(76,150,'jarek','okoń','martynacwiek@wp.pl',1,NULL,NULL,'2012-09-24 20:07:33',0,NULL,0,NULL,0),(78,152,'Grzegorz','Bieńkowski','gbienkowsk@gmail.com',1,NULL,NULL,'2012-09-25 07:15:55',0,NULL,0,NULL,0),(79,153,'Monika','Bogusławska','monia.sko@interia.pl',1,NULL,NULL,'2012-09-25 08:44:14',0,NULL,0,NULL,0),(81,155,'Małgorzata','Walter-Pietrzyca','olo130@op.pl',1,NULL,NULL,'2012-09-25 09:23:47',0,NULL,0,NULL,0),(82,156,'Dorota','Duma','dorota13337@wp.pl',1,NULL,NULL,'2012-09-25 10:26:33',0,NULL,0,NULL,0),(83,157,'Ewa','Janczak','ewaboniak1969@o2.pl',1,NULL,NULL,'2012-09-25 13:41:16',0,NULL,0,NULL,0),(84,158,'paweł','kozacki','pawel300@op.pl',1,NULL,NULL,'2012-09-25 14:25:37',0,NULL,0,NULL,0),(85,159,'Małgorzata','Barańska','gosia.baranska@op.pl',1,NULL,NULL,'2012-09-25 14:31:09',0,NULL,0,NULL,0),(86,160,'Monika','Skotnicka-Stróżyk','skotnickastrozyk@onet.pl',1,NULL,NULL,'2012-09-25 15:12:56',0,NULL,0,NULL,0),(87,161,'Magdalena','Wiśniewska','ipap1@wp.pl',1,NULL,NULL,'2012-09-25 15:20:57',0,NULL,0,NULL,0),(88,162,'bartosz','gierczak','bg980@wp.pl',1,NULL,NULL,'2012-09-25 15:29:25',0,NULL,0,NULL,0),(89,163,'Karolina','Sobczak','sobczak_karolina@wp.pl',1,NULL,NULL,'2012-09-25 15:29:46',0,NULL,0,NULL,0),(90,164,'Dorota','Rdzanek ','dorota.zakrecona@wp.pl',1,NULL,NULL,'2012-09-25 16:38:30',0,NULL,0,NULL,0),(91,165,'Sylwia','Piekarczyk','mateusz.nicola@interia.pl',1,NULL,NULL,'2012-09-25 17:14:16',0,NULL,0,NULL,0),(92,166,'Piotr','Krzemiński','pkrzeminski@autograf.pl',1,NULL,NULL,'2012-09-25 17:38:59',0,NULL,0,NULL,0),(93,168,'Piotrek','Cieloch','piotr.cieloch@wp.pl',1,NULL,NULL,'2012-09-25 18:02:30',0,NULL,0,NULL,0),(94,169,'Robert','Osiński','karina.osinska1@op.pl',1,NULL,NULL,'2012-09-25 19:22:55',0,NULL,0,NULL,0),(95,170,'Aneta','Trawińska','atrawa@02.pl',1,NULL,NULL,'2012-09-25 19:26:47',0,NULL,0,NULL,0),(96,171,'alina','oparczyk','alina.op@o2.pl',1,NULL,NULL,'2012-09-26 07:22:26',0,NULL,0,NULL,0),(97,173,'artur','cieslik','arturcieslik69@wp.pl',1,NULL,NULL,'2012-09-26 07:57:05',0,NULL,0,NULL,0),(99,175,'Weronika','Gogolewska','biuro@fakpol.pl',1,NULL,NULL,'2012-09-26 08:20:15',0,NULL,0,NULL,0),(100,176,'Magdalena','Fanderowska','mfanderowska@wp.pl',1,NULL,NULL,'2012-09-26 09:10:31',0,NULL,0,NULL,0),(101,177,'Agnieszka','Dutkowska','ufo.z.marsa@wp.pl',1,NULL,NULL,'2012-09-26 09:15:49',0,NULL,0,NULL,0),(102,178,'Justyna','Daniluk','e.justyna83@gazeta.pl',1,NULL,NULL,'2012-09-26 10:38:59',0,NULL,0,NULL,0),(103,179,'Katarzyna','Głowacz','wrobelkasia@op.pl',1,NULL,NULL,'2012-09-26 11:48:05',0,NULL,0,NULL,0),(104,180,'Marcin','Szeliga','marcinszeliga@wp.pl',1,NULL,NULL,'2012-09-26 12:21:45',0,NULL,0,NULL,0),(105,181,'sylwia','Bal','s.ball@wp.pl',1,NULL,NULL,'2012-09-26 13:09:32',0,NULL,0,NULL,0),(106,182,'Małgożata','Pająk','rapa2003@wp.pl',1,NULL,NULL,'2012-09-26 13:31:47',0,NULL,0,NULL,0);
/*!40000 ALTER TABLE `_caretakers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_contest_prizes`
--

DROP TABLE IF EXISTS `_contest_prizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_contest_prizes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `contest_id` int(10) unsigned NOT NULL,
  `sponsor_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `image_url` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(10) DEFAULT '0',
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(10) DEFAULT '0',
  `marked_as_deleted_at` datetime DEFAULT NULL,
  `marked_as_deleted_by` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Nagrody w konkursach';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_contest_prizes`
--
-- WHERE:  1 limit 100

LOCK TABLES `_contest_prizes` WRITE;
/*!40000 ALTER TABLE `_contest_prizes` DISABLE KEYS */;
INSERT INTO `_contest_prizes` (`id`, `contest_id`, `sponsor_id`, `name`, `description`, `image_url`, `is_active`, `created_at`, `created_by`, `updated_at`, `updated_by`, `marked_as_deleted_at`, `marked_as_deleted_by`) VALUES (1,1,NULL,'Pudełko klocków LEGO','Opis','/uploads/contest-prizes/1-1.jpg',1,'2018-06-13 16:13:30',0,NULL,0,NULL,0),(2,1,NULL,'Pudełko klocków LEGO','Opis','/uploads/contest-prizes/1-2.jpg',1,'2018-06-13 16:13:30',0,NULL,0,NULL,0),(3,2,NULL,'Pudełko klocków LEGO','Opis','/uploads/contest-prizes/2-3.jpg',1,'2018-06-13 16:13:30',0,NULL,0,NULL,0),(4,2,NULL,'Pudełko klocków LEGO','Opis','/uploads/contest-prizes/2-4.jpg',1,'2018-06-13 16:13:30',0,NULL,0,NULL,0),(5,9,1,'3 książki \"Lamy United\"','','https://cdn.takemefrom.com/contests/1530037502-ksiazkowe-szalenstwo.jpg',1,'2018-06-26 18:25:02',2,'2018-06-26 20:54:31',2,NULL,0),(6,9,1,'Przyklejam, dekoruję, projektuję','3 książki \"Przyklejam, dekoruję, projektuję. Star Wars. Statki i ich piloci\"','https://cdn.takemefrom.com/contests/1530037540-ksiazkowe-szalenstwo.jpg',1,'2018-06-26 18:25:40',2,'2018-06-26 20:54:42',2,NULL,0),(7,9,1,'Sikać albo nie sikać...','3 książki \"Szkolne szaleństwa. Sikać albo nie sikać - oto jest pytanie!\"','https://cdn.takemefrom.com/contests/1530037606-ksiazkowe-szalenstwo.jpg',1,'2018-06-26 18:26:46',2,'2018-06-26 20:54:47',2,NULL,0),(8,11,3,'Zestaw z Xbox','Xbox One S, gra Just Dance i szampan Piccolo','https://cdn.takemefrom.com/contests/1530040667-piccolo.jpg',1,'2018-06-26 19:17:47',2,NULL,0,NULL,0),(9,11,3,'Drugi zestaw Xbox!','Xbox One S, gra Just Dance i szampan Piccolo','https://cdn.takemefrom.com/contests/1530040729-piccolo.jpg',1,'2018-06-26 19:18:49',2,NULL,0,NULL,0),(10,10,2,'Polska - Niemcy','Gra \"Polska Gola!\" (Polska - Niemcy)','https://cdn.takemefrom.com/contests/1530040812-polska-gola-.jpg',1,'2018-06-26 19:20:13',2,NULL,0,NULL,0),(11,10,2,'Polska - Hiszpania','Gra \"Polska Gola!\" (Polska - Hiszpania)','https://cdn.takemefrom.com/contests/1530040844-polska-gola-.jpg',1,'2018-06-26 19:20:44',2,NULL,0,NULL,0),(12,7,4,'5 Poduszek','','https://cdn.takemefrom.com/contests/1530041219-polska-izba-mleka.jpg',1,'2018-06-26 19:26:59',2,NULL,0,NULL,0),(13,8,5,'5 zestawów z serii!','5 zestawów z produktami z serii Śmiejżelki','https://cdn.takemefrom.com/contests/1530041875-smiejzelki.jpg',1,'2018-06-26 19:37:55',2,NULL,0,NULL,0);
/*!40000 ALTER TABLE `_contest_prizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_contests`
--

DROP TABLE IF EXISTS `_contests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_contests` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `game_id` int(10) unsigned NOT NULL,
  `contest_type_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `description` text COLLATE utf8_polish_ci,
  `statute` text COLLATE utf8_polish_ci,
  `box_url` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `header_url` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `begins_at` datetime DEFAULT NULL,
  `ends_at` datetime DEFAULT NULL,
  `display_ad` tinyint(1) DEFAULT '0',
  `is_active` tinyint(1) DEFAULT '0',
  `is_ended` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(10) DEFAULT '0',
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(10) DEFAULT '0',
  `marked_as_deleted_at` datetime DEFAULT NULL,
  `marked_as_deleted_by` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Konkursy';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_contests`
--
-- WHERE:  1 limit 100

LOCK TABLES `_contests` WRITE;
/*!40000 ALTER TABLE `_contests` DISABLE KEYS */;
INSERT INTO `_contests` (`id`, `game_id`, `contest_type_id`, `name`, `slug`, `description`, `statute`, `box_url`, `header_url`, `begins_at`, `ends_at`, `display_ad`, `is_active`, `is_ended`, `created_at`, `created_by`, `updated_at`, `updated_by`, `marked_as_deleted_at`, `marked_as_deleted_by`) VALUES (1,1,2,'Jaskiniowiec','jaskiniowiec','Niesamowity konkurs!',NULL,'/uploads/contests/box-1.jpg','/uploads/contests/contest-banner.jpg','2018-01-31 00:00:00','2018-02-28 00:00:00',0,0,0,'2018-06-13 16:13:30',0,NULL,0,'2018-06-14 16:02:20',2),(2,2,1,'Ptaszki i pieski','ptaszki-i-pieski','Nowe nagrody!',NULL,'/uploads/contests/box-2.jpg','/uploads/contests/contest-banner.jpg','2018-01-31 00:00:00','2018-02-28 00:00:00',0,0,0,'2018-06-13 16:13:30',0,NULL,0,'2018-06-14 16:02:23',2),(3,1,2,'Mistrz Pola','mistrz-pola','Zgarnij klocki LEGO!',NULL,'/uploads/contests/box-3.jpg','/uploads/contests/contest-banner.jpg','2018-01-31 00:00:00','2018-02-28 00:00:00',0,0,0,'2018-06-13 16:13:30',0,NULL,0,'2018-06-14 16:02:25',2),(4,2,1,'Faraon Kontratakuje','faraon-kontratakuje','Szał piórników!',NULL,'/uploads/contests/box-4.jpg','/uploads/contests/contest-banner.jpg','2018-01-31 00:00:00','2018-02-28 00:00:00',0,0,0,'2018-06-13 16:13:30',0,NULL,0,'2018-06-14 16:02:27',2),(5,1,2,'Kulki Fulki','kluki-fulki','Ekstra zabawa!',NULL,'/uploads/contests/box-2.jpg','/uploads/contests/contest-banner.jpg','2018-01-31 00:00:00','2018-02-28 00:00:00',0,0,0,'2018-06-13 16:13:30',0,NULL,0,'2018-06-14 16:02:30',2),(6,2,1,'Paramemnon','paramemnon','Moc!',NULL,'/uploads/contests/box-1.jpg','/uploads/contests/contest-banner.jpg','2018-01-31 00:00:00','2018-02-28 00:00:00',0,0,0,'2018-06-13 16:13:30',0,NULL,0,'2018-06-14 16:02:32',2),(7,2,1,'Polska Izba Mleka','polska-izba-mleka','','<p></p><div class=\"field-item even\"><p align=\"center\"><strong>Regulamin Konkursu</strong></p><p></p><p align=\"center\"><strong>Konkursiaki</strong>&nbsp;<strong>„Polska Izba mleka​”</strong></p><p><strong>I. Organizator</strong></p><p></p><ol><li>Organizatorem konkursu jest Media Service Zawada Sp. z o.o. Warszawa 04-028, al. Stanów Zjednoczonych 51 wpisaną do rejestru przedsiębiorców prowadzonego przez Sąd Rejonowy dla m. st. Warszawy,&nbsp;XIII Wydział Gospodarczy KRS, pod numerem 000027679, NIP 113-00-94-47.</li><p></p><p></p><li>Konkurs ma charakter przyrzeczenia publicznego w rozumieniu art. 921 ustawy z dnia 23 kwietnia 1964 kodeks cywilny a Organizator jest wydającym nagrody w rozumieniu tego artykułu.</li><p></p><p></p><li><strong><u>UWAGA</u></strong><u>:</u>&nbsp;<u>Każdy uczestnik konkursu (rodzic lub opiekun osoby małoletniej) &nbsp;przed podjęciem decyzji o udziale powinien zapoznać się z niniejszym regulaminem,&nbsp;</u><u>Regulamin Serwisu zamieszczonym na stronie&nbsp;</u><a href=\"http://www.konkursiaki.pl/\">www.konkursiaki.pl</a>&nbsp;<u>&nbsp;oraz Polityką prywatności, o jakiej mowa w art.&nbsp; V na stronie&nbsp;</u><a href=\"http://www.konkursiaki.pl/\">www.konkursiaki.pl</a><u>.</u><u>.</u></li><p></p></ol><p>&nbsp;</p><p><strong>II. Termin</strong></p><p>Konkurs trwać będzie od 08.06.2018 r. od godz. 09:00 do 07.07.2018&nbsp;r. do godz. 23.59.</p><p>&nbsp;</p><p><strong>III. Warunki uczestnictwa</strong></p><p>1.&nbsp;&nbsp; Uczestnikiem konkursu może być Użytkownik zarejestrowany zgodnie z Regulaminem Serwisu Konkursiaki.pl, który zagra w grę&nbsp;<strong>\"Polska Izba mleka​\"</strong>&nbsp;polegającą na przemierzaniu labiryntu i usuwaniu kulek. Gracz ma nieograniczoną liczbę prób. Szczegółowe zasady gry przedstawione są na stronie. Ranking uczestników będzie opublikowany na stronie&nbsp;<a href=\"http://www.konkursiaki.pl/\" target=\"_blank\" title=\":http://www.konkursiaki.pl/<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />blocked::http://www.konkursiaki.pl/blocked::http://www.konkursiaki.pl/:http://www.konkursiaki.pl/\">www.konkursiaki.pl</a>.</p><p>2.&nbsp;&nbsp;&nbsp; Do tabeli wyników zapisywany jest najlepszy wynik.</p><p>3.&nbsp;&nbsp;&nbsp; Ranking uczestników będzie opublikowany na stronie&nbsp;<a href=\"http://www.konkursiaki.pl/\" target=\"_blank\" title=\":http://www.konkursiaki.pl/<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />blocked::http://www.konkursiaki.pl/blocked::http://www.konkursiaki.pl/:http://www.konkursiaki.pl/\">www.konkursiaki.pl</a>.</p><p><strong>IV. Nagrody:</strong></p><p>1.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Nagrody:</p><p>a.&nbsp; &nbsp; <span>5 poduszek ufundowanych przez Izbę Mleka o wartości jednostkowej 50 zł.</span></p><p>2.&nbsp;&nbsp;&nbsp; Nagrody zostaną przyznane zgodnie z kolejnością przestawioną w art. III.</p><p>3.&nbsp;&nbsp;&nbsp; Laureat wyłoniony w Konkursie zostanie o tym powiadomiony mailowo przez Organizatora za pośrednictwem adresu email, który został podany przez Uczestnika podczas rejestracji.</p><p>4.&nbsp;&nbsp;&nbsp; Laureat ma 14 dni na potwierdzenia danych niezbędnych do wysyłki nagrody.</p><p>5.&nbsp;&nbsp;&nbsp; Nagrody zostaną przyznane zgodnie z kolejnością przestawioną powyżej.</p><p>6.&nbsp;&nbsp;&nbsp; Laureat wyłoniony w Konkursie zostanie o tym powiadomiony mailowo przez Organizatora za pośrednictwem adresu email, który został podany przez Uczestnika podczas rejestracji.</p><p><strong>V. Prawa uczestników, kontakt z Organizatorem, ochrona danych osobowych uczestników konkursu</strong></p><p>Pozostałe warunki uczestniczenia w konkursie, w zakresie jaki ma do niego zastosowanie, w tym kontakt z organizatorem, warunki techniczne dla korzystania z serwisu, zgłaszanie reklamacji, &nbsp;określa Regulamin Serwisu WWW. Konkursiaki zamieszczony na stronie&nbsp;<a href=\"http://www.konkursiaki.pl/\">www.konkursiaki.pl</a>&nbsp;. Postanowienia dotyczące pozyskiwania i przetwarzania danych osobowych uczestnika konkursu, w tym osób małoletnich, uprawnienia z tym związane zawarte zostały w Polityce Prywatności zamieszczonej na stronie&nbsp;<a href=\"http://www.konkursiaki.pl/\">www.konkursiaki.pl</a>.</p></div>','http://cdn.takemefrom.com/contests/polska-izba-mleka-box.png','http://cdn.takemefrom.com/contests/1529065230-polska-izba-mleka-header.JPG','2018-06-08 00:00:00','2018-07-07 00:00:00',1,1,0,'2018-06-14 16:04:50',0,NULL,0,NULL,0),(8,2,1,'Śmiejżelki','smiejzelki','','<div class=\"field-item even\"><p align=\"center\"><strong>Regulamin Konkursu</strong></p>\r\n<p align=\"center\"><strong>Konkursiaki</strong>&nbsp;<strong>„Śmiejżelki​”</strong></p>\r\n<p><strong>I. Organizator</strong></p>\r\n<ol><li>Organizatorem konkursu jest Media Service Zawada Sp. z o.o. Warszawa 04-028, al. Stanów Zjednoczonych 51 wpisaną do rejestru przedsiębiorców prowadzonego przez Sąd Rejonowy dla m. st. Warszawy,&nbsp;XIII Wydział Gospodarczy KRS, pod numerem 000027679, NIP 113-00-94-47.</li>\r\n<li>Konkurs ma charakter przyrzeczenia publicznego w rozumieniu art. 921 ustawy z dnia 23 kwietnia 1964 kodeks cywilny a Organizator jest wydającym nagrody w rozumieniu tego artykułu.</li>\r\n<li><strong><u>UWAGA</u></strong><u>:</u> <u>Każdy uczestnik konkursu (rodzic lub opiekun osoby małoletniej) &nbsp;przed podjęciem decyzji o udziale powinien zapoznać się z niniejszym regulaminem, </u><u>Regulamin Serwisu zamieszczonym na stronie&nbsp;</u><a href=\"http://www.konkursiaki.pl/\">www.konkursiaki.pl</a>&nbsp;<u> oraz Polityką prywatności, o jakiej mowa w art.&nbsp; V na stronie </u><a href=\"http://www.konkursiaki.pl/\">www.konkursiaki.pl</a><u>.</u><u>.</u></li>\r\n</ol><p>&nbsp;</p>\r\n<p><strong>II. Termin</strong></p>\r\n<p>Konkurs trwać będzie od 30.05.2018 r. od godz. 09:00 do 30.06.2018&nbsp;r. do godz. 23.59.</p>\r\n<p>&nbsp;</p>\r\n<p><strong>III. Warunki uczestnictwa</strong></p>\r\n<p>1.&nbsp;&nbsp; Uczestnikiem konkursu może być Użytkownik zarejestrowany zgodnie z Regulaminem Serwisu Konkursiaki.pl, który zagra w grę&nbsp;<strong>\"Śmiejżelki​\"</strong>&nbsp;polegającą na przemierzaniu labiryntu i usuwaniu kulek. Gracz ma nieograniczoną liczbę prób. Szczegółowe zasady gry przedstawione są na stronie. Ranking uczestników będzie opublikowany na stronie&nbsp;<a href=\"http://www.konkursiaki.pl/\" target=\"_blank\" title=\":http://www.konkursiaki.pl/<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />\r\nblocked::http://www.konkursiaki.pl/blocked::http://www.konkursiaki.pl/:http://www.konkursiaki.pl/\">www.konkursiaki.pl</a>.</p>\r\n<p>2.&nbsp;&nbsp;&nbsp; Do tabeli wyników zapisywany jest najlepszy wynik.</p>\r\n<p>3.&nbsp;&nbsp;&nbsp; Ranking uczestników będzie opublikowany na stronie&nbsp;<a href=\"http://www.konkursiaki.pl/\" target=\"_blank\" title=\":http://www.konkursiaki.pl/<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />\r\nblocked::http://www.konkursiaki.pl/blocked::http://www.konkursiaki.pl/:http://www.konkursiaki.pl/\">www.konkursiaki.pl</a>.</p>\r\n<p><strong>IV. Nagrody:</strong></p>\r\n<p>1.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Nagrody:</p>\r\n<p>a. 5 zestawów z produktami z serii Śmiejżelki (w każdym 3 paczki żelek i lunch box) o wartości jednostkowej 30 zł brutto ufundowane przez Storck Sp. z o.o.</p>\r\n<p>2.&nbsp;&nbsp;&nbsp; Nagrody zostaną przyznane zgodnie z kolejnością przestawioną w art. III.</p>\r\n<p>3.&nbsp;&nbsp;&nbsp; Laureat wyłoniony w Konkursie zostanie o tym powiadomiony mailowo przez Organizatora za pośrednictwem adresu email, który został podany przez Uczestnika podczas rejestracji.</p>\r\n<p>4.&nbsp;&nbsp;&nbsp; Laureat ma 14 dni na potwierdzenia danych niezbędnych do wysyłki nagrody.</p>\r\n<p>5.&nbsp;&nbsp;&nbsp; Nagrody zostaną przyznane zgodnie z kolejnością przestawioną powyżej.</p>\r\n<p>6.&nbsp;&nbsp;&nbsp; Laureat wyłoniony w Konkursie zostanie o tym powiadomiony mailowo przez Organizatora za pośrednictwem adresu email, który został podany przez Uczestnika podczas rejestracji.</p>\r\n<p><strong>V. Prawa uczestników, kontakt z Organizatorem, ochrona danych osobowych uczestników konkursu</strong></p>\r\n<p>Pozostałe warunki uczestniczenia w konkursie, w zakresie jaki ma do niego zastosowanie, w tym kontakt z organizatorem, warunki techniczne dla korzystania z serwisu, zgłaszanie reklamacji, &nbsp;określa Regulamin Serwisu WWW. Konkursiaki zamieszczony na stronie&nbsp;<a href=\"http://www.konkursiaki.pl/\">www.konkursiaki.pl</a>&nbsp;. Postanowienia dotyczące pozyskiwania i przetwarzania danych osobowych uczestnika konkursu, w tym osób małoletnich, uprawnienia z tym związane zawarte zostały w Polityce Prywatności zamieszczonej na stronie&nbsp;<a href=\"http://www.konkursiaki.pl/\">www.konkursiaki.pl</a>.</p>\r\n</div>','http://cdn.takemefrom.com/contests/smiejzelki-box.jpg','http://cdn.takemefrom.com/contests/1529065386-smiejzelki-header.jpg','2018-05-30 10:00:00','2018-06-30 10:00:00',1,1,0,'2018-06-14 16:07:38',0,NULL,0,NULL,0),(9,2,1,'Książkowe szaleństwo','ksiazkowe-szalenstwo','','<p>﻿</p>','http://cdn.takemefrom.com/contests/ksiazkowe-szalenstwo-box.png','http://cdn.takemefrom.com/contests/1529065465-ksiazkowe-szalenstwo-header.jpg','2018-05-29 00:00:00','2018-06-29 00:00:00',1,1,0,'2018-06-14 16:08:56',0,NULL,0,NULL,0),(10,2,1,'Polska Gola!','polska-gola','Już teraz! Przemierzaj labirynt i usuwaj kulki... jednak bądź czujny i uważaj na niebezpieczeństwa. Powodzenia!!!','<p></p><div class=\"field-item even\"><p align=\"center\"><strong>Regulamin Konkursu</strong></p><p></p><p align=\"center\"><strong>Konkursiaki</strong>&nbsp;<strong>„Polska gola​”</strong></p><p><strong>I. Organizator</strong></p><p></p><ol><li>Organizatorem konkursu jest Media Service Zawada Sp. z o.o. Warszawa 04-028, al. Stanów Zjednoczonych 51 wpisaną do rejestru przedsiębiorców prowadzonego przez Sąd Rejonowy dla m. st. Warszawy,&nbsp;XIII Wydział Gospodarczy KRS, pod numerem 000027679, NIP 113-00-94-47.</li><p></p><p></p><li>Konkurs ma charakter przyrzeczenia publicznego w rozumieniu art. 921 ustawy z dnia 23 kwietnia 1964 kodeks cywilny a Organizator jest wydającym nagrody w rozumieniu tego artykułu.</li><p></p><p></p><li><strong><u>UWAGA</u></strong><u>:</u>&nbsp;<u>Każdy uczestnik konkursu (rodzic lub opiekun osoby małoletniej) &nbsp;przed podjęciem decyzji o udziale powinien zapoznać się z niniejszym regulaminem,&nbsp;</u><u>Regulamin Serwisu zamieszczonym na stronie&nbsp;</u><a href=\"http://www.konkursiaki.pl/\">www.konkursiaki.pl</a>&nbsp;<u>&nbsp;oraz Polityką prywatności, o jakiej mowa w art.&nbsp; V na stronie&nbsp;</u><a href=\"http://www.konkursiaki.pl/\">www.konkursiaki.pl</a><u>.</u><u>.</u></li><p></p></ol><p>&nbsp;</p><p><strong>II. Termin</strong></p><p>Konkurs trwać będzie od 19.06.2018 r. od godz. 09:00 do 19.07.2018&nbsp;r. do godz. 23.59.</p><p>&nbsp;</p><p><strong>III. Warunki uczestnictwa</strong></p><p>1.&nbsp;&nbsp; Uczestnikiem konkursu może być Użytkownik zarejestrowany zgodnie z Regulaminem Serwisu Konkursiaki.pl, który zagra w grę&nbsp;<strong>\"Polska gola​\"</strong>&nbsp;polegającą na przemierzaniu labiryntu i usuwaniu kulek. Gracz ma nieograniczoną liczbę prób. Szczegółowe zasady gry przedstawione są na stronie. Ranking uczestników będzie opublikowany na stronie&nbsp;<a href=\"http://www.konkursiaki.pl/\" target=\"_blank\" title=\":http://www.konkursiaki.pl/<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />blocked::http://www.konkursiaki.pl/blocked::http://www.konkursiaki.pl/:http://www.konkursiaki.pl/\">www.konkursiaki.pl</a>.</p><p>2.&nbsp;&nbsp;&nbsp; Do tabeli wyników zapisywany jest najlepszy wynik.</p><p>3.&nbsp;&nbsp;&nbsp; Ranking uczestników będzie opublikowany na stronie&nbsp;<a href=\"http://www.konkursiaki.pl/\" target=\"_blank\" title=\":http://www.konkursiaki.pl/<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />blocked::http://www.konkursiaki.pl/blocked::http://www.konkursiaki.pl/:http://www.konkursiaki.pl/\">www.konkursiaki.pl</a>.</p><p><strong>IV. Nagrody:</strong></p><p>1.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Nagrody:</p><p>a.&nbsp; &nbsp;&nbsp;<span>Gra \"Polska Gola!\" (Polska - Niemcy) - 5 szt. o wartości jednostkwej 44,90 Zł/szt</span></p><p><span>b.&nbsp; &nbsp;&nbsp;Gra \"Polska Gola!\" (Polska - Hiszpania) - 5 szt.&nbsp;o wartości jednostkwej 44,90 Zł/szt</span></p><p>2.&nbsp;&nbsp;&nbsp; Nagrody zostaną przyznane zgodnie z kolejnością przestawioną w art. III.</p><p>3.&nbsp;&nbsp;&nbsp; Laureat wyłoniony w Konkursie zostanie o tym powiadomiony mailowo przez Organizatora za pośrednictwem adresu email, który został podany przez Uczestnika podczas rejestracji.</p><p>4.&nbsp;&nbsp;&nbsp; Laureat ma 14 dni na potwierdzenia danych niezbędnych do wysyłki nagrody.</p><p>5.&nbsp;&nbsp;&nbsp; Nagrody zostaną przyznane zgodnie z kolejnością przestawioną powyżej.</p><p>6.&nbsp;&nbsp;&nbsp; Laureat wyłoniony w Konkursie zostanie o tym powiadomiony mailowo przez Organizatora za pośrednictwem adresu email, który został podany przez Uczestnika podczas rejestracji.</p><p><strong>V. Prawa uczestników, kontakt z Organizatorem, ochrona danych osobowych uczestników konkursu</strong></p><p>Pozostałe warunki uczestniczenia w konkursie, w zakresie jaki ma do niego zastosowanie, w tym kontakt z organizatorem, warunki techniczne dla korzystania z serwisu, zgłaszanie reklamacji, &nbsp;określa Regulamin Serwisu WWW. Konkursiaki zamieszczony na stronie&nbsp;<a href=\"http://www.konkursiaki.pl/\">www.konkursiaki.pl</a>&nbsp;. Postanowienia dotyczące pozyskiwania i przetwarzania danych osobowych uczestnika konkursu, w tym osób małoletnich, uprawnienia z tym związane zawarte zostały w Polityce Prywatności zamieszczonej na stronie&nbsp;<a href=\"http://www.konkursiaki.pl/\">www.konkursiaki.pl</a>.</p></div>','https://cdn.takemefrom.com/contests/1530039994-polska-gola--box.png','https://cdn.takemefrom.com/contests/1530039994-polska-gola--header.jpg','2018-06-19 21:03:35','2018-07-19 21:03:35',1,1,0,'2018-06-26 19:06:34',0,NULL,0,NULL,0),(11,2,1,'Piccolo','piccolo','Już teraz! Przemierzaj labirynt i usuwaj kulki... jednak bądź czujny i uważaj na niebezpieczeństwa. Powodzenia!!!','\r\n    <a id=\"main-content\"></a>\r\n                <div class=\"block block-system block-main block-system-main odd block-without-title\" id=\"block-system-main\"><div class=\"block-inner clearfix\"><div class=\"content clearfix\"><article class=\"node node-contest-legal userpoints-nodeaccess-node-access node-published node-not-promoted node-not-sticky author-asik odd clearfix\" id=\"node-contest-legal-2987\"><div class=\"node-content clearfix\"><div class=\"field field-name-body field-type-text-with-summary field-label-hidden\"><div class=\"field-items\"><div class=\"field-item even\"><p align=\"center\"><strong>Regulamin Konkursu</strong></p>\r\n<p align=\"center\"><strong>Konkursiaki</strong>&nbsp;<strong>„Piccolo​”</strong></p>\r\n<p><strong>I. Organizator</strong></p>\r\n<ol><li>Organizatorem konkursu jest Media Service Zawada Sp. z o.o. Warszawa 04-028, al. Stanów Zjednoczonych 51 wpisaną do rejestru przedsiębiorców prowadzonego przez Sąd Rejonowy dla m. st. Warszawy,&nbsp;XIII Wydział Gospodarczy KRS, pod numerem 000027679, NIP 113-00-94-47.</li>\r\n<li>Konkurs ma charakter przyrzeczenia publicznego w rozumieniu art. 921 ustawy z dnia 23 kwietnia 1964 kodeks cywilny a Organizator jest wydającym nagrody w rozumieniu tego artykułu.</li>\r\n<li><strong><u>UWAGA</u></strong><u>:</u>&nbsp;<u>Każdy uczestnik konkursu (rodzic lub opiekun osoby małoletniej) &nbsp;przed podjęciem decyzji o udziale powinien zapoznać się z niniejszym regulaminem,&nbsp;</u><u>Regulamin Serwisu zamieszczonym na stronie&nbsp;</u><a href=\"http://www.konkursiaki.pl/\">www.konkursiaki.pl</a>&nbsp;<u>&nbsp;oraz Polityką prywatności, o jakiej mowa w art.&nbsp; V na stronie&nbsp;</u><a href=\"http://www.konkursiaki.pl/\">www.konkursiaki.pl</a><u>.</u><u>.</u></li>\r\n</ol><p>&nbsp;</p>\r\n<p><strong>II. Termin</strong></p>\r\n<p>Konkurs trwać będzie od 19.06.2018 r. od godz. 09:00 do 19.07.2018&nbsp;r. do godz. 23.59.</p>\r\n<p>&nbsp;</p>\r\n<p><strong>III. Warunki uczestnictwa</strong></p>\r\n<p>1.&nbsp;&nbsp; Uczestnikiem konkursu może być Użytkownik zarejestrowany zgodnie z Regulaminem Serwisu Konkursiaki.pl, który zagra w grę&nbsp;<strong>\"</strong><strong>Piccolo</strong><strong>​\"</strong>&nbsp;polegającą na przemierzaniu labiryntu i usuwaniu kulek. Gracz ma nieograniczoną liczbę prób. Szczegółowe zasady gry przedstawione są na stronie. Ranking uczestników będzie opublikowany na stronie&nbsp;<a href=\"http://www.konkursiaki.pl/\" target=\"_blank\" title=\":http://www.konkursiaki.pl/<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />\r\nblocked::http://www.konkursiaki.pl/blocked::http://www.konkursiaki.pl/:http://www.konkursiaki.pl/\">www.konkursiaki.pl</a>.</p>\r\n<p>2.&nbsp;&nbsp;&nbsp; Do tabeli wyników zapisywany jest najlepszy wynik.</p>\r\n<p>3.&nbsp;&nbsp;&nbsp; Ranking uczestników będzie opublikowany na stronie&nbsp;<a href=\"http://www.konkursiaki.pl/\" target=\"_blank\" title=\":http://www.konkursiaki.pl/<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />\r\nblocked::http://www.konkursiaki.pl/blocked::http://www.konkursiaki.pl/:http://www.konkursiaki.pl/\">www.konkursiaki.pl</a>.</p>\r\n<p><strong>IV. Nagrody:</strong></p>\r\n<p>1.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Nagrody:</p>\r\n<p>a.&nbsp; &nbsp; 1 zestaw: Xbox One, gra Just Dance i szampan Piccolo o wartości jednostkowej 1400 zł brutto ufundowany przez kuźnia PR Sp.z o.o.</p>\r\n<p>2.&nbsp;&nbsp;&nbsp; Nagrody zostaną przyznane zgodnie z kolejnością przestawioną w art. III.</p>\r\n<p>3.&nbsp;&nbsp;&nbsp; Laureat wyłoniony w Konkursie zostanie o tym powiadomiony mailowo przez Organizatora za pośrednictwem adresu email, który został podany przez Uczestnika podczas rejestracji.</p>\r\n<p>4.&nbsp;&nbsp;&nbsp; Laureat ma 14 dni na potwierdzenia danych niezbędnych do wysyłki nagrody.</p>\r\n<p>5.&nbsp;&nbsp;&nbsp; Nagrody zostaną przyznane zgodnie z kolejnością przestawioną powyżej.</p>\r\n<p>6.&nbsp;&nbsp;&nbsp; Laureat wyłoniony w Konkursie zostanie o tym powiadomiony mailowo przez Organizatora za pośrednictwem adresu email, który został podany przez Uczestnika podczas rejestracji.</p>\r\n<p><strong>V. Prawa uczestników, kontakt z Organizatorem, ochrona danych osobowych uczestników konkursu</strong></p>\r\n<p>Pozostałe warunki uczestniczenia w konkursie, w zakresie jaki ma do niego zastosowanie, w tym kontakt z organizatorem, warunki techniczne dla korzystania z serwisu, zgłaszanie reklamacji, &nbsp;określa Regulamin Serwisu WWW. Konkursiaki zamieszczony na stronie&nbsp;<a href=\"http://www.konkursiaki.pl/\">www.konkursiaki.pl</a>&nbsp;. Postanowienia dotyczące pozyskiwania i przetwarzania danych osobowych uczestnika konkursu, w tym osób małoletnich, uprawnienia z tym związane zawarte zostały w Polityce Prywatności zamieszczonej na stronie&nbsp;<a href=\"http://www.konkursiaki.pl/\">www.konkursiaki.pl</a>.</p></div></div></div></div></article></div></div></div>','https://cdn.takemefrom.com/contests/1530040558-piccolo-box.png','https://cdn.takemefrom.com/contests/1530040558-piccolo-header.jpg','2018-06-19 21:07:39','2018-07-19 21:07:39',1,1,0,'2018-06-26 19:15:58',0,NULL,0,NULL,0);
/*!40000 ALTER TABLE `_contests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_hero_files`
--

DROP TABLE IF EXISTS `_hero_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_hero_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hero_id` int(10) unsigned NOT NULL,
  `hero_file_type_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `description` text COLLATE utf8_polish_ci,
  `file_url` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(10) DEFAULT '0',
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(10) DEFAULT '0',
  `marked_as_deleted_at` datetime DEFAULT NULL,
  `marked_as_deleted_by` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Pliki bohaterÃ³w';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_hero_files`
--
-- WHERE:  1 limit 100

LOCK TABLES `_hero_files` WRITE;
/*!40000 ALTER TABLE `_hero_files` DISABLE KEYS */;
INSERT INTO `_hero_files` (`id`, `hero_id`, `hero_file_type_id`, `name`, `description`, `file_url`, `is_active`, `created_at`, `created_by`, `updated_at`, `updated_by`, `marked_as_deleted_at`, `marked_as_deleted_by`) VALUES (1,1,1,'Tunele z lokatorami','','http://cdn.takemefrom.com/heroes/20-21_SDM_05_OK.jpg',1,'2018-06-13 16:13:30',0,'2018-06-14 16:28:29',2,NULL,0),(2,1,1,'Niedzielna wycieczka','','http://cdn.takemefrom.com/heroes/30-31_SDM_05_OK.jpg',1,'2018-06-13 16:13:30',0,'2018-06-14 16:28:39',2,NULL,0),(3,1,1,'Afera w archiwum','','http://cdn.takemefrom.com/heroes/36_SDM_05_OK.jpg',1,'2018-06-13 16:13:30',0,'2018-06-14 16:28:47',2,NULL,0),(4,1,2,'Tapeta 1 1280x1024','','http://cdn.takemefrom.com/heroes/SD_1280x1024_0.jpg',1,'2018-06-13 16:13:30',0,'2018-06-14 16:29:04',2,NULL,0),(5,1,2,'Tapeta 2 1280x1024','','http://cdn.takemefrom.com/heroes/SD_1280x1024_3_0.jpg',1,'2018-06-13 16:13:30',0,'2018-06-14 16:29:13',2,NULL,0),(6,1,2,'Tapeta 3 1280x1024','','http://cdn.takemefrom.com/heroes/SD_1280x1024_10urodziny_0.jpg',1,'2018-06-13 16:13:30',0,'2018-06-14 16:29:22',2,NULL,0),(7,10,1,'Komiks \"Kolejka górska\"','','http://cdn.takemefrom.com/heroes/add1.jpg',1,'2018-06-14 19:37:27',2,NULL,0,NULL,0),(8,10,1,'Zabawa: Poprzez dżunglę','','http://cdn.takemefrom.com/heroes/add2.jpg',1,'2018-06-14 19:38:00',2,'2018-06-14 19:39:49',2,NULL,0),(9,10,1,'Plakat','','http://cdn.takemefrom.com/heroes/1529079282-1-lego-jurassic-world.jpg',1,'2018-06-14 19:38:38',2,'2018-06-15 16:14:43',2,NULL,0),(10,10,2,'Tapeta LEGO Jurassic','','http://cdn.takemefrom.com/heroes/1280x1024_LEGOJurassic_0.jpg',1,'2018-06-14 19:39:11',2,'2018-06-14 19:39:39',2,NULL,0),(11,3,1,'\"Atak wężowych klaunów\" - 1','','http://cdn.takemefrom.com/heroes/1529006694-add1.jpg',1,'2018-06-14 19:59:27',2,'2018-06-14 20:07:19',2,NULL,0),(12,3,1,'\"Atak wężowych klaunów\" - 2','','http://cdn.takemefrom.com/heroes/1529006703-add2.jpg',1,'2018-06-14 20:00:05',2,'2018-06-14 20:07:24',2,NULL,0),(13,3,1,'Plakat','','http://cdn.takemefrom.com/heroes/add3.jpg',0,'2018-06-14 20:00:32',2,'2018-06-14 20:01:18',2,'2018-06-14 20:01:28',2),(14,3,1,'Plakat','','http://cdn.takemefrom.com/heroes/1529006720-add3.jpg',1,'2018-06-14 20:05:20',2,NULL,0,NULL,0),(15,3,2,'Tapeta 1024x768','','http://cdn.takemefrom.com/heroes/1529006771-1024x768_LEGOBatman.jpg',1,'2018-06-14 20:06:11',2,'2018-06-14 20:06:17',2,NULL,0),(16,3,1,'Tapeta 1280x1024','','http://cdn.takemefrom.com/heroes/1529006806-1280x1024_LEGOBatman.jpg',1,'2018-06-14 20:06:46',2,NULL,0,NULL,0),(17,9,1,'Komiks \"Axl na lodzie\"','','http://cdn.takemefrom.com/heroes/1529008503-add1.jpg',1,'2018-06-14 20:35:03',2,NULL,0,NULL,0),(18,9,1,'Zabawa: Bitwa robotów - 1','','http://cdn.takemefrom.com/heroes/1529008538-add2.jpg',1,'2018-06-14 20:35:38',2,'2018-06-14 20:36:05',2,NULL,0),(19,9,1,'Zabawa: Bitwa robotów - 2','','http://cdn.takemefrom.com/heroes/1529008558-add3.jpg',1,'2018-06-14 20:35:58',2,NULL,0,NULL,0),(20,9,1,'Kiepski występ błazna - 1','','http://cdn.takemefrom.com/heroes/1529008595-add4.jpg',1,'2018-06-14 20:36:36',2,'2018-06-14 20:37:30',2,NULL,0),(21,9,1,'Kiepski występ błazna - 2','','http://cdn.takemefrom.com/heroes/1529008612-add5.jpg',1,'2018-06-14 20:36:53',2,'2018-06-14 20:37:36',2,NULL,0),(22,9,2,'Tapeta 800x600','','http://cdn.takemefrom.com/heroes/1529008684-800x600_NEXO_0.jpg',1,'2018-06-14 20:38:04',2,'2018-06-14 20:38:56',2,NULL,0),(23,9,2,'Tapeta 1024x768','','http://cdn.takemefrom.com/heroes/1529008702-1024x768_NEXO_0.jpg',1,'2018-06-14 20:38:22',2,'2018-06-14 20:39:27',2,NULL,0),(24,9,2,'Tapeta 1280x1024','','http://cdn.takemefrom.com/heroes/1529008722-1280x1024_NEXO_0.jpg',1,'2018-06-14 20:38:43',2,'2018-06-14 20:39:33',2,NULL,0),(25,6,1,'\"Puchar zdobywcy pucharów\"','','http://cdn.takemefrom.com/heroes/1529066309-add1.jpg',1,'2018-06-15 12:38:29',2,NULL,0,NULL,0),(26,6,1,'\"Puchar zdobywcy pucharów\"','','http://cdn.takemefrom.com/heroes/1529066588-add2.jpg',1,'2018-06-15 12:43:09',2,NULL,0,NULL,0),(27,6,1,'Plakat','','http://cdn.takemefrom.com/heroes/1529066612-LCM_03_plakat.jpg',1,'2018-06-15 12:43:32',2,'2018-06-15 12:43:46',2,NULL,0),(28,6,2,'Tapeta 800x600','','http://cdn.takemefrom.com/heroes/1529066659-800x600_LEGOCity_0.jpg',1,'2018-06-15 12:44:19',2,'2018-06-15 12:45:40',2,NULL,0),(29,6,2,'Tapeta 1024x768','','http://cdn.takemefrom.com/heroes/1529066683-1024x768_LEGOCity_0.jpg',1,'2018-06-15 12:44:43',2,NULL,0,NULL,0),(30,6,2,'Tapeta 1280x1024','','http://cdn.takemefrom.com/heroes/1529066707-1280x1024_LEGOCity_0.jpg',1,'2018-06-15 12:45:07',2,NULL,0,NULL,0),(31,2,1,'Rozróba w dżungli - 1','','http://cdn.takemefrom.com/heroes/1529067790-add1.jpg',1,'2018-06-15 13:03:11',2,'2018-06-15 13:04:01',2,NULL,0),(32,2,1,'Rozróba w dżungli - 2','','http://cdn.takemefrom.com/heroes/1529067814-add2.jpg',1,'2018-06-15 13:03:35',2,NULL,0,NULL,0),(33,2,1,'Rozróba w dżungli - 3','','http://cdn.takemefrom.com/heroes/1529067834-add3.jpg',1,'2018-06-15 13:03:54',2,NULL,0,NULL,0),(34,2,1,'Misja: Idealny kamuflaż','','http://cdn.takemefrom.com/heroes/1529067870-add4.jpg',1,'2018-06-15 13:04:30',2,NULL,0,NULL,0),(35,2,1,'Nya','','http://cdn.takemefrom.com/heroes/1529067899-add5.jpg',1,'2018-06-15 13:04:59',2,NULL,0,NULL,0),(36,2,1,'Lloyd kręci motocyklistami','','http://cdn.takemefrom.com/heroes/1529067940-add6.jpg',1,'2018-06-15 13:05:40',2,NULL,0,NULL,0),(37,2,2,'Tapeta 800x600','','http://cdn.takemefrom.com/heroes/1529067967-800x600_Lego_Ninja_0.jpg',1,'2018-06-15 13:06:07',2,NULL,0,NULL,0),(38,2,2,'Tapeta 1024x768','','http://cdn.takemefrom.com/heroes/1529067986-1024x768_Lego_Ninja_0.jpg',1,'2018-06-15 13:06:27',2,'2018-06-15 13:07:08',2,NULL,0),(39,2,2,'Tapeta 1280x1024','','http://cdn.takemefrom.com/heroes/1529068007-1280x1024_Lego_Ninja_0.jpg',1,'2018-06-15 13:06:47',2,NULL,0,NULL,0),(40,2,2,'Tapeta 800x600','','http://cdn.takemefrom.com/heroes/1529069760-800x600_LNM_3_1.jpg',1,'2018-06-15 13:36:00',2,NULL,0,NULL,0),(41,2,2,'Tapeta 1024x768','','http://cdn.takemefrom.com/heroes/1529069783-1024x768_LNM_3_1.jpg',1,'2018-06-15 13:36:23',2,'2018-06-15 13:37:47',2,NULL,0),(42,2,2,'Tapeta 1280x1024','','http://cdn.takemefrom.com/heroes/1529069803-1280x1024_LNM_3_1.jpg',1,'2018-06-15 13:36:44',2,NULL,0,NULL,0),(43,11,1,'komiks 01','','https://cdn.takemefrom.com/heroes/1530092844-1-Safiras.jpg',1,'2018-06-27 09:46:11',2,'2018-06-27 11:47:25',2,NULL,0),(44,11,1,'komiks 02','','https://cdn.takemefrom.com/heroes/1530094253-1-Safiras.jpg',1,'2018-06-27 10:10:53',1778,'2018-06-27 12:11:10',1778,NULL,0),(45,11,1,'kolorowanki','','https://cdn.takemefrom.com/heroes/1530094293-1-Safiras.jpg',1,'2018-06-27 10:11:33',1778,NULL,0,NULL,0),(46,11,1,'zagadki','','https://cdn.takemefrom.com/heroes/1530094315-1-Safiras.jpg',1,'2018-06-27 10:11:55',1778,NULL,0,NULL,0),(47,12,1,'komiks01','','https://cdn.takemefrom.com/heroes/1530094740-1-Ben10.jpg',1,'2018-06-27 10:19:00',1778,NULL,0,NULL,0),(48,12,1,'komiks02','','https://cdn.takemefrom.com/heroes/1530094757-1-Ben10.jpg',1,'2018-06-27 10:19:17',1778,NULL,0,NULL,0),(49,12,1,'laboratorium','','https://cdn.takemefrom.com/heroes/1530094775-1-Ben10.jpg',1,'2018-06-27 10:19:35',1778,NULL,0,NULL,0),(50,12,1,'plakat','','https://cdn.takemefrom.com/heroes/1530094794-1-Ben10.jpg',1,'2018-06-27 10:19:54',1778,NULL,0,NULL,0),(51,12,2,'Tapeta 800x600','','https://cdn.takemefrom.com/heroes/1530094839-2-Ben10.jpg',1,'2018-06-27 10:20:39',1778,NULL,0,NULL,0),(52,12,2,'Tapeta 1024x768','','https://cdn.takemefrom.com/heroes/1530094866-2-Ben10.jpg',1,'2018-06-27 10:21:06',1778,NULL,0,NULL,0),(53,12,2,'Tapeta 1280x1024','','https://cdn.takemefrom.com/heroes/1530094890-2-Ben10.jpg',1,'2018-06-27 10:21:30',1778,NULL,0,NULL,0),(54,13,1,'komiks01','','https://cdn.takemefrom.com/heroes/1530098397-1-CN.jpg',1,'2018-06-27 11:19:57',1778,NULL,0,NULL,0),(55,13,1,'komiks 02','','https://cdn.takemefrom.com/heroes/1530098415-1-CN.jpg',1,'2018-06-27 11:20:15',1778,NULL,0,NULL,0),(56,13,1,'Pora na','','https://cdn.takemefrom.com/heroes/1530098437-1-CN.jpg',1,'2018-06-27 11:20:37',1778,NULL,0,NULL,0),(57,1,1,'Sztuka w stylu Ocho','','https://cdn.takemefrom.com/heroes/1530098461-1-scooby-doo.jpg',1,'2018-06-27 11:21:01',1778,NULL,0,NULL,0),(58,13,1,'studio wyobrazni','','https://cdn.takemefrom.com/heroes/1530098487-1-CN.jpg',1,'2018-06-27 11:21:27',1778,NULL,0,NULL,0),(59,13,2,'Tapeta 800x600','','https://cdn.takemefrom.com/heroes/1530098532-2-CN.jpg',1,'2018-06-27 11:22:12',1778,NULL,0,NULL,0),(60,13,2,'Tapeta 1024x768','','https://cdn.takemefrom.com/heroes/1530098554-2-CN.jpg',1,'2018-06-27 11:22:34',1778,NULL,0,NULL,0),(61,13,2,'Tapeta 1280x1024','','https://cdn.takemefrom.com/heroes/1530098572-2-CN.jpg',1,'2018-06-27 11:22:52',1778,NULL,0,NULL,0),(62,13,2,'Tapeta 2 800x600','','https://cdn.takemefrom.com/heroes/1530098595-2-CN.jpg',1,'2018-06-27 11:23:15',1778,NULL,0,NULL,0),(63,13,2,'Tapeta 2 1024x768','','https://cdn.takemefrom.com/heroes/1530098617-2-CN.jpg',1,'2018-06-27 11:23:37',1778,NULL,0,NULL,0),(64,13,2,'Tapeta 2 1280x1024','','https://cdn.takemefrom.com/heroes/1530098643-2-CN.jpg',1,'2018-06-27 11:24:03',1778,NULL,0,NULL,0),(65,14,1,'komiks 01','','https://cdn.takemefrom.com/heroes/1530099372-1-WinxClub.jpg',1,'2018-06-27 11:36:12',1778,'2018-06-27 13:39:46',1778,NULL,0),(66,14,1,'komiks 02','','https://cdn.takemefrom.com/heroes/1530099390-1-WinxClub.jpg',1,'2018-06-27 11:36:30',1778,NULL,0,NULL,0),(67,14,1,'lekcja stylu','','https://cdn.takemefrom.com/heroes/1530099413-1-WinxClub.jpg',1,'2018-06-27 11:36:53',1778,NULL,0,NULL,0),(68,14,1,'Maagiczny test','','https://cdn.takemefrom.com/heroes/1530099430-1-WinxClub.jpg',1,'2018-06-27 11:37:10',1778,NULL,0,NULL,0),(69,14,1,'Hawaje','','https://cdn.takemefrom.com/heroes/1530099452-1-WinxClub.jpg',1,'2018-06-27 11:37:32',1778,NULL,0,NULL,0),(70,14,2,'Tapeta 800x600','','https://cdn.takemefrom.com/heroes/1530099471-2-WinxClub.jpg',1,'2018-06-27 11:37:51',1778,NULL,0,NULL,0),(71,14,2,'Tapeta 1024x768','','https://cdn.takemefrom.com/heroes/1530099491-2-WinxClub.jpg',1,'2018-06-27 11:38:11',1778,NULL,0,NULL,0),(72,14,2,'Tapeta 1280x1024','','https://cdn.takemefrom.com/heroes/1530099508-2-WinxClub.jpg',1,'2018-06-27 11:38:28',1778,NULL,0,NULL,0),(73,15,1,'komiks 01','','https://cdn.takemefrom.com/heroes/1530100341-1-LegoFriends.jpg',1,'2018-06-27 11:52:21',1778,NULL,0,NULL,0),(74,15,1,'konkurs','','https://cdn.takemefrom.com/heroes/1530100381-1-LegoFriends.jpg',1,'2018-06-27 11:53:01',1778,NULL,0,NULL,0),(75,15,1,'zestawy','','https://cdn.takemefrom.com/heroes/1530100399-1-LegoFriends.jpg',1,'2018-06-27 11:53:19',1778,NULL,0,NULL,0),(76,15,2,'Tapeta 800x600','','https://cdn.takemefrom.com/heroes/1530100451-2-LegoFriends.jpg',1,'2018-06-27 11:54:12',1778,NULL,0,NULL,0),(77,15,2,'Tapeta 1024x768','','https://cdn.takemefrom.com/heroes/1530102429-2-LegoFriends.jpg',1,'2018-06-27 12:27:10',1778,NULL,0,NULL,0),(78,15,2,'Tapeta 1280x1024','','https://cdn.takemefrom.com/heroes/1530102449-2-LegoFriends.jpg',1,'2018-06-27 12:27:29',1778,NULL,0,NULL,0),(79,15,2,'Tapeta 2 800x600','','https://cdn.takemefrom.com/heroes/1530102471-2-LegoFriends.jpg',1,'2018-06-27 12:27:51',1778,NULL,0,NULL,0),(80,15,2,'Tapeta 2 1024x768','','https://cdn.takemefrom.com/heroes/1530102494-2-LegoFriends.jpg',1,'2018-06-27 12:28:14',1778,NULL,0,NULL,0),(81,15,2,'Tapeta 2 1280x1024','','https://cdn.takemefrom.com/heroes/1530102514-2-LegoFriends.jpg',1,'2018-06-27 12:28:34',1778,NULL,0,NULL,0),(82,16,2,'Tapeta 800x600','','https://cdn.takemefrom.com/heroes/1530103455-2-Mia-i-Ja.jpg',1,'2018-06-27 12:44:15',1778,NULL,0,NULL,0),(83,16,2,'Tapeta 1024x768','','https://cdn.takemefrom.com/heroes/1530103470-2-Mia-i-Ja.jpg',1,'2018-06-27 12:44:30',1778,NULL,0,NULL,0),(84,16,2,'Tapeta 1280x1024','','https://cdn.takemefrom.com/heroes/1530103492-2-Mia-i-Ja.jpg',1,'2018-06-27 12:44:52',1778,NULL,0,NULL,0),(85,16,2,'Tapeta 2 800x600','','https://cdn.takemefrom.com/heroes/1530103512-2-Mia-i-Ja.jpg',1,'2018-06-27 12:45:12',1778,NULL,0,NULL,0),(86,16,2,'Tapeta 2 1024x768','','https://cdn.takemefrom.com/heroes/1530103540-2-Mia-i-Ja.jpg',1,'2018-06-27 12:45:40',1778,NULL,0,NULL,0),(87,16,2,'Tapeta 2 1280x1024','','https://cdn.takemefrom.com/heroes/1530103557-2-Mia-i-Ja.jpg',1,'2018-06-27 12:45:58',1778,NULL,0,NULL,0),(88,16,1,'komiks 01','','https://cdn.takemefrom.com/heroes/1530103597-1-Mia-i-Ja.jpg',1,'2018-06-27 12:46:37',1778,NULL,0,NULL,0),(89,16,1,'komiks 02','','https://cdn.takemefrom.com/heroes/1530103612-1-Mia-i-Ja.jpg',1,'2018-06-27 12:46:52',1778,NULL,0,NULL,0),(90,16,1,'konkurs','','https://cdn.takemefrom.com/heroes/1530103642-1-Mia-i-Ja.jpg',1,'2018-06-27 12:47:23',1778,NULL,0,NULL,0),(91,16,1,'spis','','https://cdn.takemefrom.com/heroes/1530103667-1-Mia-i-Ja.jpg',1,'2018-06-27 12:47:47',1778,NULL,0,NULL,0),(92,17,2,'Rysunek','','https://cdn.takemefrom.com/heroes/1530178555-2-MS.jpg',1,'2018-06-28 09:35:55',1778,NULL,0,NULL,0);
/*!40000 ALTER TABLE `_hero_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_heroes`
--

DROP TABLE IF EXISTS `_heroes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_heroes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `description` text COLLATE utf8_polish_ci,
  `avatar_url` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `header_url` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `cover_url` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `video_url` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `video_cover_url` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `gadget_url` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `footer_url` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `license_description` text COLLATE utf8_polish_ci,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(10) DEFAULT '0',
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(10) DEFAULT '0',
  `marked_as_deleted_at` datetime DEFAULT NULL,
  `marked_as_deleted_by` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Bohaterowie';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_heroes`
--
-- WHERE:  1 limit 100

LOCK TABLES `_heroes` WRITE;
/*!40000 ALTER TABLE `_heroes` DISABLE KEYS */;
INSERT INTO `_heroes` (`id`, `name`, `slug`, `description`, `avatar_url`, `header_url`, `cover_url`, `video_url`, `video_cover_url`, `gadget_url`, `footer_url`, `license_description`, `is_active`, `created_at`, `created_by`, `updated_at`, `updated_by`, `marked_as_deleted_at`, `marked_as_deleted_by`) VALUES (1,'Scooby Doo','scooby-doo','Tajemnicza Spółka musi zmierzyć się z dinozaurami, które zakłócają spokój mieszkańcom Dreszczykowa. Ale przecież nie tylko Velma wie, że te prehistoryczne gady wyginęły dawno temu… Ktoś się, zatem pod nie podszywa! W jakim celu? To już musisz wyjaśnić wspólnie z detektywami!','//cdn.takemefrom.com/heroes/scooby-doo-avatar.jpg','http://cdn.takemefrom.com/heroes/scooby-doo-header.jpg','http://cdn.takemefrom.com/heroes/1529008289-scooby-doo-cover.jpg','http://cdn.takemefrom.com/heroes/scooby-doo-video.mp4','http://cdn.takemefrom.com/heroes/scooby-doo-video-cover.png','http://cdn.takemefrom.com/heroes/1529070023-scooby-doo-gadget.png','','',1,'2018-01-31 00:00:00',0,'2018-06-15 13:40:23',2,NULL,0),(2,'Magazyn Lego® Ninjago®','lego-ninjago','\r\nKiedyś chciał podbić cały świat, później przeszedł na stronę dobra i poświęcił życie dla Ninjago City. Ale dzięki trzem Maskom Oni może zostać wskrzeszony pod najgorszą postacią. Zgadza się, zapowiada się powrót Garmadona. Co na to ninja? Z najnowszym numerem magazynu niezwykła figurka: Nya z włócznią!','http://cdn.takemefrom.com/heroes/lego-ninjago-avatar.jpg','http://cdn.takemefrom.com/heroes/1529067505-lego-ninjago-header.jpg','http://cdn.takemefrom.com/heroes/1529067506-lego-ninjago-cover.jpg','http://cdn.takemefrom.com/heroes/1529067506-lego-ninjago-video.mp4','http://cdn.takemefrom.com/heroes/1529067506-lego-ninjago-video-cover.png','http://cdn.takemefrom.com/heroes/1529067505-lego-ninjago-gadget.png','http://cdn.takemefrom.com/heroes/1529067506-lego-ninjago-footer.jpg','LEGO, the LEGO logo, the Brick and Knob configurations, the Minifigure and NINJAGO are trademarks of the LEGO Group. © 2018 The LEGO Group. Produced by Media Service Zawada sp. z o.o. under license from the LEGO Group.',1,'2018-01-31 00:00:00',0,'2018-06-26 21:53:18',2,NULL,0),(3,'LEGO Batman','lego-batman','Witaj w świecie przygód Mrocznego Rycerza! W najnowszym numerze Batman będzie musiał stawić czoła swojemu największemu lękowi: Wężowym Klaunom. Zajmie się tym, jak na gwiazdę przystało, a przygodę zakończy dzikim beatboxowym bitem. Z nowym numerem figurka zakręconej Harley Quinn na wrotkach!','http://cdn.takemefrom.com/heroes/lego-batman-avatar.jpg','http://cdn.takemefrom.com/heroes/lego-batman-header.jpg','http://cdn.takemefrom.com/heroes/1529009328-lego-batman-cover.jpg','http://cdn.takemefrom.com/heroes/lego-batman-video.mp4','http://cdn.takemefrom.com/heroes/lego-batman-video-cover.png','http://cdn.takemefrom.com/heroes/1529079704-lego-batman-gadget.png','http://cdn.takemefrom.com/heroes/lego-batman-footer.jpg','Copyright © 2018 DC Comics, WBEI & The LEGO Group. THE LEGO® BATMAN MOVIE © & ™ DC Comics, Warner Bros. Entertainment Inc., & The LEGO Group. LEGO, the LEGO logo, the Minifigure and the Brick and Knob configurations are trademarks and/or copyrights of the LEGO Group. \r\n©2018 The LEGO Group. BATMAN and all related characters and elements © & ™ DC Comics. All rights reserved. WB SHIELD: ™ & © WBEI. (s17)',1,'2018-01-31 00:00:00',0,'2018-06-15 16:21:45',2,NULL,0),(4,'Dragons','dragons','Opis Dragons','http://cdn.takemefrom.com/heroes/dragons-avatar.jpg','/uploads/heroes/heroes-4-header.jpg','','','','','','',0,'2018-01-31 00:00:00',0,'2018-06-14 12:24:31',2,'2018-06-27 11:33:37',2),(5,'LEGO Elves','lego-elves','Opis LEGO Elves','http://cdn.takemefrom.com/heroes/lego-elves-avatar.jpg','/uploads/heroes/heroes-5-header.jpg','','','','','','',0,'2018-01-31 00:00:00',0,'2018-06-14 12:24:06',2,'2018-06-27 11:33:26',2),(6,'LEGO City','lego-city','Połowa miasta przyszła zobaczyć Raya w akcji. To najlepszy rajdowiec w historii i dziś, jak zawsze, jest zdecydowanym faworytem. Ale nie może być inaczej, przecież jeszcze nigdy nie przegrał wyścigu! Z najnowszym numerem magazynu wyjątkowy zestaw: kierowca rajdowy Ray z wyścigówką.','http://cdn.takemefrom.com/heroes/lego-city-avatar.jpg','http://cdn.takemefrom.com/heroes/1529066230-lego-city-header.jpg','http://cdn.takemefrom.com/heroes/1529066230-lego-city-cover.jpg','http://cdn.takemefrom.com/heroes/1529066230-lego-city-video.mp4','http://cdn.takemefrom.com/heroes/1529066230-lego-city-video-cover.png','https://cdn.takemefrom.com/heroes/1530042932-lego-city-gadget.png','http://cdn.takemefrom.com/heroes/1529066230-lego-city-footer.jpg','LEGO, the LEGO logo, the Brick and Knob configurations and the Minifigure are trademarks of the LEGO Group. ©2018 The LEGO Group. All rights reserved. Produced by Media Service Zawada sp. z o.o. under license from the LEGO Group.',1,'2018-01-31 00:00:00',0,'2018-06-26 21:55:32',2,NULL,0),(8,'Magic Stars','magic-safiras','Opis Magic Stars','http://cdn.takemefrom.com/heroes/magic-safiras-avatar.jpg','/uploads/heroes/heroes-8-header.jpg','','','','','','',0,'2018-01-31 00:00:00',0,'2018-06-14 12:23:39',2,'2018-06-27 10:55:16',2),(9,'Magazyn Lego® Nexo Knights™','lego-nexo-knights','Największe serwery w Knighton znajdują się w stacji arktycznej wysoko w górach Zimnej Północy. Nudne życie codzienne pracujących tu giermkobotów zostało ostatnio urozmaicone specjalnymi programami rozrywkowymi ponieważ Jestro testuje roboty jako publiczność. Ale wkrótce przestanie być wesoło... Z najnowszym numerem magazynu oryginalny zestaw: Cyberbajter z wyrzutnią Potwornych.','http://cdn.takemefrom.com/heroes/lego-nexo-knights-avatar.jpg','http://cdn.takemefrom.com/heroes/1529007947-lego-nexo-knights-header.jpg','http://cdn.takemefrom.com/heroes/1529007947-lego-nexo-knights-cover.jpg','','','https://cdn.takemefrom.com/heroes/1530042776-lego-nexo-knights-gadget.png','http://cdn.takemefrom.com/heroes/1529007947-lego-nexo-knights-footer.jpg','LEGO, the LEGO logo, the Brick and Knob configurations, the Minifigure and NEXO KNIGHTS are trademarks of the LEGO Group. \r\n© 2018 The LEGO Group. Produced by Media Service Zawada sp. z o.o. under license from the LEGO Group.',1,'2018-01-31 00:00:00',0,'2018-06-26 21:53:35',2,NULL,0),(10,'LEGO Jurassic World','lego-jurassic-world','Poznaj świat, po którym włóczą się dinozaury! Udało nam się je wskrzesić, ale na tym nie koniec – poszliśmy o krok dalej i tworzymy zupełnie nowe gatunki dzięki mieszaniu materiału genetycznego. Cóż... czasami coś pójdzie źle... Zobacz sam i przeżyj niezwykłą przygodę. Z magazynem oryginalny zestaw: młody Raptor z gniazdem.','https://cdn.takemefrom.com/heroes/1530042712-lego-jurassic-world-avatar.png','http://cdn.takemefrom.com/heroes/lego-jurassic-world-header.jpg','http://cdn.takemefrom.com/heroes/1529008349-lego-jurassic-world-cover.jpg','http://cdn.takemefrom.com/heroes/lego-jurassic-world-video.mp4','http://cdn.takemefrom.com/heroes/lego-jurassic-world-video-cover.png','http://cdn.takemefrom.com/heroes/1529073277-lego-jurassic-world-gadget.png','http://cdn.takemefrom.com/heroes/lego-jurassic-world-footer.jpg','Jurassic Park, Jurassic World and all related marks and logos are trademarks & © Universal Studios and Amblin Entertainment, Inc. Licensed by Universal Studios. All Rights Reserved. LEGO, the LEGO logo, the Minifigure and the Brick and Knob configurations are trademarks of the LEGO Group. ©2018 The LEGO Group',1,'2018-06-14 19:19:36',2,'2018-06-26 21:51:52',2,NULL,0),(11,'Safiras','Safiras','Przed kilkoma miesiącami smoki Safiras odkryły tajemniczą bramę. Od tego czasu w Tarakonie wiele się zmieniło, za bramą bowiem czekała na nie niespodzianka... księżniczka Tara! Smoki cieszyły się z powrotu księżniczki - a najbardziej Draki! Nie dość, że otrzymał własny kamień żywiołu, to na dodatek przyjaźń, która początkowo łączyła go z księżniczką, przerodziła się w wielką miłość! W Tarakonie ma się odbyć huczne wesele Tary i Drakiego!\r\n\r\nWraz z magazynem otrzymasz wspaniały prezent: figurki zakochanych! ','https://cdn.takemefrom.com/heroes/1530094342-Safiras-avatar.png','https://cdn.takemefrom.com/heroes/1530093968-Safiras-header.jpg','https://cdn.takemefrom.com/heroes/1530093909-Safiras-cover.jpg','https://cdn.takemefrom.com/heroes/1530093682-Safiras-video.mp4','https://cdn.takemefrom.com/heroes/1530093682-Safiras-video-cover.png','https://cdn.takemefrom.com/heroes/1530093682-Safiras-gadget.png','','',1,'2018-06-27 09:45:17',2,'2018-06-27 12:12:22',1778,NULL,0),(12,'Ben10','Ben10','Czas na… magazyn Ben 10!\r\n\r\nSzara Materia zaprojektował urządzenie zdolne rozszyfrować tajny szyfr Doktora Animo.\r\n\r\nPomóż odnaleźć i odczytać całą korespondencję głównego wroga Bena.\r\n\r\nW magazynie znajdziesz trzy konkursy z supernagrodami, plakat i całkiem nowy komiks.\r\n\r\nZ najnowszym numerem – aż trzy prezenty – dwie niespodzianki  i POSKRAMIACZ OBCYCH, by żaden kosmita cię nie zaskoczył.\r\n\r\nNowy Ben 10 już w kioskach!','https://cdn.takemefrom.com/heroes/1530176733-Ben10-avatar.png','https://cdn.takemefrom.com/heroes/1530094711-Ben10-header.png','https://cdn.takemefrom.com/heroes/1530094711-Ben10-cover.jpg','https://cdn.takemefrom.com/heroes/1530094711-Ben10-video.mp4','https://cdn.takemefrom.com/heroes/1530094711-Ben10-video-cover.png','https://cdn.takemefrom.com/heroes/1530094711-Ben10-gadget.jpg','','',1,'2018-06-27 10:18:31',1778,'2018-06-28 11:05:33',62951,NULL,0),(13,'Cartoon Network','CN','Najlepszy przepis na wakacje? 2 komiksy, trochę łamigłówek, superkonkurs i ekstraprezenty, innymi słowy nowy magazyn Cartoon Network z ulubionymi bohaterami. To pyszna porcja zabawy dla spragnionych humoru. Do lektury zapraszają: Finn i Jake, Gumball i Darwin, Clarence, Steven i inni. W prezencie demonstracyjna wersja gry LEGO Jurassic World oraz świecący spinner.\r\n','https://cdn.takemefrom.com/heroes/1530176719-CN-avatar.jpg','https://cdn.takemefrom.com/heroes/1530098359-CN-header.png','https://cdn.takemefrom.com/heroes/1530098359-CN-cover.jpg','https://cdn.takemefrom.com/heroes/1530098359-CN-video.mp4','https://cdn.takemefrom.com/heroes/1530098359-CN-video-cover.png','https://cdn.takemefrom.com/heroes/1530098359-CN-gadget.png','','',1,'2018-06-27 11:19:19',1778,'2018-06-28 11:05:19',62951,NULL,0),(14,'Winx Club','WinxClub','Zapraszamy do lektury najnowszego numeru magazynu \"Winx Club\". W środku znajdziecie m.in. magiczny test: sprawdź czy jesteś wojowniczką czy domatorką, lekcję stylu w wiosennym klimacie oraz konkurs z supernagrodami.\r\nW prezencie biżuteria modnej czarodziejki + niespodzianka.','https://cdn.takemefrom.com/heroes/1530175910-WinxClub-avatar.jpg','https://cdn.takemefrom.com/heroes/1530099343-WinxClub-header.jpg','https://cdn.takemefrom.com/heroes/1530099344-WinxClub-cover.jpg','https://cdn.takemefrom.com/heroes/1530099344-WinxClub-video.mp4','https://cdn.takemefrom.com/heroes/1530099344-WinxClub-video-cover.png','https://cdn.takemefrom.com/heroes/1530099343-WinxClub-gadget.png','','',1,'2018-06-27 11:34:02',1778,'2018-06-28 10:51:50',62951,NULL,0),(15,'Lego Friends','LegoFriends','Władze miejskie planują zabudowę dziewiczych Zielonych Wzgórz. Przyjaciółki z Heartlake City nie mogą się na to zgodzić. Na początek akcji protestacyjnej dwie z nich planują rozbić biwak na tym cudownym terenie... problem w tym, że na Zielonych Wzgórzach grasuje duch! Tymczasem reszta dziewczyn pomaga w lecznicy dla zwierząt. Z najnowszym numerem magazynu oryginalny zestaw: gabinet weterynaryjny z uroczym kociakiem!','https://cdn.takemefrom.com/heroes/1530176746-LegoFriends-avatar.jpg','https://cdn.takemefrom.com/heroes/1530100285-LegoFriends-header.jpg','https://cdn.takemefrom.com/heroes/1530100285-LegoFriends-cover.jpg','https://cdn.takemefrom.com/heroes/1530100286-LegoFriends-video.mp4','https://cdn.takemefrom.com/heroes/1530100286-LegoFriends-video-cover.png','https://cdn.takemefrom.com/heroes/1530100285-LegoFriends-gadget.jpg','https://cdn.takemefrom.com/heroes/1530100285-LegoFriends-footer.jpg','LEGO, the LEGO logo, the FRIENDS logo and the Brick and Knob configurations are trademarks of the LEGO Group.\r\n© 2018 The LEGO Group. Produced by Media Service Zawada sp. z o.o. under license from the LEGO Group. ',1,'2018-06-27 11:51:26',1778,'2018-06-28 11:05:46',62951,NULL,0),(16,'Mia & Ja','Mia-i-Ja','W Centopii zaszło wiele zmian. Królem elfów został Mo i sporo nowych obowiązków spoczęło na jego barkach. Jak sobie radzi? Cóż, młody władca już w pierwszych dniach swoich rządów pokłócił się z królem faunów i wiele wskazuje na to, że elfy i fauny staną się wrogami. Czy do tej katastrofy dojdzie? Czy uda się w jakiś sposób złagodzić upór króla faunów?\r\n\r\nOdpowiedzi na te i inne pytania znajdziesz w kolejnym magazynie \"Mia i ja\", do którego dołączone są prezenty: książka albo kolejna porcja filmowych przygód Mii na płycie DVD. To jednak nie koniec! Każda fanka Mii wraz z magazynem otrzyma małą niespodziankę.\r\n','https://cdn.takemefrom.com/heroes/1530176777-Mia-i-Ja-avatar.jpg','https://cdn.takemefrom.com/heroes/1530103411-Mia-i-Ja-header.jpg','https://cdn.takemefrom.com/heroes/1530103411-Mia-i-Ja-cover.jpg','https://cdn.takemefrom.com/heroes/1530103411-Mia-i-Ja-video.mp4','https://cdn.takemefrom.com/heroes/1530103411-Mia-i-Ja-video-cover.png','https://cdn.takemefrom.com/heroes/1530103411-Mia-i-Ja-gadget.png','','',1,'2018-06-27 12:43:31',1778,'2018-06-28 11:06:17',62951,NULL,0),(17,'Magic Stars','MS','Przenieś się do filmowego świata Magic Stars!\r\n\r\nJulka, znana czytelnikom magazynu MAGIC POCKET, wprowadzi cię w świat filmu od kuchni. W drugim wydaniu Magic Stars pomożesz Julce stworzyć wyjątkową stylizację i sprawdzisz swoją pamięć.\r\n\r\nW prezencie otrzymasz płytę DVD z odcinkami popularnego serialu LEGO Friends.\r\n','https://cdn.takemefrom.com/heroes/1530179192-MS-avatar.jpg','https://cdn.takemefrom.com/heroes/1530178489-MS-header.jpg','https://cdn.takemefrom.com/heroes/1530178489-MS-cover.jpg','https://cdn.takemefrom.com/heroes/1530178489-MS-video.mp4','https://cdn.takemefrom.com/heroes/1530178489-MS-video-cover.png','https://cdn.takemefrom.com/heroes/1530178489-MS-gadget.png','https://cdn.takemefrom.com/heroes/1530178489-MS-footer.jpg','© 2018 The LEGO Group.\r\n© 2018 Media Service Zawada Sp. z o.o. All rights reserved ',1,'2018-06-28 09:34:49',1778,'2018-06-28 11:46:32',62951,NULL,0);
/*!40000 ALTER TABLE `_heroes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_invitations`
--

DROP TABLE IF EXISTS `_invitations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_invitations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `email_to` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `last_clicked_at` int(10) DEFAULT '0',
  `new_user_id` int(10) unsigned DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `invitation_hash` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Zaproszenia uÅ¼ytkownikÃ³w';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_invitations`
--
-- WHERE:  1 limit 100

LOCK TABLES `_invitations` WRITE;
/*!40000 ALTER TABLE `_invitations` DISABLE KEYS */;
INSERT INTO `_invitations` (`id`, `user_id`, `email_to`, `created_at`, `last_clicked_at`, `new_user_id`, `updated_at`, `invitation_hash`) VALUES (1,15,'jakub.godawa+5@gmail.com','2018-06-26 20:04:05',0,NULL,NULL,'db988b52a3444d93');
/*!40000 ALTER TABLE `_invitations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_notification_statuses`
--

DROP TABLE IF EXISTS `_notification_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_notification_statuses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `notification_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(10) DEFAULT '0',
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(10) DEFAULT '0',
  `marked_as_deleted_at` datetime DEFAULT NULL,
  `marked_as_deleted_by` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Status powiadomieÅ„ dla uÅ¼ytkownikÃ³w';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_notification_statuses`
--
-- WHERE:  1 limit 100

LOCK TABLES `_notification_statuses` WRITE;
/*!40000 ALTER TABLE `_notification_statuses` DISABLE KEYS */;
INSERT INTO `_notification_statuses` (`id`, `notification_id`, `user_id`, `confirmed_at`, `created_at`, `created_by`, `updated_at`, `updated_by`, `marked_as_deleted_at`, `marked_as_deleted_by`) VALUES (1,1,1,'2018-01-31 00:00:00','2018-06-13 16:13:30',0,NULL,0,NULL,0),(2,1,2,'2018-02-12 00:00:00','2018-06-13 16:13:30',0,NULL,0,NULL,0);
/*!40000 ALTER TABLE `_notification_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_notifications`
--

DROP TABLE IF EXISTS `_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_notifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `content` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(10) DEFAULT '0',
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(10) DEFAULT '0',
  `marked_as_deleted_at` datetime DEFAULT NULL,
  `marked_as_deleted_by` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Powiadomienia dla uÅ¼ytkownikÃ³w';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_notifications`
--
-- WHERE:  1 limit 100

LOCK TABLES `_notifications` WRITE;
/*!40000 ALTER TABLE `_notifications` DISABLE KEYS */;
INSERT INTO `_notifications` (`id`, `title`, `content`, `created_at`, `created_by`, `updated_at`, `updated_by`, `marked_as_deleted_at`, `marked_as_deleted_by`) VALUES (1,'notification_title_password_restart','notification_content_password_restart','2018-06-13 16:13:30',0,NULL,0,NULL,0),(2,'notification_title_new_game','notification_content_new_game','2018-06-13 16:13:30',0,NULL,0,NULL,0);
/*!40000 ALTER TABLE `_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_slides`
--

DROP TABLE IF EXISTS `_slides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_slides` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `image_url` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `link_url` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `begins_at` datetime DEFAULT NULL,
  `ends_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(10) DEFAULT '0',
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(10) DEFAULT '0',
  `marked_as_deleted_at` datetime DEFAULT NULL,
  `marked_as_deleted_by` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Slajdy';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_slides`
--
-- WHERE:  1 limit 100

LOCK TABLES `_slides` WRITE;
/*!40000 ALTER TABLE `_slides` DISABLE KEYS */;
INSERT INTO `_slides` (`id`, `name`, `image_url`, `link_url`, `is_active`, `begins_at`, `ends_at`, `created_at`, `created_by`, `updated_at`, `updated_by`, `marked_as_deleted_at`, `marked_as_deleted_by`) VALUES (1,'Slajd 1','/uploads/slides/slide-1.jpg','http://konkursiaki.pl',1,'2018-02-02 00:00:00','2018-09-20 00:00:00','2018-06-13 16:13:30',0,NULL,0,'2018-06-14 16:09:32',2),(2,'Slajd 2','/uploads/slides/slide-2.jpg','http://konkursiaki.pl',1,'2028-02-02 00:00:00','2028-09-20 00:00:00','2018-06-13 16:13:30',0,NULL,0,'2018-06-14 16:09:29',2),(3,'Slajd 3','/uploads/slides/slide-3.jpg','http://konkursiaki.pl',1,'2038-02-02 00:00:00','2038-09-20 00:00:00','2018-06-13 16:13:30',0,NULL,0,'2018-06-14 16:09:27',2),(4,'KochamMleko','http://cdn.takemefrom.com/slides/Konkursiaki_WKM_550x320.jpg','/konkurs/polska-izba-mleka',1,'1970-01-01 00:00:00','2222-01-01 00:00:00','2018-06-14 16:10:22',0,NULL,0,NULL,0),(5,'Śmiejżelki','http://cdn.takemefrom.com/slides/Konkursiaki_nimm2_550x320.jpg','/konkurs/smiejzelki',1,'1970-01-01 00:00:00','2222-01-01 00:00:00','2018-06-14 16:11:29',0,NULL,0,NULL,0),(6,'Książkowe szaleństwo','http://cdn.takemefrom.com/slides/Konkursiaki_CNG_550x320.jpg','/konkurs/ksiazkowe-szalenstwo',1,'1970-01-01 00:00:00','2222-01-01 00:00:00','2018-06-14 16:11:59',0,NULL,0,NULL,0),(7,'Polska Gola!','https://cdn.takemefrom.com/slides/1530034215-polska-gola.jpg','/konkursy/polska-gola',1,'2018-06-26 19:29:43','2018-07-10 19:29:43','2018-06-26 17:30:15',0,NULL,0,NULL,0),(8,'Piccolo','https://cdn.takemefrom.com/slides/1530034243-Konkursiaki_Piccolo_550x320.jpg','/konkursy/piccolo',1,'2018-06-26 19:30:19','2018-07-10 19:30:19','2018-06-26 17:30:43',0,NULL,0,NULL,0);
/*!40000 ALTER TABLE `_slides` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_sponsors`
--

DROP TABLE IF EXISTS `_sponsors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_sponsors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `description` text COLLATE utf8_polish_ci,
  `image_url` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(10) DEFAULT '0',
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(10) DEFAULT '0',
  `marked_as_deleted_at` datetime DEFAULT NULL,
  `marked_as_deleted_by` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Sponsorzy np. nagrÃ³d konkursÃ³w';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_sponsors`
--
-- WHERE:  1 limit 100

LOCK TABLES `_sponsors` WRITE;
/*!40000 ALTER TABLE `_sponsors` DISABLE KEYS */;
INSERT INTO `_sponsors` (`id`, `name`, `description`, `image_url`, `is_active`, `created_at`, `created_by`, `updated_at`, `updated_by`, `marked_as_deleted_at`, `marked_as_deleted_by`) VALUES (1,'Wydawnictwo Zielona Sowa','','https://cdn.takemefrom.com/contests/1530037457-wydawnictwo-zielona-sowa.jpg',1,'2018-06-26 18:24:17',2,NULL,0,NULL,0),(2,'Wydawnictwo Nasza Księgarnia','','https://cdn.takemefrom.com/contests/1530039795-wydawnictwo-nasza-ksiegarnia.jpg',1,'2018-06-26 19:03:15',2,NULL,0,NULL,0),(3,'Kuźnia PR Sp. z o.o.','','https://cdn.takemefrom.com/contests/1530040597-kuznia-pr-sp-z-o-o-.gif',1,'2018-06-26 19:16:37',2,NULL,0,NULL,0),(4,'Polska Izba Mleka','','https://cdn.takemefrom.com/contests/1530041190-polska-izba-mleka.png',1,'2018-06-26 19:26:30',2,NULL,0,NULL,0),(5,'Storck Sp. z o.o.','','https://cdn.takemefrom.com/contests/1530041804-storck-sp-z-o-o-.png',1,'2018-06-26 19:36:44',2,NULL,0,NULL,0);
/*!40000 ALTER TABLE `_sponsors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_static_sites`
--

DROP TABLE IF EXISTS `_static_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_static_sites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `content` text COLLATE utf8_polish_ci,
  `is_active` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(10) DEFAULT '0',
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(10) DEFAULT '0',
  `marked_as_deleted_at` datetime DEFAULT NULL,
  `marked_as_deleted_by` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Strony statyczne';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_static_sites`
--
-- WHERE:  1 limit 100

LOCK TABLES `_static_sites` WRITE;
/*!40000 ALTER TABLE `_static_sites` DISABLE KEYS */;
INSERT INTO `_static_sites` (`id`, `title`, `slug`, `content`, `is_active`, `created_at`, `created_by`, `updated_at`, `updated_by`, `marked_as_deleted_at`, `marked_as_deleted_by`) VALUES (1,'O nas','o-nas','<h1>O nas</h1><strong>Czy wiesz, że od ponad 18 lat wydajemy magazyny i książki dla dzieci?</strong>\n<p>Na pewno znasz takie magazyny jak Scooby-Doo!, Cartoon Netwoork, Winx Club, które pochodzą z naszego portfolio. Postanowiliśmy pójść krok dalej i rozszerzyć naszą działalność. Właśnie oddajemy w Twoje ręce portal Konkursiaki.pl.</p>\n<p class=\"center\" style=\"margin: 50px 0;\"><img src=\"/assets/images/media-service-zawada.png\" /></p>\n<h2>Zatem:</h2>\n<ul>\n	<li>Lubisz bezpiecznie surfować w internecie, bawić się</li>\n	<li>i zdobywać nagrody? Twoi ulubieni bohaterowie to postacie znane z telewizyjnych kreskówek?</li>\n</ul>\n<h2>W takim razie Konkursiaki.pl są w sam raz dla Ciebie!</h2>\n<p>Na naszej stronie znajdziesz wiele informacji o bohaterach, znanych z najpopularniejszych kanałów telewizyjnych. Poznasz ich z innej strony i dowiesz się, co u nich słychać. Ale przede wszystkim damy Ci okazję do wspaniałej zabawy!</p>\n<h2>Zagraj o wspaniałe nagrody z twoimi ulubionymi bohaterami!</h2>\n<p>Co dwa tygodnie znajdziesz tu nowy konkurs! Możesz próbować tyle razy, ile chcesz – poprawiać swoje wyniki i rywalizować z kolegami. Im aktywniej uczestniczysz w konkursach, tym więcej punktów i – przyznawanych za nie – odznak masz na koncie.</p>\n<h2>Zostań supergraczem!</h2> <p class=\"center\"><img src=\"/assets/images/okladki.jpg\" /></p>',1,'2018-06-13 16:13:30',0,NULL,0,NULL,0),(2,'Dla rodziców','dla-rodzicow','<h1>Dla rodziców</h1><h2>Specjalnie dla Waszych dzieci przygotowaliśmy serwis Konkursiaki.pl.</h2>\n<p>Miłośnicy gier i kreskówek znajdą tu informacje o ulubionych bohaterach oraz porcję dobrej – a przede wszystkim bezpiecznej zabawy. Serwis przeznaczony jest dla dzieci od lat sześciu, ale rejestracja może się odbyć jedynie za zgodą rodziców. Dlatego w chwili, gdy Wasze dziecko dokonuje rejestracji, musi podać e-mail rodzica lub opiekuna, żeby otrzymał on stosowną informację.</p>\n<h2>Cały czas dbamy o to, by na naszych stronach pojawiały się bezpieczne treści.</h2>\n<p class=\"center\"><img src=\"/assets/images/certyfikat-ssl.jpg\" /></p><p>Nad serwisem czuwają specjaliści odpowiedzialni między innymi za redagowanie tematów w wydawanych przez nas magazynach dla najmłodszych. Starannie dobieramy też nagrody dla zwycięzców konkursów – prezenty mają certyfikaty bezpieczeństwa i są dopasowane do wieku dziecka.  Oczywiście, równie starannie dobieramy reklamy pojawiające się na naszych stronach. Zarówno użytkownikom serwisu, jak i ich rodzicom polecamy jedynie artykuły dozwolone dla dzieci i dla nich przeznaczone.</p>\n<h2>Mamy nadzieję, że zaufają Państwo nam i naszemu serwisowi.</h2> <p>Zespół Konkursiaków.pl</p>',1,'2018-06-13 16:13:30',0,NULL,0,NULL,0),(3,'Regulamin','regulamin','<h1>Regulamin</h1><p>\n  <strong>REGULAMIN SERWISU INTERNETOWEGO WWW.KONKURSIAKI.PL</strong>\n</p>\n<p>\n  <strong>Dla konkursów rozpoczynających się od dnia 1 października 2016r.</strong>\n</p>\n<p>\n  <strong>UWAGA</strong>: Każdy uczestnik (rodzic lub opiekun osoby małoletniej) przed podjęciem decyzji o udziale w konkursie powinien zapoznać się z niniejszym Regulamin serwisu zamieszczonym na stronie <a href=\"http://www.konkursiaki.pl/\">www.konkursiaki.pl</a>, regulaminem poszczególnego konkursu  oraz Polityką prywatności na stronie <a href=\"http://www.konkursiaki.pl/\">www.konkursiaki.pl</a>.\n</p>\n<p>\n  <strong>ART. I. POSTANOWIENIA OGÓLNE</strong>\n</p>\n<ol><li>Serwis internetowy <a href=\"http://konkursiaki.pl/\">www.konkursiaki.pl</a> (zwany dalej: <strong>Serwisem</strong>) prowadzony jest przez przedsiębiorcę Media Service Zawada Sp. z o. o. z siedzibą: 04-028 Warszawa, al. Stanów Zjednoczonych 51, wpisaną do rejestru przedsiębiorców prowadzonego przez Sąd Rejonowy dla m.st. Warszawy w Warszawie, XIII Wydział Gospodarczy KRS, pod numerem 000027679, NIP 113-00-94-477 (zwany dalej: <strong>Administratorem</strong>).</li>\n<li>Administrator Serwisu odpowiada za wszelkie zamieszczone w nim treści.</li>\n<li>Niniejszy regulamin (zwany dalej: <strong>Regulaminem</strong>) określa zasady korzystania z Serwisu i przeprowadzanych przez Administratora konkursów.\n</li><li>Administrator jest jednocześnie organizatorem konkursów.</li>\n<li>Konkurs ma charakter przyrzeczenia publicznego w rozumieniu art. 921 ustawy z dnia 23 kwietnia 1964 kodeks cywilny a Organizator jest wydającym nagrody w rozumieniu tego artykułu.</li>\n<li>Konkurs jest prowadzony na terenie Polski.</li>\n<li>Konkurs prowadzony jest w języku polskim.</li>\n<li><strong>Małoletni w konkursie.</strong> W przypadku kiedy uczestnikiem konkursu będzie osoba małoletnia, która nie przekroczyła 16 roku życia, oświadczenie o akceptacji regulaminu, może wyrazić taka osoba, jeśli nie jest to połączone z przekazywaniem danych osobowych. W innym przypadku oświadczenia o zapoznaniu się z polityką prywatności, bądź inne oświadczenia jakie mogą znajdować się na stronie Serwisu ( w tym dotyczące wszelkich zgód) wyraża rodzic lub opiekun prawny uczestnika. Użytkownik przed wzięciem udziału w konkursie powinien zapoznać się z treścią Regulaminu konkursu i Polityką prywatności, które są dostępne w wersji PDF na stronie <a href=\"http://konkursiaki.pl/\">www.konkursiaki.pl</a>. Użytkownik ma prawo ich pobrania dla celów dowodowych.</li>\n</ol><p>\n    <strong>ART. II. PRZETWARZANIE DANYCH OSOBOWYCH</strong>\n  </p>\n<ol><li>Użytkownik Serwisu (dalej Użytkownik) przy rejestracji podaje dane osobowe: imię i nazwisko, adres zamieszkania (adres do doręczenia nagrody, jeśli jest inny niż adres zamieszkania); co jest niezbędnym warunkiem uczestniczenia w konkursach, wzajemnej komunikacji oraz wysłania nagród rzeczowych.</li>\n<li>Użytkownik może zostać poproszony również o podanie innych danych. Ich przekazanie jest dobrowolne, a ich przetwarzanie nastąpi wyłącznie na podstawie zgody Użytkownika.</li>\n<li>Pozyskiwanie danych osobowych Użytkownika i ich przetwarzanie  przez Administratora będzie odbywać się wyłącznie zgodnie z przepisami prawa w tym zgodnie z Rozporządzeniem Parlamentu Europejskiego i Rady (UE) 2016/46/WE, dalej RODO, oraz  zgodnie z ustawą z dn. 18 lipca 2002 r. o świadczeniu usług drogą elektroniczną (Dz. U. 2002 r, Nr 144, poz. 1204, z późn. zm.). Administrator wskazany w ust. 1 Regulaminu jest jednocześnie administratorem danych osobowych w rozumieniu RODO.</li>\n<li>Przetwarzanie i ochrona danych osobowych Użytkownika Serwisu odbywać się będzie zgodnie z zasadami zawartymi w Polityce Prywatności zamieszczonej na stronie <a href=\"http://konkursiaki.pl/\">www.konkursiaki.pl</a>.</li>\n<li>W Polityce Prywatności określone są szczegółowo procedury dotyczące zasad pozyskiwania danych, udzielania zgód a także określone są uprawniania osoby, której dane są przetwarzane. Użytkownik powinien skontaktować się z Administratorem stosownie do zasad wskazanych w Polityce Prywatności.</li>\n<li><span style=\"text-decoration:underline;\">WAŻNE.</span> Przed przystąpieniem do konkursy oraz wyrażeniem jakiejkolwiek zgody z nim związanym (też drogą elektroniczną) Użytkownik (jego rodzic/opiekun prawny) powinien najpierw zapoznać się z Polityką prywatności. </li>\n</ol><p>\n    <strong>ART. III. KONTAKT Z ADMINSTRATOREM</strong>\n  </p>\n<p>\n    Użytkownik może kontaktować się z Administratorem:\n  </p>\n<ol><li>Drogą pocztową, pod adresem: Media Service Zawada Sp. z o.o. z siedzibą: 04-028 Warszawa, al. Stanów Zjednoczonych 51.</li>\n<li>Za pośrednictwem poczty elektronicznej: <a href=\"mailto:konkursiaki@konkursiaki.pl\">konkursiaki@konkursiaki.pl</a>, telefonicznie: +48 22 870 53 43 lub faxem: +48 22 870 75 51.</li>\n</ol><p>\n    <strong>UWAGA</strong>: koszt połączenia telefonicznego Uczestnika z podanym powyżej numerem nie będzie wyższy niż normalny koszt zwykłych połączeń telefonicznych ustalonych przez dostawcę usług telefonicznych z jakich korzysta Uczestnik.\n  </p>\n<p>\n    <strong>ART. IV. WYMAGANIA TECHNICZNE</strong>\n  </p>\n<p>\n    W celu korzystania z Serwisu przez Użytkownika konieczne jest spełnienie poniższych minimalnych warunków technicznych:\n  </p>\n<ol><li>Dostęp do Internetu w czasie, w jakim organizowane będą konkursy na stronie Serwisu.</li>\n<li>Dostęp do przeglądarki internetowej; wymagania co do wsparcia przeglądarek:\n<ul><li>Chrome &gt;= 33.0</li>\n<li>Firefox &gt;= 27</li>\n<li>Internet Explorer &gt;= 8 (nie zalecana: niektóre gry w html5 mogą nie działać poprawnie)</li>\n<li>dodatkowe wymagania:\n<ul><li>minimalna rozdzielczość ekranu: 1024x768 pikseli</li>\n<li>flash: niektóre gry mogą wymagać zainstalowania wtyczki Flash</li>\n<li>włączony JavaScript</li>\n<li>włączone cookies oraz zgoda użytkownika na wykorzystywanie ich przez Serwis</li>\n<li>zalecane jest wyłączenie wtyczek typu adblock</li>\n</ul></li>\n</ul></li><li>W razie awarii systemu, która uniemożliwia korzystania z Serwisu, Administrator zamieści na stronie informację o awarii.</li>\n<li><strong>W przypadku </strong>urządzenia teleinformatycznego (telefon) powinien on umożliwić wysyłanie wiadomości SMS zgodnie z definicją.</li>\n\n\n\n</ol><p>\nW razie awarii systemu, która uniemożliwia korzystania z Serwisu, Organizator Konkursu zamieści na stronie informację o awarii; <strong>przerwa nie będzie jednak miała wpływu na uzyskane przez Uczestnika do tego momentu korzyści (punkty, nagrody etc.)</strong>.\n</p>\n<p>\n<strong>ART. V. REJESTRACJA W SERWISIE</strong>\n</p>\n<ol><li>Użytkownikiem Serwisu jest każda osoba odwiedzająca Serwis.</li>\n<li>Użytkownicy Serwisu dzielą się na zarejestrowanych oraz nie zarejestrowanych.</li>\n<li>Rejestracja w Serwisie nie jest obowiązkowa.</li>\n<li>Rejestracja i korzystanie z Serwisu jest bezpłatne.</li>\n<li>Użytkownik nie zarejestrowany to osoba, która nie dokonała rejestracji w Serwisie. Brak rejestracji oznacza ograniczony dostęp do Serwisu.</li>\n<li>Użytkownik zarejestrowany to osoba, która dokonała pełnej rejestracji i aktywowała swoje konto w Serwisie. Ma ona pełny dostęp do niemal wszystkich elementów Serwisu, z wyjątkiem tych, do których dostęp jest ograniczony kodem lub wymagają odblokowania poprzez wymianę punktów.</li>\n<li>Każdy Użytkownik może się zarejestrować wyłącznie pod jednym Nickiem, któremu może być przypisany wyłącznie jeden adres zamieszkania (adres do doręczenia nagrody).</li>\n<li>Rejestracja osoby małoletniej, która nie ukończyła 13 lat powinna zostać dokonana przez jej rodzica (opiekuna prawnego), a osoby, która ukończyła 13 lat ale nie ukończyła 18 lat, powinna zostać potwierdzona przez rodzica (opiekuna prawnego).</li>\n<li>Dane osobowe podane podczas rejestracji muszą zostać potwierdzone przez aktywację linku przesłanego drogą mailową na podany przez Użytkownika adres e-mail.</li>\n<li>Nagrody są przyznawane tylko tym użytkownikom, którzy mają uzupełnione wszystkie dane, tak jak wskazuje formularz rejestracji. Brak takich danych jak imię, nazwisko użytkownika i jego  rzeczywisty adres korespondencyjny, uniemożliwia Administratorowi dokonanie weryfikacji danych potrzebnych do przyznania i wysłania nagrody. Użytkownik w każdej chwili może uzupełnić swoje dane poprzez formularz Edytuj profil.</li>\n</ol><p>\n<strong>ART. VI. ZASADY UCZESTNICZENIA W KONKURSACH, KONTA, WERYFIKACJA LAUREATÓW</strong>\n</p>\n<ol><li>W celu umożliwienia uczestniczenia w konkursach jak najszerszemu gronu użytkowników i ograniczenie uczestniczenia w konkursach osób, które poprzez swoje, sprzeczne z regulaminem działania, w tym wykorzystywanie środków technicznych, organizacyjnych lub oprogramowania - uzyskują niczym nie uzasadnioną przewagę nad innymi uczestnikami i w rezultacie ograniczają możliwości wygrania nagród przez inne osoby, Administrator wprowadza następujące zasady:\n<ul><li>Każdy Użytkownik ma prawo do założenia tylko jednego konta w Serwisie, w ramach jednego konkursu, jeden Uczestnik może wykorzystywać wyłącznie tylko jedno urządzenie teleinformatyczne: komputer albo telefon (smartfon) albo tablet albo inne urządzenie przeznaczone do komunikacji elektronicznej.</li>\n<li>Do każdego Użytkownika może być przypisany tylko jeden adres korespondencyjny (adres do doręczenia nagrody).</li>\n<li>W ramach jednego konkursu, pod jeden adres wskazany jako adres Użytkownika może zostać przekazana nie więcej niż 1 (jedna) nagroda.</li>\n</ul></li><li>Zabrania się wykorzystywania przez Użytkownika w celu uzyskania wygranej, środków technicznych, organizacyjnych lub oprogramowania, których jedynym celem jest bezzasadne zapewnienie lub zwiększenie możliwości wygrania nagrody w stosunku do innych uczestników konkursu, którzy nie korzystają z takich rozwiązań. W przypadku kiedy Użytkownik wykorzystywał środki wskazane w ust. 1, lit.d, Administrator uprawniony będzie do usunięcia uzyskanego w ten sposób wyniku, zawieszenia konta takiego Użytkownika na okres 30 dni; o podjęciu takich czynności Użytkownik zostanie poinformowany. W przypadku ponownego naruszenia tych zasad przez tego samego Użytkownika Administrator uprawniony będzie do usunięcia konta Użytkownika na stałe. Administrator poinformuje taką osobę w okresie do 48 godzin o zablokowaniu lub usunięciu konta. Administrator zastrzega sobie możliwości dokonania weryfikacji osoby laureata i miejsca jego zamieszkania w granicach, jakie dopuszczają bezwzględnie obowiązujące przepisy prawa.</li>\n<li>Nagrody zostaną doręczone wyłącznie osobom (laureatom), które uczestniczyły w konkursie z zachowaniem wymagań Regulaminu.</li>\n<li>Biorąc udział w Konkursie, Użytkownik nie będzie dostarczać treści bezprawnych, w szczególności używać obraźliwych oznaczeń (nicków).</li>\n<li>Nagroda będzie doręczona do miejsca zamieszkania laureata w sposób zgodny z przepisami prawa, w tym prawa pocztowego; tożsamość odbiorcy zostanie ustalona stosownie do obowiązujących przepisów. Nagroda będzie dostarczona nie później w terminie 30 dni od dnia poinformowania o zdobyciu nagrody.</li>\n<li>Zabrania się używania obraźliwych i wulgarnych Nazw Użytkownika (nick) w Serwisie. Nazwy Użytkownika naruszające ten punkt Regulaminu będą usuwane przez Administratora Serwisu.</li>\n<li>Każdy Użytkownik jest wyłącznie odpowiedzialny za sposób korzystania ze swojego konta w Serwisie, w tym podejmowania decyzji o uczestniczeniu w konkursie bądź dokonywanie wpisów.</li>\n<li>Nazwa Użytkownika umożliwiająca zalogowanie, powinna być anonimowa, to jest nie powinna zawierać prawdziwych danych osobowych Użytkownika (np. imię i nazwisko). Nazwa Użytkownika będzie przetwarzana przez Administratora tak jak inne dane osobowe Użytkownika.</li>\n\n\n</ol><p>\n<strong>ART. VII. KONKURSY - PUNKTY - ODZNAKI I RANGI – RANKINGI</strong>\n</p>\n<ol><li>Administrator Serwisu po uzyskaniu zgody na przetwarzanie danych osobowych Użytkownika będzie uprawniony do zamieszczenia na stronie Serwisu Nazwy Użytkownika.</li>\n<li>W każdym przypadku Użytkownik przed wzięciem udziału w konkursie powinien zapoznać się z jego Regulaminem i Polityką Prywatności.</li>\n<li>W konkursach organizowanych przez Administratora z wykorzystaniem Serwisu mogą brać udział wszystkie osoby, ale tylko wyniki osób zarejestrowanych i zalogowanych będą brane pod uwagę w rankingach konkursów.</li>\n<li>Pracownicy Administratora, osoby przez niego zatrudnione na podstawie umowy cywilnej oraz ich dzieci nie mogą uczestniczyć w konkursach organizowanych w ramach Serwisu.</li>\n<li>Nagrody przyznawane w konkursach organizowanych w Serwisie nie podlegają wymianie na inne nagrody rzeczowe albo nagrody pieniężne. Użytkownik Serwisu może zostać laureatem tylko jednej nagrody w ramach jednego konkursu.</li>\n<li>Laureaci konkursów o wygranej w konkursie zostaną poinformowani drogą mailową oraz otrzymają dodatkowo komunikat o wygranej po zalogowaniu się do Serwisu.</li>\n<li>Lista laureatów każdego konkursu będzie opublikowana w Serwisie w terminie najpóźniej 21 dni od dnia zakończenia konkursu. Laureaci zostaną wymienieni poprzez wykorzystanie Nazwy Użytkownika, w kolejności odpowiadającej ilości zdobytych przez nich punktów. Zasady naliczania punktów Użytkownikowi i wyłaniania laureatów zamieszczone będą w regulaminach poszczególnych konkursów.</li>\n<li>Odbiór nagrody. Nagrody przyznane w konkursach organizowanych w ramach Serwisu zostaną przesłane pocztą – przesyłką pocztową w terminie 30 dni od momentu opublikowania listy laureatów w Serwisie. Wysłanie nagrody będzie poprzedzone prośbą Administratora, wysłaną e-mailem o potwierdzenie adresu, na jaki ma zostać przesłana nagroda. W przypadku kiedy adres podany w procesie rejestracji uległ zmianie, Użytkownik powinien dokonać jego aktualizacji.</li>\n<li>Użytkownicy otrzymują PUNKTY za następujące aktywności:<br /><table><tr><td>\n  <strong>Lp.</strong>\n\n</td>\n<td><strong>Nazwa aktywności</strong>\n</td>\n<td><strong>Ilość punktów</strong>\n</td>\n<td><strong>Częstotliwość przyznawania punktów</strong>\n</td>\n</tr><tr><td>1\n</td>\n<td>rejestracja w serwisie\n</td>\n<td>5\n</td>\n<td>jednorazowo\n</td>\n</tr><tr><td>2\n</td>\n<td>logowanie w serwisie\n</td>\n<td>1\n</td>\n<td>1 / dzień\n</td>\n</tr><tr><td>3\n</td>\n<td>rejestracja dokonana przez zaproszonego znajomego\n</td>\n<td>5\n</td>\n<td>1 / użytkownik\n</td>\n</tr><tr><td>4\n</td>\n<td>udział w konkursie\n</td>\n<td>5\n</td>\n<td>1 / konkurs\n</td>\n</tr><tr><td>5\n</td>\n<td>punkty za zwycięstwo w konkursie: 100 punktów za I miejsce, drugie = 99 pkt, itd. 100 = 1 pkt.\n</td>\n<td>\n</td>\n<td>1 / konkurs\n</td>\n</tr><tr><td>6\n</td>\n<td>Punkty za zwycięstwo w konkursie specjalnym: 200 punktów za I miejsce, drugie – 199 pkt, itd. 200 miejsce – 1 pkt\n</td>\n<td>\n</td>\n<td>1 / konkurs\n</td>\n</tr><tr><td>7\n</td>\n<td>poprawna odpowiedź w quizie\n</td>\n<td>2\n</td>\n<td>1 / dzień\n</td>\n</tr><tr><td>8\n</td>\n<td>Poprawienie swojego najlepszego wyniku w grze\n</td>\n<td>1\n</td>\n<td>1 / za każdy poprawiony wynik\n</td>\n</tr></table></li>\n<li>Liczba punktów za konkretne aktywności mogą być podwajane w wybranych okresach czasu w związku z akcjami specjalnymi prowadzonymi w serwisie (np. konkursy specjalne). W takich sytuacjach użytkownik będzie o tym powiadamiany.</li>\n<li>Za wykonanie określonych zadań Użytkownikowi zostaną przyznane odznaki:<br /><table><tr><td>\n<strong>Odznaka</strong>\n\n</td>\n<td><strong>Zadanie</strong>\n</td>\n</tr><tr><td>CHAMPION. Jest w czołówkach rankingów!\n</td>\n<td>Odznaka przyznawana jest za bycie w 5 różnych konkursach w pierwszej 50.\n</td>\n</tr><tr><td>FAJTER. Nie poddaje się!\n</td>\n<td>Odznaka przyznawana jest za bycie w ostatniej 50. w 5 różnych konkursach.\n</td>\n</tr><tr><td>FAN. Często nas odwiedza!\n</td>\n<td>Odznaka przyznawana jest za zalogowanie się min. 20 razy w miesiącu, w tym co najmniej raz dziennie przez kolejne 20 dni\n</td>\n</tr><tr><td>GAMER. Lubi grać!\n</td>\n<td>Odznaka przyznawana jest za min. 150 gier miesięcznie. Daje dostęp do konkursów specjalnych\n</td>\n</tr><tr><td>FRIEND. Towarzyski!\n</td>\n<td>Odznaka przyznawana jest za 15 zarejestrowanych znajomych, którzy trafili do nas poprzez Twoje zaproszenie polecenia. Daje dostęp do nowych filmów.\n</td>\n</tr></table></li>\n<li>Liczba zebranych punktów i ilość wykonanych zadań świadczą o randze użytkownika:<br /><table><tr><td>\n<strong>Ranga Użytkownika</strong>\n\n</td>\n<td><strong>Punktacja</strong>\n</td>\n</tr><tr><td>PLAYER\n</td>\n<td><strong>5</strong>\n</td>\n</tr><tr><td>STAR PLAYER\n</td>\n<td><strong>500</strong>\n</td>\n</tr><tr><td>TOP PLAYER\n</td>\n<td><strong>1000</strong>\n</td>\n</tr><tr><td>KONKURSIAK\n</td>\n<td><strong>5000</strong>\n</td>\n</tr></table></li>\n<li>Zarówno odznaki, jak i rangi, mogą w wybranych okresach czasu pozwalać ich posiadaczom na dostęp do treści Serwisu ograniczonych dla innych użytkowników.</li>\n<li>Liczba punktów użytkownika określa jego miejsce w rankingach prowadzonych w Serwisie.</li>\n</ol><p>\n<strong>ART. VIII. RANKINGI I WYMIANA PUNKTÓW</strong>\n</p>\n<p>\nW ramach serwisu prowadzone są 3 rodzaje rankingów – konkursów, miesięczny i roczny.\n</p>\n<ol><li>Ranking miesięczny uwzględnia pierwszych 50 Użytkowników wg. punktów zdobytych w miesiącu.</li>\n<li>Ranking roczny uwzględnia pierwszych 50 Użytkowników wg. punktów zdobytych w danym roku.</li>\n<li>Ranking roczny premiowany jest nagrodą roczną. Nagroda przyznawana jest użytkownikowi z największą liczbą punktów w tym rankingu. W przypadku uzyskania takiej samej liczby punktów przez więcej niż jedna osobę, pod uwagę brana będzie liczba zwycięstw i kolejność miejsc w zajętych konkursach.</li>\n<li>Ranking miesięczny premiowany jest nagrodą miesięczną. Nagroda przyznawana jest Użytkownikowi z największą liczbą punktów w tym rankingu. W przypadku uzyskania takiej samej liczby punktów przez więcej niż jedna osobę, pod uwagę brana będzie liczba zwycięstw i kolejność miejsc w zajętych konkursach.</li>\n<li>Nagroda miesięczna może być przyznana temu samemu Użytkownikowi 3 razy w ciągu danego cyklu rankingu rocznego.</li>\n<li>Ranking roczny kończy się z dniem 30 września każdego roku a nowy ranking rozpoczyna się z dniem 1 października każdego roku. Z dniem rozpoczęcia nowego rankingu rocznego wszystkie dotychczas zdobyte punkty zostaną wyzerowane,</li>\n<li>Jednocześnie, Użytkownikom przyznane zostają jednorazowo punkty w zależności od miejsca, jakie uzyskali w już zakończonym w rankingu:\n<ul><li>50 pkt. – użytkownikom posiadającym 10 000 pkt. i więcej</li>\n<li>25 pkt. – użytkownikom posiadającym od 2 000 pkt. do 9 999</li>\n<li>10 pkt. – użytkownikom posiadającym od 1 000 pkt. do 1 999</li>\n<li>5 pkt. – reszcie użytkowników</li>\n</ul></li>\n<li>Listy laureatów rankingów miesięcznych i rocznego będą opublikowane na stronie Serwisu w terminie najpóźniej 14 dni roboczych od momentu zakończenia danego okresu rankingowego. Laureaci zostaną wymienieni według Nazwy Użytkownika i w kolejności jaka odpowiada liczbie zdobytych przez nich punktów.</li>\n<li>Zabrania się wykorzystywania przez Użytkownika w celu uzyskania punktów, środków technicznych, organizacyjnych lub oprogramowania, których jedynym celem jest bezzasadne zapewnienie lub zwiększenie możliwości zdobycia punktów w stosunku do innych Użytkowników Serwisu, którzy nie korzystają z takich rozwiązań.</li>\n<li>W przypadku kiedy Użytkownik wykorzystywał środki wskazane w Art. VI, ust. 1, lit. d, Administrator uprawniony będzie do usunięcia uzyskanych w ten sposób punktów, zawieszenia konta takiego Użytkownika na okres 30 dni; w przypadku ponownego naruszenia tych zasad przez tego samego Użytkownika Administrator uprawniony będzie do usunięcia konta Użytkownika; Administrator poinformuje taką osobę w okresie do 48 godzin o zablokowaniu lub usunięciu konta.</li>\n<li>Użytkownicy mogą wymieniać zgromadzone przez nich punkty na dostępy do zablokowanych treści w serwisie. Odbywać się to będzie za pomocą formularza wymiany punktów w profilu użytkownika. Liczba punktów oraz rodzaj treści będą każdorazowo podane w formularzu.</li>\n<li>Wymienione punkty zostaną odjęte od puli punktów użytkownika. Jeśli po odjęciu punktów użytkownik będzie miał ich za mało niż przewidują to wymogi posiadanej rangi – Użytkownik jej nie straci.</li>\n</ol><p>\n<strong>ART. IX. INFORMACJE O NOWYCH KONKURSACH</strong>\n</p>\n<p>\nPod warunkiem wyrażenia odrębnej zgody przez Użytkownika, Administrator może przesyłać mu informacje marketingowe (informacje handlowe) w tym o nowych konkursach organizowanych przez Administratora na podany przez Użytkownika adres poczty elektronicznej przy wykorzystaniu telekomunikacyjnych urządzeń końcowych (komputery, telefony etc.) i automatycznych systemów wywołujących. Szczegółowe postanowienia w tym zakresie zamieszczone są w Polityce prywatności na stronie <a href=\"http://konkursiaki.pl/\">www.konkursiaki.pl</a>. Użytkownik Serwisu ma prawo do wycofania takiej zgody.\n</p>\n<p>\n<strong>ART. X. REKLAMACJE</strong>\n</p>\n<ol><li>Każdemu Użytkownikowi przysługuje prawo wniesienia reklamacji związanej z rozstrzygnięciem konkursu. Reklamacje powinno składać się w terminie do 30 dni od dnia zakończenia Konkursu.</li>\n<li>Reklamacje mają zastosowanie także do usunięcia punktów, zawieszenia lub usunięcia konta Użytkownika.</li>\n<li>Reklamacje można zgłaszać do Administratora: drogą pocztową, pod adresem: Media Service Zawada sp. z o.o. z siedzibą: 04-028 Warszawa, al. Stanów Zjednoczonych 51 albo za pośrednictwem poczty elektronicznej: <a href=\"mailto:kontakt@msz.com.pl\">kontakt@konkursiaki.pl</a>, albo faxem: +48 22 870 75 51.</li>\n<li>W reklamacji należy zaznaczyć: „Reklamacja\", podać nazwę konkursu, wskazując co jest przedmiotem reklamacji. Uczestnik może też wskazać jakiego rozstrzygnięcia oczekuje od Organizatora.</li>\n<li>Reklamacja zostanie rozpatrzona najpóźniej w ciągu 14 dni od jej otrzymania.</li>\n<li>Powyższe terminy nie zmieniają terminów zgłaszania reklamacji jakie wynikają z przepisów prawa.</li>\n<li>Postępowanie reklamacyjne dotyczy także przekazanych Użytkownikowi nagród.</li>\n<li>Do wydanych nagród (rzeczy) mają zastosowanie uprawnienia gwarancyjne w przypadku ich udzielenia. Administrator zapewnia, iż przekazywane przez niego Laureatom nagrody są bez wad. W przypadku zaistnienia wady, laureat konkursu, przesyła wadliwą nagrodę na koszt organizatora na podany powyżej adres. W reklamacji laureat może zaznaczyć jakiego rozstrzygnięcia oczekuje.</li>\n<li>Reklamacja zostanie rozpatrzona najpóźniej w ciągu 14 dni od jej otrzymania. Organizator udzieli odpowiedzi o rozstrzygnięciu na adres wskazany przez Laureata.</li>\n<li>Laureat ma prawo, niezależnie od przysługujących mu uprawnień z tytułu udzielonej gwarancji, wykonywać uprawnienia z tytułu rękojmi.</li>\n<li>W przypadku braku gwarancji Laureatowi przysługują uprawnienia z tytułu rękojmi.</li>\n</ol><p>\n<strong>ART. XI. ALTERNATYWNE ROZSTRZYGANIE SPORÓW</strong>\n</p>\n<p>\nKażdy uczestnik konkursu, jako konsument, jeśli jego zgłoszenie reklamacyjne nie zostanie rozstrzygnięte zgodnie z oczekiwaniem, nie będzie w ogóle rozpatrzone albo reklamacja nie została przyjęta, jest uprawniony do skorzystania z procedury pozasądowego rozwiązywania sporów. Ma między innymi następujące możliwości:\n</p>\n<ol><li>zwrócenie się do Wojewódzkiego Inspektora Inspekcji Handlowej z wnioskiem o wszczęcie postępowania mediacyjnego w sprawie polubownego zakończenia sporu. Informacje dotyczące procedury mediacyjnej znajdują sie w siedzibach oraz na stronach internetowych poszczególnych Wojewódzkich Inspektoratów Inpsekcji Handlowej; Wojewódzki Inspektor Inspekcji Handlowej właściwy dla siedziby MSZ Sp. z o.o.: <strong>Wojewódzki Inspektorat Inspekcji Handlowej ul. Sienkiewicza 3, 00-015 Warszawa, <a href=\"mailto:ih_warszawa@wiih.org.pl\">ih_warszawa@wiih.org.pl</a>,</strong></li>\n<li>zwrócenie się do stałego polubownego sądu konsumenckiego działającego przy Wojewódzkim Inspektorze Inspekcji Handlowej z wnioskiem o rozstrzygnięcie sporu wynikłego z zawartej umowy. Wykaz stałych polubownych sądów konsumenckich znajduję się na stronie internetowej Urzędu Ochrony Konkurencji Konsumentów pod adresem <a href=\"http://www.uokik.gov.pl/wazne_adresy.php\">www.uokik.gov.pl/wazne_adresy.php</a>,</li>\n<li>zwrócenie się o bezpłatną pomoc prawną do miejskiego lub powiatowego rzecznika konsumentów lub organizacji społecznej, do której zadań statutowych należy ochrona konsumentów, m.in. Federacji Konsumentów - adres strony internetowej; <a href=\"http://www.federacja-konsumentow.org.pl/\">www.federacja-konsumentow.org.pl</a>.</li>\n<li>wykorzystania insytucji mediacji przewidzianej przez przepisy ustawy z 17 listopada 1964 r. kodeks postępowania cywilnego (Dz.U.nr 43, poz. 296, ze zm.), art 183(1) i następne kpc.</li>\n<li>W przypadku zawierania umów przy wykorzystaniu Internetu ( umowy sprzedaży lub umowy o świadczenie usług), skorzystanie z internetowego systemu rozstrzygania sporów konsumenckich (tzw. <strong>Platforma ODR</strong>), co jest omówione poniżej.</li>\n</ol><p>\nSzczegółowe informacje o pozasądowych sposobach rozpatrywania reklamacji i dochodzenia roszczeń, a także zasady dostępu do tych procedur dostępne są w siedzibach oraz na stronach internetowych powiatowych (miejskich) rzeczników konsumentów, organizacji społecznych, do których zadań statutowych należy ochrona konsumentów, Wojewódzkich Inspektoratów Inspekcji Handlowej oraz pod następującymi adresami Urzędu Ochrony Konkurencji i Konsumentów: <a href=\"http://www.uokik.gov.pl/spory_konsumenckie.php\">www.uokik.gov.pl/spory_konsumenckie.php</a>, <a href=\"http://www.uokik.gov.pl/wazne_adresy.php\">www.uokik.gov.pl/wazne_adresy.php</a>, <a href=\"http://www.uokik.gov.pl/sprawy_indywidualne.php\">www.uokik.gov.pl/sprawy_indywidualne.php</a>.\n</p>\n<p>\nSkorzystanie z pozasądowych sposobów rozpatrywania reklamacji i dochodzenia roszczeń ma charakter dobrowolny i może mieć miejsce, gdy obie strony sporu wyrażą na to zgodę.\n</p>\n<p>\nPełna lista podmiotów, które są uprawnione do pozasądowego rozwiązywania sporów, których stroną jest konsument znajduję się na stronie internetowej UOKIK: <a href=\"http://www.uokik.gov.pl/\">www.uokik.gov.pl</a>. Listę prowadzi Prezez UOKiK.\n</p>\n<p>\nZalecane jest skorzystanie z przewidzianej w regulaminie procedury reklamacyjnej, gdyż zgodnie z art. 34 ust. 2 pkt. 1 ustawy z dnia 23 września 2016 r, o pozasądowym rozwiązywaniu sporów konsumenckich (Dz.U. z 9 listopada 2016 r, poz. 1823), podmiot uprawniony do prowadzenia postępowania w sprawie pozasądowego rozwiązywania sporów konsumenckich może odmówić wszczęscia postępowania, jeżeli konsument nie podjął wcześniejszej próby kontaktu z przedsiębiorcą, np. w formie złożenia reklamacji. Uczestnik konkursu (konsument) może skontaktować się z Media Service Zawada Sp. z o.o.: <strong><a href=\"mailto:recepcja@msz.com.pl\">recepcja@msz.com.pl</a></strong>\n</p>\n<p>\n<strong>PLATFORMA ODR</strong>\n</p>\n<p>\nZgodnie z rozporządzeniem Parlamentu Europejskiego i Rady (UE) Nr 524/2013 z dnia 21 maja 2013 r. w sprawie internetowego systemu rozstrzygania sporów konsumenckich oraz zmiany rozporządzenia (WE) nr 2006/2004 i dyrektywy 2009/22/WE (rozporządzenie w sprawie ODR w sporach konsumenckich), konsument (uczestnik konkursu) może również skorzystać z platformy internetowego systemu rozstrzygania sporów (<strong>platforma ODR</strong>),\n</p>\n<p>\nDostęp do platformy ODR zapewnia łącze internetowe: <strong>ec.europa.eu/consumers/odr</strong>\n</p>\n<p>\nEuropejska platforma ODR ma ułatwiać przede wszystkim szybkie i sprawiedliwe pozasądowe rozstrzyganie przez Internet sporów między konsumentami i przedsiębiorcami dotyczących zobowiązań umownych wynikających z internetowych umów sprzedaży lub umów o świadczenie usług zawieranych między konsumentami mieszkającymi w Unii a przedsiębiorcami mającymi siedzibę w Unii.\n</p>\n<p>\nUczestnik konkursu (konsument) może skontaktować  się z organizatorem Media Service Zawada Sp. z o.o.: <strong><a href=\"mailto:recepcja@msz.com.pl\">recepcja@msz.com.pl</a></strong>\n</p>\n<p>\nW przypadku osób małoletnich wskazane powyżej czynności powinny być wykonane (lub) potwierdzone przez rodziców (opiekunów prawnych).\n</p>\n<p>\n<strong>ART. XII. ZAKRES REGULAMINU</strong>\n</p>\n<p>\nPostanowienia Regulaminu mają zastosowanie do konkursów jakie są organizowane w ramach Serwisu. Okres trwania konkursu ten nie ma wpływu na prawa i obowiązki Użytkownika jakie mają do niego zastosowanie w okresie trwania konkursu, które przysługują mu wprost z regulaminu (np. prawa do otrzymania nagród, prawo do zgłaszania reklamacji), bądź wynikają z przepisów prawa (uprawnienia gwarancyjne, z tytułu rękojmi, itp.).\n</p>\n<p>\n<strong>ART. XIII. POSTANOWIENIA KOŃCOWE</strong>\n</p>\n<ol><li>Do Konkursu stosować się będzie w szczególności postanowienia ustawy z 30 maja 2014 r. o prawach konsumenta oraz z 18 lipca 2002 r. o świadczeniu usług drogą elektroniczną. (Dz. U. z 2002 r. Nr 144, poz.1204, z późn. zm.).</li>\n<li>Nie jest dopuszczalne wysyłanie wiadomości polecającej Serwis samemu sobie lub na fikcyjne konto. Zaistnienie sytuacji wskazanej powyżej powoduje usunięcie takiego konta z Serwisu przez Administratora. Użytkownik przyjmuje do wiadomości, że do uczestniczenia w konkursach, skutecznej komunikacji, w tym przekazania nagrody niezbędne jest podanie prawdziwych danych. W przypadku zmiany przez Użytkownika wcześniej podanych danych, Użytkownik powinien niezwłocznie przekazać aktualne dane.</li>\n<li>Regulamin jest dostępny w siedzibie Administratora oraz na stronie <a href=\"http://konkursiaki.pl/\">www.konkursiaki.pl</a>. w wersji PDF i może być pobrany przez każdego uczestnika dla celów dowodowych.</li>\n<li>Każdy konkurs ma swój własny Regulamin.</li>\n</ol>',1,'2018-06-13 16:13:30',0,NULL,0,NULL,0),(4,'Polityka prywatności','polityka-prywatnosci','<h1>Polityka prywatności</h1><strong>Konkursiaki.pl - Polityka prywatności i informacyjna</strong></p>\n<p>W celu zapewnienia osobom udostępniających dane niezbędnych i wyczerpujących informacji dotyczących w szczególności podmiotu, którym dane są przekazywane, celów przetwarzania, podstawy prawnej przetwarzania a także zasad wzajemnej komunikacji, Spółka na podstawie art. 12 i art. 13 Rozporządzenia Parlamentu Europejskiego i Rady (UE) 2016/46/WE, dalej RODO, w trakcie pozyskiwania danych osobowych przekazuje następujące informacje</p>\n<ol><li><strong>UWAGA!</strong> Przed wzięciem udziału w konkursie każdy Uczestnik (rodzic lub opiekun prawny) powinien zapoznać się z treścią niniejszej „Polityki prywatności i informacyjnej \" oraz „Regulaminu konkursu\".</li>\n<li>Administratorem danych osobowych (dalej \"<strong>Administrator\")</strong> przetwarzanych w związku z korzystaniem ze strony internetowej <a href=\"http://www.konkursiaki.pl/\">www.konkursiaki.pl</a> zgodnie z art. 4 pkt. 7 RODO jest Media Service Zawada Sp. z o.o. z siedzibą przy al. Stanów Zjednoczonych 51, 04-028 Warszawa, wpisana do rejestru przedsiębiorców, prowadzonego przez Sąd Rejonowy dla m.st. Warszawy, w Warszawie, XIII Wydział Gospodarczy KRS, pod numerem 000027679, NIP 113-00-94-477. Administrator działa zgodnie z przepisami prawa, w szczególności zgodnie z RODO oraz ustawą z dnia 18 lipca 2002 r. o świadczeniu usług drogą elektroniczną (Dz. U. 2002 r, nr 144, poz. 1204, z późn. zm., dalej ŚUEu).</li>\n<li>W ramach działania serwisu <a href=\"http://www.konkursiaki.pl/\">www.konkursiaki.pl</a> mogą być przekazywane innym podmiotom pozyskane dane osobowe użytkowników. Podmiotem odpowiedzialnym za przetwarzanie przekazanych danych osobowych jest Michał Łojewski prowadzący działalność gospodarczą pod firmą Gynkar, Michał Łojewski z siedzibą: ul. Chełmska 21, zarejestrowaną w Centralnej Ewidencji Działalności i Informacji Gospodarczej prowadzonej przez Ministra Gospodarki, posiadającej NIP 525-112-04-31, Regon 12659563.</li>\n<li>Dostęp do danych osobowych użytkowników strony internetowej <a href=\"http://www.konkursiaki.pl/\">www.konkursiaki.pl</a> (dalej Użytkownicy), mają wyłącznie osoby posiadające upoważnienie nadane przez Administratora danych osobowych. Osoby te są zobowiązane do zachowania w poufności informacji dotyczących danych osobowych i w razie niedopełnienia obowiązków podlegają odpowiedzialności dyscyplinarnej i przewidzianej przez przepisy prawa.</li>\n<li>Administrator przetwarza dane osobowe podawane przez Użytkowników podczas rejestracji na stronie internetowej. Administrator prosi o dane osobowe: imię, nazwisko, adres zamieszkania, adres poczty e-mail, datę urodzenia oraz nazwę Użytkownika (nick). Dane te są umieszczone w bazie danych, zarejestrowanej przez GIODO. Administrator przetwarza i ma dostęp do danych Użytkownika.</li>\n<li>Dane osobowe Użytkowników są przetwarzane w celu przeprowadzania cyklu konkursów organizowanych przez Media Service Zawada sp. z o.o, dla celów marketingu bezpośredniego, oraz określenia zachowań i preferencji Użytkowników. Użytkownik wyrazi zgodę na przetwarzanie swoich danych w powyższych celach.</li>\n<li>Przetwarzanie danych osobowych Użytkowników odbywa się w oparciu o przepisy prawa (np. art. 6 ust. 1 pkt. b lub f RODO). W przypadku danych osób małoletnich, poniżej 16 roku życia, ich pozyskiwanie i przetwarzanie w celach wskazanych w ust.5, wymaga zgody rodzica/opiekuna prawnego.</li>\n<li>Media Service Zawada Sp. z o.o. nie przekazuje ani nie sprzedaje danych osobowych Użytkowników żadnym innym podmiotom.</li>\n<li>Użytkownik wszystkie dane osobowe podaje dobrowolnie a zgoda na ich przetwarzanie może zostać odwołana w każdym czasie. Użytkownikowi przysługują prawa opisane poniżej.</li>\n<li>Użytkownik może wyrazić odrębną zgodę na otrzymywanie od Administratora informacji handlowych (marketingowych), w tym o nowych konkursach organizowanych przez Administratora za pośrednictwem środków komunikacji elektronicznej, w tym przy użyciu urządzeń telekomunikacyjnych urządzeń końcowych i automatycznych systemów wywołujących (art. 10 ustawy z 18 lipca 2002 r. o świadczeniu usług drogą elektroniczną i art. 172 w zw. z art.174 ustawy z 16 lipca 2004 Prawo telekomunikacyjne).</li>\n<li>W celu umożliwienia otrzymywania wskazanych powyżej informacji Użytkownik może podać swoje dane, w tym numer telefonu lub adres poczty elektronicznej. Wykorzystywanie urządzeń komunikacji elektronicznych przez Administratora w celach opisanych w ust. 9 nie będzie odbywać się na koszt Użytkownika.</li>\n<li>Treść oświadczeń o udzieleniu zgody na przetwarzanie danych osobowych i w celach marketingowych znajduje się na stronie <a href=\"http://www.konkursiaki.pl/\">www.konkursiaki.pl</a></li>\n<li>Każdy Użytkownik (jego rodzic lub opiekun prawny) ma prawo do: odwołania swojej zgody na przetwarzanie danych osobowych w celach związanych z organizacją konkursów, z tym że wycofanie tej zgody jest jednoznaczne z zamknięciem konta w serwisie;</li>\n<li>Żądanie o treści: <strong>„Cofam moją zgodę na przetwarzanie danych osobowych moich i mojego dziecka w celach związanych z przeprowadzaniem konkursów organizowanych przez Media Service Zawada Sp. z o.o.\",</strong> można skierować:\n<ol><li>w formie pisemnej na adres Media Service Zawada Sp. z o.o., 04-028 Warszawa, al. Stanów Zjednoczonych 51; może to mieć formę listu poleconego,</li>\n<li>jako e-mail na adres poczty elektronicznej Administratora: <a href=\"mailto:kontakt@konkursiaki.pl\">kontakt@konkursiaki.pl</a>,</li>\n<li>jako fax: +48 22 870 75 51,</li>\n</ol></li>\n<li>Wycofania zgody na otrzymywanie informacji handlowych, w tym o nowych konkursach organizowanych przez Administratora przesyłanych za pośrednictwem środków komunikacji elektronicznej, w tym przy użyciu urządzeń telekomunikacyjnych urządzeń końcowych i automatycznych systemów wywołujących; zgoda w tym zakresie może nastąpić w każdym czasie w sposób prosty i wolny od opłat. Żądanie o treści: <strong>„Cofam moją zgodę na przesyłanie mi informacji handlowych (marketingowych), przez Media Service Zawada Sp. z o.o., za pomocą środków komunikacji elektronicznej lub przy wykorzystaniu telekomunikacyjnych urządzeń końcowych i automatycznych systemów wywołujących.\"</strong> można skierować:\n<ol><li>w formie pisemnej na adres Media Service Zawada Sp. z o.o., 04-028 Warszawa, al. Stanów Zjednoczonych 51; może to mieć formę listu poleconego,</li>\n<li>jako e-mail na adres poczty elektronicznej Administratora: <a href=\"mailto:kontakt@konkursiaki.pl\">kontakt@konkursiaki.pl</a>,</li>\n<li>jako fax: +48 22 870 75 51,</li>\n</ol><p>W przypadku, kiedy otrzymywanie informacji marketingowych odbywa się tylko w oparciu o art. 6 ust. 1 lit. f RODO, tj. kiedy nie jest wymagana zgoda uprawnionego, Użytkownik może zgłosić do Administratora sprzeciw dotyczący dalszego przetwarzania danych w powyższym celu, w formie i na adresy podane powyżej.</p>\n</li>\n<li>Administrator będzie kontaktował się z Użytkownikiem drogą elektroniczną na podany przez Użytkownika adres poczty elektronicznej.</li>\n<li><strong>Kontakt z Administratorem.</strong> Użytkownik może kontaktować się z Administratorem, w tym także w celu realizowania swoich uprawnień podanych w ust. 8 i 9 (odwołanie zgody na przetwarzanie danych osobowych):\n<ol><li>drogą pocztową: Media Service Zawada sp.  z o.o. z siedzibą: 04-028 Warszawa, al. Stanów Zjednoczonych 51,</li>\n<li>za pośrednictwem poczty elektronicznej: <a href=\"mailto:kontakt@konkursiaki.pl\">kontakt@konkursiaki.pl</a>, telefonicznie: +48 22870 53 43;</li>\n<li>faxem: +48 22 870 75 51.</li>\n</ol></li>\n<li>Koszt połączenia telefonicznego Użytkownika z podanym powyżej numerem Administratora nie będzie wyższy niż normalny koszt zwykłych połączeń telefonicznych ustalonych przez dostawcę usług telefonicznych, z jakich korzysta Użytkownik.</li>\n<li>Media Service Zawada sp. z o.o. stosuje odpowiednie środki bezpieczeństwa w celu ochrony danych przed nieupoważnionym dostępem, nieupoważnioną zmianą, ujawnieniem lub zniszczeniem. Zaliczają się do nich wewnętrzne kontrole zebranych danych, procedury przechowywania i przetwarzania oraz środki bezpieczeństwa, w tym odpowiednie algorytmy szyfrowania i fizyczne środki bezpieczeństwa mające na celu ochronę przed nieupoważnionym dostępem do systemów, w których przechowywane są dane osobowe.</li>\n<li><span>Polityka plików \"cookies\"</span>\n<ol><li>Poprzez pliki „cookies\" należy rozumieć dane informatyczne, w szczególności pliki tekstowe, przechowywane w urządzeniach końcowych użytkowników przeznaczone do korzystania ze stron internetowych. Pliki te pozwalają rozpoznać urządzenie użytkownika i odpowiednio wyświetlić stronę internetową dostosowaną do jego indywidualnych preferencji. „Cookies\" zazwyczaj zawierają nazwę strony internetowej z której pochodzą, czas przechowywania ich na urządzeniu końcowym oraz unikalny numer.</li>\n<li>Pliki „cookies\" używane są w celu dostosowania zawartości stron internetowych do preferencji użytkownika oraz optymalizacji korzystania ze stron internetowych. Używane są również w celu tworzenia anonimowych, zagregowanych statystyk, które pomagają zrozumieć w jaki sposób użytkownik korzysta ze stron internetowych co umożliwia ulepszanie ich struktury i zawartości, z wyłączeniem personalnej identyfikacji użytkownika.</li>\n<li>Stosowane są dwa rodzaje plików „cookies\" – „sesyjne\" oraz „stałe\". Pierwsze z nich są plikami tymczasowymi, które pozostają na urządzeniu użytkownika, aż do wylogowania ze strony internetowej lub wyłączenia oprogramowania (przeglądarki internetowej). „Stałe\" pliki pozostają na urządzeniu użytkownika przez czas określony w parametrach plików „cookies\" albo do momentu ich ręcznego usunięcia przez użytkownika. Pliki „cookies\" wykorzystywane przez partnerów operatora strony internetowej, w tym w szczególności użytkowników strony internetowej, podlegają ich własnej polityce prywatności.</li>\n<li>Dane osobowe gromadzone przy użyciu plików „cookies\" mogą być zbierane wyłącznie w celu wykonywania określonych funkcji na rzecz użytkownika. Takie dane są zaszyfrowane w sposób uniemożliwiający dostęp do nich osobom nieuprawnionym.</li>\n</ol><p><strong>Administrator przekazuje Użytkownikowi portalu, którego dane przetwarza, dodatkowo poniższe informacje: </strong></p>\n</li>\n<li><strong>Kontakt z Inspektorem Ochrony Danych: </strong>\n<p>tel.:48 22 870 53 43 , email: <a href=\"mailto:pkoc@msz.com.pl.pl\">pkoc@msz.com.pl.pl</a></p>\n</li>\n<li><strong>Cel przetwarzania</strong>:<strong> </strong>organizacja i przeprowadzenie konkursów organizowanych przez Administratora; obejmuje to konkursy ogłaszane w czasopismach oraz na stronie WWW Administratora; o ile zostanie udzielona zgoda dane mogą być przetwarzane w celach marketingowych. Przekazane dane mają umożliwić przekazanie nagród laureatom,</li>\n<li><strong>Podstawa prawna przetwarzanych danych : </strong>dane są przetwarzane w oparciu:\n<p>a/ o <strong>udzieloną zgodę</strong> (rodzica albo opiekuna prawnego) tj. art. 6 ust. 1 lit. b,</p>\n<p>b/ na podstawie art. 6 ust. 1 lit. f. RODO, kiedy dane przetwarzane są na potrzeby konkursów a nie będzie konieczna zgoda rodzica/opiekuna prawnego</p>\n<p>i zachodzi niezbędność przetwarzania do celów wynikających z prawnie uzasadnionych interesów realizowanych przez administratora lub przez stronę trzecią,</p>\n<p>c/ na podstawie art. 6 ust. 1 lit. f. RODO w przypadku marketingu bezpośredniego tj. kiedy zachodzi niezbędność przetwarzania do celów wynikających z prawnie uzasadnionych interesów realizowanych przez administratora lub przez stronę trzecią i nie zachodzi konieczność uzyskania zgody uprawnionego.</p>\n</li>\n<li><strong>Czas przetwarzania danych:</strong> dane będą przetwarzane, w zależności, który okres będzie dłuższy: a/ zrealizowania celu, w jakim były zbierane i przetwarzane, tj. do momentu zakończenia poszczególnego konkursu tj. wybrania laureatów, b/ upływu okresu zgłaszania reklamacji przez uczestników, określonych w regulaminie konkursu lub przepisów prawa, w tym dot. konsumentów, c/ w przypadku laureatów, którzy otrzymali nagrody, przez okres jaki jest niezbędny do przekazania nagrody i upływu okresu zgłaszania reklamacji określonych w regulaminie konkursu lub przepisów prawa, w tym dotyczących konsumentów albo do upływu okresu wynikającego z przepisów prawa podatkowego.</li>\n<li><strong>Odbiorcy danych: </strong>w określonych przypadkach np. wykonywanie czynności na potrzeby marketingu bezpośredniego, dane osobowe mogą być przekazywane do osób trzecich, tj. podmiotów, których przedmiotem działalności są działania marketingowe. W takim przypadku dane będą przekazywane w oparciu o umowę, która będzie spełniać wymagania RODO, w tym zawierać zobowiązanie takiego podmiotu do zachowania tajemnicy.</li>\n<li><strong>Przysługujące prawa:</strong> Użytkownik portalu (uczestnik konkursów) udostępniający dane, ma wynikające z RODO następujące prawa:\n<p>a/ prawo do żądania od administratora dostępu do treści swoich danych – art. 15,</p>\n<p>b/ prawo do sprostowania danych – art. 16,</p>\n<p>c/ prawo do usunięcia danych, „<strong>prawo do bycia zapomnianym\"</strong> - art. 17,</p>\n<p>d/ prawo do ograniczenia przetwarzania -art. 18,</p>\n<p>e/ prawo do wniesienia sprzeciwu wobec przetwarzania, w przypadku marketingu bezpośredniego - art. 21,</p>\n<p>f/ prawo do przenoszenia danych – art. 20,</p>\n<p>g/ prawo wniesienia skargi do organu nadzorczego - art. 77,</p>\n<p>h/ kiedy przetwarzanie odbywa się na podstawie zgody, prawo do <strong>cofnięcia zgody</strong> w dowolnym momencie, przy czym pozostaje to bez wpływu na zgodność z prawem przetwarzania, którego dokonano na podstawie zgody przed jej cofnięciem.</p>\n<p><span>UWAGA: udostępniający ma prawo do wycofania zgody w sposób według własnego wyboru, w sposób, który nie będzie dla niego uciążliwy i co będzie dla niego równie łatwe jak i wyrażenia zgody. Wycofać zgodę można w szczególności przesyłając swoje żądanie na adres poczty elektronicznej Administratora</span>: <a href=\"mailto:kontakt@msz.com.pl\">kontakt@msz.com.pl</a></p>\n</li>\n<li><strong>Charakter podania danych: </strong>uczestnik konkursu, chcąc w nim uczestniczyć podaje<strong> dane dobrowolnie. </strong></li>\n</ol>',1,'2018-06-13 16:13:30',0,NULL,0,NULL,0),(5,'FAQ','faq','<h1>FAQ</h1><h3>Najczęściej zadawane pytania</h3>\n<p> </p>\n<ol><li><strong>Konkursy nie działają lub nie działają poprawnie.</strong><br />\n	Jeśli zauważyłeś, że konkursy nie działają poprawnie lub w ogóle nie startują, upewnij się, czy masz dostęp do szerokopasmowego Internetu o prędkości min. 512 Kbit, czy Twój komputer ma 1GB RAM pamięci lub więcej i procesor 1GHz lub więcej, oraz czy korzystasz z następujących przeglądarek: Mozilla Firefox wersja 17.0 lub wyższa, Google Chrome wersja 23. lub wyższa, Internet Explorer wersja 9. lub wyższa, Safari wersja 5. lub wyższa. Sprawdź też, czy masz zainstalowany Flash Player.\n<p>	 </p></li>\n<li><strong>Niektóre wyniki wyglądają na nierealne.</strong><br />\n	Ranking konkursu jest weryfikowany na bieżąco podczas trwania konkursu, jak również zaraz po jego zakończeniu, tuż przed przyznaniem nagród. Organizator usuwa z konkursu Użytkowników w przypadku uzasadnionego podejrzenia o oszustwo.\n<p>	 </p></li>\n<li><strong>Otrzymałem/am informację o tym, że moje dziecko zarejestrowało się w waszym serwisie. Nie życzę sobie tego. / Mój adres mailowy został wykorzystany do stworzenia konta bez mojej zgody. Jak usunąć konto w serwisie konkursiaki.pl?</strong><br />\n	Usunięcie konta w serwisie konkursiaki.pl jest bardzo proste. Należy się zalogować w serwisie i w zakładce Moje konto wybrać Mój profil. Następnie po kliknięciu przycisku Edytuj profil przejdziemy do formularza edycji profilu, na samym dole znajduje się przycisk Anuluj konto.\n<p>	 </p></li>\n<li><strong>Podczas rejestracji podałem adres korespondencyjny, który uległ zmianie.</strong><br />\n	W każdej chwili możesz zmienić adres poprzez edycję profilu w zakładce Moje konto. Ponadto w przypadku wygranej w konkursie każdorazowo otrzymasz e-mail, za pomocą którego będziesz mógł potwierdzić adres lub dokonać zmiany.\n<p>	 </p></li>\n<li><strong>Czym różnią się odznaki od rangi użytkownika?</strong><br />\n	Odznaki przyznawane są Użytkownikom za określoną częstotliwość poszczególnych aktywności. Ranga użytkownika świadczy natomiast o liczbie zdobytych punktów, którymi premiujemy poszczególne aktywności. Więcej na temat odznak oraz rangi użytkownika można znaleźć w <a href=\"16\" target=\"_blank\">regulaminie serwisu</a>.\n<p>	 </p></li>\n<li><strong>Co dają mi punkty w rankingu serwisu?</strong><br />\n	Punkty w rankingu świadczą o zaangażowaniu Użytkownika. Najaktywniejsi i najbardziej utytułowani Użytkownicy będą nagradzani. Więcej na temat punktacji w rankingu można znaleźć w<a href=\"16\" target=\"_blank\"> regulaminie serwisu</a>.<br />\n	 </li>\n<li><strong>Nie otrzymałam/em jeszcze nagrody.</strong><br />\n	Nagrody przyznane w konkursach organizowanych w ramach serwisu wysyłane są pocztą – przesyłką pocztową w terminie 6 tygodni od momentu opublikowania listy laureatów w serwisie. Wysłanie nagrody jest poprzedzone e-mailem od Administratora z prośbą o potwierdzenie adresu, na który ma zostać przesłana nagroda. Jeśli po upływie powyższego terminu nagroda nie dotarła lub jeśli od momentu potwierdzenia adresu uległ on zmianie, prosimy o kontakt z <a href=\"mailto:kontakt@konkursiaki.pl\">kontakt@konkursiaki.pl</a>.\n<p>	 </p></li>\n<li><strong>Po zakończeniu konkursu byłem wysoko w rankingu, a teraz mnie nie ma.</strong><br />\n	Jeśli Twojego wyniku nie ma w rankingu konkursu to znaczy, że zostałeś z niego usunięty ze względu na podejrzenie o oszustwo. Powinieneś/aś otrzymać e-mail z taką informacją. Jeśli go nie otrzymałeś/Aś, sprawdź folder spam w swojej skrzynce lub w programie pocztowym. W celu uzyskania szczegółowych informacji, prosimy o kontakt z <a href=\"mailto:kontakt@konkursiaki.pl\">kontakt@konkursiaki.pl</a>.\n<p>	 </p></li>\n<li><strong>Jak dodać/zaprosić znajomych?</strong><br />\n	Jeśli chcesz do wspólnej zabawy na konkursiaki.pl zaprosić znajomych, którzy jeszcze nie są zarejestrowani w naszym serwisie, możesz skorzystać z formularza Zaproś znajomych. Formularz pojawia się zawsze po zalogowaniu. Możesz skorzystać również z opcji Zaproś znajomych, dostępnej w zakładce Moje konto. Pamiętaj, że każdy znajomy, który zarejestruje się na konkursiaki.pl za sprawą Twojego zaproszenia, to 5 punktów w rankingu dla Ciebie.\n<p>	 </p></li>\n<li><strong>Jak usunąć znajomych?</strong><br />\n	W zakładce Moje konto wybierz opcję Moi znajomi. Przy każdym znajomym jest umieszczony przycisk Usuń znajomego.\n<p>	 </p></li>\n<li><strong>Jak mogę zmienić swoje dane, zaktualizować swój profil?</strong><br />\n	W zakładce Moje konto wybierz opcję Mój profil, wyświetli się strona z informacjami na temat Twojego profilu. Możesz na niej za pomocą przycisku Edytuj profil zmieniać dane dotyczące: adresu zamieszkania, rodzica oraz swojego adresu e-mail.<br />\n	W przypadku tego ostatniego musisz podać aktualne hasło. Możesz też zmienić swój awatar poprzez kliknięcie przycisku Edytuj znajdującego się pod awatarem. Jeśli chcesz dodać lub zmienić Ulubione postacie lub Moje zajawki, kliknij przycisk Edytuj znajdujący się obok tych sekcji.\n<p>	 </p></li>\n<li><strong>Jak uzyskać nowe hasło?</strong><br />\n	Jeśli nie pamiętasz swojego hasła i nie możesz zalogować się do serwisu, na stronie logowania kliknij link Nie pamiętasz hasła? Następnie w oknie tekstowym wpisz nazwę użytkownika, czyli nick lub adres e-mail, którego używałeś do zarejestrowania się w serwisie. Na ten adres zostanie wysłana wiadomość z linkiem do strony, na której będziesz mógł utworzyć nowe hasło.<br />\n	Jeśli jesteś zalogowany, ale z jakichś powodów chcesz zmienić hasło, w zakładce Moje konto wybierz opcję Mój profil, następnie kliknij Edytuj profil. Wyświetli się formularz, w którym po podaniu obecnego hasła będziesz mógł utworzyć nowe.\n<p>	 </p></li>\n<li><strong>Dlaczego moje konto zostało zablokowane?</strong><br />\n	Istnieją 3 powody, dla których konto w serwisie może zostać zablokowane: 5 razy podano nieprawidłowe hasło lub login, w tym przypadku konto zostanie odblokowane po około 15 minutach, naruszony został jeden z punktów regulaminu serwisu lub konkursu, powstało podejrzenie oszustwa w konkursie. W celu uzyskania szczegółowych informacji, prosimy o kontakt z <a href=\"mailto:kontakt@konkursiaki.pl\">kontakt@konkursiaki.pl</a>.</li>\n</ol>',1,'2018-06-13 16:13:30',0,NULL,0,NULL,0),(6,'Kontakt','kontakt','<h1>Kontakt</h1><h2>Masz pytania? Napisz do nas:</h2>\n\n<p>(w treści maila podaj swojego nicka)</p>\n\n<p>admin@konkursiaki.pl</p>\n\n<h3>Siedziba firmy:</h3>\n\n<p>Media Service Zawada sp. z o.o.<br />\nal. Stan&oacute;w Zjednoczonych 51<br />\n04-028 Warszawa<br />\nTel.: +48 22 870 53 43<br />\nFax.: +48 22 870 75 51</p>\n\n<p>wysyłka nagr&oacute;d: <a href=\"mailto:kontakt@konkursiaki.pl\">kontakt@konkursiaki.pl</a></p>\n\n<p>obsługa techniczna: admin@konkursiaki.pl</p>',1,'2018-06-13 16:13:30',0,NULL,0,NULL,0);
/*!40000 ALTER TABLE `_static_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_user_badges`
--

DROP TABLE IF EXISTS `_user_badges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_user_badges` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `badge_id` int(11) unsigned NOT NULL DEFAULT '0',
  `given_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=64848 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Tabela odznak uÅ¼ytkownika';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_user_badges`
--
-- WHERE:  1 limit 100

LOCK TABLES `_user_badges` WRITE;
/*!40000 ALTER TABLE `_user_badges` DISABLE KEYS */;
INSERT INTO `_user_badges` (`id`, `user_id`, `badge_id`, `given_at`) VALUES (6,2,1,'2015-01-14 00:00:00'),(8,2,3,'2016-01-12 00:00:00'),(10,2,5,'2016-04-17 00:00:00'),(11,3,1,'2015-03-29 00:00:00'),(12,3,2,'2016-04-22 00:00:00'),(13,3,3,'2016-10-27 00:00:00'),(14,3,4,'2016-03-13 00:00:00'),(15,3,5,'2015-07-09 00:00:00'),(16,6,1,'2016-01-02 00:00:00'),(17,6,2,'2016-06-16 00:00:00'),(18,6,3,'2015-04-13 00:00:00'),(19,6,4,'2016-01-12 00:00:00'),(20,6,5,'2015-04-25 00:00:00'),(21,8,1,'2015-06-22 00:00:00'),(22,8,2,'2016-06-02 00:00:00'),(23,8,3,'2016-09-06 00:00:00'),(24,8,4,'2015-02-27 00:00:00'),(25,8,5,'2016-09-28 00:00:00'),(26,5,1,'2015-03-28 00:00:00'),(27,5,2,'2016-12-13 00:00:00'),(28,5,3,'2016-01-21 00:00:00'),(29,5,4,'2016-06-02 00:00:00'),(30,5,5,'2016-12-05 00:00:00'),(31,4,1,'2016-05-21 00:00:00'),(32,4,2,'2016-02-26 00:00:00'),(33,4,3,'2016-08-10 00:00:00'),(34,4,4,'2015-08-02 00:00:00'),(35,4,5,'2015-02-03 00:00:00'),(36,7,1,'2015-09-14 00:00:00'),(37,7,2,'2016-03-29 00:00:00'),(38,7,3,'2015-02-06 00:00:00'),(39,7,4,'2015-10-08 00:00:00'),(40,7,5,'2016-07-19 00:00:00'),(41,1,1,'2016-06-10 00:00:00'),(43,1,3,'2015-06-17 00:00:00'),(44,1,4,'2015-08-17 00:00:00'),(45,1,5,'2016-10-01 00:00:00'),(46,9,1,'2015-11-18 00:00:00'),(47,9,2,'2016-02-23 00:00:00'),(48,9,3,'2016-02-04 00:00:00'),(49,9,4,'2015-01-11 00:00:00'),(50,9,5,'2015-11-10 00:00:00'),(65,2,2,'2015-08-27 00:00:00'),(66,3,2,'2015-02-23 00:00:00'),(67,4,2,'2015-10-10 00:00:00'),(68,5,2,'2016-06-04 00:00:00'),(69,6,2,'2015-10-24 00:00:00'),(70,7,2,'2016-10-11 00:00:00'),(71,8,2,'2015-06-19 00:00:00'),(80,2,2,'2016-07-06 00:00:00'),(81,3,2,'2015-08-18 00:00:00'),(82,4,2,'2015-08-06 00:00:00'),(83,5,2,'2016-02-05 00:00:00'),(84,171,1,'2018-06-22 16:18:02'),(85,239,1,'2018-06-22 16:18:02'),(86,265,1,'2018-06-22 16:18:02'),(87,338,1,'2018-06-22 16:18:02'),(88,408,1,'2018-06-22 16:18:02'),(89,447,1,'2018-06-22 16:18:02'),(90,485,1,'2018-06-22 16:18:02'),(91,595,1,'2018-06-22 16:18:02'),(92,651,1,'2018-06-22 16:18:02'),(93,668,1,'2018-06-22 16:18:02'),(94,724,1,'2018-06-22 16:18:02'),(95,738,1,'2018-06-22 16:18:02'),(96,739,1,'2018-06-22 16:18:02'),(97,771,1,'2018-06-22 16:18:02'),(98,846,1,'2018-06-22 16:18:02'),(99,850,1,'2018-06-22 16:18:02'),(100,999,1,'2018-06-22 16:18:02'),(101,1004,1,'2018-06-22 16:18:02'),(102,1029,1,'2018-06-22 16:18:02'),(103,1042,1,'2018-06-22 16:18:02'),(104,1045,1,'2018-06-22 16:18:02'),(105,1057,1,'2018-06-22 16:18:02'),(106,1063,1,'2018-06-22 16:18:02'),(107,1110,1,'2018-06-22 16:18:02'),(108,1170,1,'2018-06-22 16:18:02'),(109,1186,1,'2018-06-22 16:18:02'),(110,1277,1,'2018-06-22 16:18:02'),(111,1280,1,'2018-06-22 16:18:02'),(112,1334,1,'2018-06-22 16:18:02'),(113,1340,1,'2018-06-22 16:18:02'),(114,1341,1,'2018-06-22 16:18:02'),(115,1348,1,'2018-06-22 16:18:02'),(116,1391,1,'2018-06-22 16:18:02'),(117,1394,1,'2018-06-22 16:18:02'),(118,1408,1,'2018-06-22 16:18:02'),(119,1458,1,'2018-06-22 16:18:02'),(120,1496,1,'2018-06-22 16:18:02'),(121,1648,1,'2018-06-22 16:18:02'),(122,1661,1,'2018-06-22 16:18:02'),(123,1671,1,'2018-06-22 16:18:02'),(124,1673,1,'2018-06-22 16:18:02'),(125,1674,1,'2018-06-22 16:18:02'),(126,1714,1,'2018-06-22 16:18:02'),(127,1737,1,'2018-06-22 16:18:02'),(128,1745,1,'2018-06-22 16:18:02'),(129,1797,1,'2018-06-22 16:18:02'),(130,1812,1,'2018-06-22 16:18:02');
/*!40000 ALTER TABLE `_user_badges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_user_logins`
--

DROP TABLE IF EXISTS `_user_logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_user_logins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT '0',
  `session_id` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `login_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `logout_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Rejestracja logowania i wylogowania uÅ¼ytkownikÃ³w';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_user_logins`
--
-- WHERE:  1 limit 100

LOCK TABLES `_user_logins` WRITE;
/*!40000 ALTER TABLE `_user_logins` DISABLE KEYS */;
INSERT INTO `_user_logins` (`id`, `user_id`, `session_id`, `login_at`, `logout_at`) VALUES (1,11,'gmjonkgrgu1eiterci1d6hktt6','2018-06-20 14:46:50','2018-06-20 17:22:50'),(2,2,'51258frlicjmr5cifcecd42bg5','2018-06-21 10:08:28',NULL),(3,2,'ojt7kbf654gh7jbst29o5vfa25','2018-06-21 19:36:02',NULL),(4,2,'gg3dst0j5hnv4ft5ifs9m4a5b0','2018-06-22 11:47:05',NULL),(5,2,'geuouc713oboppkmem38no78u1','2018-06-22 12:12:40',NULL),(6,2,'bdn5lv9lrgedqsj0en8k86p406','2018-06-22 13:07:31','2018-06-22 15:12:55'),(7,12,'96nilos9v24udk90rdkqio63h0','2018-06-22 13:13:36','2018-06-22 15:15:06'),(8,2,'tndpcd222o7dsbihmvh1ougm43','2018-06-22 13:15:15',NULL),(9,2,'msu2cc1pi5aril4rgrj3ptg3m4','2018-06-22 15:22:25',NULL),(10,2,'rru2abeqq4ii0pq2o01dt3oq83','2018-06-22 18:45:09',NULL),(11,2,'ri73br44vvrl00im819olusho0','2018-06-22 18:45:52',NULL),(12,2,'e50faffspq2v24qt6m1q6tau85','2018-06-25 14:04:19',NULL),(13,2,'gn76skoqmgjbujfm2di8ke5u92','2018-06-25 16:50:20',NULL),(14,2,'2q0rb9tnqhi1tmp7u5cashlrn3','2018-06-26 06:05:03',NULL),(15,2,'at8lqkrj1rd1sgmoqtbdklisf3','2018-06-26 07:11:25',NULL),(16,2,'n10qjj1tuk2crishlmk1n6h8o4','2018-06-26 11:52:44','2018-06-26 13:53:54'),(17,2,'6t8ahoaqrkbp3rbor4e7bvk5q0','2018-06-26 12:00:48',NULL),(18,2,'tin2fac1hucsm4k7g3uhtd55f1','2018-06-26 12:59:55',NULL),(19,2,'n883erfulp2aqr142o64dj3n82','2018-06-26 15:20:41','2018-06-26 17:28:44'),(20,2,'ojvtqifiie0q4ngg7i8h8cg446','2018-06-26 15:31:56',NULL),(21,2,'prmng7j0cl1c0cpkl3a6rpdcm2','2018-06-26 17:29:32','2018-06-26 22:00:10'),(22,15,'om315f6vei8s8mhrb3qfkcm7d6','2018-06-26 20:03:38','2018-06-26 22:13:39'),(23,2,'6d81uova8513tplagi7ghejca1','2018-06-27 08:54:12','2018-06-27 11:52:14'),(24,1,'omcjapq1qpu379d0l6j49s11g3','2018-06-27 09:48:34','2018-06-27 11:50:31'),(25,1,'seq2o4b9p931jsdam7696a6mu4','2018-06-27 09:50:41',NULL),(26,1,'ood8iamo9c9r1c8gqio60ucsl4','2018-06-27 09:55:38','2018-06-27 11:58:25'),(27,1778,'k45ooi5bg8ibss48gmjeu65ah4','2018-06-27 09:59:47','2018-06-27 12:00:02'),(28,1778,'1n01h0gqblnadca05o7udmgjb3','2018-06-27 10:00:21',NULL),(29,1,'cj29b1h9sg68tv39ms05vva1n2','2018-06-27 11:03:25',NULL),(30,1778,'jg2fi9ts90hvf315mt8g4q6rc2','2018-06-27 11:15:57','2018-06-27 14:50:16'),(31,1,'jrf1236paqjgkonb55tm76jui6','2018-06-27 12:23:23',NULL),(32,1778,'23bo2gjlrh12vvgc0kcmvqo5r0','2018-06-27 13:35:25',NULL),(33,62951,'gca8ufctgsnc1oavu4tbr3d2r5','2018-06-27 15:09:03',NULL),(34,1778,'c4oedb4099uokplpqrrq3juu32','2018-06-27 19:49:52',NULL),(35,62951,'tr6b2fm6jpkp4trdrktajeds07','2018-06-28 07:22:11',NULL),(36,1778,'bdbfng2fabqnifb28j32lu3tl4','2018-06-28 07:42:54',NULL),(37,1778,'660fd2co3tvvjenqckh0u9ndt6','2018-06-28 08:20:42',NULL),(38,62951,'gbjit3g7ikm21g82428ev4t374','2018-06-28 08:49:27',NULL),(39,1,'2a39hbpa33mjmf4ts4o2q5pu85','2018-06-28 09:45:17',NULL),(40,235,'qk6r2anjqecku0h0ofonse3fl4','2018-06-28 09:50:42','2018-06-28 12:03:06'),(41,1778,'uh3hv2fgl3c67mbrlhu3clp851','2018-06-28 09:59:52',NULL),(42,235,'741n9lunmbksr6ca72v05ife13','2018-06-28 10:03:27',NULL);
/*!40000 ALTER TABLE `_user_logins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_user_movies`
--

DROP TABLE IF EXISTS `_user_movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_user_movies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `description` text COLLATE utf8_polish_ci,
  `video_url` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `image_url` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `link_url` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `begins_at` datetime DEFAULT NULL,
  `ends_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(10) DEFAULT '0',
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(10) DEFAULT '0',
  `marked_as_deleted_at` datetime DEFAULT NULL,
  `marked_as_deleted_by` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Filmy uÅ¼ytkownikÃ³w';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_user_movies`
--
-- WHERE:  1 limit 100

LOCK TABLES `_user_movies` WRITE;
/*!40000 ALTER TABLE `_user_movies` DISABLE KEYS */;
INSERT INTO `_user_movies` (`id`, `user_id`, `name`, `description`, `video_url`, `image_url`, `link_url`, `is_active`, `begins_at`, `ends_at`, `created_at`, `created_by`, `updated_at`, `updated_by`, `marked_as_deleted_at`, `marked_as_deleted_by`) VALUES (1,1,'User video 1','description','/uploads/user_movies/user_movies/movie-1.mov','/uploads/user_movie-1.jpg','http://konkursiaki.pl',1,'2018-02-02 00:00:00','2018-02-20 00:00:00','2018-06-13 16:13:30',0,NULL,0,NULL,0),(2,2,'User video 2','description','/uploads/user_movies/user_movies/movie-2.mov','/uploads/user_movie-2.jpg','http://konkursiaki.pl',1,'2018-02-02 00:00:00','2018-02-20 00:00:00','2018-06-13 16:13:30',0,NULL,0,NULL,0),(3,2,'User video 3','description','/uploads/user_movies/user_movies/movie-1.mov','/uploads/user_movie-3.jpg','http://konkursiaki.pl',1,'2018-02-02 00:00:00','2018-02-20 00:00:00','2018-06-13 16:13:30',0,NULL,0,NULL,0),(4,1,'User video 4','description','/uploads/user_movies/user_movies/movie-1.mov','/uploads/user_movie-4.jpg','http://konkursiaki.pl',1,'2018-02-02 00:00:00','2018-02-20 00:00:00','2018-06-13 16:13:30',0,NULL,0,NULL,0),(5,2,'User video 5','description','/uploads/user_movies/user_movies/movie-1.mov','/uploads/user_movie-3.jpg','http://konkursiaki.pl',1,'2018-02-02 00:00:00','2018-02-20 00:00:00','2018-06-13 16:13:30',0,NULL,0,NULL,0),(6,1,'User video 6','description','/uploads/user_movies/user_movies/movie-2.mov','/uploads/user_movie-2.jpg','http://konkursiaki.pl',1,'2018-02-02 00:00:00','2018-02-20 00:00:00','2018-06-13 16:13:30',0,NULL,0,NULL,0);
/*!40000 ALTER TABLE `_user_movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_user_movies_likes`
--

DROP TABLE IF EXISTS `_user_movies_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_user_movies_likes` (
  `user_id` int(10) unsigned NOT NULL,
  `user_movie_id` int(10) unsigned NOT NULL,
  `given_at` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`,`user_movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Polubienia filmÃ³w uÅ¼ytkownikÃ³w';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_user_movies_likes`
--
-- WHERE:  1 limit 100

LOCK TABLES `_user_movies_likes` WRITE;
/*!40000 ALTER TABLE `_user_movies_likes` DISABLE KEYS */;
INSERT INTO `_user_movies_likes` (`user_id`, `user_movie_id`, `given_at`) VALUES (1,3,NULL),(1,4,NULL),(2,1,NULL),(2,4,NULL);
/*!40000 ALTER TABLE `_user_movies_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_users`
--

DROP TABLE IF EXISTS `_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL DEFAULT '2',
  `nick` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `surname` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `avatar_url` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `password_hash` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `activation_hash` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `activated_at` datetime DEFAULT NULL,
  `password_reset_hash` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `password_reset_expires_at` datetime DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT '0',
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT '0',
  `marked_as_deleted_at` datetime DEFAULT NULL,
  `marked_as_deleted_by` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=64084 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='UÅ¼ytkownicy';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_users`
--
-- WHERE:  1 limit 100

LOCK TABLES `_users` WRITE;
/*!40000 ALTER TABLE `_users` DISABLE KEYS */;
INSERT INTO `_users` (`id`, `role_id`, `nick`, `email`, `name`, `surname`, `avatar_url`, `is_active`, `password_hash`, `activation_hash`, `activated_at`, `password_reset_hash`, `password_reset_expires_at`, `last_login_at`, `created_at`, `created_by`, `updated_at`, `updated_by`, `marked_as_deleted_at`, `marked_as_deleted_by`) VALUES (1,1,'admin','jakub.godawa@gmail.com','Jan2','Jan','picture-1-1403505158.gif',1,'$2y$10$lfcDrSP/sMBiKztmjL5WBOWG0HRXptBbYeqYx39TuMhxaNbfD69B6',NULL,NULL,NULL,NULL,'2018-06-26 12:29:00','2012-08-18 15:01:31',0,'2018-06-27 11:48:24',0,NULL,0),(3,2,'basia99','basia@demo.com','Basia','Grymas',NULL,1,'$2y$10$EwF6/cRU8hVn8b7j.WswyeLmie6oYOI83ljS3WvWW9uu4GOzevOOy',NULL,NULL,NULL,NULL,NULL,'2018-06-13 16:13:30',0,NULL,0,'2018-06-14 16:45:54',2),(4,2,'sta13','stasia@demo.com','Stasia','Hejsiup',NULL,1,'$2y$10$EwF6/cRU8hVn8b7j.WswyeLmie6oYOI83ljS3WvWW9uu4GOzevOOy',NULL,NULL,NULL,NULL,NULL,'2018-06-13 16:13:30',0,NULL,0,'2018-06-14 16:45:57',2),(5,2,'kkmaster','krzys@demo.com','Krzyś','Kowal',NULL,1,'$2y$10$EwF6/cRU8hVn8b7j.WswyeLmie6oYOI83ljS3WvWW9uu4GOzevOOy',NULL,NULL,NULL,NULL,NULL,'2018-06-13 16:13:30',0,NULL,0,'2018-06-14 16:45:59',2),(6,2,'grzechu','grzes@demo.com','Grześ','Stawo',NULL,1,'$2y$10$EwF6/cRU8hVn8b7j.WswyeLmie6oYOI83ljS3WvWW9uu4GOzevOOy',NULL,NULL,NULL,NULL,NULL,'2018-06-13 16:13:30',0,NULL,0,'2018-06-14 16:46:01',2),(7,2,'tomo','tomek@demo.com','Tomek','Dynda',NULL,1,'$2y$10$EwF6/cRU8hVn8b7j.WswyeLmie6oYOI83ljS3WvWW9uu4GOzevOOy',NULL,NULL,NULL,NULL,NULL,'2018-06-13 16:13:30',0,NULL,0,'2018-06-14 16:46:03',2),(8,2,'banzai11','jasia@demo.com','Jasia','Dżem',NULL,1,'$2y$10$EwF6/cRU8hVn8b7j.WswyeLmie6oYOI83ljS3WvWW9uu4GOzevOOy',NULL,NULL,NULL,NULL,NULL,'2018-06-13 16:13:30',0,NULL,0,'2018-06-14 16:46:07',2),(9,2,'zuzu','zuzia@demo.com','Zuzia','Kapusta',NULL,1,'$2y$10$EwF6/cRU8hVn8b7j.WswyeLmie6oYOI83ljS3WvWW9uu4GOzevOOy',NULL,NULL,NULL,NULL,NULL,'2018-06-13 16:13:30',0,NULL,0,'2018-06-14 16:46:10',2),(10,2,'aaaappp11','adam@demo.com','Adam','Ginger',NULL,1,'$2y$10$EwF6/cRU8hVn8b7j.WswyeLmie6oYOI83ljS3WvWW9uu4GOzevOOy',NULL,NULL,NULL,NULL,NULL,'2018-06-13 16:13:30',0,NULL,0,'2018-06-14 16:46:12',2),(12,2,'źżćóęńłąŻŹĆÓŁĘŃĄŚś','jakub.godawa+3@gmail.com','Kuba Godawa','Godawa','',1,'$2y$10$UBWZZQsxx8XxjrV8lFaA8Op28YZidKjRoN8w1LtURybEm8bjjZrfy','06949caef04bd9b2832a457931da0ab32c4a6cae578b30405e200834f38d792b',NULL,NULL,NULL,NULL,'2018-06-20 15:23:23',0,'2018-06-22 15:12:48',2,NULL,0),(14,2,'vysogot111test','jakub.godawa+61@gmail.com','Kuba Godawa','Godawa',NULL,1,'$2y$10$p9NkW2DLmNLinVr8pdrzL.jv48JobGOfPIar108PM0UX45q5G8gxC','c178a537b7d429da',NULL,NULL,NULL,NULL,'2018-06-26 15:29:34',0,NULL,0,NULL,0),(15,2,'test123','jakub.godawa+114@gmail.com','Kuba Godawa','Godawa',NULL,1,'$2y$10$1FSeQuQB1U5M1mh.xeFjW.FVhejdEUZ3IYFB2uh.yDkB470uUhoi6','a04e2d0526347456',NULL,NULL,NULL,NULL,'2018-06-26 20:00:58',0,NULL,0,NULL,0),(37,2,'adrian','adrian@weeverlabs.com','Adrian2','Andrzejewski','http://cdn.takemefrom.com/users/avatars/konkursiak-adrian.gif',1,NULL,NULL,NULL,NULL,NULL,'2013-09-30 11:06:14','2012-08-29 11:04:01',0,NULL,0,NULL,0),(55,2,'adrian4','adrian@weeverlabs.coma','Adrian','Andrzejewski','',1,NULL,NULL,NULL,NULL,NULL,'2012-09-12 13:13:53','2012-09-07 11:06:07',0,NULL,0,NULL,0),(56,2,'adrian5','adrian5@a.a','','','',1,NULL,NULL,NULL,NULL,NULL,'2012-09-07 13:08:01','2012-09-07 11:08:01',0,NULL,0,NULL,0),(68,2,'adrian112','jassdk@na.al','asdf','sdf','',1,NULL,NULL,NULL,NULL,NULL,'1970-01-01 01:00:00','2012-09-20 08:59:29',0,NULL,0,NULL,0),(71,2,'Superkonkursiak','msz@msz.com.pl','','','',1,NULL,NULL,NULL,NULL,NULL,'2012-09-20 16:05:38','2012-09-20 13:35:19',0,NULL,0,NULL,0),(72,2,'lowcanagrod','a.blaszczyk@msz.com.pl','','','',1,NULL,NULL,NULL,NULL,NULL,'2012-09-20 15:41:20','2012-09-20 13:39:43',0,NULL,0,NULL,0),(73,2,'jupiterek','jupiterek@poczta.onet.pl','Tola','Makowska','http://cdn.takemefrom.com/users/avatars/konkursiak-jupiterek.gif',1,NULL,NULL,NULL,NULL,NULL,'2012-09-23 10:22:37','2012-09-20 13:59:27',0,NULL,0,NULL,0),(75,2,'ad4m','adam@ludwinski.net','A','B','http://cdn.takemefrom.com/users/avatars/konkursiak-ad4m.png',1,NULL,NULL,NULL,NULL,NULL,'2014-04-01 20:34:23','2012-09-20 20:21:46',0,NULL,0,NULL,0),(84,2,'adam','abcd@weeverlabs.com','','','http://cdn.takemefrom.com/users/avatars/konkursiak-adam.gif',1,NULL,NULL,NULL,NULL,NULL,'2012-09-22 05:54:46','2012-09-22 03:53:12',0,NULL,0,NULL,0),(85,2,'rowerek2004','rowerek2004@wp.pl','','','',1,NULL,NULL,NULL,NULL,NULL,'2013-09-01 12:37:05','2012-09-22 06:14:44',0,NULL,0,NULL,0),(86,2,'ppwentyl','piotr.przesmycki@onet.pl','','','',1,NULL,NULL,NULL,NULL,NULL,'2015-08-04 15:34:59','2012-09-22 06:44:33',0,NULL,0,NULL,0),(87,2,'Maciek','Maciek_Stoklosa@wp.pl','','','http://cdn.takemefrom.com/users/avatars/konkursiak-maciek.gif',1,NULL,NULL,NULL,NULL,NULL,'2012-09-23 11:30:53','2012-09-22 07:32:31',0,NULL,0,NULL,0),(88,2,'rex','stoklosap@wp.pl','','','http://cdn.takemefrom.com/users/avatars/konkursiak-rex.gif',1,NULL,NULL,NULL,NULL,NULL,'2012-09-22 10:00:42','2012-09-22 07:35:25',0,NULL,0,NULL,0),(89,2,'dawiciorpg','dawid318@vp.pl','','','',1,NULL,NULL,NULL,NULL,NULL,'2017-08-02 18:33:54','2012-09-22 08:38:25',0,NULL,0,NULL,0),(90,2,'laszka77','ewa_laszkowska@wp.pl','ewa','laszkowska','http://cdn.takemefrom.com/users/avatars/konkursiak-laszka77.png',1,NULL,NULL,NULL,NULL,NULL,'2015-09-21 11:41:31','2012-09-22 09:34:06',0,NULL,0,NULL,0),(91,2,'rj','r.jasinski@msz.com.pl','','','http://cdn.takemefrom.com/users/avatars/konkursiak-rj.gif',1,NULL,NULL,NULL,NULL,NULL,'2018-02-16 13:30:14','2012-09-22 10:17:32',0,NULL,0,NULL,0),(92,2,'michalios','michalk777@o2.pl','','','',1,NULL,NULL,NULL,NULL,NULL,'2014-02-03 22:15:04','2012-09-22 10:37:28',0,NULL,0,NULL,0),(93,2,'p_rzemo4','p_rzemo4@wp.pl','','','',1,NULL,NULL,NULL,NULL,NULL,'2012-09-22 13:32:03','2012-09-22 11:28:39',0,NULL,0,NULL,0),(94,2,'tomjan05','tomjan05@wp.pl','','','',1,NULL,NULL,NULL,NULL,NULL,'2012-09-22 14:29:45','2012-09-22 12:28:19',0,NULL,0,NULL,0),(95,2,'filios12345','filipo3@poczta.onet.pl','','','http://cdn.takemefrom.com/users/avatars/konkursiak-filios12345.gif',1,NULL,NULL,NULL,NULL,NULL,'2012-09-22 15:46:58','2012-09-22 13:43:11',0,NULL,0,NULL,0),(96,2,'erykos','bylicakolbego@amorki.pl','','','',1,NULL,NULL,NULL,NULL,NULL,'2012-09-22 16:51:46','2012-09-22 14:43:27',0,NULL,0,NULL,0),(97,2,'ikar','iki67@wp.pl','','','',1,NULL,NULL,NULL,NULL,NULL,'2012-09-22 16:58:26','2012-09-22 14:48:28',0,NULL,0,NULL,0),(98,2,'syndromdelikatnejstopy','thewanted@vp.pl','','','',1,NULL,NULL,NULL,NULL,NULL,'2012-09-22 17:01:44','2012-09-22 15:00:46',0,NULL,0,NULL,0),(99,2,'maksmistrz','dlugi1979@o2.pl','','','',1,NULL,NULL,NULL,NULL,NULL,'2012-09-22 18:13:06','2012-09-22 16:10:21',0,NULL,0,NULL,0),(100,2,'MESSI','angel2003@op.pl','','','http://cdn.takemefrom.com/users/avatars/konkursiak-messi.gif',1,NULL,NULL,NULL,NULL,NULL,'2013-11-15 17:34:21','2012-09-22 16:25:16',0,NULL,0,NULL,0),(101,2,'Bartek7879','Sylwia26@buziaczek.pl','','','',1,NULL,NULL,NULL,NULL,NULL,'2013-05-25 09:48:15','2012-09-22 17:29:43',0,NULL,0,NULL,0),(102,2,'jasio2004','kami.b@op.pl','','','',1,NULL,NULL,NULL,NULL,NULL,'2013-06-01 22:04:48','2012-09-22 18:04:45',0,NULL,0,NULL,0),(103,2,'agent','ola.goryczko@op.pl','','','http://cdn.takemefrom.com/users/avatars/konkursiak-agent.gif',1,NULL,NULL,NULL,NULL,NULL,'2014-09-06 14:11:11','2012-09-22 18:35:01',0,NULL,0,NULL,0),(104,2,'agencik','joannagoryczko@op.pl','','','http://cdn.takemefrom.com/users/avatars/konkursiak-agencik.png',1,NULL,NULL,NULL,NULL,NULL,'2015-08-31 13:12:29','2012-09-22 18:45:39',0,NULL,0,NULL,0),(105,2,'alex','aleks.h@vp.pl','','','',1,NULL,NULL,NULL,NULL,NULL,'2012-10-18 19:40:53','2012-09-22 19:10:41',0,NULL,0,NULL,0),(106,2,'Oki','iwonarad2@interia.pl','','','',1,NULL,NULL,NULL,NULL,NULL,'2012-09-29 23:50:56','2012-09-22 20:36:00',0,NULL,0,NULL,0),(107,2,'Patryk_Ziom','pati1125@buziaczek.pl','','','http://cdn.takemefrom.com/users/avatars/konkursiak-patrykziom.gif',1,NULL,NULL,NULL,NULL,NULL,'2013-02-20 17:38:31','2012-09-23 07:19:53',0,NULL,0,NULL,0),(108,2,'Antarktyda27','heheczki.babeczki@gmail.com','','','',1,NULL,NULL,NULL,NULL,NULL,'2012-10-06 12:22:08','2012-09-23 07:33:42',0,NULL,0,NULL,0),(109,2,'Lovvciana.','adrianna27@autograf.pl','','','http://cdn.takemefrom.com/users/avatars/konkursiak-lovvciana.gif',1,NULL,NULL,NULL,NULL,NULL,'2012-11-01 11:10:52','2012-09-23 08:02:16',0,NULL,0,NULL,0),(110,2,'michal','ela158@interia.eu','','','',1,NULL,NULL,NULL,NULL,NULL,'2012-09-25 16:57:43','2012-09-23 10:05:42',0,NULL,0,NULL,0),(111,2,'malentas','marekh@wp.pl','','','',1,NULL,NULL,NULL,NULL,NULL,'1970-01-01 01:00:00','2012-09-23 10:19:20',0,NULL,0,NULL,0),(112,2,'marek7','marekh7@wp.pl','','','',1,NULL,NULL,NULL,NULL,NULL,'2012-09-23 12:25:42','2012-09-23 10:25:26',0,NULL,0,NULL,0),(113,2,'lego456','jacek1977_77@02.pl','','','',1,NULL,NULL,NULL,NULL,NULL,'1970-01-01 01:00:00','2012-09-23 10:36:46',0,NULL,0,NULL,0),(114,2,'maul','lele.pi@onet.pl','','','',1,NULL,NULL,NULL,NULL,NULL,'1970-01-01 01:00:00','2012-09-23 12:07:39',0,NULL,0,NULL,0),(115,2,'alex143','ola98r@wp.pl','','','',1,NULL,NULL,NULL,NULL,NULL,'2012-09-23 14:32:53','2012-09-23 12:31:59',0,NULL,0,NULL,0),(116,2,'Beavers2000','Beavers2000@onet.pl','','','',1,NULL,NULL,NULL,NULL,NULL,'2012-10-23 20:15:40','2012-09-23 13:15:51',0,NULL,0,NULL,0),(117,2,'dorix','dorian900.00@o2.pl','','','http://cdn.takemefrom.com/users/avatars/konkursiak-dorix.png',1,NULL,NULL,NULL,NULL,NULL,'2015-08-17 00:33:22','2012-09-23 14:18:27',0,NULL,0,NULL,0),(118,2,'Vezzos','wiksa@gg.pl','','','http://cdn.takemefrom.com/users/avatars/konkursiak-vezzos.gif',1,NULL,NULL,NULL,NULL,NULL,'2012-10-23 18:53:37','2012-09-23 14:55:26',0,NULL,0,NULL,0),(119,2,'sebastian84','190306@wp.pl','','','',1,NULL,NULL,NULL,NULL,NULL,'2012-10-06 13:40:08','2012-09-23 15:52:26',0,NULL,0,NULL,0),(120,2,'scizor13','mamaprzemka@o2.pl','','','',1,NULL,NULL,NULL,NULL,NULL,'2015-03-29 17:33:01','2012-09-23 16:23:39',0,NULL,0,NULL,0),(121,2,'aleksandra130202','aleksandra1302@interia.pl','','','http://cdn.takemefrom.com/users/avatars/konkursiak-aleksandra130202.gif',1,NULL,NULL,NULL,NULL,NULL,'2015-11-21 11:18:12','2012-09-23 16:52:01',0,NULL,0,NULL,0),(122,2,'marecki','p.bardecki@interia.pl','','','',1,NULL,NULL,NULL,NULL,NULL,'1970-01-01 01:00:00','2012-09-23 17:07:45',0,NULL,0,NULL,0),(123,2,'messi2004','czacha343@o2.pl','','','http://cdn.takemefrom.com/users/avatars/konkursiak-messi2004.gif',1,NULL,NULL,NULL,NULL,NULL,'2012-10-22 19:49:29','2012-09-23 17:28:19',0,NULL,0,NULL,0),(124,2,'wojtek','gregorek_1@czat.onet.pl','','','',1,NULL,NULL,NULL,NULL,NULL,'2012-09-23 20:03:25','2012-09-23 17:59:44',0,NULL,0,NULL,0),(125,2,'gameworld1','Adrian.pawlowski2@wp.pl','','','',1,NULL,NULL,NULL,NULL,NULL,'2012-09-23 21:13:59','2012-09-23 19:08:36',0,NULL,0,NULL,0),(126,2,'Śledziu','Kamilsle@op.pl','','','',1,NULL,NULL,NULL,NULL,NULL,'1970-01-01 01:00:00','2012-09-23 19:32:43',0,NULL,0,NULL,0),(127,2,'Mlickonti','antoni.mlicki@gmail.com','','','',1,NULL,NULL,NULL,NULL,NULL,'2012-09-24 18:55:46','2012-09-23 20:00:02',0,NULL,0,NULL,0),(128,2,'bartek8828','bartosz.szczukowski@onet.pl','','','http://cdn.takemefrom.com/users/avatars/konkursiak-bartek8828.gif',1,NULL,NULL,NULL,NULL,NULL,'2013-12-07 20:49:36','2012-09-24 07:51:27',0,NULL,0,NULL,0),(129,2,'monia','monig5@wp.pl','a','a','http://cdn.takemefrom.com/users/avatars/konkursiak-monia.gif',1,NULL,NULL,NULL,NULL,NULL,'2018-02-13 13:51:05','2012-09-24 08:59:02',0,NULL,0,NULL,0),(130,2,'biedronka','margerytka7@gmail.com','','','',1,NULL,NULL,NULL,NULL,NULL,'2016-05-16 14:50:40','2012-09-24 08:59:29',0,NULL,0,NULL,0),(131,2,'Nana','m.kucharska8@chello.pl','Marta ','Ligęza','',1,NULL,NULL,NULL,NULL,NULL,'2018-05-03 17:50:32','2012-09-24 09:11:02',0,NULL,0,NULL,0),(132,2,'Tomaszon351','gormit.kemot@o2.pl','','','http://cdn.takemefrom.com/users/avatars/konkursiak-tomaszon351.png',1,NULL,NULL,NULL,NULL,NULL,'2014-10-23 18:05:25','2012-09-24 10:44:35',0,NULL,0,NULL,0),(133,2,'tajek2','gpataj@interia.pl','','','',1,NULL,NULL,NULL,NULL,NULL,'2013-07-01 22:28:13','2012-09-24 12:41:34',0,NULL,0,NULL,0),(134,2,'Tomzyk125','timek@Poczta.onet.pl','','','',1,NULL,NULL,NULL,NULL,NULL,'2012-09-24 14:50:40','2012-09-24 12:48:07',0,NULL,0,NULL,0),(135,2,'Kinia','kingaosiecka@interia.pl','','','',1,NULL,NULL,NULL,NULL,NULL,'2014-03-09 12:14:16','2012-09-24 13:28:45',0,NULL,0,NULL,0),(136,2,'ann','aannaa7@wp.pl','Anna','Kowalska','',1,NULL,NULL,NULL,NULL,NULL,'2015-09-03 10:46:06','2012-09-24 13:30:18',0,NULL,0,NULL,0),(137,2,'kawosz20','hanaha5@wp.pl','','','',1,NULL,NULL,NULL,NULL,NULL,'2012-09-24 15:52:26','2012-09-24 13:51:09',0,NULL,0,NULL,0),(138,2,'BARTEK324','BARTEK19926@O2.PL','','','',1,NULL,NULL,NULL,NULL,NULL,'2012-09-24 16:22:38','2012-09-24 14:21:26',0,NULL,0,NULL,0),(139,2,'rafix','aro9@o2.pl','','','',1,NULL,NULL,NULL,NULL,NULL,'2012-09-24 16:49:12','2012-09-24 14:48:34',0,NULL,0,NULL,0),(140,2,'kuba','goya1979@interia.eu','','','http://cdn.takemefrom.com/users/avatars/konkursiak-kuba.gif',1,NULL,NULL,NULL,NULL,NULL,'2013-01-08 13:50:38','2012-09-24 15:05:17',0,NULL,0,NULL,0),(141,2,'sebastian','dora.k@poczta.onet.pl','','','',1,NULL,NULL,NULL,NULL,NULL,'2012-09-24 17:33:13','2012-09-24 15:31:56',0,NULL,0,NULL,0),(142,2,'julek05','bpkula2@wp.pl','','','http://cdn.takemefrom.com/users/avatars/konkursiak-julek05.gif',1,NULL,NULL,NULL,NULL,NULL,'2012-09-24 17:56:39','2012-09-24 15:55:25',0,NULL,0,NULL,0),(143,2,'OLAFS','dszczypinski@wp.pl','','','',1,NULL,NULL,NULL,NULL,NULL,'2013-04-07 16:49:52','2012-09-24 16:14:47',0,NULL,0,NULL,0),(144,2,'koszmarek','kubawozniak04@gmail.com','','','',1,NULL,NULL,NULL,NULL,NULL,'2014-05-09 18:10:46','2012-09-24 16:20:00',0,NULL,0,NULL,0),(145,2,'Lonesti','kamils233@interia.pl','','','',1,NULL,NULL,NULL,NULL,NULL,'2013-10-15 17:02:27','2012-09-24 16:26:26',0,NULL,0,NULL,0),(146,2,'Bartuniu','szymczakbozena@wp.pl','','','',1,NULL,NULL,NULL,NULL,NULL,'2013-07-11 16:21:52','2012-09-24 16:32:29',0,NULL,0,NULL,0),(147,2,'Rafi7','rufio010702@wp.pl','','','http://cdn.takemefrom.com/users/avatars/konkursiak-rafi7.png',1,NULL,NULL,NULL,NULL,NULL,'2014-10-23 18:23:17','2012-09-24 16:48:22',0,NULL,0,NULL,0),(148,2,'flabi','plewkaanna@gmail.com','','','',1,NULL,NULL,NULL,NULL,NULL,'2013-02-05 19:36:36','2012-09-24 17:08:14',0,NULL,0,NULL,0),(149,2,'marcel111','p.h.u.marcel@o2.pl','','','',1,NULL,NULL,NULL,NULL,NULL,'2012-09-24 19:48:37','2012-09-24 17:48:11',0,NULL,0,NULL,0),(150,2,'piotrok','piotrok04@wp.pl','','','',1,NULL,NULL,NULL,NULL,NULL,'2012-09-30 15:21:54','2012-09-24 20:07:33',0,NULL,0,NULL,0),(151,2,'igunia91','igunia91@wp.pl','Iga','Ryngwelska','',1,NULL,NULL,NULL,NULL,NULL,'2012-09-24 23:59:31','2012-09-24 20:48:01',0,NULL,0,NULL,0),(152,2,'gwiezdnewojny3','gwiezdnewojny3@o2.pl','','','',1,NULL,NULL,NULL,NULL,NULL,'1970-01-01 01:00:00','2012-09-25 07:15:55',0,NULL,0,NULL,0),(153,2,'olaeryk','monia.sko@interia.pl','','','',1,NULL,NULL,NULL,NULL,NULL,'2015-01-30 19:23:05','2012-09-25 08:44:14',0,NULL,0,NULL,0),(154,2,'Damianusix','dw12ster@gmail.com','Damian','Wałek','http://cdn.takemefrom.com/users/avatars/konkursiak-damianusix.gif',0,NULL,NULL,NULL,NULL,NULL,'2012-10-21 12:14:01','2012-09-25 09:08:57',0,NULL,0,NULL,0),(155,2,'Mati','olo130@op.pl','','','',1,NULL,NULL,NULL,NULL,NULL,'2016-07-05 15:20:12','2012-09-25 09:23:47',0,NULL,0,NULL,0),(156,2,'kacper30124','kacper30124@wp.pl','','','',1,NULL,NULL,NULL,NULL,NULL,'2014-02-03 17:38:28','2012-09-25 10:26:33',0,NULL,0,NULL,0),(157,2,'Magaszan','szymon.janczak850@wp.pl','','','',1,NULL,NULL,NULL,NULL,NULL,'2012-09-25 15:45:20','2012-09-25 13:41:16',0,NULL,0,NULL,0),(158,2,'messi459','pawel300@op.pl','','','',1,NULL,NULL,NULL,NULL,NULL,'2012-09-26 11:55:32','2012-09-25 14:25:37',0,NULL,0,NULL,0),(159,2,'norbert05','norbert2005@op.pl','','','',1,NULL,NULL,NULL,NULL,NULL,'2015-04-06 10:36:11','2012-09-25 14:31:09',0,NULL,0,NULL,0),(160,2,'matik','mateuszstrozyk@onet.pl','','','',1,NULL,NULL,NULL,NULL,NULL,'2012-09-25 17:14:32','2012-09-25 15:12:56',0,NULL,0,NULL,0),(161,2,'Tomkol','ipap1@wp.pl','','','',1,NULL,NULL,NULL,NULL,NULL,'2013-11-25 10:21:40','2012-09-25 15:20:57',0,NULL,0,NULL,0),(162,2,'antubis','kg004@wp.pl','','','',1,NULL,NULL,NULL,NULL,NULL,'2015-02-01 12:02:24','2012-09-25 15:29:25',0,NULL,0,NULL,0),(163,2,'Triksel','sobczak_karolina@wp.pl','','','',1,NULL,NULL,NULL,NULL,NULL,'2013-06-07 14:51:28','2012-09-25 15:29:46',0,NULL,0,NULL,0);
/*!40000 ALTER TABLE `_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_video_ads`
--

DROP TABLE IF EXISTS `_video_ads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_video_ads` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `video_url` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `image_url` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `link_url` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `begins_at` datetime DEFAULT NULL,
  `ends_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(10) DEFAULT '0',
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(10) DEFAULT '0',
  `marked_as_deleted_at` datetime DEFAULT NULL,
  `marked_as_deleted_by` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Reklamy video';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_video_ads`
--
-- WHERE:  1 limit 100

LOCK TABLES `_video_ads` WRITE;
/*!40000 ALTER TABLE `_video_ads` DISABLE KEYS */;
INSERT INTO `_video_ads` (`id`, `name`, `video_url`, `image_url`, `link_url`, `is_active`, `begins_at`, `ends_at`, `created_at`, `created_by`, `updated_at`, `updated_by`, `marked_as_deleted_at`, `marked_as_deleted_by`) VALUES (1,'Video ad 1','/uploads/videos/movie-1.mov','/uploads/videos/movie-cta.jpg','http://konkursiaki.pl',1,'2018-02-02 00:00:00','2018-02-20 00:00:00','2018-06-13 16:13:30',0,NULL,0,'2018-06-14 16:20:32',2),(2,'Video ad 2','/uploads/videos/movie-2.mov','/uploads/videos/movie-cta.jpg','http://konkursiaki.pl',1,'2018-02-02 00:00:00','2018-02-20 00:00:00','2018-06-13 16:13:30',0,NULL,0,'2018-06-14 16:20:34',2),(3,'Ben 10','http://cdn.takemefrom.com/videos/ben-zielony.mp4','http://cdn.takemefrom.com/videos/Ben10_5_15_spot.jpg','https://konkursiaki.pl',1,'1970-01-01 00:00:00','2222-01-01 00:00:00','2018-06-14 16:32:00',0,NULL,0,NULL,0),(4,'Cartoon Network','http://cdn.takemefrom.com/videos/Cartoon_Network_Przedstawia_05_17_0.mp4','http://cdn.takemefrom.com/videos/cn.png','https://konkursiaki.pl',1,'1970-01-01 00:00:00','2222-01-01 00:00:00','2018-06-14 16:33:34',0,NULL,0,NULL,0),(5,'LEGO Elves','http://cdn.takemefrom.com/videos/Lego Elves 02_17_15sek.mp4','http://cdn.takemefrom.com/videos/elves.png','https://konkursiaki.pl',1,'1970-01-01 00:00:00','2222-01-01 00:00:00','2018-06-14 16:34:45',0,NULL,0,NULL,0),(6,'Ben 10','http://cdn.takemefrom.com/videos/Ben10Magazyn03_18_10sek_4.mp4','http://cdn.takemefrom.com/videos/benten.png','https://konkursiaki.pl',1,'1970-01-01 00:00:00','2222-01-01 00:00:00','2018-06-14 16:35:39',0,NULL,0,NULL,0);
/*!40000 ALTER TABLE `_video_ads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `def_badges`
--

DROP TABLE IF EXISTS `def_badges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `def_badges` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `subtitle` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `description` text COLLATE utf8_polish_ci,
  `image_url` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Odznaki dla graczy za aktywnoÅ›Ä‡';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `def_badges`
--
-- WHERE:  1 limit 100

LOCK TABLES `def_badges` WRITE;
/*!40000 ALTER TABLE `def_badges` DISABLE KEYS */;
INSERT INTO `def_badges` (`id`, `title`, `subtitle`, `description`, `image_url`) VALUES (1,'badge_champion_title','badge_champion_subtitle','badge_champion_description','/assets/images/badges/champion.png'),(2,'badge_fighter_title','badge_fighter_subtitle','badge_fighter_description','/assets/images/badges/fighter.png'),(3,'badge_fan_title','badge_fan_subtitle','badge_fan_description','/assets/images/badges/fan.png'),(4,'badge_friend_title','badge_friend_subtitle','badge_friend_description','/assets/images/badges/friend.png'),(5,'badge_gamer_title','badge_gamer_subtitle','badge_gamer_description','/assets/images/badges/gamer.png');
/*!40000 ALTER TABLE `def_badges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `def_contest_places`
--

DROP TABLE IF EXISTS `def_contest_places`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `def_contest_places` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `contest_type_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `place` int(11) DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=559 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Punktacja przyznawana za dane miejsce w zaleÅ¼noÅ›ci od rodzaju konkursu';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `def_contest_places`
--
-- WHERE:  1 limit 100

LOCK TABLES `def_contest_places` WRITE;
/*!40000 ALTER TABLE `def_contest_places` DISABLE KEYS */;
INSERT INTO `def_contest_places` (`id`, `contest_type_id`, `name`, `place`, `points`) VALUES (232,1,NULL,1,100),(233,1,NULL,2,99),(234,1,NULL,3,98),(235,1,NULL,4,97),(236,1,NULL,5,96),(237,1,NULL,6,95),(238,1,NULL,7,94),(239,1,NULL,8,93),(240,1,NULL,9,92),(241,1,NULL,10,91),(242,1,NULL,11,90),(243,1,NULL,12,89),(244,1,NULL,13,88),(245,1,NULL,14,87),(246,1,NULL,15,86),(247,1,NULL,16,85),(248,1,NULL,17,84),(249,1,NULL,18,83),(250,1,NULL,19,82),(251,1,NULL,20,81),(252,1,NULL,21,80),(253,1,NULL,22,79),(254,1,NULL,23,78),(255,1,NULL,24,77),(256,1,NULL,25,76),(257,1,NULL,26,75),(258,1,NULL,27,74),(259,1,NULL,28,73),(260,1,NULL,29,72),(261,1,NULL,30,71),(262,1,NULL,31,70),(263,1,NULL,32,69),(264,1,NULL,33,68),(265,1,NULL,34,67),(266,1,NULL,35,66),(267,1,NULL,36,65),(268,1,NULL,37,64),(269,1,NULL,38,63),(270,1,NULL,39,62),(271,1,NULL,40,61),(272,1,NULL,41,60),(273,1,NULL,42,59),(274,1,NULL,43,58),(275,1,NULL,44,57),(276,1,NULL,45,56),(277,1,NULL,46,55),(278,1,NULL,47,54),(279,1,NULL,48,53),(280,1,NULL,49,52),(281,1,NULL,50,51),(282,1,NULL,51,50),(283,1,NULL,52,49),(284,1,NULL,53,48),(285,1,NULL,54,47),(286,1,NULL,55,46),(287,1,NULL,56,45),(288,1,NULL,57,44),(289,1,NULL,58,43),(290,1,NULL,59,42),(291,1,NULL,60,41),(292,1,NULL,61,40),(293,1,NULL,62,39),(294,1,NULL,63,38),(295,1,NULL,64,37),(296,1,NULL,65,36),(297,1,NULL,66,35),(298,1,NULL,67,34),(299,1,NULL,68,33),(300,1,NULL,69,32),(301,1,NULL,70,31),(302,1,NULL,71,30),(303,1,NULL,72,29),(304,1,NULL,73,28),(305,1,NULL,74,27),(306,1,NULL,75,26),(307,1,NULL,76,25),(308,1,NULL,77,24),(309,1,NULL,78,23),(310,1,NULL,79,22),(311,1,NULL,80,21),(312,1,NULL,81,20),(313,1,NULL,82,19),(314,1,NULL,83,18),(315,1,NULL,84,17),(316,1,NULL,85,16),(317,1,NULL,86,15),(318,1,NULL,87,14),(319,1,NULL,88,13),(320,1,NULL,89,12),(321,1,NULL,90,11),(322,1,NULL,91,10),(323,1,NULL,92,9),(324,1,NULL,93,8),(325,1,NULL,94,7),(326,1,NULL,95,6),(327,1,NULL,96,5),(328,1,NULL,97,4),(329,1,NULL,98,3),(330,1,NULL,99,2),(331,1,NULL,100,1);
/*!40000 ALTER TABLE `def_contest_places` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `def_contest_types`
--

DROP TABLE IF EXISTS `def_contest_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `def_contest_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Rodzaje konkursÃ³w, np. normalny lub specjalny';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `def_contest_types`
--
-- WHERE:  1 limit 100

LOCK TABLES `def_contest_types` WRITE;
/*!40000 ALTER TABLE `def_contest_types` DISABLE KEYS */;
INSERT INTO `def_contest_types` (`id`, `name`) VALUES (1,'Normalny'),(2,'Specjalny');
/*!40000 ALTER TABLE `def_contest_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `def_games`
--

DROP TABLE IF EXISTS `def_games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `def_games` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `description` text COLLATE utf8_polish_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Gry do konkursÃ³w';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `def_games`
--
-- WHERE:  1 limit 100

LOCK TABLES `def_games` WRITE;
/*!40000 ALTER TABLE `def_games` DISABLE KEYS */;
INSERT INTO `def_games` (`id`, `name`, `description`) VALUES (1,'sorcerer','game_sorcerer_description'),(2,'pacman','game_pacman_description');
/*!40000 ALTER TABLE `def_games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `def_hero_file_types`
--

DROP TABLE IF EXISTS `def_hero_file_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `def_hero_file_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Typy plikÃ³w bohaterÃ³w';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `def_hero_file_types`
--
-- WHERE:  1 limit 100

LOCK TABLES `def_hero_file_types` WRITE;
/*!40000 ALTER TABLE `def_hero_file_types` DISABLE KEYS */;
INSERT INTO `def_hero_file_types` (`id`, `name`) VALUES (1,'hero_file_type_magazine'),(2,'hero_file_type_wallpaper');
/*!40000 ALTER TABLE `def_hero_file_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `def_mail_templates`
--

DROP TABLE IF EXISTS `def_mail_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `def_mail_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `content` text COLLATE utf8_polish_ci,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Szablony maili';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `def_mail_templates`
--
-- WHERE:  1 limit 100

LOCK TABLES `def_mail_templates` WRITE;
/*!40000 ALTER TABLE `def_mail_templates` DISABLE KEYS */;
INSERT INTO `def_mail_templates` (`id`, `name`, `subject`, `content`, `updated_at`, `updated_by`) VALUES (1,'registration','{{nick}}, dziękujemy za rejestrację!','<p>{{nick}},</p><p>Dziękujemy za rejestrację na Konkursiaki.pl. Możesz aktywować swoje konto klikając w poniższy odnośnik:</p><p>{{activation_link}}</p><p>Jeśli zdarzy Ci się go zapomnieć hasła wejdź na {{password_reset_link}} i otrzymasz kolejną wiadomość email!</p><p>--<br>Zespół Konkursiaki.pl</p>',NULL,0),(2,'registration_for_caretaker','Twoje dziecko zarejestrowało się na Konkursiaki.pl!','<p>Dzień dobry,</p>\r\n<p>Twoje dziecko zarejestrowało się  w serwisie z grami dla dzieci <a href=\"\" https:=\"\" konkursiaki.pl=\"\" \"\"=\"\">https://konkursiaki.pl/</a>,</p>\r\n<p></p>\r\n<p><strong>Konkursiaki.pl</strong> to bezpieczne miejsce z grami dla Twojego dziecka, gdzie znajdzie informacje o ulubionych bohaterach, może dobrze się bawić i wygrywać supernagrody!<br></p>\r\n<p>Aby Twoje dziecko mogło się zalogować do naszego serwisu, potrzebujemy Twojej zgody. Poniżej znajduje się link. Klikając w niego, potwierdzasz swoją zgodę:</p>\r\n<p>{{link}}</p>\r\n<p>Serwis przeznaczony jest dla dzieci od lat sześciu, a rejestracja może się odbyć jedynie po poinformowaniu rodziców. Dlatego w chwili, gdy Twoje dziecko dokonuje rejestracji, musi podać e-mail rodzica lub opiekuna, żeby otrzymał on stosowną informację.</p>\r\n<p><strong>Twój adres e-mail był potrzebny jedynie w celu informacji o rejestracji dziecka.</strong></p>\r\n<p>\r\nW przyszłości nie będziesz otrzymywać innych wiadomości e-mail od naszej firmy, za wyjątkiem sytuacji, gdy Twoje dziecko zostanie laureatem konkursu i będzie potrzeba podania adresu do wysyłki nagrody.</p>\r\n<p></p>\r\n<p>Więcej informacji na temat <a href=\"http://takemefrom.com/polityka-prywatności\" https:=\"\" konkursiaki.pl=\"\" polityka-prywatnosci\"\"=\"\" target=\"\">Polityki Prywatności</a> i <a href=\"http://takemefrom.com/regulamin\" https:=\"\" konkursiaki.pl=\"\" regulamin\"\"=\"\" target=\"\">Regulaminu</a> znajdą Państwo na stronie <a href=\"http://konkursiaki.pl\" https:=\"\" konkursiaki.pl=\"\" \"\"=\"\" target=\"\">www.konkursiaki.pl</a>.<br>\r\nWszelkie pytania dotyczące strony prosimy kierować na adres: <a href=\"http://mailto:kontakt@konkursiaki.pl\" mailto:kontakt@konkursiaki.pl\"\"=\"\" target=\"\">kontakt@konkursiaki.pl</a></p>\r\n<p></p>\r\n<p>Pozdrawiamy,<br>\r\n-- Zespół Konkursiaki.pl</p>',NULL,0),(3,'password_reset','{{nick}}, chcesz zmienić hasło na Konkursiakach?','<p>{{nick}},</p><p>W serwisie Konkursiaki.pl została uruchomiona procedura resetowania twojego hasła.</p><p>Możesz się zalogować klikając poniższy odnośnik bądź kopiując go w pole adresu przeglądarki:</p><p>{{link}}</p><p>Odnośnik może zostać użyty tylko raz a jego użycie umożliwi wpisanie własnego hasła. Odnośnik straci ważność po jednym dniu.</p><p>Jeśli ten email dotarł do Ciebie przez przypadek i wcale nie zgłaszałeś chęci zmiany hasła, po prostu go zignoruj i loguj się na swoim dotychczasowym haśle.</p><p>--<br>Zespół Konkursiaki.pl</p>',NULL,0),(4,'account_deactivation','Twoje konto zostało deaktywowane','Bardzo nam&nbsp;przykro, ale Twoje konto na Konkursiaki.pl zostało deaktywowane.',NULL,0),(5,'inviting_an_outsider','{{nick}} wysłał Ci zaproszenie na Konkursiaki.pl!','<p>{{nick}} zaprosił Cię na stronę Konkursiaki.pl.</p>\r\n<p>Zaloguj się i odbierz pierwsze punkty na dobry początek. Pamiętaj! Za każde polecenie strony znajomemu otrzymujesz ekstra bonusy.</p>\r\n<p>Aby stać się członkiem Konkursiaki.pl, świetnie się bawić  i wygrywać supernagrody, kliknij na poniższy link lub wklej go w pasku adresu przeglądarki.</p>\r\n<p>{{link}}</p>\r\n<p>--<br>Redakcja Konkursiaki.pl</p>',NULL,0),(6,'being_a_contest_laureate','Zostałeś laureatem konkursu \"{{contest_name}}\" na Konkursiaki.pl!','<p>﻿Witaj {{nick}},</p>\r\n<p>Jest nam niezmiernie miło poinformować, że zostałeś/zostałaś laureatem konkursu \"{{contest_name}}\", zamieszczonego na stronie www.konkursiaki.pl.</p>\r\n<p>W celu przesłania nagrody proszę kliknąć w link: {{address_confirmation_link}} i wpisać do formularza adres wysyłkowy. Zgodnie z regulaminem konkursu masz 14 dni na potwierdzenie danych niezbędnych do wysyłki nagrody.</p>\r\n<p>Zapraszamy do ponownego wzięcia udziału w konkursach!</p>\r\n<p>Supernagrody czekają!</p>\r\n<p>--</p>\r\n<p>Zespół Konkursiaki.pl</p>\r\n<p>W razie jakichkolwiek pytań, zachęcamy do kontaktu z naszym zespołem.</p>\r\n<p></p>',NULL,0),(7,'new_contest_creation','Rusza nowy konkurs \"{{contest_name}}\" na Konkursiaki.pl!','<p></p><h2>Witaj {{nick}}</h2><p></p><p></p><p>Już dziś na Konkursiaki.pl startuje nowy konkurs – {{contest_name}}<strong>!</strong>!</p><p>Wejdź na stronę: {{contest_link}} i graj o supernagrody!</p><p></p><p>Życzymy dobrej zabawy. Powodzenia!</p><p>Graj i wygrywaj!</p><p>--<br>Redakcja Konkursiaki.pl</p><p></p><p>Jeśli nie chcesz dostawać powiadomień systemowych o nowych konkursach, wejdź w zakładkę Moje konto w serwisie konkursiaki.pl i w Edytuj profil odznacz: Zgodę a na przetwarzanie danych osobowych w celu otrzymywania powiadomień, a następnie zapisz zmiany.</p>',NULL,0),(8,'known_user_new_password','Nowe hasło do Konkursiaków!','<p>Witaj {{nick}},</p><p><br></p><p>Wejdź tutaj i załóż nowe hasło:</p><p>{{link}}</p><p><br></p><p>Pozdrawiamy,</p><p>Zespół Konkursiaki.pl</p>',NULL,0);
/*!40000 ALTER TABLE `def_mail_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `def_pointed_activities`
--

DROP TABLE IF EXISTS `def_pointed_activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `def_pointed_activities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='AktywnoÅ›ci uczestnikÃ³w w serwisie, ktÃ³re sÄ… punktowane';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `def_pointed_activities`
--
-- WHERE:  1 limit 100

LOCK TABLES `def_pointed_activities` WRITE;
/*!40000 ALTER TABLE `def_pointed_activities` DISABLE KEYS */;
INSERT INTO `def_pointed_activities` (`id`, `name`, `points`) VALUES (1,'registration',5),(2,'login',1),(3,'invitation_login',5),(4,'contest_participation',5),(5,'personal_best_score_update',1);
/*!40000 ALTER TABLE `def_pointed_activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `def_ranks`
--

DROP TABLE IF EXISTS `def_ranks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `def_ranks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `points_threshold` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `image_url` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Rangi graczy z racji zdobytych punktÃ³w i wykonanych zadaÅ„';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `def_ranks`
--
-- WHERE:  1 limit 100

LOCK TABLES `def_ranks` WRITE;
/*!40000 ALTER TABLE `def_ranks` DISABLE KEYS */;
INSERT INTO `def_ranks` (`id`, `title`, `points_threshold`, `image_url`) VALUES (1,'rank_player','5','/assets/images/ranks/player.png'),(2,'rank_star_player','500','/assets/images/ranks/star-player.png'),(3,'rank_top_player','1000','/assets/images/ranks/top-player.png'),(4,'rank_konkursiak','5000','/assets/images/ranks/konkursiak.png');
/*!40000 ALTER TABLE `def_ranks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `def_roles`
--

DROP TABLE IF EXISTS `def_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `def_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Role uÅ¼ytkownikÃ³w';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `def_roles`
--
-- WHERE:  1 limit 100

LOCK TABLES `def_roles` WRITE;
/*!40000 ALTER TABLE `def_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `def_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `old_contests`
--

DROP TABLE IF EXISTS `old_contests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `old_contests` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned DEFAULT '0',
  `type` char(32) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `start` datetime DEFAULT NULL,
  `expire` datetime DEFAULT NULL,
  `game_mode` smallint(5) unsigned DEFAULT NULL,
  `top_score` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_cid` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8 COMMENT='Konkursy ze starych konkursiakÃ³w';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `old_contests`
--
-- WHERE:  1 limit 100

LOCK TABLES `old_contests` WRITE;
/*!40000 ALTER TABLE `old_contests` DISABLE KEYS */;
INSERT INTO `old_contests` (`id`, `cid`, `type`, `title`, `start`, `expire`, `game_mode`, `top_score`, `created_at`) VALUES (1,214,'pacman','Kartka Przyjaźni','2016-08-01 15:59:00','2016-09-02 23:59:00',0,'PIGMEJ19','2018-06-22 14:19:40'),(2,215,'bubbles','Tajemniczy Wulkan','2016-08-09 11:59:00','2016-09-11 23:59:00',0,'gugaczka','2018-06-22 14:19:40'),(3,216,'memo','Obrońcy Fortecy','2016-08-14 11:59:00','2016-09-13 23:59:00',0,'mario75','2018-06-22 14:19:40'),(4,217,'puzzle','Wakacje w Heartlake','2016-08-19 11:59:00','2016-09-18 23:38:00',0,'Prex14','2018-06-22 14:19:40'),(5,218,'mahjong','Wielka wyprawa','2016-08-19 14:56:00','2016-09-24 23:56:00',0,'wita15','2018-06-22 14:19:40'),(6,219,'stones','Kosmiczni wojownicy','2016-08-26 11:59:00','2016-09-26 23:59:00',0,'ala8','2018-06-22 14:19:40'),(7,220,'pacman','Pogromcy skał','2016-08-29 15:59:00','2016-09-28 23:59:00',0,'bojamaciejewski','2018-06-22 14:19:40'),(8,221,'bubbles','Pieskie życie','2016-09-09 11:59:00','2016-09-30 23:59:00',0,'Warbandit','2018-06-22 14:19:40'),(9,222,'memo','Świat Zabawek','2016-09-16 11:59:00','2016-09-30 23:59:00',0,'Natka2000','2018-06-22 14:19:40'),(10,223,'puzzle','Mistrzowie żywiołów','2016-10-01 11:59:00','2016-10-30 23:59:00',0,'Theoden','2018-06-22 14:19:40'),(11,224,'mahjong','Galaktyczne wyścigi','2016-10-01 11:59:00','2016-11-01 23:59:00',0,'kosteczka','2018-06-22 14:19:40'),(12,225,'pacman','Akademia Beta','2016-10-01 11:59:00','2016-11-12 23:59:00',0,'Ewelina Ratajczak','2018-06-22 14:19:40'),(13,226,'bubbles','Smoczy treser','2016-10-06 11:59:00','2016-11-02 23:59:00',0,'Warbandit','2018-06-22 14:19:40'),(14,227,'memo','Num Noms pyszna zabawa','2016-10-07 16:59:00','2016-11-07 23:59:00',0,'ewaz','2018-06-22 14:19:40'),(15,228,'bubbles','Żelowy zawrót głowy','2016-10-07 16:59:00','2016-11-07 23:59:00',0,'-xxx-','2018-06-22 14:19:40'),(16,229,'puzzle','Rydwan Władcy bestii','2016-10-15 11:59:00','2016-11-13 23:43:00',0,'palma','2018-06-22 14:19:40'),(17,230,'pacman','halloweenowe rozgrywki','2016-10-21 13:59:00','2016-11-21 23:59:00',0,'JanuszL','2018-06-22 14:19:40'),(18,231,'arkanoid','Dyniowa uczta','2016-10-31 13:59:00','2016-11-27 23:59:00',0,'bałwan','2018-06-22 14:19:40'),(19,232,'mahjong','Twierdza nieszczęścia','2016-11-04 11:59:00','2016-11-29 23:35:00',0,'wszmal','2018-06-22 14:19:40'),(20,233,'memo','Świętuj z Winx','2016-11-14 11:59:00','2016-12-10 23:59:00',0,'zabster','2018-06-22 14:19:40'),(21,234,'memo','Andrzejkowe Szaleństwo','2016-11-24 17:59:00','2016-12-24 23:59:00',0,'Bastianek','2018-06-22 14:19:40'),(22,235,'bubbles','Zimowe szaleństwo','2016-11-30 15:59:00','2016-12-30 23:59:00',0,'-xxx-','2018-06-22 14:19:40'),(23,236,'puzzle','Świąteczne słodkości','2016-12-01 12:59:00','2017-01-15 23:59:00',0,'zabster','2018-06-22 14:19:40'),(24,237,'mahjong','Dalekie podróże','2016-12-12 13:59:00','2017-01-12 23:59:00',0,'zetbe','2018-06-22 14:19:40'),(25,238,'puzzle','LEGO Technic','2016-12-16 12:59:00','2017-01-16 23:59:00',0,'gonia','2018-06-22 14:19:40'),(26,239,'arkanoid','Świąteczny wyścig','2016-12-20 15:59:00','2017-01-20 23:59:00',0,'bojamaciejewski','2018-06-22 14:19:40'),(27,240,'pacman','Sylwestrowa zabawa','2016-12-28 11:59:00','2017-01-28 23:59:00',0,'Lejeuna','2018-06-22 14:19:40'),(28,241,'memo','Waleczna Nya','2016-12-30 11:59:00','2017-01-30 23:59:00',0,'mucha84','2018-06-22 14:19:40'),(29,242,'bubbles','Rycerska zbroja','2017-01-16 11:59:00','2017-02-16 23:59:00',0,'BogZaj','2018-06-22 14:19:40'),(30,244,'bubbles','Słodkie Num Noms','2017-01-18 14:59:00','2017-02-18 23:59:00',0,'malolat','2018-06-22 14:19:40'),(31,245,'mahjong','Maszyny w mieście','2017-01-20 11:59:00','2017-02-20 23:59:00',0,'wszmal','2018-06-22 14:19:40'),(32,246,'puzzle','Bajkowe podróże','2017-01-30 11:59:00','2017-03-03 23:59:00',0,'daria2002gra','2018-06-22 14:19:40'),(33,247,'pacman','Magiczni przyjaciele','2017-01-31 11:59:00','2017-03-05 23:59:00',0,'.2385','2018-06-22 14:19:40'),(34,248,'arkanoid','Superbohater','2017-02-07 11:59:00','2017-03-07 23:59:00',0,'maja2000','2018-06-22 14:19:40'),(35,249,'stones','Filmowa podróż','2017-02-20 17:15:00','2017-03-20 23:59:00',0,'kaper121','2018-06-22 14:19:40'),(36,250,'memo','Mroczny Rycerz','2017-02-22 11:59:00','2017-03-22 23:59:00',0,'ewaz','2018-06-22 14:19:40'),(37,251,'bubbles','Wiosenne zabawy','2017-02-23 15:59:00','2017-03-23 23:59:00',0,'maja2000','2018-06-22 14:19:40'),(38,252,'mahjong','Modowe szaleństwo','2017-02-28 09:59:00','2017-03-28 23:59:00',0,'feliksor','2018-06-22 14:19:40'),(39,253,'pacman','Leśna przygoda','2017-03-02 15:59:00','2017-04-02 23:59:00',0,'kkropla','2018-06-22 14:19:40'),(40,254,'arkanoid','Wojownicy mocy','2017-03-10 11:59:00','2017-04-10 23:59:00',0,'maja2000','2018-06-22 14:19:40'),(41,255,'bubbles','Trola Śpiew','2017-03-10 15:59:00','2017-04-13 23:59:00',0,'Ewelina Ratajczak','2018-06-22 14:19:40'),(42,256,'bubbles','Baw się modą','2017-03-17 16:00:00','2017-03-31 23:59:00',0,'Patrycja Ch.','2018-06-22 14:19:40'),(43,257,'memo','Bojowe pojazdy','2017-03-20 15:59:00','2017-04-20 23:59:00',0,'Nexoknights','2018-06-22 14:19:40'),(44,258,'puzzle','Podwodny świat','2017-03-24 11:59:00','2017-04-24 23:59:00',0,'mario75','2018-06-22 14:19:40'),(45,259,'pacman','bar Pana Dziarskiego','2017-03-30 15:59:00','2017-04-30 23:59:00',0,'maja2000','2018-06-22 14:19:40'),(46,260,'memo','Wesołe Pingwiny','2017-04-03 15:59:00','2017-05-03 23:59:00',0,'Julakak','2018-06-22 14:19:40'),(47,261,'arkanoid','Wiosenne porządki','2017-04-07 13:59:00','2017-05-07 23:59:00',0,'maja2000','2018-06-22 14:19:40'),(48,262,'mahjong','Wyścig po puchar','2017-04-14 11:59:00','2017-05-14 23:59:00',0,'maja2000','2018-06-22 14:19:40'),(49,263,'pacman','Szybowanie w przestworzach','2017-04-20 15:59:00','2017-05-20 23:59:00',0,'fredka19','2018-06-22 14:19:40'),(50,264,'memo','Mały majsterkowicz','2017-05-02 11:59:00','2017-06-02 23:59:00',0,'-xxx-','2018-06-22 14:19:40'),(51,265,'bubbles','Wielkie żeglowanie','2017-05-13 15:59:00','2017-06-13 23:39:00',0,'PleM','2018-06-22 14:19:40'),(52,266,'puzzle','Majowe rozgrywki','2017-05-10 09:50:00','2017-06-10 23:59:00',0,'bunia110','2018-06-22 14:19:40'),(53,267,'stones','Masz wiadomość','2017-05-18 09:45:00','2017-06-18 23:59:00',0,'mierzwik','2018-06-22 14:19:40'),(54,268,'mahjong','Masza na dobranoc','2017-05-23 09:59:00','2017-06-23 23:29:00',0,'Halusia','2018-06-22 14:19:40'),(55,269,'arkanoid','Obcy natarcie','2017-05-30 09:59:00','2017-06-30 23:59:00',0,'sikorka','2018-06-22 14:19:40'),(56,270,'pacman','Pieskie życie','2017-06-14 09:59:00','2017-07-14 23:59:00',0,'105xxx','2018-06-22 14:19:40'),(57,271,'bubbles','Z Emi nigdy więcej nudy','2017-05-26 09:59:00','2017-06-26 23:59:00',0,'-xxx-','2018-06-22 14:19:40'),(58,272,'memo','Na ratunek','2017-06-21 09:59:00','2017-07-21 23:59:00',0,'basiaJ','2018-06-22 14:19:40'),(59,273,'puzzle','Francuska podróż','2017-06-07 09:59:00','2017-07-07 23:59:00',0,'daria2002gra','2018-06-22 14:19:40'),(60,274,'stones','Cień przeznaczenia','2017-06-29 09:59:00','2017-07-29 23:59:00',0,'szymon546','2018-06-22 14:19:40'),(61,275,'arkanoid','Szkolna wyprawka','2017-07-04 09:59:00','2017-08-04 23:59:00',0,'nadian2011','2018-06-22 14:19:40'),(62,276,'bubbles','Wakacyjni giermkowie','2017-07-04 10:59:00','2017-07-31 23:59:00',0,'LucillaBab','2018-06-22 14:19:40'),(63,277,'pacman','Gwiezdna przygoda','2017-07-21 11:59:00','2017-08-21 23:59:00',0,'105xxx','2018-06-22 14:19:40'),(64,278,'mahjong','Wakacyjna podróż','2017-07-21 11:59:00','2017-08-21 23:59:00',0,'Tunia','2018-06-22 14:19:40'),(65,279,'arkanoid','Podniebne harce','2017-08-01 14:45:00','2017-08-31 23:59:00',0,'wiktorek2008','2018-06-22 14:19:40'),(66,280,'bubbles','Szkolna rozgrywka','2017-08-07 10:59:00','2017-09-07 23:59:00',0,'-xxx-','2018-06-22 14:19:40'),(67,281,'bubbles','Gang Wiewióra 2','2017-08-07 10:59:00','2017-09-07 23:59:00',0,'PleM','2018-06-22 14:19:40'),(68,282,'memo','Enchantimals™ – siła przyjaźni','2017-08-04 10:36:00','2017-09-04 23:59:00',0,'ajanga','2018-06-22 14:19:40'),(69,283,'stones','Lot w przyszłość','2017-08-16 09:00:00','2017-09-16 23:59:00',0,'Marcinek77','2018-06-22 14:19:40'),(70,284,'pacman','Magia wyobraźni','2017-08-31 09:00:00','2017-09-30 23:59:00',0,'dziadekwkraczadogry','2018-06-22 14:19:40'),(71,285,'memo','Zuza-Łobuza','2017-09-04 12:00:00','2017-10-04 23:59:00',0,'dominikagrateraz','2018-06-22 14:19:40'),(72,287,'stones','Batmanowa Przygoda','2017-09-11 17:15:00','2017-10-11 23:59:00',0,'superOla','2018-06-22 14:19:40'),(73,288,'bubbles','Kosmiczna Zabawa','2017-09-11 17:45:00','2017-10-11 23:59:00',0,'-xxx-','2018-06-22 14:19:40'),(74,289,'arkanoid','Rycerskie Wyzwanie','2017-09-15 09:00:00','2017-10-15 23:59:00',0,'Reniu','2018-06-22 14:19:40'),(75,291,'memo','Misiowa Zgadywanka','2017-09-15 09:00:00','2017-10-15 23:59:00',0,'mario75','2018-06-22 14:19:40'),(76,292,'bubbles','Dawaj Gazu!','2017-10-06 09:00:00','2017-11-06 23:59:00',0,'JanuszL','2018-06-22 14:19:40'),(77,293,'stones','Tajemnicza Wyprawa','2017-10-11 09:00:00','2017-11-11 23:59:00',0,'Reniu','2018-06-22 14:19:40'),(78,294,'mahjong','Ninjowe Układanki','2017-09-29 09:00:00','2017-10-29 23:59:00',0,'mario75','2018-06-22 14:19:40'),(79,296,'memo','Zakręcona Sawanna','2017-10-02 09:00:00','2017-11-02 23:59:00',0,'Warbandit','2018-06-22 14:19:40'),(80,297,'stones','Tajna misja','2017-10-17 09:00:00','2018-01-17 23:59:00',1,'fredka19','2018-06-22 14:19:40'),(81,298,'pacman','Heartlake City','2017-10-18 09:00:00','2017-11-18 23:59:00',0,'Miki2001','2018-06-22 14:19:40'),(82,300,'puzzle','MAGIA WYCINANIA','2017-11-01 09:00:00','2017-12-01 23:59:00',0,'ariel2016','2018-06-22 14:19:40'),(83,301,'memo','COOL MAKER - zostań projektantką','2017-11-03 09:00:00','2017-12-03 23:59:00',0,'merynosek','2018-06-22 14:19:40'),(84,302,'arkanoid','Filmowa uczta','2017-11-12 09:00:00','2017-12-12 23:59:00',0,'Miki2001','2018-06-22 14:19:40'),(85,303,'mahjong','Inwazja mocy','2017-11-15 09:00:00','2017-12-15 23:59:00',0,'Tunia','2018-06-22 14:19:40'),(86,304,'stones','Sprytne Gobblety','2017-11-13 13:00:00','2017-12-13 23:59:00',0,'Miki2001','2018-06-22 14:19:40'),(87,305,'pacman','BEN10 - KOSMICZNA PRZESTRZEŃ','2017-12-01 09:00:00','2018-01-01 23:59:00',0,'dziadekwkraczadogry','2018-06-22 14:19:40'),(88,306,'bubbles','Waleczny Ninja','2017-11-29 09:00:00','2017-12-29 23:59:00',0,'Kawazmlekiem','2018-06-22 14:19:40'),(89,307,'memo','Mleczna rozgrywka – Kampania sfinansowana z Funduszu Promocji Mleka','2017-12-01 09:00:00','2018-01-01 23:59:00',0,'mario75','2018-06-22 14:19:40'),(90,308,'stones','COCO. Niezwykłe tajemnice','2017-12-04 16:00:00','2018-01-04 23:59:00',0,'stachu70','2018-06-22 14:19:40'),(91,309,'puzzle','Paddington 2: TWARZ TWARDZIELA - SERCE MISIA','2017-12-06 11:00:00','2018-01-06 23:59:00',0,'dominikagrateraz','2018-06-22 14:19:40'),(92,310,'arkanoid','LEGO Star Wars','2017-12-15 14:00:00','2018-01-15 23:59:00',0,'stachu70','2018-06-22 14:19:40'),(93,311,'mahjong','Fenomen kreatywności','2018-01-03 16:00:00','2018-02-03 23:59:00',0,'matsuge','2018-06-22 14:19:40'),(94,312,'bubbles','Niepokorna załoga','2018-01-22 15:00:00','2018-02-22 23:59:00',0,'Ewelina Ratajczak','2018-06-22 14:19:40'),(95,313,'arkanoid','Sekretny świat','2018-02-01 09:00:00','2018-02-28 23:59:00',0,'daria2002gra','2018-06-22 14:19:40'),(96,314,'bubbles','Jaskiniowiec','2018-02-08 20:00:00','2018-03-08 23:59:00',0,'JanuszL','2018-06-22 14:19:40'),(97,319,'pacman','Starcie z kobrą','2018-02-15 15:00:00','2018-03-15 23:59:00',0,'stachu70','2018-06-22 14:19:40'),(98,320,'arkanoid','Walcz jak Ninja!','2018-02-28 09:00:00','2018-03-28 23:59:00',0,'dominikagrateraz','2018-06-22 14:19:40'),(99,321,'bubbles','Zabawa Mleczysława','2018-03-08 09:00:00','2018-04-08 23:59:00',0,'-xxx-','2018-06-22 14:19:40'),(100,322,'bubbles','Flushville','2018-03-08 09:00:00','2018-04-08 23:59:00',0,'Kawazmlekiem','2018-06-22 14:19:40');
/*!40000 ALTER TABLE `old_contests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `old_score_games`
--

DROP TABLE IF EXISTS `old_score_games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `old_score_games` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT '0',
  `contest_id` int(10) unsigned DEFAULT '0',
  `max_points` int(11) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51252 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Punkty za gry ze starych konkursiakow';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `old_score_games`
--
-- WHERE:  1 limit 100

LOCK TABLES `old_score_games` WRITE;
/*!40000 ALTER TABLE `old_score_games` DISABLE KEYS */;
INSERT INTO `old_score_games` (`id`, `user_id`, `contest_id`, `max_points`, `created_at`) VALUES (1,0,331,840,'2018-06-22 17:10:59'),(2,0,332,1800,'2018-06-22 17:10:59'),(3,0,333,1580,'2018-06-22 17:10:59'),(4,0,334,470,'2018-06-22 17:10:59'),(5,1,215,33,'2018-06-22 17:10:59'),(6,1,216,359,'2018-06-22 17:10:59'),(7,1,217,76,'2018-06-22 17:10:59'),(8,1,218,140,'2018-06-22 17:10:59'),(9,1,219,4792,'2018-06-22 17:10:59'),(10,1,220,6040,'2018-06-22 17:10:59'),(11,1,221,3,'2018-06-22 17:10:59'),(12,1,222,297,'2018-06-22 17:10:59'),(13,1,223,110,'2018-06-22 17:10:59'),(14,1,225,1480,'2018-06-22 17:10:59'),(15,1,227,372,'2018-06-22 17:10:59'),(16,1,230,3780,'2018-06-22 17:10:59'),(17,1,231,4250,'2018-06-22 17:10:59'),(18,1,234,483,'2018-06-22 17:10:59'),(19,1,235,31,'2018-06-22 17:10:59'),(20,1,240,46480,'2018-06-22 17:10:59'),(21,1,242,20,'2018-06-22 17:10:59'),(22,1,247,14140,'2018-06-22 17:10:59'),(23,1,249,5548,'2018-06-22 17:10:59'),(24,1,253,3140,'2018-06-22 17:10:59'),(25,1,261,250,'2018-06-22 17:10:59'),(26,1,271,13,'2018-06-22 17:10:59'),(27,1,283,5464,'2018-06-22 17:10:59'),(28,1,285,2320,'2018-06-22 17:10:59'),(29,1,289,1360,'2018-06-22 17:10:59'),(30,1,306,31,'2018-06-22 17:10:59'),(31,1,313,40,'2018-06-22 17:10:59'),(32,1,314,32,'2018-06-22 17:10:59'),(33,1,319,2470,'2018-06-22 17:10:59'),(34,1,326,440,'2018-06-22 17:10:59'),(35,1,329,2370,'2018-06-22 17:10:59'),(36,89,277,2190,'2018-06-22 17:10:59'),(37,89,279,160,'2018-06-22 17:10:59'),(38,129,232,68,'2018-06-22 17:10:59'),(39,129,237,144,'2018-06-22 17:10:59'),(40,129,249,7070,'2018-06-22 17:10:59'),(41,129,252,144,'2018-06-22 17:10:59'),(42,129,255,417,'2018-06-22 17:10:59'),(43,129,256,149,'2018-06-22 17:10:59'),(44,129,262,72,'2018-06-22 17:10:59'),(45,129,308,6794,'2018-06-22 17:10:59'),(46,129,312,470,'2018-06-22 17:10:59'),(47,129,314,113,'2018-06-22 17:10:59'),(48,131,221,2073,'2018-06-22 17:10:59'),(49,131,226,3102,'2018-06-22 17:10:59'),(50,131,227,284,'2018-06-22 17:10:59'),(51,131,228,90,'2018-06-22 17:10:59'),(52,131,230,23670,'2018-06-22 17:10:59'),(53,131,231,6120,'2018-06-22 17:10:59'),(54,131,234,392,'2018-06-22 17:10:59'),(55,131,251,93,'2018-06-22 17:10:59'),(56,131,254,6240,'2018-06-22 17:10:59'),(57,131,261,6240,'2018-06-22 17:10:59'),(58,131,262,71,'2018-06-22 17:10:59'),(59,131,279,6240,'2018-06-22 17:10:59'),(60,131,281,2067,'2018-06-22 17:10:59'),(61,131,283,5156,'2018-06-22 17:10:59'),(62,131,287,6526,'2018-06-22 17:10:59'),(63,131,289,2490,'2018-06-22 17:10:59'),(64,131,310,3390,'2018-06-22 17:10:59'),(65,131,320,5520,'2018-06-22 17:10:59'),(66,131,324,6240,'2018-06-22 17:10:59'),(67,171,234,527,'2018-06-22 17:10:59'),(68,171,235,809,'2018-06-22 17:10:59'),(69,171,237,144,'2018-06-22 17:10:59'),(70,171,238,112,'2018-06-22 17:10:59'),(71,171,239,500,'2018-06-22 17:10:59'),(72,171,241,450,'2018-06-22 17:10:59'),(73,171,242,469,'2018-06-22 17:10:59'),(74,171,244,395,'2018-06-22 17:10:59'),(75,171,287,4542,'2018-06-22 17:10:59'),(76,171,288,98,'2018-06-22 17:10:59'),(77,171,289,100,'2018-06-22 17:10:59'),(78,235,221,150,'2018-06-22 17:10:59'),(79,235,250,959,'2018-06-22 17:10:59'),(80,235,260,568,'2018-06-22 17:10:59'),(81,235,333,240,'2018-06-22 17:10:59'),(82,235,334,2110,'2018-06-22 17:10:59'),(83,338,219,5300,'2018-06-22 17:10:59'),(84,338,221,436,'2018-06-22 17:10:59'),(85,338,222,197,'2018-06-22 17:10:59'),(86,338,234,338,'2018-06-22 17:10:59'),(87,338,235,325,'2018-06-22 17:10:59'),(88,338,241,244,'2018-06-22 17:10:59'),(89,338,249,5680,'2018-06-22 17:10:59'),(90,338,250,418,'2018-06-22 17:10:59'),(91,338,252,102,'2018-06-22 17:10:59'),(92,338,257,327,'2018-06-22 17:10:59'),(93,338,260,359,'2018-06-22 17:10:59'),(94,338,262,72,'2018-06-22 17:10:59'),(95,338,264,333,'2018-06-22 17:10:59'),(96,338,265,89,'2018-06-22 17:10:59'),(97,338,267,4658,'2018-06-22 17:10:59'),(98,338,271,287,'2018-06-22 17:10:59'),(99,338,272,322,'2018-06-22 17:10:59'),(100,338,274,5558,'2018-06-22 17:10:59');
/*!40000 ALTER TABLE `old_score_games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `old_score_total`
--

DROP TABLE IF EXISTS `old_score_total`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `old_score_total` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT '0',
  `points` int(11) DEFAULT '0',
  `max_points` int(11) DEFAULT '0',
  `given_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `given_at` (`given_at`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_given_at` (`given_at`)
) ENGINE=InnoDB AUTO_INCREMENT=36179 DEFAULT CHARSET=utf8 COMMENT='Punkty ze starych konkursiakow';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `old_score_total`
--
-- WHERE:  1 limit 100

LOCK TABLES `old_score_total` WRITE;
/*!40000 ALTER TABLE `old_score_total` DISABLE KEYS */;
INSERT INTO `old_score_total` (`id`, `user_id`, `points`, `max_points`, `given_at`, `created_at`) VALUES (1,129,23,23,'2018-02-13 10:21:55','2018-06-22 18:31:28'),(2,131,180,180,'2018-05-10 23:13:56','2018-06-22 18:31:28'),(3,235,19,19,'2018-06-20 11:44:21','2018-06-22 18:31:28'),(4,338,449,449,'2018-06-10 18:36:18','2018-06-22 18:31:28'),(5,368,1,1,'2018-03-05 17:01:53','2018-06-22 18:31:28'),(6,546,87,87,'2018-06-17 18:37:05','2018-06-22 18:31:28'),(7,651,562,562,'2018-06-14 18:35:42','2018-06-22 18:31:28'),(8,668,1217,1217,'2018-06-22 09:00:35','2018-06-22 18:31:28'),(9,738,677,677,'2018-03-20 18:45:45','2018-06-22 18:31:28'),(10,889,302,302,'2018-06-18 19:59:42','2018-06-22 18:31:28'),(11,976,127,127,'2018-01-04 12:08:41','2018-06-22 18:31:28'),(12,999,1653,1653,'2018-06-21 18:07:09','2018-06-22 18:31:28'),(13,1036,414,414,'2018-06-17 18:37:05','2018-06-22 18:31:28'),(14,1174,80,80,'2018-01-05 13:01:14','2018-06-22 18:31:28'),(15,1186,465,465,'2018-06-10 18:36:18','2018-06-22 18:31:28'),(16,1277,497,497,'2018-06-19 21:36:15','2018-06-22 18:31:28'),(17,1278,100,100,'2018-01-12 10:20:37','2018-06-22 18:31:28'),(18,1334,173,173,'2018-06-14 12:35:23','2018-06-22 18:31:28'),(19,1340,69,69,'2018-02-10 17:23:00','2018-06-22 18:31:28'),(20,1341,182,182,'2018-03-30 17:20:53','2018-06-22 18:31:28'),(21,1381,19,19,'2018-02-03 08:22:07','2018-06-22 18:31:28'),(22,1496,1086,1086,'2018-06-17 18:37:05','2018-06-22 18:31:28'),(23,1591,27,27,'2018-06-11 23:13:12','2018-06-22 18:31:28'),(24,1671,7,7,'2017-10-30 21:41:43','2018-06-22 18:31:28'),(25,1730,230,230,'2018-05-30 16:41:36','2018-06-22 18:31:28'),(26,1778,9,9,'2018-06-19 12:54:26','2018-06-22 18:31:28'),(27,1832,1725,1725,'2018-04-17 20:11:50','2018-06-22 18:31:28'),(28,1845,383,383,'2018-06-09 18:20:46','2018-06-22 18:31:28'),(29,1873,19,19,'2018-06-21 10:38:03','2018-06-22 18:31:28'),(30,1885,53,53,'2018-02-01 20:12:58','2018-06-22 18:31:28'),(31,1933,288,288,'2018-04-07 15:32:11','2018-06-22 18:31:28'),(32,1995,1259,1259,'2018-06-19 12:35:36','2018-06-22 18:31:28'),(33,2021,14,14,'2018-03-19 22:43:58','2018-06-22 18:31:28'),(34,2075,100,100,'2018-05-18 21:31:54','2018-06-22 18:31:28'),(35,2190,1,1,'2018-01-17 21:50:31','2018-06-22 18:31:28'),(36,2314,276,276,'2018-05-18 19:17:24','2018-06-22 18:31:28'),(37,2321,155,155,'2018-06-14 23:09:25','2018-06-22 18:31:28'),(38,2343,6,6,'2018-03-08 21:28:54','2018-06-22 18:31:28'),(39,2465,313,313,'2018-06-22 12:33:21','2018-06-22 18:31:28'),(40,2517,46,46,'2018-05-27 20:34:53','2018-06-22 18:31:28'),(41,2664,250,250,'2018-03-08 14:19:24','2018-06-22 18:31:28'),(42,2751,1274,1274,'2018-06-20 17:43:45','2018-06-22 18:31:28'),(43,2927,6,6,'2018-03-29 19:06:47','2018-06-22 18:31:28'),(44,3070,3,3,'2018-04-04 19:35:17','2018-06-22 18:31:28'),(45,3086,3,3,'2018-03-08 19:03:20','2018-06-22 18:31:28'),(46,3127,64,64,'2018-04-07 21:41:17','2018-06-22 18:31:28'),(47,3130,1455,1455,'2018-06-21 17:53:07','2018-06-22 18:31:28'),(48,3178,281,281,'2018-06-21 22:12:31','2018-06-22 18:31:28'),(49,3185,95,95,'2018-06-09 14:34:50','2018-06-22 18:31:28'),(50,3220,1,1,'2018-06-03 22:05:35','2018-06-22 18:31:28'),(51,3353,16,16,'2018-02-11 21:47:58','2018-06-22 18:31:28'),(52,3365,258,258,'2018-01-23 19:44:28','2018-06-22 18:31:28'),(53,3597,593,593,'2018-06-13 22:02:26','2018-06-22 18:31:28'),(54,3620,81,81,'2018-05-10 23:13:56','2018-06-22 18:31:28'),(55,4059,1847,1847,'2018-06-10 23:01:32','2018-06-22 18:31:28'),(56,4078,74,74,'2018-03-21 16:18:42','2018-06-22 18:31:28'),(57,4090,64,64,'2018-05-10 22:34:30','2018-06-22 18:31:28'),(58,4125,6,6,'2017-12-01 17:56:51','2018-06-22 18:31:28'),(59,4495,1,1,'2018-05-07 16:45:35','2018-06-22 18:31:28'),(60,4498,1859,1859,'2018-06-19 15:32:46','2018-06-22 18:31:28'),(61,4554,29,29,'2017-11-07 22:13:19','2018-06-22 18:31:28'),(62,4864,69,69,'2018-06-17 14:56:34','2018-06-22 18:31:28'),(63,4983,737,737,'2018-04-18 21:05:29','2018-06-22 18:31:28'),(64,5057,30,30,'2018-03-31 00:48:53','2018-06-22 18:31:28'),(65,5105,13,13,'2018-04-22 17:28:18','2018-06-22 18:31:28'),(66,5281,6,6,'2017-11-05 01:19:12','2018-06-22 18:31:28'),(67,5908,163,163,'2018-03-25 21:29:55','2018-06-22 18:31:28'),(68,6049,1005,1005,'2018-04-20 10:21:55','2018-06-22 18:31:28'),(69,6112,6,6,'2017-11-18 21:15:17','2018-06-22 18:31:28'),(70,6130,39,39,'2017-12-05 10:57:22','2018-06-22 18:31:28'),(71,6173,39,39,'2018-05-04 01:59:15','2018-06-22 18:31:28'),(72,6204,6,6,'2018-03-02 23:31:12','2018-06-22 18:31:28'),(73,6487,19,19,'2018-05-16 13:53:44','2018-06-22 18:31:28'),(74,6807,341,341,'2018-06-22 01:31:23','2018-06-22 18:31:28'),(75,7073,603,603,'2018-06-10 18:36:18','2018-06-22 18:31:28'),(76,7090,7,7,'2018-02-28 15:45:59','2018-06-22 18:31:28'),(77,7209,37,37,'2017-12-02 00:43:06','2018-06-22 18:31:28'),(78,7298,9,9,'2018-05-10 16:49:14','2018-06-22 18:31:28'),(79,7312,26,26,'2018-02-07 19:38:49','2018-06-22 18:31:28'),(80,7361,1,1,'2018-02-23 16:39:11','2018-06-22 18:31:28'),(81,7441,8,8,'2017-11-01 15:23:28','2018-06-22 18:31:28'),(82,7460,773,773,'2017-12-04 07:44:52','2018-06-22 18:31:28'),(83,7577,95,95,'2018-06-10 18:36:18','2018-06-22 18:31:28'),(84,7689,463,463,'2018-06-21 14:37:41','2018-06-22 18:31:28'),(85,8171,15,15,'2017-12-01 21:55:22','2018-06-22 18:31:28'),(86,8217,102,102,'2018-02-16 15:06:54','2018-06-22 18:31:28'),(87,8616,21,21,'2018-03-15 20:43:20','2018-06-22 18:31:28'),(88,8734,3,3,'2018-01-25 12:18:58','2018-06-22 18:31:28'),(89,8782,327,327,'2018-06-22 01:31:56','2018-06-22 18:31:28'),(90,9004,1276,1276,'2018-06-21 17:37:12','2018-06-22 18:31:28'),(91,9179,206,206,'2018-05-10 22:34:30','2018-06-22 18:31:28'),(92,9214,8587,8587,'2018-06-21 21:57:39','2018-06-22 18:31:28'),(93,9266,110,110,'2017-12-18 11:49:34','2018-06-22 18:31:28'),(94,9314,68,68,'2018-05-13 16:34:51','2018-06-22 18:31:28'),(95,9383,6,6,'2017-12-06 21:01:30','2018-06-22 18:31:28'),(96,9384,918,918,'2018-04-12 15:26:20','2018-06-22 18:31:28'),(97,9468,58,58,'2017-12-25 21:46:30','2018-06-22 18:31:28'),(98,9478,24,24,'2017-11-10 20:33:53','2018-06-22 18:31:28'),(99,9547,72,72,'2017-11-20 16:25:37','2018-06-22 18:31:28'),(100,9861,15,15,'2017-11-02 19:05:37','2018-06-22 18:31:28');
/*!40000 ALTER TABLE `old_score_total` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `old_score_total_by_month`
--

DROP TABLE IF EXISTS `old_score_total_by_month`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `old_score_total_by_month` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT '0',
  `max_points` int(11) DEFAULT '0',
  `given_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_given_at` (`given_at`)
) ENGINE=InnoDB AUTO_INCREMENT=40574 DEFAULT CHARSET=utf8 COMMENT='Punkty ze starych konkursiakow';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `old_score_total_by_month`
--
-- WHERE:  1 limit 100

LOCK TABLES `old_score_total_by_month` WRITE;
/*!40000 ALTER TABLE `old_score_total_by_month` DISABLE KEYS */;
INSERT INTO `old_score_total_by_month` (`id`, `user_id`, `max_points`, `given_at`, `created_at`) VALUES (1,1,18,'2018-02-28 06:46:22','2018-06-26 15:43:39'),(2,1,11,'2018-03-29 12:53:48','2018-06-26 15:43:39'),(3,1,10,'2018-04-25 13:21:38','2018-06-26 15:43:39'),(4,1,21,'2018-05-30 16:00:23','2018-06-26 15:43:39'),(5,1,14,'2018-06-26 09:18:41','2018-06-26 15:43:39'),(6,1,15,'2017-10-31 08:48:11','2018-06-26 15:43:39'),(7,1,13,'2017-11-30 11:20:35','2018-06-26 15:43:39'),(8,1,10,'2017-12-29 11:50:06','2018-06-26 15:43:39'),(9,129,20,'2018-01-05 15:34:34','2018-06-26 15:43:39'),(10,129,1,'2018-02-13 10:21:55','2018-06-26 15:43:39'),(11,129,2,'2017-12-11 17:11:51','2018-06-26 15:43:39'),(12,131,30,'2018-01-26 10:51:46','2018-06-26 15:43:39'),(13,131,2,'2018-02-27 13:56:18','2018-06-26 15:43:39'),(14,131,7,'2018-03-13 18:53:04','2018-06-26 15:43:39'),(15,131,51,'2018-04-21 22:09:26','2018-06-26 15:43:39'),(16,131,77,'2018-05-10 23:13:56','2018-06-26 15:43:39'),(17,131,7,'2017-10-13 18:35:45','2018-06-26 15:43:39'),(18,131,6,'2017-12-25 21:25:44','2018-06-26 15:43:39'),(19,235,2,'2018-01-25 10:35:09','2018-06-26 15:43:39'),(20,235,1,'2018-02-23 09:27:01','2018-06-26 15:43:39'),(21,235,12,'2018-06-20 11:44:21','2018-06-26 15:43:39'),(22,235,3,'2017-10-27 12:17:01','2018-06-26 15:43:39'),(23,235,1,'2017-11-13 12:47:39','2018-06-26 15:43:39'),(24,338,87,'2018-01-05 14:55:22','2018-06-26 15:43:39'),(25,338,15,'2018-02-11 18:12:31','2018-06-26 15:43:39'),(26,338,14,'2018-04-29 11:10:10','2018-06-26 15:43:39'),(27,338,36,'2018-06-10 18:36:18','2018-06-26 15:43:39'),(28,338,115,'2017-10-29 13:06:32','2018-06-26 15:43:39'),(29,338,96,'2017-11-19 15:21:53','2018-06-26 15:43:39'),(30,338,86,'2017-12-31 15:06:30','2018-06-26 15:43:39'),(31,368,1,'2018-03-05 17:01:53','2018-06-26 15:43:39'),(32,546,27,'2018-03-16 23:09:08','2018-06-26 15:43:39'),(33,546,16,'2018-05-12 16:29:59','2018-06-26 15:43:39'),(34,546,44,'2018-06-17 18:37:05','2018-06-26 15:43:39'),(35,651,74,'2018-01-22 10:04:41','2018-06-26 15:43:39'),(36,651,6,'2018-03-27 13:43:24','2018-06-26 15:43:39'),(37,651,1,'2018-04-04 13:57:16','2018-06-26 15:43:39'),(38,651,1,'2018-05-25 22:51:44','2018-06-26 15:43:39'),(39,651,1,'2018-06-14 18:35:42','2018-06-26 15:43:39'),(40,651,214,'2017-10-29 17:57:24','2018-06-26 15:43:39'),(41,651,135,'2017-11-29 20:10:13','2018-06-26 15:43:39'),(42,651,130,'2017-12-18 12:21:45','2018-06-26 15:43:39'),(43,668,158,'2018-01-31 12:11:53','2018-06-26 15:43:39'),(44,668,57,'2018-02-28 15:46:08','2018-06-26 15:43:39'),(45,668,137,'2018-03-31 12:22:52','2018-06-26 15:43:39'),(46,668,133,'2018-04-30 09:08:27','2018-06-26 15:43:39'),(47,668,109,'2018-05-31 12:52:25','2018-06-26 15:43:39'),(48,668,51,'2018-06-26 10:25:27','2018-06-26 15:43:39'),(49,668,226,'2017-10-31 09:44:53','2018-06-26 15:43:39'),(50,668,231,'2017-11-30 11:57:05','2018-06-26 15:43:39'),(51,668,118,'2017-12-31 11:16:56','2018-06-26 15:43:39'),(52,738,196,'2018-01-30 13:03:50','2018-06-26 15:43:39'),(53,738,66,'2018-02-19 20:41:51','2018-06-26 15:43:39'),(54,738,1,'2018-03-20 18:45:45','2018-06-26 15:43:39'),(55,738,142,'2017-10-31 01:02:00','2018-06-26 15:43:39'),(56,738,182,'2017-11-29 11:13:29','2018-06-26 15:43:39'),(57,738,90,'2017-12-26 00:15:13','2018-06-26 15:43:39'),(58,889,22,'2018-01-28 22:59:47','2018-06-26 15:43:39'),(59,889,19,'2018-02-25 20:07:47','2018-06-26 15:43:39'),(60,889,28,'2018-03-29 20:05:45','2018-06-26 15:43:39'),(61,889,20,'2018-04-29 22:44:50','2018-06-26 15:43:39'),(62,889,34,'2018-05-29 20:00:29','2018-06-26 15:43:39'),(63,889,94,'2018-06-25 20:12:12','2018-06-26 15:43:39'),(64,889,28,'2017-10-11 20:15:02','2018-06-26 15:43:39'),(65,889,68,'2017-11-21 19:58:36','2018-06-26 15:43:39'),(66,976,26,'2018-01-04 12:08:41','2018-06-26 15:43:39'),(67,976,50,'2017-10-29 09:07:33','2018-06-26 15:43:39'),(68,976,43,'2017-11-30 17:15:40','2018-06-26 15:43:39'),(69,976,8,'2017-12-08 17:12:31','2018-06-26 15:43:39'),(70,999,394,'2018-01-31 17:27:22','2018-06-26 15:43:39'),(71,999,101,'2018-02-28 20:24:32','2018-06-26 15:43:39'),(72,999,94,'2018-03-31 21:40:31','2018-06-26 15:43:39'),(73,999,58,'2018-04-30 16:06:19','2018-06-26 15:43:39'),(74,999,127,'2018-05-31 21:35:42','2018-06-26 15:43:39'),(75,999,198,'2018-06-25 18:10:26','2018-06-26 15:43:39'),(76,999,195,'2017-10-31 19:56:34','2018-06-26 15:43:39'),(77,999,199,'2017-11-30 20:20:49','2018-06-26 15:43:39'),(78,999,291,'2017-12-31 18:21:57','2018-06-26 15:43:39'),(79,1036,62,'2018-01-21 12:07:43','2018-06-26 15:43:39'),(80,1036,16,'2018-02-19 21:04:02','2018-06-26 15:43:39'),(81,1036,41,'2018-03-28 19:50:43','2018-06-26 15:43:39'),(82,1036,9,'2018-05-13 20:58:22','2018-06-26 15:43:39'),(83,1036,79,'2018-06-17 18:37:05','2018-06-26 15:43:39'),(84,1036,47,'2017-10-30 19:06:53','2018-06-26 15:43:39'),(85,1036,61,'2017-11-23 14:46:40','2018-06-26 15:43:39'),(86,1036,101,'2017-12-22 17:58:58','2018-06-26 15:43:39'),(87,1174,50,'2018-01-05 13:01:14','2018-06-26 15:43:39'),(88,1174,30,'2017-12-18 11:49:34','2018-06-26 15:43:39'),(89,1186,83,'2018-01-05 14:55:22','2018-06-26 15:43:39'),(90,1186,13,'2018-04-29 11:12:07','2018-06-26 15:43:39'),(91,1186,3,'2018-05-13 12:18:22','2018-06-26 15:43:39'),(92,1186,84,'2018-06-10 18:36:18','2018-06-26 15:43:39'),(93,1186,111,'2017-10-29 19:29:26','2018-06-26 15:43:39'),(94,1186,75,'2017-11-07 18:36:23','2018-06-26 15:43:39'),(95,1186,96,'2017-12-26 11:52:31','2018-06-26 15:43:39'),(96,1277,110,'2018-01-28 18:21:37','2018-06-26 15:43:39'),(97,1277,6,'2018-03-18 20:32:25','2018-06-26 15:43:39'),(98,1277,121,'2018-05-27 20:34:53','2018-06-26 15:43:39'),(99,1277,110,'2018-06-19 21:36:15','2018-06-26 15:43:39'),(100,1277,8,'2017-10-27 16:08:05','2018-06-26 15:43:39');
/*!40000 ALTER TABLE `old_score_total_by_month` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `old_user_contests`
--

DROP TABLE IF EXISTS `old_user_contests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `old_user_contests` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `contests_list` varchar(6000) DEFAULT NULL,
  `contests_count` int(10) unsigned DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7135 DEFAULT CHARSET=utf8 COMMENT='Uczestnictwo w konkursach';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `old_user_contests`
--
-- WHERE:  1 limit 100

LOCK TABLES `old_user_contests` WRITE;
/*!40000 ALTER TABLE `old_user_contests` DISABLE KEYS */;
INSERT INTO `old_user_contests` (`id`, `user_id`, `contests_list`, `contests_count`, `created_at`) VALUES (1,1,'215,216,217,218,219,220,221,222,223,225,227,230,231,234,235,240,242,247,249,253,261,271,283,285,289,306,313,314,319,326,329',31,'2018-06-22 13:42:48'),(2,89,'277,279',2,'2018-06-22 13:42:48'),(3,129,'232,237,249,252,255,256,262,308,312,314',10,'2018-06-22 13:42:48'),(4,131,'221,226,227,228,230,231,234,251,254,261,262,279,281,283,287,289,310,320,324',19,'2018-06-22 13:42:48'),(5,171,'234,235,237,238,239,241,242,244,287,288,289',11,'2018-06-22 13:42:48'),(6,235,'221,250,260,333,334',5,'2018-06-22 13:42:48'),(7,338,'219,221,222,234,235,241,249,250,252,257,260,262,264,265,267,271,272,274,276,278,282,285,291,292,296,301,302,307,312,314,326',31,'2018-06-22 13:42:48'),(8,485,'229,231,232,233,234,235,237,238,239,255,260',11,'2018-06-22 13:42:48'),(9,546,'246,247,248,249,250,251,320,321,322,326,328',11,'2018-06-22 13:42:48'),(10,614,'241,242,244,249,250',5,'2018-06-22 13:42:48'),(11,651,'215,216,218,219,220,221,223,224,226,232,235,237,239,241,242,244,245,248,249,250,252,254,255,256,257,265,267,271,274,276,278,280,281,283,287,288,289,293,294,297,302,303,304,306,308,309,310,311,320',49,'2018-06-22 13:42:48'),(12,668,'213,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,242,244,245,246,248,249,250,251,252,253,255,256,257,258,259,260,261,262,263,264,265,266,267,268,269,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,287,288,289,291,292,293,294,296,297,298,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,319,320,321,322,323,324,325,326,327,328,329,332,333,334',107,'2018-06-22 13:42:48'),(13,719,'220',1,'2018-06-22 13:42:48'),(14,724,'260,261,262,263,264',5,'2018-06-22 13:42:48'),(15,738,'224,226,227,237,241,245,248,250,251,262,264,268,272,278,279,283,287,288,292,293,294,296,300,303,304,306,308,311,312,313',30,'2018-06-22 13:42:48'),(16,797,'247,251',2,'2018-06-22 13:42:48'),(17,846,'230,231,272,274,275,276',6,'2018-06-22 13:42:48'),(18,850,'270,272,274,275,276,277,278,279,282',9,'2018-06-22 13:42:48'),(19,889,'215,218,219,221,222,223,224,226,227,228,229,231,232,233,234,235,236,237,238,239,241,242,244,245,246,247,248,249,251,252,255,256,257,258,260,261,262,264,265,266,267,268,271,273,274,275,276,291,292,293,294,296,297,300,301,302,303,310,311,312,313,314,320,321,322,325,326,327,328,329,331,332',72,'2018-06-22 13:42:48'),(20,976,'254,255,268,278,294,303',6,'2018-06-22 13:42:48'),(21,999,'213,214,217,218,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,242,244,245,246,247,248,249,250,251,252,253,255,256,257,258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,281,282,283,284,285,287,288,289,291,292,293,294,296,297,298,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,319,320,321,322,323,324,325,326,327,328,329,331,332,333,334',104,'2018-06-22 13:42:48'),(22,1002,'285,288,289',3,'2018-06-22 13:42:48'),(23,1004,'225,229,230,231,232,240,241',7,'2018-06-22 13:42:48'),(24,1036,'275,279,280,285,287,289,291,292,293,294,296,297,298,300,301,302,304,307,308,309,310,313,314,319,328',25,'2018-06-22 13:42:48'),(25,1132,'228,229,231,233',4,'2018-06-22 13:42:48'),(26,1174,'241,304,305,310',4,'2018-06-22 13:42:48'),(27,1177,'265,277',2,'2018-06-22 13:42:48'),(28,1186,'222,227,228,234,235,241,257,260,261,262,264,272,282,283,285,296,301,307,326',19,'2018-06-22 13:42:48'),(29,1267,'262,264,284,287,289',5,'2018-06-22 13:42:48'),(30,1277,'235,236,237,238,239,240,241,242,244,245,246,248,249,266,267,281,283,285,294,300,303,304,306,307,308,310,311,312,321,327,328',31,'2018-06-22 13:42:48'),(31,1278,'235,236,237,309',4,'2018-06-22 13:42:48'),(32,1280,'239,240,246',3,'2018-06-22 13:42:48'),(33,1334,'323,325,326',3,'2018-06-22 13:42:48'),(34,1340,'301,302,303,311,312,314',6,'2018-06-22 13:42:48'),(35,1341,'213,215,216,218,219,220,221,222,223,224,226,229,232,234,235,236,237,238,239,241,242,245,246,249,250,252,257,258,260,262,264,266,278,283,287,289,293,294,303',39,'2018-06-22 13:42:48'),(36,1381,'312,313',2,'2018-06-22 13:42:48'),(37,1458,'216,218,219',3,'2018-06-22 13:42:48'),(38,1483,'215',1,'2018-06-22 13:42:48'),(39,1496,'213,214,215,218,220,222,224,226,229,232,234,235,237,239,241,245,246,247,248,249,255,262,265,267,268,271,272,273,274,276,278,280,283,284,287,289,292,293,294,296,297,298,300,301,302,303,304,305,306,307,308,309,310,311,321,322,323,326,327,328,329,331,332',63,'2018-06-22 13:42:48'),(40,1535,'221,222,244,247',4,'2018-06-22 13:42:48'),(41,1591,'304,308,310',3,'2018-06-22 13:42:48'),(42,1671,'218,232,235,267,274,288',6,'2018-06-22 13:42:48'),(43,1730,'223,224,225,237,239,240,241,242,244,245,255,256,280,287,288,289,291,292,293,294,298,300,301,302,303,304,305,307,308,309,310,311,312,314,321,322,323,324,325,326',40,'2018-06-22 13:42:48'),(44,1812,'231,232,233,234,270,272,274,275,276',9,'2018-06-22 13:42:48'),(45,1826,'215,216,219,220',4,'2018-06-22 13:42:48'),(46,1832,'213,215,216,218,219,220,221,224,226,228,231,232,233,234,235,236,237,238,239,240,241,242,244,245,246,248,249,250,251,252,255,256,257,258,259,260,261,262,263,264,265,266,267,268,269,271,272,273,274,276,278,279,280,281,282,283,285,287,288,289,291,292,293,294,296,297,300,301,302,303,304,305,306,308,309,310,311,312,313,314,319,320,321,322,324,325',86,'2018-06-22 13:42:48'),(47,1845,'218,224,232,233,234,235,237,238,241,252,257,259,262,268,274,278,283,287,288,289,294,301,303,304,311,326',26,'2018-06-22 13:42:48'),(48,1873,'216,219,221,242,249,251,255,274,276,288,310',11,'2018-06-22 13:42:48'),(49,1885,'215,216,218,219,220,221,222,224,226,228,231,232,233,235,236,237,239,241,287,293,294,306,311',23,'2018-06-22 13:42:48'),(50,1921,'224,225',2,'2018-06-22 13:42:48'),(51,1933,'241,245,249,250,251,252,254,255,256,257,258,259,260,262,263,264,265,266,267,268,269,272,278,280,282,283,285,287,291,292,293,294,296',33,'2018-06-22 13:42:48'),(52,1995,'215,218,219,220,221,222,224,226,228,232,233,234,235,237,241,242,244,245,249,251,252,255,256,257,260,261,262,264,267,268,271,272,276,277,278,279,280,281,282,283,284,285,287,288,289,291,292,293,294,296,297,298,300,301,302,303,304,306,308,310,311,312,313,314,319,321,322,324,325,326,328',71,'2018-06-22 13:42:48'),(53,2021,'230,231,232,233,234,235,236,237,238,239,240,241,242,244,245,246,247,248,249,250,251,252,253,254,255,256,257,258,259,260,261,262,265,267,268,320,321,322',38,'2018-06-22 13:42:48'),(54,2075,'215,216,218,219,221,222,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,241,242,244,245,246,248,249,251,252,254,255,256,257,258,259,260,261,262,268,272,278,280,281,282,288,294,300,303,314,326',52,'2018-06-22 13:42:48'),(55,2190,'217,219,221,226,240,242,244',7,'2018-06-22 13:42:48'),(56,2314,'215,218,219,221,224,226,228,232,235,237,242,244,245,249,251,252,256,262,274,276,297,303,304,306,308,311,312,321,322',29,'2018-06-22 13:42:48'),(57,2321,'224,231,232,235,237,275,293,294,297,303,304,311,325,331',14,'2018-06-22 13:42:48'),(58,2343,'321',1,'2018-06-22 13:42:48'),(59,2405,'269,274',2,'2018-06-22 13:42:48'),(60,2423,'260,261,263,264',4,'2018-06-22 13:42:48'),(61,2465,'215,218,220,221,223,224,225,226,227,228,230,231,232,236,240,242,244,245,246,247,248,249,250,251,252,253,254,255,256,259,260,261,262,263,265,267,268,270,271,274,275,276,278,280,281,283,284,285,287,288,289,292,293,294,297,298,302,304,311,312,314,319,320,321,322,323,325,329,331,332,333',71,'2018-06-22 13:42:48'),(62,2517,'240,241,326,327',4,'2018-06-22 13:42:48'),(63,2582,'223,224,226,228,229,230,231,232,233,235,237,239',12,'2018-06-22 13:42:48'),(64,2664,'219,297,300,301,302,303,304,314,321',9,'2018-06-22 13:42:48'),(65,2723,'248,249,250',3,'2018-06-22 13:42:48'),(66,2751,'213,214,216,217,218,219,221,222,223,224,226,229,230,231,232,233,234,236,237,239,241,245,246,248,249,250,251,252,254,255,257,258,259,260,261,262,264,266,267,268,269,272,273,274,277,278,279,280,281,283,287,293,294,296,297,303,304,307,308,310,311,313,320,322,324,325,326,328',68,'2018-06-22 13:42:48'),(67,2920,'214,267',2,'2018-06-22 13:42:48'),(68,2927,'324',1,'2018-06-22 13:42:48'),(69,2942,'236,238,239,240,241,242,244,246',8,'2018-06-22 13:42:48'),(70,3070,'228,287,288',3,'2018-06-22 13:42:48'),(71,3086,'235',1,'2018-06-22 13:42:48'),(72,3127,'218,219,220,224,226,231,238,239,240,242,248,261,274,276,278,281,287,288,292,293,294,301,304,311,321,322',26,'2018-06-22 13:42:48'),(73,3130,'213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,240,241,242,244,245,246,249,250,251,252,253,254,255,256,257,258,259,260,261,262,263,264,265,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,287,288,289,291,292,293,294,296,297,298,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,319,320,321,322,323,324,325,326,327,328,329,331,332',106,'2018-06-22 13:42:48'),(74,3178,'214,218,219,220,221,223,224,225,248,249,270,289,323',13,'2018-06-22 13:42:48'),(75,3185,'223,224,225,226,230,238,239,240,241,242,245,254,257,260,262,263,264,265,267,268,269,272,277,278,280,282,283,293,297,300,303,304,305,306,308,311,321,322',38,'2018-06-22 13:42:48'),(76,3190,'219',1,'2018-06-22 13:42:48'),(77,3220,'244,253,254,255,256,257,258,259',8,'2018-06-22 13:42:48'),(78,3317,'288,289',2,'2018-06-22 13:42:48'),(79,3353,'233,234,235,239,240,241,244,245,249,251,260,262,268,271,278,303,314',17,'2018-06-22 13:42:48'),(80,3365,'216,218,222,224,226,227,229,232,234,237,241,245,252,262,268,280,285,294,303,307,308',21,'2018-06-22 13:42:48'),(81,3370,'213,214,215,216,217,218,219,220,221,222,223,224,226,227,228,229,231,232,233,272,274',21,'2018-06-22 13:42:48'),(82,3408,'240,244',2,'2018-06-22 13:42:48'),(83,3432,'263',1,'2018-06-22 13:42:48'),(84,3468,'225,227,228',3,'2018-06-22 13:42:48'),(85,3524,'224,226,227,228,231',5,'2018-06-22 13:42:48'),(86,3597,'226,228,231,235,236,237,239,240,241,242,244,246,247,248,251,253,254,255,256,257,259,260,261,262,267,271,280,284,287,288,289,291,292,293,296,301,302,304,307,308,314,319,320,321,322,323,324,325,326,332',50,'2018-06-22 13:42:48'),(87,3602,'213,214,215,219,223,274,275,276,277',9,'2018-06-22 13:42:48'),(88,3620,'323,324,325',3,'2018-06-22 13:42:48'),(89,3773,'217,219,220,221',4,'2018-06-22 13:42:48'),(90,3928,'230,232,234',3,'2018-06-22 13:42:48'),(91,4049,'223,224,225',3,'2018-06-22 13:42:48'),(92,4059,'214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,242,244,245,246,247,248,249,250,251,252,253,254,255,256,257,258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,283,284,285,287,288,289,291,292,293,294,296,297,298,300,301,302,303,304,306,307,308,310,311,312,313,314,319,320,321,322,323,324,325,326,327,328',103,'2018-06-22 13:42:48'),(93,4078,'233,234,289,291,292,293,294,311,320,321,322',11,'2018-06-22 13:42:48'),(94,4090,'265,267,269,270,322,323',6,'2018-06-22 13:42:48'),(95,4125,'229,230,231,304',4,'2018-06-22 13:42:48'),(96,4274,'230',1,'2018-06-22 13:42:48'),(97,4280,'246,248',2,'2018-06-22 13:42:48'),(98,4481,'274',1,'2018-06-22 13:42:48'),(99,4495,'279',1,'2018-06-22 13:42:48'),(100,4498,'221,225,226,227,228,230,231,257,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,287,288,289,291,292,293,294,296,297,298,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,319,320,321,322,323,324,325,326,327,328,329,331',71,'2018-06-22 13:42:48');
/*!40000 ALTER TABLE `old_user_contests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_version`
--

DROP TABLE IF EXISTS `schema_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_version` (
  `last_migration_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Wersjonowanie migracji';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_version`
--
-- WHERE:  1 limit 100

LOCK TABLES `schema_version` WRITE;
/*!40000 ALTER TABLE `schema_version` DISABLE KEYS */;
INSERT INTO `schema_version` (`last_migration_at`) VALUES ('2018-06-26 17:35:52');
/*!40000 ALTER TABLE `schema_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `score_contests`
--

DROP TABLE IF EXISTS `score_contests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `score_contests` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `contest_id` int(10) unsigned DEFAULT NULL,
  `place` int(11) DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `given_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Punkty przyznane za miejsce w konkursie';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score_contests`
--
-- WHERE:  1 limit 100

LOCK TABLES `score_contests` WRITE;
/*!40000 ALTER TABLE `score_contests` DISABLE KEYS */;
/*!40000 ALTER TABLE `score_contests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `score_games`
--

DROP TABLE IF EXISTS `score_games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `score_games` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `contest_id` int(10) unsigned DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `begins_at` datetime DEFAULT NULL,
  `ends_at` datetime DEFAULT NULL,
  `win` tinyint(1) DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `points_total` int(11) DEFAULT NULL,
  `checknumber_client` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `checknumber_server` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_contest_id` (`contest_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Punkty zdobyte w danej grze w danym konkursie na danym poziomie';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score_games`
--
-- WHERE:  1 limit 100

LOCK TABLES `score_games` WRITE;
/*!40000 ALTER TABLE `score_games` DISABLE KEYS */;
INSERT INTO `score_games` (`id`, `user_id`, `contest_id`, `level`, `begins_at`, `ends_at`, `win`, `points`, `points_total`, `checknumber_client`, `checknumber_server`) VALUES (1,1,1,1,'2012-10-03 19:44:24','2012-10-03 19:54:24',NULL,5,5,NULL,NULL),(2,1,1,2,'2012-09-20 17:06:07','2012-09-20 17:16:07',NULL,7,12,NULL,NULL),(3,2,2,1,'2012-09-12 13:03:53','2012-09-12 13:13:53',NULL,4,4,NULL,NULL),(4,3,2,1,'2012-09-07 13:05:01','2012-09-07 13:08:01',NULL,8,8,NULL,NULL),(5,3,1,1,'2012-09-20 10:52:29','2012-09-20 10:59:29',NULL,2,2,NULL,NULL),(6,3,1,2,'2012-09-20 15:31:22','2012-09-20 15:36:22',NULL,15,17,NULL,NULL),(7,3,3,1,'2012-09-20 15:31:20','2012-09-20 15:41:20',NULL,6,6,NULL,NULL),(8,4,3,1,'2012-09-20 15:39:27','2012-09-20 15:59:27',NULL,5,5,NULL,NULL),(9,5,3,1,'2014-10-01 12:02:06','2014-10-01 12:06:06',NULL,24,24,NULL,NULL),(10,6,3,1,'2012-12-31 16:42:50','2012-12-31 16:49:50',NULL,1,1,NULL,NULL),(11,6,1,1,'2014-10-01 12:03:06','2014-10-01 12:06:06',NULL,0,0,NULL,NULL),(12,6,1,2,'2017-09-30 08:00:39','2017-09-30 08:10:39',NULL,99,99,NULL,NULL),(13,6,4,1,'2014-10-01 12:01:06','2014-10-01 12:06:06',NULL,11,11,NULL,NULL),(14,7,4,1,'2014-10-01 12:03:06','2014-10-01 12:06:06',NULL,14,14,NULL,NULL),(15,7,5,1,'2012-12-31 16:20:29','2012-12-31 16:50:29',NULL,25,25,NULL,NULL),(16,8,6,1,'2015-08-04 15:14:58','2015-08-04 15:34:58',NULL,44,44,NULL,NULL),(17,9,6,1,'2012-12-31 16:10:41','2012-12-31 16:50:41',NULL,29,29,NULL,NULL),(18,10,1,1,'2014-10-01 12:03:06','2014-10-01 12:06:06',NULL,12,12,NULL,NULL),(19,10,2,1,'2014-10-01 12:03:06','2014-10-01 12:06:06',NULL,11,11,NULL,NULL),(20,10,3,1,'2012-12-31 16:21:15','2012-12-31 16:51:15',NULL,18,18,NULL,NULL),(21,10,4,1,'2012-12-31 16:41:36','2012-12-31 16:51:36',NULL,17,17,NULL,NULL),(22,10,5,1,'2017-08-02 18:35:29','2017-08-02 18:36:29',NULL,22,22,NULL,NULL),(23,10,6,1,'2017-08-02 18:34:18','2017-08-02 18:36:18',NULL,16,16,NULL,NULL),(24,10,6,2,'2015-09-21 11:41:46','2015-09-21 11:42:46',NULL,54,70,NULL,NULL),(25,10,6,3,'2014-03-26 13:32:57','2014-03-26 13:37:57',NULL,30,100,NULL,NULL),(26,2,8,1,'2018-06-15 16:53:35','2018-06-15 16:55:26',1,10200,10200,'0027d8','0027d8'),(27,2,8,2,'2018-06-15 16:55:57','2018-06-15 16:58:18',1,9250,19450,'004bfa','004bfa'),(28,2,10,1,'2018-06-26 21:39:59','2018-06-26 21:40:57',1,2280,2280,'0008e8','0008e8'),(29,2,10,2,'2018-06-26 21:42:00','2018-06-26 21:42:13',1,4860,4860,'0012fc','0012fc'),(30,2,10,3,'2018-06-26 21:43:19','2018-06-26 21:43:29',1,7040,7040,'001b80','001b80');
/*!40000 ALTER TABLE `score_games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `score_games_archive`
--

DROP TABLE IF EXISTS `score_games_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `score_games_archive` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `contest_id` int(10) unsigned DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `begins_at` datetime DEFAULT NULL,
  `ends_at` datetime DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `points_total` int(11) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT '0',
  `inserted` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Archiwum punktÃ³w zdobytych w danej grze w danym konkursie na danym poziomie';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score_games_archive`
--
-- WHERE:  1 limit 100

LOCK TABLES `score_games_archive` WRITE;
/*!40000 ALTER TABLE `score_games_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `score_games_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `score_pointed_activities`
--

DROP TABLE IF EXISTS `score_pointed_activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `score_pointed_activities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `activity_id` int(10) unsigned DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `given_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Punkty przyznane za punktowane aktywnoÅ›ci';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score_pointed_activities`
--
-- WHERE:  1 limit 100

LOCK TABLES `score_pointed_activities` WRITE;
/*!40000 ALTER TABLE `score_pointed_activities` DISABLE KEYS */;
INSERT INTO `score_pointed_activities` (`id`, `user_id`, `activity_id`, `points`, `given_at`) VALUES (1,1,1,5,'2018-06-01 00:00:00'),(2,1,2,1,'2018-06-01 00:00:00'),(3,2,3,5,'2018-06-30 00:00:00'),(4,2,4,5,'2018-06-30 00:00:00'),(5,2,5,1,'2018-06-30 00:00:00'),(6,11,2,1,'2018-06-20 16:46:50'),(7,2,2,1,'2018-06-21 12:08:28'),(8,2,2,1,'2018-06-22 13:47:05'),(9,12,2,1,'2018-06-22 15:13:36'),(10,2,2,1,'2018-06-25 16:04:19'),(11,2,2,1,'2018-06-26 08:05:03'),(12,13,1,5,'2018-06-26 13:55:19'),(13,14,1,5,'2018-06-26 17:29:34'),(14,2,4,5,'2018-06-26 21:40:57'),(15,2,5,1,'2018-06-26 21:42:13'),(16,2,5,1,'2018-06-26 21:43:29'),(17,15,1,5,'2018-06-26 22:00:59'),(18,2,2,1,'2018-06-27 10:54:12'),(19,1,2,1,'2018-06-27 11:48:34'),(20,1778,2,1,'2018-06-27 11:59:47'),(21,62951,2,1,'2018-06-27 17:09:03'),(22,62951,2,1,'2018-06-28 09:22:11'),(23,1778,2,1,'2018-06-28 09:42:55'),(24,1,2,1,'2018-06-28 11:45:17'),(25,235,2,1,'2018-06-28 11:50:42');
/*!40000 ALTER TABLE `score_pointed_activities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-28 14:06:32
