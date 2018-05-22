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

/* Boxy */
CREATE TABLE IF NOT EXISTS `_boxes` (
    `id` int unsigned NOT NULL AUTO_INCREMENT,
    `name` varchar(255),
    `image_url` varchar(255),
    `link_url` varchar(255),
    `is_active` tinyint(1),
    `begins_at` datetime,
    `ends_at` datetime,
    `created_at` datetime,
    `updated_at` datetime,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Boxy';

/* Slajdy */
CREATE TABLE IF NOT EXISTS `_slides` (
    `id` int unsigned NOT NULL AUTO_INCREMENT,
    `name` varchar(255),
    `image_url` varchar(255),
    `link_url` varchar(255),
    `is_active` tinyint(1),
    `begins_at` datetime,
    `ends_at` datetime,
    `created_at` datetime,
    `updated_at` datetime,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Slajdy';

/* Filmy użytkowników */
CREATE TABLE IF NOT EXISTS `_user_movies` (
    `id` int unsigned NOT NULL AUTO_INCREMENT,
    `user_id` int unsigned NOT NULL,
    `name` varchar(255),
    `description` text,
    `video_url` varchar(255),
    `image_url` varchar(255),
    `link_url` varchar(255),
    `is_active` tinyint(1),
    `begins_at` datetime,
    `ends_at` datetime,
    `created_at` datetime,
    `updated_at` datetime,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Filmy użytkowników';

/* Polubienia filmów użytkowników */
CREATE TABLE IF NOT EXISTS `_user_movies_likes` (
    `user_id` int unsigned NOT NULL,
    `user_movie_id` int unsigned NOT NULL,
    `given_at` datetime,
    PRIMARY KEY (`user_id`, `user_movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Polubienia filmów użytkowników';

/* Reklamy video */
CREATE TABLE IF NOT EXISTS `_video_ads` (
    `id` int unsigned NOT NULL AUTO_INCREMENT,
    `name` varchar(255),
    `video_url` varchar(255),
    `image_url` varchar(255),
    `link_url` varchar(255),
    `is_active` tinyint(1),
    `begins_at` datetime,
    `ends_at` datetime,
    `created_at` datetime,
    `updated_at` datetime,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Reklamy video';

/* Bohaterowie */
CREATE TABLE IF NOT EXISTS `_heroes` (
    `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NULL DEFAULT NULL,
    `slug` VARCHAR(255) NULL DEFAULT NULL,
    `description` TEXT NULL,
    `avatar_url` VARCHAR(255) NULL DEFAULT NULL,
    `header_url` VARCHAR(255) NULL DEFAULT NULL,
    `cover_url` VARCHAR(255) NULL DEFAULT NULL,
    `video_url` VARCHAR(255) NULL DEFAULT NULL,
    `gadget_url` VARCHAR(255) NULL DEFAULT NULL,
    `footer_url` VARCHAR(255) NULL DEFAULT NULL,
    `license_description` TEXT NULL,
    `is_active` TINYINT(1) NULL DEFAULT NULL,
    `is_marked_as_deleted` TINYINT(1) NULL DEFAULT NULL,
    `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` DATETIME NULL DEFAULT NULL,
    `marked_as_deleted_at` DATETIME NULL DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Bohaterowie';

/* Pobrania bohaterów */
CREATE TABLE IF NOT EXISTS `_hero_downloads` (
    `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `hero_id` INT(10) UNSIGNED NOT NULL,
    `name` VARCHAR(255) NULL DEFAULT NULL,
    `description` TEXT NULL,
    `file_url` VARCHAR(255) NULL DEFAULT NULL,
    `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` DATETIME NULL DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Pliki bohaterów';

/* Role */
CREATE TABLE IF NOT EXISTS `_roles` (
    `id` int unsigned NOT NULL AUTO_INCREMENT,
    `name` varchar(255) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Role';

/* Użytkownicy */
CREATE TABLE IF NOT EXISTS `_users` (
    `id` int unsigned NOT NULL AUTO_INCREMENT,
    `role_id` int NOT NULL DEFAULT '2',
    `nick` varchar(255) NOT NULL,
    `email` varchar(255) NOT NULL,
    `name` varchar(255) NOT NULL,
    `surname` varchar(255) NOT NULL,
    `avatar_url` varchar(255),
    `is_active` tinyint(1) NOT NULL DEFAULT '0',
    `password_hash` varchar(255) NOT NULL,
    `activation_hash` varchar(255),
    `last_login_at` datetime,
    `created_at` datetime,
    `updated_at` datetime,
    PRIMARY KEY (`id`),
    UNIQUE KEY `name` (`name`),
    UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Użytkownicy';

/* Konta użytkowników */
CREATE TABLE IF NOT EXISTS `_accounts` (
    `id` int unsigned NOT NULL AUTO_INCREMENT,
    `user_id` int unsigned NOT NULL,
    `gender` tinyint(1) NOT NULL,
    `birthday` date,
    `address` varchar(255),
    `postcode` varchar(255),
    `city` varchar(255),
    `contest_agreement` tinyint(1),
    `marketing_agreement` tinyint(1),
    `notifications_agreement` tinyint(1),
    `statute_agreement` tinyint(1),
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Konta użytkowników';

/* Rodzice użytkowników */
CREATE TABLE IF NOT EXISTS `_caretakers` (
    `id` int unsigned NOT NULL AUTO_INCREMENT,
    `user_id` int unsigned NOT NULL,
    `name` varchar(255),
    `surname` varchar(255),
    `email` varchar(255),
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Rodzice użytkowników';

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
    `name` varchar(255),
    `description` varchar(255),
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

/* Strony statyczne */
CREATE TABLE IF NOT EXISTS `_static_sites` (
    `id` int unsigned NOT NULL AUTO_INCREMENT,
    `title` varchar(255),
    `slug` varchar(255),
    `content` text,
    `is_active` tinyint(1),
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Strony statyczne';

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
;


SELECT 1;
