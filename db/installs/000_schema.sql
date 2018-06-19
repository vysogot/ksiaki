-- MySQL dump 10.16  Distrib 10.3.7-MariaDB, for osx10.13 (x86_64)
--
-- Host: localhost    Database: ksiaki
-- ------------------------------------------------------
-- Server version	10.3.7-MariaDB

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
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `created_by` int(10) DEFAULT 0,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(10) DEFAULT 0,
  `marked_as_deleted_at` datetime DEFAULT NULL,
  `marked_as_deleted_by` int(10) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Konta użytkowników';
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `background_color` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `details_color` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `begins_at` datetime DEFAULT NULL,
  `ends_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `created_by` int(10) DEFAULT 0,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(10) DEFAULT 0,
  `marked_as_deleted_at` datetime DEFAULT NULL,
  `marked_as_deleted_by` int(10) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Tła reklamowe';
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `is_active` tinyint(1) DEFAULT 1,
  `begins_at` datetime DEFAULT NULL,
  `ends_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `created_by` int(10) DEFAULT 0,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(10) DEFAULT 0,
  `marked_as_deleted_at` datetime DEFAULT NULL,
  `marked_as_deleted_by` int(10) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Boxy';
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `is_active` tinyint(1) DEFAULT 0,
  `activation_hash` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `activated_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `created_by` int(10) DEFAULT 0,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(10) DEFAULT 0,
  `marked_as_deleted_at` datetime DEFAULT NULL,
  `marked_as_deleted_by` int(10) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Rodzice użytkowników';
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `created_by` int(10) DEFAULT 0,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(10) DEFAULT 0,
  `marked_as_deleted_at` datetime DEFAULT NULL,
  `marked_as_deleted_by` int(10) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Nagrody w konkursach';
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `description` text COLLATE utf8_polish_ci DEFAULT NULL,
  `box_url` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `header_url` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `begins_at` datetime DEFAULT NULL,
  `ends_at` datetime DEFAULT NULL,
  `display_ad` tinyint(1) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 0,
  `is_ended` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `created_by` int(10) DEFAULT 0,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(10) DEFAULT 0,
  `marked_as_deleted_at` datetime DEFAULT NULL,
  `marked_as_deleted_by` int(10) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Konkursy';
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `description` text COLLATE utf8_polish_ci DEFAULT NULL,
  `file_url` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `created_by` int(10) DEFAULT 0,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(10) DEFAULT 0,
  `marked_as_deleted_at` datetime DEFAULT NULL,
  `marked_as_deleted_by` int(10) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Pliki bohaterów';
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `description` text COLLATE utf8_polish_ci DEFAULT NULL,
  `avatar_url` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `header_url` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `cover_url` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `video_url` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `video_cover_url` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `gadget_url` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `footer_url` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `license_description` text COLLATE utf8_polish_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `created_by` int(10) DEFAULT 0,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(10) DEFAULT 0,
  `marked_as_deleted_at` datetime DEFAULT NULL,
  `marked_as_deleted_by` int(10) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Bohaterowie';
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `created_by` int(10) DEFAULT 0,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(10) DEFAULT 0,
  `marked_as_deleted_at` datetime DEFAULT NULL,
  `marked_as_deleted_by` int(10) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Status powiadomień dla użytkowników';
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `created_by` int(10) DEFAULT 0,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(10) DEFAULT 0,
  `marked_as_deleted_at` datetime DEFAULT NULL,
  `marked_as_deleted_by` int(10) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Powiadomienia dla użytkowników';
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `is_active` tinyint(1) DEFAULT 1,
  `begins_at` datetime DEFAULT NULL,
  `ends_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `created_by` int(10) DEFAULT 0,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(10) DEFAULT 0,
  `marked_as_deleted_at` datetime DEFAULT NULL,
  `marked_as_deleted_by` int(10) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Slajdy';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_sponsors`
--

