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

TRUNCATE TABLE `def_sponsors`;
INSERT INTO `def_sponsors` (`id`, `name`, `image_url`)
VALUES
(1, 'LEGO', 'url-to-lego.jpg'),
(2, 'DUPLO', 'url-to-duplo.jpg');

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
INSERT INTO `_users` (`id`, `role_id`, `name`, `email`, `password_hash`, `is_active`, `activation_hash`, `created_at`, `last_login_at`) VALUES
	(1, 1,  'user', 	 'demo@demo.com', 	'$2y$10$EwF6/cRU8hVn8b7j.WswyeLmie6oYOI83ljS3WvWW9uu4GOzevOOy', 0, NULL, NULL, NULL),
	(2, 2,  'admin',  'demo2@demo.com', 	'$2y$10$EwF6/cRU8hVn8b7j.WswyeLmie6oYOI83ljS3WvWW9uu4GOzevOOy', 0, NULL, NULL, NULL),
	(3, 1,  'Basia',  'basia@demo.com', 	'$2y$10$EwF6/cRU8hVn8b7j.WswyeLmie6oYOI83ljS3WvWW9uu4GOzevOOy', 0, NULL, NULL, NULL),
	(4, 1,  'Stasia', 'stasia@demo.com', '$2y$10$EwF6/cRU8hVn8b7j.WswyeLmie6oYOI83ljS3WvWW9uu4GOzevOOy', 0, NULL, NULL, NULL),
	(5, 1,  'Krzyś',  'krzys@demo.com', 	'$2y$10$EwF6/cRU8hVn8b7j.WswyeLmie6oYOI83ljS3WvWW9uu4GOzevOOy', 0, NULL, NULL, NULL),
	(6, 1,  'Grześ',  'grzes@demo.com',	'$2y$10$EwF6/cRU8hVn8b7j.WswyeLmie6oYOI83ljS3WvWW9uu4GOzevOOy', 0, NULL, NULL, NULL),
	(7, 1,  'Tomek',  'tomek@demo.com',	'$2y$10$EwF6/cRU8hVn8b7j.WswyeLmie6oYOI83ljS3WvWW9uu4GOzevOOy', 0, NULL, NULL, NULL),
	(8, 1,  'Jasia',  'jasia@demo.com',  '$2y$10$EwF6/cRU8hVn8b7j.WswyeLmie6oYOI83ljS3WvWW9uu4GOzevOOy', 0, NULL, NULL, NULL),
	(9, 1,  'Zuzia',  'zuzia@demo.com',  '$2y$10$EwF6/cRU8hVn8b7j.WswyeLmie6oYOI83ljS3WvWW9uu4GOzevOOy', 0, NULL, NULL, NULL),
	(10, 1, 'Adam',  'adam@demo.com',   '$2y$10$EwF6/cRU8hVn8b7j.WswyeLmie6oYOI83ljS3WvWW9uu4GOzevOOy', 0, NULL, NULL, NULL);

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
INSERT INTO `_user_movies` (`id`, `user_id`, `name`, `video_url`, `image_url`, `link_url`, `is_active`, `begins_at`, `ends_at`) 
VALUES 
(1, 1, 'User video 1', '/uploads/movie-1.mov', '/uploads/user_movie-1.jpg', 'http://konkursiaki.pl', 1, '2018-02-02 00:00:00', '2018-02-20 00:00:00'),
(2, 2, 'User video 2', '/uploads/movie-2.mov', '/uploads/user_movie-2.jpg', 'http://konkursiaki.pl', 1, '2018-02-02 00:00:00', '2018-02-20 00:00:00'),
(3, 2, 'User video 3', '/uploads/movie-1.mov', '/uploads/user_movie-3.jpg', 'http://konkursiaki.pl', 1, '2018-02-02 00:00:00', '2018-02-20 00:00:00'),
(4, 1, 'User video 4', '/uploads/movie-1.mov', '/uploads/user_movie-4.jpg', 'http://konkursiaki.pl', 1, '2018-02-02 00:00:00', '2018-02-20 00:00:00'),
(5, 2, 'User video 5', '/uploads/movie-1.mov', '/uploads/user_movie-3.jpg', 'http://konkursiaki.pl', 1, '2018-02-02 00:00:00', '2018-02-20 00:00:00'),
(6, 1, 'User video 6', '/uploads/movie-2.mov', '/uploads/user_movie-2.jpg', 'http://konkursiaki.pl', 1, '2018-02-02 00:00:00', '2018-02-20 00:00:00');

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

TRUNCATE TABLE `_quizes`;
INSERT INTO `_quizes` (`id`, `question`)
VALUES
(1, 'quiz_animals_one'),
(2, 'quiz_hobby');

TRUNCATE TABLE `_quiz_answers`;
INSERT INTO `_quiz_answers` (`id`, `quiz_id`, `answer`, `is_correct`)
VALUES
(1, 1, 'quiz_answer_animals_one_1', FALSE),
(2, 1, 'quiz_answer_animals_one_2', TRUE),
(3, 1, 'quiz_answer_animals_one_3', FALSE),
(4, 2, 'quiz_answer_hobby_1', TRUE),
(5, 2, 'quiz_answer_hobby_2', FALSE),
(6, 2, 'quiz_answer_hobby_3', FALSE);

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
INSERT INTO `_contest_prizes` (`id`, `contest_id`, `prize_sponsor_id`, `name`, `image_url`)
VALUES
(1, 1, 1, 'Pudełko klocków LEGO', 'contest-prizes/1-1.jpg'),
(2, 1, 1, 'Pudełko klocków LEGO', 'contest-prizes/1-2.jpg'),
(3, 2, 1, 'Pudełko klocków LEGO', 'contest-prizes/2-3.jpg'),
(4, 2, 1, 'Pudełko klocków LEGO', 'contest-prizes/2-4.jpg');

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

TRUNCATE TABLE `score_quizes`;
INSERT INTO `score_quizes` (`id`, `user_id`, `quiz_id`, `points`, `given_at`)
VALUES
(1, 1, 1, 2, '2018-01-31 00:00:00'),
(2, 1, 2, 2, '2018-01-30 00:00:00');

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

SET FOREIGN_KEY_CHECKS = 1;

SELECT 1;
