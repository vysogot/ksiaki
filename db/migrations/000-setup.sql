/* Użytkownicy */
CREATE TABLE IF NOT EXISTS `_users` (
 `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'auto incrementing id of each user, unique index',
 `role_id` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'user''s account type (basic, premium, etc)',
 `session_id` varchar(48) DEFAULT NULL COMMENT 'stores session cookie id to prevent session concurrency',
 `name` varchar(64) COLLATE utf8_general_ci NOT NULL COMMENT 'user''s name, unique',
 `email` varchar(254) COLLATE utf8_general_ci NOT NULL COMMENT 'user''s email, unique',
 `password_hash` varchar(255) COLLATE utf8_general_ci DEFAULT NULL COMMENT 'user''s password in salted and hashed format',
 `active` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'user''s activation status',
 `activation_hash` varchar(40) COLLATE utf8_general_ci DEFAULT NULL COMMENT 'user''s email verification hash string',
 `created_at` bigint(20) DEFAULT NULL COMMENT 'timestamp of the creation of user''s account',
 `last_login_timestamp` bigint(20) DEFAULT NULL COMMENT 'timestamp of user''s last login',
 PRIMARY KEY (`id`),
 UNIQUE KEY `name` (`name`),
 UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='user data';

/* Aktywności uczestników w serwisie, które są punktowane */
CREATE TABLE IF NOT EXISTS `def_pointed_activities` (
 `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
 `name` varchar(255) DEFAULT NULL,
 `points` int(11) DEFAULT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Aktywności uczestników w serwisie, które są punktowane';

/* Rodzaje konkursów, np. normalny lub specjalny */
CREATE TABLE IF NOT EXISTS `def_contest_types` (
 `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
 `name` varchar(255) DEFAULT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Rodzaje konkursów, np. normalny lub specjalny';

/* Punktacja przyznawana za dane miejsce w zależności od rodzaju konkursu */
CREATE TABLE IF NOT EXISTS `def_contest_places` (
 `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
 `contest_type_id` int(11) unsigned DEFAULT NULL,
 `name` varchar(255) DEFAULT NULL,
 `level` int(11) DEFAULT NULL,
 `points` int(11) DEFAULT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Punktacja przyznawana za dane miejsce w zależności od rodzaju konkursu';

/* Sponsorzy nagród w konkursach */
CREATE TABLE IF NOT EXISTS `def_prize_sponsors` (
 `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
 `name` varchar(255) DEFAULT NULL,
 `image_url` varchar(255) DEFAULT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Sponsorzy nagród w konkursach';

/* Odznaki dla graczy za aktywność */
CREATE TABLE IF NOT EXISTS `def_user_badges` (
 `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
 `title` varchar(255) DEFAULT NULL,
 `subtitle` varchar(255) DEFAULT NULL,
 `description` varchar(255) DEFAULT NULL,
 `image_url` varchar(255) DEFAULT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Odznaki dla graczy za aktywność';

/* Rangi graczy z racji zdobytych punktów i wykonanych zadań */
CREATE TABLE IF NOT EXISTS `def_user_ranks` (
 `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
 `title` varchar(255) DEFAULT NULL,
 `points_threshold` varchar(255) DEFAULT NULL,
 `image_url` varchar(255) DEFAULT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Rangi graczy z racji zdobytych punktów i wykonanych zadań';

/* Gry do konkursów */
CREATE TABLE IF NOT EXISTS `_games` (
 `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
 `name` varchar(255) DEFAULT NULL,
 `url` varchar(255) DEFAULT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Gry do konkursów';

/* Bohaterowie */
CREATE TABLE IF NOT EXISTS `_heroes` (
 `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
 `name` varchar(255) DEFAULT NULL,
 `is_active` tinyint(1) DEFAULT NULL,
 `avatar_url` varchar(255) DEFAULT NULL,
 `header_url` varchar(255) DEFAULT NULL,
 `left_box_url` varchar(255) DEFAULT NULL,
 `middle_box_url` varchar(255) DEFAULT NULL,
 `video_url` varchar(255) DEFAULT NULL,
 `created_at` timestamp,
 `uploaded_at` timestamp,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Bohaterowie';

/* Konkursy */
CREATE TABLE IF NOT EXISTS `_contests` (
 `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
 `game_id` int(11) unsigned NOT NULL,
 `contest_type_id` int(11) unsigned NOT NULL,
 `name` varchar(255) DEFAULT NULL,
 `description` varchar(255) DEFAULT NULL,
 `header_url` varchar(255) DEFAULT NULL,
 `begins_at` varchar(255) DEFAULT NULL,
 `ends_at` varchar(255) DEFAULT NULL,
 `display_ad` tinyint(4) DEFAULT '0',
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Konkursy';

/* Nagrody w konkursach */
CREATE TABLE IF NOT EXISTS `_contest_prizes` (
 `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
 `contest_id` int(11) unsigned NOT NULL,
 `prize_sponsor_id` int(11) unsigned NOT NULL,
 `name` varchar(255) DEFAULT NULL,
 `image_url` varchar(255) DEFAULT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Nagrody w konkursach';

/* Powiadomienia dla użytkowników */
CREATE TABLE IF NOT EXISTS `_notifications` (
 `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
 `title` varchar(255) DEFAULT NULL,
 `content` varchar(255) DEFAULT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Powiadomienia dla użytkowników';

/* Status powiadomień dla użytkowników */
CREATE TABLE IF NOT EXISTS `_notification_status` (
 `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
 `user_id` int(11) unsigned NOT NULL,
 `confirmed_at` timestamp,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Status powiadomień dla użytkowników';

/* Quizy */
CREATE TABLE IF NOT EXISTS `_quizes` (
 `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
 `question` varchar(255) DEFAULT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Quizy';

/* Odpowiedzi na quizy */
CREATE TABLE IF NOT EXISTS `_quizes_answers` (
 `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
 `quiz_id` int(11) unsigned NOT NULL,
 `answer` varchar(255) DEFAULT NULL,
 `is_correct` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'is this answer correct',
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Odpowiedzi na quizy';

/* Punkty przyznane za punktowane aktywności */
CREATE TABLE IF NOT EXISTS `score_pointed_activities` (
 `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
 `user_id` int(11) unsigned DEFAULT NULL,
 `event_id` int(11) unsigned DEFAULT NULL,
 `points` int(11) DEFAULT NULL,
 `given_at` timestamp,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Punkty przyznane za punktowane aktywności';

/* Punkty przyznane za miejsce w konkursie */
CREATE TABLE IF NOT EXISTS `score_contests` (
 `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
 `user_id` int(11) unsigned DEFAULT NULL,
 `contest_id` int(11) unsigned DEFAULT NULL,
 `place` int(11) DEFAULT NULL,
 `points` int(11) DEFAULT NULL,
 `given_at` timestamp,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Punkty przyznane za miejsce w konkursie';

/* Punkty zdobyte w danej grze w danym konkursie na danym poziomie */
CREATE TABLE IF NOT EXISTS `score_games` (
 `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
 `user_id` int(11) unsigned DEFAULT NULL,
 `contest_id` int(11) unsigned DEFAULT NULL,
 `level` int(11) DEFAULT NULL,
 `level_begins_at` timestamp,
 `level_ends_at` timestamp,
 `points_for_level` int(11) DEFAULT NULL,
 `points_total` int(11) DEFAULT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Punkty zdobyte w danej grze w danym konkursie na danym poziomie';

/* Punkty zdobyte w quizach */
CREATE TABLE IF NOT EXISTS `score_quizes` (
 `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
 `user_id` int(11) unsigned DEFAULT NULL,
 `quiz_id` int(11) unsigned DEFAULT NULL,
 `points` int(11) DEFAULT NULL,
 `given_at` timestamp,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Punkty zdobyte w quizach';

/* Strony statyczne */
CREATE TABLE IF NOT EXISTS `static_sites` (
 `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
 `title` tinyint(1) DEFAULT NULL,
 `slug` varchar(255) DEFAULT NULL,
 `content` varchar(255) DEFAULT NULL,
 `created_at` timestamp,
 `uploaded_at` timestamp,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Strony statyczne';

/* DO USUNIĘCIA – tabela z HUGE */
CREATE TABLE IF NOT EXISTS `notes` (
 `note_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
 `note_text` text NOT NULL,
 `user_id` int(11) unsigned NOT NULL,
 PRIMARY KEY (`note_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='user notes';

SELECT 1;
