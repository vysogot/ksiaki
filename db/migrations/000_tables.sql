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
 `description` text,
 `avatar_url` varchar(255),
 `header_url` varchar(255),
 `is_active` tinyint(1),
 `created_at` datetime,
 `updated_at` datetime,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Bohaterowie';

/* Użytkownicy */
CREATE TABLE IF NOT EXISTS `_users` (
 `id` int unsigned NOT NULL AUTO_INCREMENT,
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
 `box_url` varchar(255),
 `header_url` varchar(255),
 `begins_at` datetime,
 `ends_at` datetime,
 `display_ad` tinyint(1) DEFAULT 0,
 `is_active` tinyint(1) DEFAULT 1,
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
CREATE TABLE IF NOT EXISTS `score_games` (
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
 `user_id` int(11) unsigned NOT NULL,
 `expires_at` datetime NOT NULL,
 PRIMARY KEY (`token_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Zapamiętane loginy';

/* Archiwum punktów */
CREATE TABLE `score_games_archive` (
	`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`user_id` INT(10) UNSIGNED NULL DEFAULT NULL,
	`contest_id` INT(10) UNSIGNED NULL DEFAULT NULL,
	`level` INT(11) NULL DEFAULT NULL,
	`begins_at` DATETIME NULL DEFAULT NULL,
	`ends_at` DATETIME NULL DEFAULT NULL,
	`points` INT(11) NULL DEFAULT NULL,
	`points_total` INT(11) NULL DEFAULT NULL,
	`deleted` TINYINT(4) NULL DEFAULT '0',
	`inserted` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (`id`)
)
COMMENT='Archiwum punktów zdobytych w danej grze w danym konkursie na danym poziomie'
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=15323
;

CREATE TABLE `user_badges` (
	`id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
	`user_id` INT(11) UNSIGNED NOT NULL DEFAULT '0',
	`badge_id` INT(11) UNSIGNED NOT NULL DEFAULT '0',
	`given_at` DATETIME NULL DEFAULT NULL,
	`inserted_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (`id`)
)
COMMENT='Tabela odznak użytkownika'
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=33
;


SELECT 1;
