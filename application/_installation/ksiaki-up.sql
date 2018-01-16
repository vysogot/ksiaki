CREATE DATABASE IF NOT EXISTS `ksiaki`;

/*****
------
TABELE
------
*****/

/* Użytkownicy z frameworku HUGE */
CREATE TABLE IF NOT EXISTS `ksiaki`.`users` (
 `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'auto incrementing user_id of each user, unique index',
 `session_id` varchar(48) DEFAULT NULL COMMENT 'stores session cookie id to prevent session concurrency',
 `user_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'user''s name, unique',
 `user_password_hash` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'user''s password in salted and hashed format',
 `user_email` varchar(254) COLLATE utf8_unicode_ci NOT NULL COMMENT 'user''s email, unique',
 `user_active` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'user''s activation status',
 `user_deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'user''s deletion status',
 `user_account_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'user''s account type (basic, premium, etc)',
 `user_has_avatar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 if user has a local avatar, 0 if not',
 `user_remember_me_token` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'user''s remember-me cookie token',
 `user_creation_timestamp` bigint(20) DEFAULT NULL COMMENT 'timestamp of the creation of user''s account',
 `user_suspension_timestamp` bigint(20) DEFAULT NULL COMMENT 'Timestamp till the end of a user suspension',
 `user_last_login_timestamp` bigint(20) DEFAULT NULL COMMENT 'timestamp of user''s last login',
 `user_failed_logins` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'user''s failed login attempts',
 `user_last_failed_login` int(10) DEFAULT NULL COMMENT 'unix timestamp of last failed login attempt',
 `user_activation_hash` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'user''s email verification hash string',
 `user_password_reset_hash` char(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'user''s password reset code',
 `user_password_reset_timestamp` bigint(20) DEFAULT NULL COMMENT 'timestamp of the password reset request',
 `user_provider_type` text COLLATE utf8_unicode_ci,
 PRIMARY KEY (`user_id`),
 UNIQUE KEY `user_name` (`user_name`),
 UNIQUE KEY `user_email` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='user data';

/* Rodzaje banerów, reklam, które będą wyświetlane na stronie */
CREATE TABLE IF NOT EXISTS `ksiaki`.`def_banner_types` (
 `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
 `name` varchar(255) DEFAULT NULL,
 `width_px` int(11) DEFAULT NULL,
 `height_px` int(11) DEFAULT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Rodzaje banerów, reklam, które będą wyświetlane na stronie';

/* Aktywności uczestników w serwisie, które są punktowane */
CREATE TABLE IF NOT EXISTS `ksiaki`.`def_pointed_activities` (
 `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
 `name` varchar(255) DEFAULT NULL,
 `points` int(11) DEFAULT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Aktywności uczestników w serwisie, które są punktowane';

/* Rodzaje konkursów, np. normalny lub specjalny */
CREATE TABLE IF NOT EXISTS `ksiaki`.`def_contest_types` (
 `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
 `name` varchar(255) DEFAULT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Rodzaje konkursów, np. normalny lub specjalny';

/* Punktacja przyznawana za dane miejsce w zależności od rodzaju konkursu */
CREATE TABLE IF NOT EXISTS `ksiaki`.`def_contest_places` (
 `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
 `contest_type_id` int(11) unsigned DEFAULT NULL,
 `name` varchar(255) DEFAULT NULL,
 `level` int(11) DEFAULT NULL,
 `points` int(11) DEFAULT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Punktacja przyznawana za dane miejsce w zależności od rodzaju konkursu';

/* Sponsorzy nagród w konkursach */
CREATE TABLE IF NOT EXISTS `ksiaki`.`def_prize_sponsors` (
 `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
 `name` varchar(255) DEFAULT NULL,
 `image_url` varchar(255) DEFAULT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Sponsorzy nagród w konkursach';

/* Odznaki dla graczy za aktywność */
CREATE TABLE IF NOT EXISTS `ksiaki`.`def_user_badges` (
 `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
 `title` varchar(255) DEFAULT NULL,
 `subtitle` varchar(255) DEFAULT NULL,
 `description` varchar(255) DEFAULT NULL,
 `image_url` varchar(255) DEFAULT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Odznaki dla graczy za aktywność';

/* Rangi graczy z racji zdobytych punktów i wykonanych zadań */
CREATE TABLE IF NOT EXISTS `ksiaki`.`def_user_ranks` (
 `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
 `title` varchar(255) DEFAULT NULL,
 `points_threshold` varchar(255) DEFAULT NULL,
 `image_url` varchar(255) DEFAULT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Rangi graczy z racji zdobytych punktów i wykonanych zadań';

/* Banery reklamowe */
CREATE TABLE IF NOT EXISTS `ksiaki`.`_banners` (
 `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
 `banner_type_id` int(11) unsigned NOT NULL,
 `title` varchar(255) DEFAULT NULL,
 `image_url` varchar(255) DEFAULT NULL,
 `link_to_url` varchar(255) DEFAULT NULL,
 `begins_at` varchar(255) DEFAULT NULL,
 `ends_at` varchar(255) DEFAULT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Banery reklamowe';

/* Gry do konkursów */
CREATE TABLE IF NOT EXISTS `ksiaki`.`_games` (
 `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
 `name` varchar(255) DEFAULT NULL,
 `url` varchar(255) DEFAULT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Gry do konkursów';

/* Bohaterowie */
CREATE TABLE IF NOT EXISTS `ksiaki`.`_heroes` (
 `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
 `name` varchar(255) DEFAULT NULL,
 `is_active` tinyint(1) DEFAULT NULL,
 `avatar_url` varchar(255) DEFAULT NULL,
 `top_banner_url` varchar(255) DEFAULT NULL,
 `left_box_url` varchar(255) DEFAULT NULL,
 `middle_box_url` varchar(255) DEFAULT NULL,
 `video_url` varchar(255) DEFAULT NULL,
 `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
 `uploaded_at` timestamp DEFAULT CURRENT_TIMESTAMP,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Bohaterowie';

/* Konkursy */
CREATE TABLE IF NOT EXISTS `ksiaki`.`_contests` (
 `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
 `game_id` int(11) unsigned NOT NULL,
 `contest_type_id` int(11) unsigned NOT NULL,
 `name` varchar(255) DEFAULT NULL,
 `description` varchar(255) DEFAULT NULL,
 `banner_url` varchar(255) DEFAULT NULL,
 `begins_at` varchar(255) DEFAULT NULL,
 `ends_at` varchar(255) DEFAULT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Konkursy';

/* Nagrody w konkursach */
CREATE TABLE IF NOT EXISTS `ksiaki`.`_contest_prizes` (
 `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
 `contest_id` int(11) unsigned NOT NULL,
 `prize_sponsor_id` int(11) unsigned NOT NULL,
 `name` varchar(255) DEFAULT NULL,
 `image_url` varchar(255) DEFAULT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Nagrody w konkursach';

/* Powiadomienia dla użytkowników */
CREATE TABLE IF NOT EXISTS `ksiaki`.`_notifications` (
 `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
 `title` varchar(255) DEFAULT NULL,
 `content` varchar(255) DEFAULT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Powiadomienia dla użytkowników';

/* Status powiadomień dla użytkowników */
CREATE TABLE IF NOT EXISTS `ksiaki`.`_notification_status` (
 `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
 `user_id` int(11) unsigned NOT NULL,
 `confirmed_at` timestamp DEFAULT CURRENT_TIMESTAMP,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Status powiadomień dla użytkowników';

/* Quizy */
CREATE TABLE IF NOT EXISTS `ksiaki`.`_quizes` (
 `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
 `question` varchar(255) DEFAULT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Quizy';

/* Odpowiedzi na quizy */
CREATE TABLE IF NOT EXISTS `ksiaki`.`_quizes_answers` (
 `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
 `quiz_id` int(11) unsigned NOT NULL,
 `answer` varchar(255) DEFAULT NULL,
 `is_correct` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'is this answer correct',
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Odpowiedzi na quizy';

/* Punkty przyznane za punktowane aktywności */
CREATE TABLE IF NOT EXISTS `ksiaki`.`score_pointed_activities` (
 `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
 `user_id` int(11) unsigned DEFAULT NULL,
 `event_id` int(11) unsigned DEFAULT NULL,
 `points` int(11) DEFAULT NULL,
 `given_at` timestamp DEFAULT CURRENT_TIMESTAMP,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Punkty przyznane za punktowane aktywności';

/* Punkty przyznane za miejsce w konkursie */
CREATE TABLE IF NOT EXISTS `ksiaki`.`score_contests` (
 `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
 `user_id` int(11) unsigned DEFAULT NULL,
 `contest_id` int(11) unsigned DEFAULT NULL,
 `place` int(11) DEFAULT NULL,
 `points` int(11) DEFAULT NULL,
 `given_at` timestamp DEFAULT CURRENT_TIMESTAMP,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Punkty przyznane za miejsce w konkursie';

/* Punkty zdobyte w danej grze w danym konkursie na danym poziomie */
CREATE TABLE IF NOT EXISTS `ksiaki`.`score_games` (
 `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
 `user_id` int(11) unsigned DEFAULT NULL,
 `contest_id` int(11) unsigned DEFAULT NULL,
 `level` int(11) DEFAULT NULL,
 `level_begins_at` timestamp DEFAULT CURRENT_TIMESTAMP,
 `level_ends_at` timestamp DEFAULT CURRENT_TIMESTAMP,
 `points_for_level` int(11) DEFAULT NULL,
 `points_total` int(11) DEFAULT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Punkty zdobyte w danej grze w danym konkursie na danym poziomie';

/* Punkty zdobyte w quizach */
CREATE TABLE IF NOT EXISTS `ksiaki`.`score_quizes` (
 `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
 `user_id` int(11) unsigned DEFAULT NULL,
 `quiz_id` int(11) unsigned DEFAULT NULL,
 `points` int(11) DEFAULT NULL,
 `given_at` timestamp DEFAULT CURRENT_TIMESTAMP,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Punkty zdobyte w quizach';

/* Strony statyczne */
CREATE TABLE IF NOT EXISTS `ksiaki`.`static_sites` (
 `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
 `title` tinyint(1) DEFAULT NULL,
 `slug` varchar(255) DEFAULT NULL,
 `content` varchar(255) DEFAULT NULL,
 `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
 `uploaded_at` timestamp DEFAULT CURRENT_TIMESTAMP,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Strony statyczne';

/* DO USUNIĘCIA – tabela z HUGE */
CREATE TABLE IF NOT EXISTS `ksiaki`.`notes` (
 `note_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
 `note_text` text NOT NULL,
 `user_id` int(11) unsigned NOT NULL,
 PRIMARY KEY (`note_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='user notes';

/***********
------------
DANE TESTOWE
------------
***********/

INSERT INTO `ksiaki`.`users` (`user_id`, `session_id`, `user_name`, `user_password_hash`, `user_email`, `user_active`, `user_deleted`, `user_account_type`,
`user_has_avatar`, `user_remember_me_token`, `user_creation_timestamp`, `user_suspension_timestamp`, `user_last_login_timestamp`,
`user_failed_logins`, `user_last_failed_login`, `user_activation_hash`, `user_password_reset_hash`,
`user_password_reset_timestamp`, `user_provider_type`) VALUES
  (1, NULL, 'demo', '$2y$10$OvprunjvKOOhM1h9bzMPs.vuwGIsOqZbw88rzSyGCTJTcE61g5WXi', 'demo@demo.com', 1, 0, 7, 0, NULL, 1422205178, NULL, 1422209189, 0, NULL, NULL, NULL, NULL, 'DEFAULT'),
  (2, NULL, 'demo2', '$2y$10$OvprunjvKOOhM1h9bzMPs.vuwGIsOqZbw88rzSyGCTJTcE61g5WXi', 'demo2@demo.com', 1, 0, 1, 0, NULL, 1422205178, NULL, 1422209189, 0, NULL, NULL, NULL, NULL, 'DEFAULT');