DROP TABLE IF EXISTS `_sponsors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_sponsors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `description` text COLLATE utf8_polish_ci DEFAULT NULL,
  `image_url` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `created_by` int(10) DEFAULT 0,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(10) DEFAULT 0,
  `marked_as_deleted_at` datetime DEFAULT NULL,
  `marked_as_deleted_by` int(10) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Sponsorzy np. nagród konkursów';
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `content` text COLLATE utf8_polish_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `created_by` int(10) DEFAULT 0,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(10) DEFAULT 0,
  `marked_as_deleted_at` datetime DEFAULT NULL,
  `marked_as_deleted_by` int(10) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Strony statyczne';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_user_badges`
--

DROP TABLE IF EXISTS `_user_badges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_user_badges` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL DEFAULT 0,
  `badge_id` int(11) unsigned NOT NULL DEFAULT 0,
  `given_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Tabela odznak użytkownika';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_user_logins`
--

DROP TABLE IF EXISTS `_user_logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_user_logins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT 0,
  `session_id` char(32) COLLATE utf8_polish_ci DEFAULT NULL,
  `login_at` timestamp NULL DEFAULT current_timestamp(),
  `logout_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Rejestracja logowania i wylogowania użytkowników';
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `description` text COLLATE utf8_polish_ci DEFAULT NULL,
  `video_url` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `image_url` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `link_url` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `begins_at` datetime DEFAULT NULL,
  `ends_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `created_by` int(10) DEFAULT 0,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(10) DEFAULT 0,
  `marked_as_deleted_at` datetime DEFAULT NULL,
  `marked_as_deleted_by` int(10) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Filmy użytkowników';
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Polubienia filmów użytkowników';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_users`
--

DROP TABLE IF EXISTS `_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL DEFAULT 2,
  `nick` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `surname` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `avatar_url` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `password_hash` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `activation_hash` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `activated_at` datetime DEFAULT NULL,
  `password_reset_hash` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `password_reset_expires_at` datetime DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT 0,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT 0,
  `marked_as_deleted_at` datetime DEFAULT NULL,
  `marked_as_deleted_by` int(10) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Użytkownicy';
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `is_active` tinyint(1) DEFAULT 1,
  `begins_at` datetime DEFAULT NULL,
  `ends_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `created_by` int(10) DEFAULT 0,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(10) DEFAULT 0,
  `marked_as_deleted_at` datetime DEFAULT NULL,
  `marked_as_deleted_by` int(10) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Reklamy video';
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `description` text COLLATE utf8_polish_ci DEFAULT NULL,
  `image_url` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Odznaki dla graczy za aktywność';
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=559 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Punktacja przyznawana za dane miejsce w zależności od rodzaju konkursu';
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Rodzaje konkursów, np. normalny lub specjalny';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `def_games`
--

DROP TABLE IF EXISTS `def_games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `def_games` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `description` text COLLATE utf8_polish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Gry do konkursów';
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Typy plików bohaterów';
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Aktywności uczestników w serwisie, które są punktowane';
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Rangi graczy z racji zdobytych punktów i wykonanych zadań';
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Role użytkowników';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `old_contests`
--

DROP TABLE IF EXISTS `old_contests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `old_contests` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned DEFAULT 0,
  `type` char(32) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `start` datetime DEFAULT NULL,
  `expire` datetime DEFAULT NULL,
  `game_mode` smallint(5) unsigned DEFAULT NULL,
  `top_score` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Konkursy ze starych konkursiaków';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `old_score_total`
--

DROP TABLE IF EXISTS `old_score_total`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `old_score_total` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT 0,
  `points` int(11) DEFAULT 0,
  `max_points` int(11) DEFAULT 0,
  `given_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Punkty ze starych konkursiakow';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `old_user_contests`
--

DROP TABLE IF EXISTS `old_user_contests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `old_user_contests` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `contests_list` varchar(6000) DEFAULT NULL,
  `contests_count` int(10) unsigned DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Uczestnictwo w konkursach';
/*!40101 SET character_set_client = @saved_cs_client */;

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Punkty przyznane za miejsce w konkursie';
/*!40101 SET character_set_client = @saved_cs_client */;

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Punkty zdobyte w danej grze w danym konkursie na danym poziomie';
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `deleted` tinyint(4) DEFAULT 0,
  `inserted` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Archiwum punktów zdobytych w danej grze w danym konkursie na danym poziomie';
/*!40101 SET character_set_client = @saved_cs_client */;

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Punkty przyznane za punktowane aktywności';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-17 14:38:00
