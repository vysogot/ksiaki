SET FOREIGN_KEY_CHECKS = 0;
SET NAMES utf8;

TRUNCATE TABLE `def_games`;
INSERT INTO `def_games` (`id`, `name`, `description`)
VALUES
(1, 'sorcerer', 'game_sorcerer_description'),
(2, 'arkanoid', 'game_arkanoid_description');

TRUNCATE TABLE `def_contest_types`;
INSERT INTO `def_contest_types` (`id`, `name`)
VALUES
(1, 'Normalny'),
(2, 'Specjalny');

TRUNCATE TABLE `def_contest_places`;
INSERT INTO `def_contest_places` (`id`, `contest_type_id`, `name`, `place`, `points`)
VALUES
(1, 1, 'contest_places_1st_place', 1, 100),
(2, 1, 'contest_places_2nd_place', 2, 99),
(3, 2, 'contest_places_1st_place', 1, 200),
(4, 2, 'contest_places_2nd_place', 2, 199);

TRUNCATE TABLE `def_pointed_activities`;
INSERT INTO `def_pointed_activities` (`id`, `name`, `points`)
VALUES
(1, 'registration', 5),
(2, 'login', 1),
(3, 'invitation_login', 5),
(4, 'contest_participation', 5),
(5, 'personal_best_score_update', 1);

TRUNCATE TABLE `def_badges`;
INSERT INTO `def_badges` (`id`, `title`, `subtitle`, `description`, `image_url`)
VALUES
(1, 'badge_champion_title', 'badge_champion_subtitle', 'badge_champion_description', 'badge-champion-url.jpg'),
(2, 'badge_fighter_title', 'badge_fighter_subtitle', 'badge_fighter_description', 'badge-fighter-url.jpg'),
(3, 'badge_fan_title', 'badge_fan_subtitle', 'badge_fan_description', 'badge-fan-url.jpg'),
(4, 'badge_gamer_title', 'badge_gamer_subtitle', 'badge_gamer_description', 'badge-gamer-url.jpg'),
(5, 'badge_friend_title', 'badge_friend_subtitle', 'badge_friend_description', 'badge-friend-url.jpg');

TRUNCATE TABLE `def_ranks`;
INSERT INTO `def_ranks` (`id`, `title`, `points_threshold`, `image_url`)
VALUES
(1, 'rank_player', 5, 'rank-player.jpg'),
(2, 'rank_star_player', 500, 'rank-star-player.jpg'),
(3, 'rank_top_player', 1000, 'rank-top-player.jpg'),
(4, 'rank_konkursiak', 5000, 'rank-konkursiaki.jpg');

TRUNCATE TABLE `_users`;
/* password: 12345678 */
INSERT INTO `_users` (`id`, `role_id`, `nick`, `name`, `surname`, `email`, `password_hash`, `is_active`) VALUES
	(1, 2,  'user', 'Piotr', 'Gracz',  'demo@demo.com', 	'$2y$10$EwF6/cRU8hVn8b7j.WswyeLmie6oYOI83ljS3WvWW9uu4GOzevOOy', 1),
	(2, 1,  'admin', 'Tomasz', 'Admin', 'demo2@demo.com', 	'$2y$10$EwF6/cRU8hVn8b7j.WswyeLmie6oYOI83ljS3WvWW9uu4GOzevOOy', 1),
	(3, 2,  'basia99', 'Basia', 'Grymas', 'basia@demo.com', 	'$2y$10$EwF6/cRU8hVn8b7j.WswyeLmie6oYOI83ljS3WvWW9uu4GOzevOOy', 1),
	(4, 2,  'sta13', 'Stasia', 'Hejsiup', 'stasia@demo.com', '$2y$10$EwF6/cRU8hVn8b7j.WswyeLmie6oYOI83ljS3WvWW9uu4GOzevOOy', 1),
	(5, 2,  'kkmaster', 'Krzyś', 'Kowal', 'krzys@demo.com', 	'$2y$10$EwF6/cRU8hVn8b7j.WswyeLmie6oYOI83ljS3WvWW9uu4GOzevOOy', 1),
	(6, 2,  'grzechu', 'Grześ', 'Stawo', 'grzes@demo.com',	'$2y$10$EwF6/cRU8hVn8b7j.WswyeLmie6oYOI83ljS3WvWW9uu4GOzevOOy', 1),
	(7, 2,  'tomo', 'Tomek', 'Dynda', 'tomek@demo.com',	'$2y$10$EwF6/cRU8hVn8b7j.WswyeLmie6oYOI83ljS3WvWW9uu4GOzevOOy', 1),
	(8, 2,  'banzai11', 'Jasia', 'Dżem', 'jasia@demo.com',  '$2y$10$EwF6/cRU8hVn8b7j.WswyeLmie6oYOI83ljS3WvWW9uu4GOzevOOy', 1),
	(9, 2,  'zuzu', 'Zuzia', 'Kapusta', 'zuzia@demo.com',  '$2y$10$EwF6/cRU8hVn8b7j.WswyeLmie6oYOI83ljS3WvWW9uu4GOzevOOy', 1),
	(10, 2, 'aaaappp11', 'Adam', 'Ginger', 'adam@demo.com',   '$2y$10$EwF6/cRU8hVn8b7j.WswyeLmie6oYOI83ljS3WvWW9uu4GOzevOOy', 1);

