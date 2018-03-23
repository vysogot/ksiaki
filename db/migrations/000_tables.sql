/* Aktywności uczestników w serwisie, które są punktowane */
CREATE TABLE IF NOT EXISTS `def_pointed_activities` (
 `id` int unsigned NOT NULL AUTO_INCREMENT,
 `name` varchar(255),
 `points` int,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Aktywności uczestników w serwisie, które są punktowane';

/* Rodzaje konkursów, np. normalny lub specjalny */
CREATE TABLE IF NOT EXISTS `def_contest_types` (
 `id` int unsigned NOT NULL AUTO_INCREMENT,
 `name` varchar(255),
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Rodzaje konkursów, np. normalny lub specjalny';

/* Punktacja przyznawana za dane miejsce w zależności od rodzaju konkursu */
CREATE TABLE IF NOT EXISTS `def_contest_places` (
 `id` int unsigned NOT NULL AUTO_INCREMENT,
 `contest_type_id` int unsigned,
 `name` varchar(255),
 `place` int,
 `points` int,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Punktacja przyznawana za dane miejsce w zależności od rodzaju konkursu';

/* Sponsorzy nagród w konkursach */
CREATE TABLE IF NOT EXISTS `def_sponsors` (
 `id` int unsigned NOT NULL AUTO_INCREMENT,
 `name` varchar(255),
 `image_url` varchar(255),
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Sponsorzy nagród w konkursach';

/* Odznaki dla graczy za aktywność */
CREATE TABLE IF NOT EXISTS `def_badges` (
 `id` int unsigned NOT NULL AUTO_INCREMENT,
 `title` varchar(255),
 `subtitle` varchar(255),
 `description` text,
 `image_url` varchar(255),
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Odznaki dla graczy za aktywność';

/* Rangi graczy z racji zdobytych punktów i wykonanych zadań */
CREATE TABLE IF NOT EXISTS `def_ranks` (
 `id` int unsigned NOT NULL AUTO_INCREMENT,
 `title` varchar(255),
 `points_threshold` varchar(255),
 `image_url` varchar(255),
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Rangi graczy z racji zdobytych punktów i wykonanych zadań';

/* Gry do konkursów */
CREATE TABLE IF NOT EXISTS `def_games` (
 `id` int unsigned NOT NULL AUTO_INCREMENT,
 `name` varchar(255),
 `description` text,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Gry do konkursów';

/* Tła */
CREATE TABLE IF NOT EXISTS `_backgrounds` (
 `id` int unsigned NOT NULL AUTO_INCREMENT,
 `name` varchar(255),
 `image_url` varchar(255),
 `link_url` varchar(255),
 `background_color` varchar(255),
 `details_color` varchar(255),
 `is_active` tinyint(1),
 `begins_at` datetime,
 `ends_at` datetime,
 `created_at` datetime,
 `updated_at` datetime,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Tła reklamowe';

/* Bohaterowie */
CREATE TABLE IF NOT EXISTS `_heroes` (
 `id` int unsigned NOT NULL AUTO_INCREMENT,
 `name` varchar(255),
 `is_active` tinyint(1),
 `avatar_url` varchar(255),
 `header_url` varchar(255),
 `left_box_url` varchar(255),
 `middle_box_url` varchar(255),
 `video_url` varchar(255),
 `created_at` datetime,
 `updated_at` datetime,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Bohaterowie';

/* Użytkownicy */
CREATE TABLE IF NOT EXISTS `_users` (
 `id` int NOT NULL AUTO_INCREMENT,
 `role_id` tinyint(1) NOT NULL DEFAULT '1',
 `session_id` varchar(255),
 `name` varchar(255) NOT NULL,
 `email` varchar(255) NOT NULL,
 `password_hash` varchar(255),
 `active` tinyint(1) NOT NULL DEFAULT '0',
 `activation_hash` varchar(255),
 `created_at` datetime,
 `last_login_at` datetime,
 PRIMARY KEY (`id`),
 UNIQUE KEY `name` (`name`),
 UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Użytkownicy';

/* Konkursy */
CREATE TABLE IF NOT EXISTS `_contests` (
 `id` int unsigned NOT NULL AUTO_INCREMENT,
 `game_id` int unsigned NOT NULL,
 `contest_type_id` int unsigned NOT NULL,
 `name` varchar(255),
 `description` text,
 `header_url` varchar(255),
 `begins_at` datetime,
 `ends_at` datetime,
 `display_ad` tinyint(1) DEFAULT 0,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Konkursy';

/* Nagrody w konkursach */
CREATE TABLE IF NOT EXISTS `_contest_prizes` (
 `id` int unsigned NOT NULL AUTO_INCREMENT,
 `contest_id` int unsigned NOT NULL,
 `prize_sponsor_id` int unsigned NOT NULL,
 `name` varchar(255),
 `image_url` varchar(255),
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Nagrody w konkursach';

/* Powiadomienia dla użytkowników */
CREATE TABLE IF NOT EXISTS `_notifications` (
 `id` int unsigned NOT NULL AUTO_INCREMENT,
 `title` varchar(255),
 `content` varchar(255),
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Powiadomienia dla użytkowników';

/* Status powiadomień dla użytkowników */
CREATE TABLE IF NOT EXISTS `_notification_statuses` (
 `id` int unsigned NOT NULL AUTO_INCREMENT,
 `notification_id` int unsigned NOT NULL,
 `user_id` int unsigned NOT NULL,
 `confirmed_at` datetime,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Status powiadomień dla użytkowników';

/* Quizy */
CREATE TABLE IF NOT EXISTS `_quizes` (
 `id` int unsigned NOT NULL AUTO_INCREMENT,
 `question` varchar(255),
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Quizy';

/* Odpowiedzi na quizy */
CREATE TABLE IF NOT EXISTS `_quiz_answers` (
 `id` int unsigned NOT NULL AUTO_INCREMENT,
 `quiz_id` int unsigned NOT NULL,
 `answer` varchar(255),
 `is_correct` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'is this answer correct',
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Odpowiedzi na quizy';

/* Punkty przyznane za punktowane aktywności */
CREATE TABLE IF NOT EXISTS `score_pointed_activities` (
 `id` int unsigned NOT NULL AUTO_INCREMENT,
 `user_id` int unsigned,
 `activity_id` int unsigned,
 `points` int,
 `given_at` datetime,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Punkty przyznane za punktowane aktywności';

/* Punkty przyznane za miejsce w konkursie */
CREATE TABLE IF NOT EXISTS `score_contests` (
 `id` int unsigned NOT NULL AUTO_INCREMENT,
 `user_id` int unsigned,
 `contest_id` int unsigned,
 `place` int,
 `points` int,
 `given_at` datetime,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Punkty przyznane za miejsce w konkursie';

/* Punkty zdobyte w danej grze w danym konkursie na danym poziomie */
CREATE TABLE IF NOT EXISTS `game_scores` (
 `id` int unsigned NOT NULL AUTO_INCREMENT,
 `user_id` int unsigned,
 `contest_id` int unsigned,
 `level` int,
 `begins_at` datetime,
 `ends_at` datetime,
 `points` int,
 `points_total` int,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Punkty zdobyte w danej grze w danym konkursie na danym poziomie';

/* Punkty zdobyte w quizach */
CREATE TABLE IF NOT EXISTS `score_quizes` (
 `id` int unsigned NOT NULL AUTO_INCREMENT,
 `user_id` int unsigned,
 `quiz_id` int unsigned,
 `points` int,
 `given_at` datetime,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Punkty zdobyte w quizach';

/* Strony statyczne */
CREATE TABLE IF NOT EXISTS `static_sites` (
 `id` int unsigned NOT NULL AUTO_INCREMENT,
 `title` varchar(255),
 `slug` varchar(255),
 `content` text,
 `created_at` datetime,
 `updated_at` datetime,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Strony statyczne';

CREATE TABLE `remembered_logins` (
 `token_hash` varchar(255) NOT NULL,
 `user_id` int(11) NOT NULL,
 `expires_at` datetime NOT NULL,
 PRIMARY KEY (`token_hash`),
 KEY `user_id` (`user_id`),
 CONSTRAINT `remembered_logins_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Zapamiętane loginy';

SELECT 1;