TRUNCATE TABLE `_backgrounds`;
INSERT INTO `_backgrounds` (`id`, `name`, `image_url`, `link_url`, `background_color`, `details_color`, `is_active`, `begins_at`, `ends_at`, `created_at`, `updated_at`)
VALUES
(1, 'Mleczna droga', '/uploads/background-1.jpg', 'http://onet.pl', '#fff', '#000', 1, '2018-01-31 00:00:00', '2028-09-30 00:00:00', '2008-09-30 00:00:00', '2009-09-30 00:00:00'),
(2, 'Jaskiniowiec', '/uploads/background-2.jpg', 'http://wp.pl', 'black', 'white', 0, '2018-09-30 00:00:00', '2019-09-30 00:00:00', '2006-09-30 00:00:00', '2008-09-30 00:00:00');

TRUNCATE TABLE `_slides`;
INSERT INTO `_slides` (`id`, `name`, `image_url`, `link_url`, `is_active`, `begins_at`, `ends_at`) 
VALUES 
(1, 'Slajd 1', '/uploads/slide-1.jpg', 'http://konkursiaki.pl', 1, '2018-02-02 00:00:00', '2018-09-20 00:00:00'),
(2, 'Slajd 2', '/uploads/slide-2.jpg', 'http://konkursiaki.pl', 1, '2028-02-02 00:00:00', '2028-09-20 00:00:00'),
(3, 'Slajd 3', '/uploads/slide-3.jpg', 'http://konkursiaki.pl', 1, '2038-02-02 00:00:00', '2038-09-20 00:00:00');

TRUNCATE TABLE `_user_movies`;
INSERT INTO `_user_movies` (`id`, `user_id`, `name`, `description`, `video_url`, `image_url`, `link_url`, `is_active`, `begins_at`, `ends_at`) 
VALUES 
(1, 1, 'User video 1', 'description', '/uploads/movie-1.mov', '/uploads/user_movie-1.jpg', 'http://konkursiaki.pl', 1, '2018-02-02 00:00:00', '2018-02-20 00:00:00'),
(2, 2, 'User video 2', 'description', '/uploads/movie-2.mov', '/uploads/user_movie-2.jpg', 'http://konkursiaki.pl', 1, '2018-02-02 00:00:00', '2018-02-20 00:00:00'),
(3, 2, 'User video 3', 'description', '/uploads/movie-1.mov', '/uploads/user_movie-3.jpg', 'http://konkursiaki.pl', 1, '2018-02-02 00:00:00', '2018-02-20 00:00:00'),
(4, 1, 'User video 4', 'description', '/uploads/movie-1.mov', '/uploads/user_movie-4.jpg', 'http://konkursiaki.pl', 1, '2018-02-02 00:00:00', '2018-02-20 00:00:00'),
(5, 2, 'User video 5', 'description', '/uploads/movie-1.mov', '/uploads/user_movie-3.jpg', 'http://konkursiaki.pl', 1, '2018-02-02 00:00:00', '2018-02-20 00:00:00'),
(6, 1, 'User video 6', 'description', '/uploads/movie-2.mov', '/uploads/user_movie-2.jpg', 'http://konkursiaki.pl', 1, '2018-02-02 00:00:00', '2018-02-20 00:00:00');

TRUNCATE TABLE `_user_movies_likes`;
INSERT INTO `_user_movies_likes` (`user_id`, `user_movie_id`)
VALUES (1, 4), (2, 4), (1, 3), (2, 1);

TRUNCATE TABLE `_video_ads`;
INSERT INTO `_video_ads` (`id`, `name`, `video_url`, `image_url`, `link_url`, `is_active`, `begins_at`, `ends_at`) 
VALUES 
(1, 'Video ad 1', '/uploads/movie-1.mov', '/uploads/movie-cta.jpg', 'http://konkursiaki.pl', 1, '2018-02-02 00:00:00', '2018-02-20 00:00:00'),
(2, 'Video ad 2', '/uploads/movie-2.mov', '/uploads/movie-cta.jpg', 'http://konkursiaki.pl', 1, '2018-02-02 00:00:00', '2018-02-20 00:00:00');

TRUNCATE TABLE `_boxes`;
INSERT INTO `_boxes` (`id`, `name`, `image_url`, `link_url`, `is_active`, `begins_at`, `ends_at`, `created_at`, `updated_at`)
VALUES
(1, 'Pierwszy box', '/uploads/box-1.jpg', 'http://onet.pl', 1, '2018-01-31 00:00:00', '2028-09-30 00:00:00', '2008-09-30 00:00:00', '2009-09-30 00:00:00'),
(2, 'Drugi box', '/uploads/box-2.jpg', 'http://wp.pl', 1, '2018-09-30 00:00:00', '2019-09-30 00:00:00', '2006-09-30 00:00:00', '2008-09-30 00:00:00'),
(3, 'Trzeci box', '/uploads/box-3.jpg', 'http://wp.pl', 1, '2018-09-30 00:00:00', '2019-09-30 00:00:00', '2006-09-30 00:00:00', '2008-09-30 00:00:00'),
(4, 'Czwarty box', '/uploads/box-4.jpg', 'http://wp.pl', 1, '2018-09-30 00:00:00', '2019-09-30 00:00:00', '2006-09-30 00:00:00', '2008-09-30 00:00:00'),
(5, 'Piąty box', '/uploads/box-3.jpg', 'http://wp.pl', 1, '2018-09-30 00:00:00', '2019-09-30 00:00:00', '2006-09-30 00:00:00', '2008-09-30 00:00:00'),
(6, 'Szósty box', '/uploads/box-2.jpg', 'http://wp.pl', 1, '2018-09-30 00:00:00', '2019-09-30 00:00:00', '2006-09-30 00:00:00', '2008-09-30 00:00:00');

TRUNCATE TABLE `_contests`;
INSERT INTO `_contests` (`id`, `game_id`, `contest_type_id`, `name`, `description`, `box_url`, `header_url`, `begins_at`, `ends_at`, `display_ad`)
VALUES
(1, 1, 2, 'Jaskiniowiec', 'Niesamowity konkurs!', '/uploads/box-1.jpg', '/uploads/contest-banner.jpg', '2018-01-31 00:00:00', '2018-02-28 00:00:00', 0),
(2, 1, 1, 'Ptaszki i pieski', 'Nowe nagrody!', '/uploads/box-2.jpg', '/uploads/contest-banner.jpg', '2018-01-31 00:00:00', '2018-02-28 00:00:00', 0),
(3, 1, 2, 'Mistrz Pola', 'Zgarnij klocki LEGO!', '/uploads/box-3.jpg', '/uploads/contest-banner.jpg', '2018-01-31 00:00:00', '2018-02-28 00:00:00', 0),
(4, 1, 1, 'Faraon Kontratakuje', 'Szał piórników!', '/uploads/box-4.jpg', '/uploads/contest-banner.jpg', '2018-01-31 00:00:00', '2018-02-28 00:00:00', 0),
(5, 1, 2, 'Kulki Fulki', 'Ekstra zabawa!', '/uploads/box-2.jpg', '/uploads/contest-banner.jpg', '2018-01-31 00:00:00', '2018-02-28 00:00:00', 0),
(6, 1, 1, 'Paramemnon', 'Moc!', '/uploads/box-1.jpg', '/uploads/contest-banner.jpg', '2018-01-31 00:00:00', '2018-02-28 00:00:00', 0);

TRUNCATE TABLE `_notifications`;
INSERT INTO `_notifications` (`id`, `title`, `content`)
VALUES
(1, 'notification_title_password_restart', 'notification_content_password_restart'),
(2, 'notification_title_new_game', 'notification_content_new_game');

TRUNCATE TABLE `_notification_statuses`;
INSERT INTO `_notification_statuses` (`id`, `notification_id`, `user_id`, `confirmed_at`)
VALUES
(1, 1, 1, '2018-01-31 00:00:00'),
(2, 1, 2, '2018-02-12 00:00:00');

TRUNCATE TABLE `_heroes`;
INSERT INTO `_heroes` (`id`, `name`, `slug`, `description`, `avatar_url`, `header_url`, `is_active`, `created_at`, `updated_at`)
VALUES
(1, 'Scooby Doo', 'scooby-doo', 'Opis Scoobiego Doo', '/uploads/heroes-1-avatar.jpg', '/uploads/heroes-1-header.jpg', TRUE, '2018-01-31 00:00:00', '2018-01-31 00:00:00'),
(2, 'LEGO Ninjago', 'lego-ninjago', 'Opis LEGO Ninjago', '/uploads/heroes-2-avatar.jpg', '/uploads/heroes-2-header.jpg', TRUE, '2018-01-31 00:00:00', '2018-01-31 00:00:00'),
(3, 'LEGO Batman', 'lego-batman', 'Opis LEGO Batmana', '/uploads/heroes-3-avatar.jpg', '/uploads/heroes-3-header.jpg', TRUE, '2018-01-31 00:00:00', '2018-01-31 00:00:00'),
(4, 'Dragons', 'dragons', 'Opis Dragons', '/uploads/heroes-4-avatar.jpg', '/uploads/heroes-4-header.jpg', TRUE, '2018-01-31 00:00:00', '2018-01-31 00:00:00'),
(5, 'LEGO Elves', 'lego-elves', 'Opis LEGO Elves', '/uploads/heroes-5-avatar.jpg', '/uploads/heroes-5-header.jpg', TRUE, '2018-01-31 00:00:00', '2018-01-31 00:00:00'),
(6, 'LEGO City', 'lego-city', 'Opis LEGO City', '/uploads/heroes-6-avatar.jpg', '/uploads/heroes-6-header.jpg', TRUE, '2018-01-31 00:00:00', '2018-01-31 00:00:00'),
(7, 'Safiras', 'safiras', 'Opis Safiras', '/uploads/heroes-7-avatar.jpg', '/uploads/heroes-7-header.jpg', TRUE, '2018-01-31 00:00:00', '2018-01-31 00:00:00'),
(8, 'Magic Stars', 'magic-safiras', 'Opis Magic Stars', '/uploads/heroes-8-avatar.jpg', '/uploads/heroes-8-header.jpg', TRUE, '2018-01-31 00:00:00', '2018-01-31 00:00:00'),
(9, 'LEGO Nexo Knights', 'lego-nexo-knights', 'Opis Nexo Knights', '/uploads/heroes-9-avatar.jpg', '/uploads/heroes-9-header.jpg', TRUE, '2018-01-31 00:00:00', '2018-01-31 00:00:00');

TRUNCATE TABLE `_contest_prizes`;
INSERT INTO `_contest_prizes` (`id`, `contest_id`, `name`, `description`, `image_url`)
VALUES
(1, 1, 'Pudełko klocków LEGO', 'Opis', 'contest-prizes/1-1.jpg'),
(2, 1, 'Pudełko klocków LEGO', 'Opis', 'contest-prizes/1-2.jpg'),
(3, 2, 'Pudełko klocków LEGO', 'Opis', 'contest-prizes/2-3.jpg'),
(4, 2, 'Pudełko klocków LEGO', 'Opis', 'contest-prizes/2-4.jpg');

TRUNCATE TABLE `_static_sites`;
INSERT INTO `_static_sites` (`id`, `title`, `slug`, `content`, `is_active`)
VALUES
(1, 'O nas', 'o-nas', 'Tutaj długi tekst o tym kim jesteśmy...', 1),
(2, 'Dla rodziców', 'dla-rodzicow', 'Informacje dla rodziców...', 1),
(3, 'Regulamin', 'regulamin', 'Regulamin...', 1),
(4, 'Polityka prywatności', 'polityka-prywatnosci', 'Polityka prywatności...', 1),
(5, 'FAQ', 'faq', 'FAQ...', 1),
(6, 'Kontakt', 'kontakt', 'Kontakt...', 1);

TRUNCATE TABLE `score_pointed_activities`;
INSERT INTO `score_pointed_activities` (`id`, `user_id`, `activity_id`, `points`, `given_at`)
VALUES
(1, 1, 1, 5, '2018-01-31 00:00:00'),
(2, 1, 2, 1, '2018-02-01 00:00:00'),
(3, 2, 3, 5, '2018-01-31 00:00:00'),
(4, 2, 4, 5, '2018-01-31 00:00:00'),
(5, 2, 5, 1, '2018-01-31 00:00:00');

TRUNCATE TABLE `score_games`;
INSERT INTO `score_games` (`id`, `user_id`, `contest_id`, `level`, `begins_at`, `ends_at`, `points`, `points_total`) VALUES
	(1, 1, 1,   1, '2012-10-03 19:44:24', '2012-10-03 19:54:24', 5, 5),
	(2, 1, 1,   2, '2012-09-20 17:06:07', '2012-09-20 17:16:07', 7, 12),
	(3, 2, 2,   1, '2012-09-12 13:03:53', '2012-09-12 13:13:53', 4, 4),
	(4, 3, 2,   1, '2012-09-07 13:05:01', '2012-09-07 13:08:01', 8, 8),
	(5, 3, 1,   1, '2012-09-20 10:52:29', '2012-09-20 10:59:29', 2, 2),
	(6, 3, 1,   2, '2012-09-20 15:31:22', '2012-09-20 15:36:22', 15, 17),
	(7, 3, 3,   1, '2012-09-20 15:31:20', '2012-09-20 15:41:20', 6, 6),
	(8, 4, 3,   1, '2012-09-20 15:39:27', '2012-09-20 15:59:27', 5, 5),
	(9, 5, 3,   1, '2014-10-01 12:02:06', '2014-10-01 12:06:06', 24, 24),
	(10, 6, 3,  1, '2012-12-31 16:42:50', '2012-12-31 16:49:50', 1, 1),
	(11, 6, 1,  1, '2014-10-01 12:03:06', '2014-10-01 12:06:06', 0, 0),
	(12, 6, 1,  2, '2017-09-30 08:00:39', '2017-09-30 08:10:39', 99, 99),
	(13, 6, 4,  1, '2014-10-01 12:01:06', '2014-10-01 12:06:06', 11, 11),
	(14, 7, 4,  1, '2014-10-01 12:03:06', '2014-10-01 12:06:06', 14, 14),
	(15, 7, 5,  1, '2012-12-31 16:20:29', '2012-12-31 16:50:29', 25, 25),
	(16, 8, 6,  1, '2015-08-04 15:14:58', '2015-08-04 15:34:58', 44, 44),
	(17, 9, 6,  1, '2012-12-31 16:10:41', '2012-12-31 16:50:41', 29, 29),
	(18, 10, 1, 1, '2014-10-01 12:03:06', '2014-10-01 12:06:06', 12, 12),
	(19, 10, 2, 1, '2014-10-01 12:03:06', '2014-10-01 12:06:06', 11, 11),
	(20, 10, 3, 1, '2012-12-31 16:21:15', '2012-12-31 16:51:15', 18, 18),
	(21, 10, 4, 1, '2012-12-31 16:41:36', '2012-12-31 16:51:36', 17, 17),
	(22, 10, 5, 1, '2017-08-02 18:35:29', '2017-08-02 18:36:29', 22, 22),
	(23, 10, 6, 1, '2017-08-02 18:34:18', '2017-08-02 18:36:18', 16, 16),
	(24, 10, 6, 2, '2015-09-21 11:41:46', '2015-09-21 11:42:46', 54, 70),
	(25, 10, 6, 3, '2014-03-26 13:32:57', '2014-03-26 13:37:57', 30, 100);

TRUNCATE TABLE def_contest_places;
INSERT INTO `def_contest_places` (`id`, `contest_type_id`, `name`, `place`, `points`) VALUES
	(232, 1, NULL, 1, 100),
	(233, 1, NULL, 2, 99),
	(234, 1, NULL, 3, 98),
	(235, 1, NULL, 4, 97),
	(236, 1, NULL, 5, 96),
	(237, 1, NULL, 6, 95),
	(238, 1, NULL, 7, 94),
	(239, 1, NULL, 8, 93),
	(240, 1, NULL, 9, 92),
	(241, 1, NULL, 10, 91),
	(242, 1, NULL, 11, 90),
	(243, 1, NULL, 12, 89),
	(244, 1, NULL, 13, 88),
	(245, 1, NULL, 14, 87),
	(246, 1, NULL, 15, 86),
	(247, 1, NULL, 16, 85),
	(248, 1, NULL, 17, 84),
	(249, 1, NULL, 18, 83),
	(250, 1, NULL, 19, 82),
	(251, 1, NULL, 20, 81),
	(252, 1, NULL, 21, 80),
	(253, 1, NULL, 22, 79),
	(254, 1, NULL, 23, 78),
	(255, 1, NULL, 24, 77),
	(256, 1, NULL, 25, 76),
	(257, 1, NULL, 26, 75),
	(258, 1, NULL, 27, 74),
	(259, 1, NULL, 28, 73),
	(260, 1, NULL, 29, 72),
	(261, 1, NULL, 30, 71),
	(262, 1, NULL, 31, 70),
	(263, 1, NULL, 32, 69),
	(264, 1, NULL, 33, 68),
	(265, 1, NULL, 34, 67),
	(266, 1, NULL, 35, 66),
	(267, 1, NULL, 36, 65),
	(268, 1, NULL, 37, 64),
	(269, 1, NULL, 38, 63),
	(270, 1, NULL, 39, 62),
	(271, 1, NULL, 40, 61),
	(272, 1, NULL, 41, 60),
	(273, 1, NULL, 42, 59),
	(274, 1, NULL, 43, 58),
	(275, 1, NULL, 44, 57),
	(276, 1, NULL, 45, 56),
	(277, 1, NULL, 46, 55),
	(278, 1, NULL, 47, 54),
	(279, 1, NULL, 48, 53),
	(280, 1, NULL, 49, 52),
	(281, 1, NULL, 50, 51),
	(282, 1, NULL, 51, 50),
	(283, 1, NULL, 52, 49),
	(284, 1, NULL, 53, 48),
	(285, 1, NULL, 54, 47),
	(286, 1, NULL, 55, 46),
	(287, 1, NULL, 56, 45),
	(288, 1, NULL, 57, 44),
	(289, 1, NULL, 58, 43),
	(290, 1, NULL, 59, 42),
	(291, 1, NULL, 60, 41),
	(292, 1, NULL, 61, 40),
	(293, 1, NULL, 62, 39),
	(294, 1, NULL, 63, 38),
	(295, 1, NULL, 64, 37),
	(296, 1, NULL, 65, 36),
	(297, 1, NULL, 66, 35),
	(298, 1, NULL, 67, 34),
	(299, 1, NULL, 68, 33),
	(300, 1, NULL, 69, 32),
	(301, 1, NULL, 70, 31),
	(302, 1, NULL, 71, 30),
	(303, 1, NULL, 72, 29),
	(304, 1, NULL, 73, 28),
	(305, 1, NULL, 74, 27),
	(306, 1, NULL, 75, 26),
	(307, 1, NULL, 76, 25),
	(308, 1, NULL, 77, 24),
	(309, 1, NULL, 78, 23),
	(310, 1, NULL, 79, 22),
	(311, 1, NULL, 80, 21),
	(312, 1, NULL, 81, 20),
	(313, 1, NULL, 82, 19),
	(314, 1, NULL, 83, 18),
	(315, 1, NULL, 84, 17),
	(316, 1, NULL, 85, 16),
	(317, 1, NULL, 86, 15),
	(318, 1, NULL, 87, 14),
	(319, 1, NULL, 88, 13),
	(320, 1, NULL, 89, 12),
	(321, 1, NULL, 90, 11),
	(322, 1, NULL, 91, 10),
	(323, 1, NULL, 92, 9),
	(324, 1, NULL, 93, 8),
	(325, 1, NULL, 94, 7),
	(326, 1, NULL, 95, 6),
	(327, 1, NULL, 96, 5),
	(328, 1, NULL, 97, 4),
	(329, 1, NULL, 98, 3),
	(330, 1, NULL, 99, 2),
	(331, 1, NULL, 100, 1),
	(359, 2, NULL, 1, 200),
	(360, 2, NULL, 2, 199),
	(361, 2, NULL, 3, 198),
	(362, 2, NULL, 4, 197),
	(363, 2, NULL, 5, 196),
	(364, 2, NULL, 6, 195),
	(365, 2, NULL, 7, 194),
	(366, 2, NULL, 8, 193),
	(367, 2, NULL, 9, 192),
	(368, 2, NULL, 10, 191),
	(369, 2, NULL, 11, 190),
	(370, 2, NULL, 12, 189),
	(371, 2, NULL, 13, 188),
	(372, 2, NULL, 14, 187),
	(373, 2, NULL, 15, 186),
	(374, 2, NULL, 16, 185),
	(375, 2, NULL, 17, 184),
	(376, 2, NULL, 18, 183),
	(377, 2, NULL, 19, 182),
	(378, 2, NULL, 20, 181),
	(379, 2, NULL, 21, 180),
	(380, 2, NULL, 22, 179),
	(381, 2, NULL, 23, 178),
	(382, 2, NULL, 24, 177),
	(383, 2, NULL, 25, 176),
	(384, 2, NULL, 26, 175),
	(385, 2, NULL, 27, 174),
	(386, 2, NULL, 28, 173),
	(387, 2, NULL, 29, 172),
	(388, 2, NULL, 30, 171),
	(389, 2, NULL, 31, 170),
	(390, 2, NULL, 32, 169),
	(391, 2, NULL, 33, 168),
	(392, 2, NULL, 34, 167),
	(393, 2, NULL, 35, 166),
	(394, 2, NULL, 36, 165),
	(395, 2, NULL, 37, 164),
	(396, 2, NULL, 38, 163),
	(397, 2, NULL, 39, 162),
	(398, 2, NULL, 40, 161),
	(399, 2, NULL, 41, 160),
	(400, 2, NULL, 42, 159),
	(401, 2, NULL, 43, 158),
	(402, 2, NULL, 44, 157),
	(403, 2, NULL, 45, 156),
	(404, 2, NULL, 46, 155),
	(405, 2, NULL, 47, 154),
	(406, 2, NULL, 48, 153),
	(407, 2, NULL, 49, 152),
	(408, 2, NULL, 50, 151),
	(409, 2, NULL, 51, 150),
	(410, 2, NULL, 52, 149),
	(411, 2, NULL, 53, 148),
	(412, 2, NULL, 54, 147),
	(413, 2, NULL, 55, 146),
	(414, 2, NULL, 56, 145),
	(415, 2, NULL, 57, 144),
	(416, 2, NULL, 58, 143),
	(417, 2, NULL, 59, 142),
	(418, 2, NULL, 60, 141),
	(419, 2, NULL, 61, 140),
	(420, 2, NULL, 62, 139),
	(421, 2, NULL, 63, 138),
	(422, 2, NULL, 64, 137),
	(423, 2, NULL, 65, 136),
	(424, 2, NULL, 66, 135),
	(425, 2, NULL, 67, 134),
	(426, 2, NULL, 68, 133),
	(427, 2, NULL, 69, 132),
	(428, 2, NULL, 70, 131),
	(429, 2, NULL, 71, 130),
	(430, 2, NULL, 72, 129),
	(431, 2, NULL, 73, 128),
	(432, 2, NULL, 74, 127),
	(433, 2, NULL, 75, 126),
	(434, 2, NULL, 76, 125),
	(435, 2, NULL, 77, 124),
	(436, 2, NULL, 78, 123),
	(437, 2, NULL, 79, 122),
	(438, 2, NULL, 80, 121),
	(439, 2, NULL, 81, 120),
	(440, 2, NULL, 82, 119),
	(441, 2, NULL, 83, 118),
	(442, 2, NULL, 84, 117),
	(443, 2, NULL, 85, 116),
	(444, 2, NULL, 86, 115),
	(445, 2, NULL, 87, 114),
	(446, 2, NULL, 88, 113),
	(447, 2, NULL, 89, 112),
	(448, 2, NULL, 90, 111),
	(449, 2, NULL, 91, 110),
	(450, 2, NULL, 92, 109),
	(451, 2, NULL, 93, 108),
	(452, 2, NULL, 94, 107),
	(453, 2, NULL, 95, 106),
	(454, 2, NULL, 96, 105),
	(455, 2, NULL, 97, 104),
	(456, 2, NULL, 98, 103),
	(457, 2, NULL, 99, 102),
	(458, 2, NULL, 100, 101),
	(459, 2, NULL, 101, 100),
	(460, 2, NULL, 102, 99),
	(461, 2, NULL, 103, 98),
	(462, 2, NULL, 104, 97),
	(463, 2, NULL, 105, 96),
	(464, 2, NULL, 106, 95),
	(465, 2, NULL, 107, 94),
	(466, 2, NULL, 108, 93),
	(467, 2, NULL, 109, 92),
	(468, 2, NULL, 110, 91),
	(469, 2, NULL, 111, 90),
	(470, 2, NULL, 112, 89),
	(471, 2, NULL, 113, 88),
	(472, 2, NULL, 114, 87),
	(473, 2, NULL, 115, 86),
	(474, 2, NULL, 116, 85),
	(475, 2, NULL, 117, 84),
	(476, 2, NULL, 118, 83),
	(477, 2, NULL, 119, 82),
	(478, 2, NULL, 120, 81),
	(479, 2, NULL, 121, 80),
	(480, 2, NULL, 122, 79),
	(481, 2, NULL, 123, 78),
	(482, 2, NULL, 124, 77),
	(483, 2, NULL, 125, 76),
	(484, 2, NULL, 126, 75),
	(485, 2, NULL, 127, 74),
	(486, 2, NULL, 128, 73),
	(487, 2, NULL, 129, 72),
	(488, 2, NULL, 130, 71),
	(489, 2, NULL, 131, 70),
	(490, 2, NULL, 132, 69),
	(491, 2, NULL, 133, 68),
	(492, 2, NULL, 134, 67),
	(493, 2, NULL, 135, 66),
	(494, 2, NULL, 136, 65),
	(495, 2, NULL, 137, 64),
	(496, 2, NULL, 138, 63),
	(497, 2, NULL, 139, 62),
	(498, 2, NULL, 140, 61),
	(499, 2, NULL, 141, 60),
	(500, 2, NULL, 142, 59),
	(501, 2, NULL, 143, 58),
	(502, 2, NULL, 144, 57),
	(503, 2, NULL, 145, 56),
	(504, 2, NULL, 146, 55),
	(505, 2, NULL, 147, 54),
	(506, 2, NULL, 148, 53),
	(507, 2, NULL, 149, 52),
	(508, 2, NULL, 150, 51),
	(509, 2, NULL, 151, 50),
	(510, 2, NULL, 152, 49),
	(511, 2, NULL, 153, 48),
	(512, 2, NULL, 154, 47),
	(513, 2, NULL, 155, 46),
	(514, 2, NULL, 156, 45),
	(515, 2, NULL, 157, 44),
	(516, 2, NULL, 158, 43),
	(517, 2, NULL, 159, 42),
	(518, 2, NULL, 160, 41),
	(519, 2, NULL, 161, 40),
	(520, 2, NULL, 162, 39),
	(521, 2, NULL, 163, 38),
	(522, 2, NULL, 164, 37),
	(523, 2, NULL, 165, 36),
	(524, 2, NULL, 166, 35),
	(525, 2, NULL, 167, 34),
	(526, 2, NULL, 168, 33),
	(527, 2, NULL, 169, 32),
	(528, 2, NULL, 170, 31),
	(529, 2, NULL, 171, 30),
	(530, 2, NULL, 172, 29),
	(531, 2, NULL, 173, 28),
	(532, 2, NULL, 174, 27),
	(533, 2, NULL, 175, 26),
	(534, 2, NULL, 176, 25),
	(535, 2, NULL, 177, 24),
	(536, 2, NULL, 178, 23),
	(537, 2, NULL, 179, 22),
	(538, 2, NULL, 180, 21),
	(539, 2, NULL, 181, 20),
	(540, 2, NULL, 182, 19),
	(541, 2, NULL, 183, 18),
	(542, 2, NULL, 184, 17),
	(543, 2, NULL, 185, 16),
	(544, 2, NULL, 186, 15),
	(545, 2, NULL, 187, 14),
	(546, 2, NULL, 188, 13),
	(547, 2, NULL, 189, 12),
	(548, 2, NULL, 190, 11),
	(549, 2, NULL, 191, 10),
	(550, 2, NULL, 192, 9),
	(551, 2, NULL, 193, 8),
	(552, 2, NULL, 194, 7),
	(553, 2, NULL, 195, 6),
	(554, 2, NULL, 196, 5),
	(555, 2, NULL, 197, 4),
	(556, 2, NULL, 198, 3),
	(557, 2, NULL, 199, 2),
	(558, 2, NULL, 200, 1);


TRUNCATE TABLE `score_contests`;
CALL `sp_contests_ending`(1);
CALL `sp_contests_ending`(2);
CALL `sp_contests_ending`(3);

TRUNCATE TABLE user_badges;
INSERT INTO `user_badges` (`id`, `user_id`, `badge_id`, `given_at`, `inserted_at`) VALUES
	(6, 2, 1, '2015-01-14 00:00:00', '2018-03-26 14:03:02'),
	(8, 2, 3, '2016-01-12 00:00:00', '2018-03-26 14:03:02'),
	(10, 2, 5, '2016-04-17 00:00:00', '2018-03-26 14:03:02'),
	(11, 3, 1, '2015-03-29 00:00:00', '2018-03-26 14:03:02'),
	(12, 3, 2, '2016-04-22 00:00:00', '2018-03-26 14:03:02'),
	(13, 3, 3, '2016-10-27 00:00:00', '2018-03-26 14:03:02'),
	(14, 3, 4, '2016-03-13 00:00:00', '2018-03-26 14:03:02'),
	(15, 3, 5, '2015-07-09 00:00:00', '2018-03-26 14:03:02'),
	(16, 6, 1, '2016-01-02 00:00:00', '2018-03-26 14:03:02'),
	(17, 6, 2, '2016-06-16 00:00:00', '2018-03-26 14:03:02'),
	(18, 6, 3, '2015-04-13 00:00:00', '2018-03-26 14:03:02'),
	(19, 6, 4, '2016-01-12 00:00:00', '2018-03-26 14:03:02'),
	(20, 6, 5, '2015-04-25 00:00:00', '2018-03-26 14:03:02'),
	(21, 8, 1, '2015-06-22 00:00:00', '2018-03-26 14:03:02'),
	(22, 8, 2, '2016-06-02 00:00:00', '2018-03-26 14:03:02'),
	(23, 8, 3, '2016-09-06 00:00:00', '2018-03-26 14:03:02'),
	(24, 8, 4, '2015-02-27 00:00:00', '2018-03-26 14:03:02'),
	(25, 8, 5, '2016-09-28 00:00:00', '2018-03-26 14:03:02'),
	(26, 5, 1, '2015-03-28 00:00:00', '2018-03-26 14:03:02'),
	(27, 5, 2, '2016-12-13 00:00:00', '2018-03-26 14:03:02'),
	(28, 5, 3, '2016-01-21 00:00:00', '2018-03-26 14:03:02'),
	(29, 5, 4, '2016-06-02 00:00:00', '2018-03-26 14:03:02'),
	(30, 5, 5, '2016-12-05 00:00:00', '2018-03-26 14:03:02'),
	(31, 4, 1, '2016-05-21 00:00:00', '2018-03-26 14:03:02'),
	(32, 4, 2, '2016-02-26 00:00:00', '2018-03-26 14:03:02'),
	(33, 4, 3, '2016-08-10 00:00:00', '2018-03-26 14:03:02'),
	(34, 4, 4, '2015-08-02 00:00:00', '2018-03-26 14:03:02'),
	(35, 4, 5, '2015-02-03 00:00:00', '2018-03-26 14:03:02'),
	(36, 7, 1, '2015-09-14 00:00:00', '2018-03-26 14:03:02'),
	(37, 7, 2, '2016-03-29 00:00:00', '2018-03-26 14:03:02'),
	(38, 7, 3, '2015-02-06 00:00:00', '2018-03-26 14:03:02'),
	(39, 7, 4, '2015-10-08 00:00:00', '2018-03-26 14:03:02'),
	(40, 7, 5, '2016-07-19 00:00:00', '2018-03-26 14:03:02'),
	(41, 1, 1, '2016-06-10 00:00:00', '2018-03-26 14:03:02'),
	(43, 1, 3, '2015-06-17 00:00:00', '2018-03-26 14:03:02'),
	(44, 1, 4, '2015-08-17 00:00:00', '2018-03-26 14:03:02'),
	(45, 1, 5, '2016-10-01 00:00:00', '2018-03-26 14:03:02'),
	(46, 9, 1, '2015-11-18 00:00:00', '2018-03-26 14:03:02'),
	(47, 9, 2, '2016-02-23 00:00:00', '2018-03-26 14:03:02'),
	(48, 9, 3, '2016-02-04 00:00:00', '2018-03-26 14:03:02'),
	(49, 9, 4, '2015-01-11 00:00:00', '2018-03-26 14:03:02'),
	(50, 9, 5, '2015-11-10 00:00:00', '2018-03-26 14:03:02'),
	(65, 2, 2, '2015-08-27 00:00:00', '2018-03-26 14:05:47'),
	(66, 3, 2, '2015-02-23 00:00:00', '2018-03-26 14:05:47'),
	(67, 4, 2, '2015-10-10 00:00:00', '2018-03-26 14:05:47'),
	(68, 5, 2, '2016-06-04 00:00:00', '2018-03-26 14:05:47'),
	(69, 6, 2, '2015-10-24 00:00:00', '2018-03-26 14:05:47'),
	(70, 7, 2, '2016-10-11 00:00:00', '2018-03-26 14:05:47'),
	(71, 8, 2, '2015-06-19 00:00:00', '2018-03-26 14:05:47'),
	(80, 2, 2, '2016-07-06 00:00:00', '2018-03-26 14:05:59'),
	(81, 3, 2, '2015-08-18 00:00:00', '2018-03-26 14:05:59'),
	(82, 4, 2, '2015-08-06 00:00:00', '2018-03-26 14:05:59'),
	(83, 5, 2, '2016-02-05 00:00:00', '2018-03-26 14:05:59');

SET FOREIGN_KEY_CHECKS = 1;
SELECT 1;
