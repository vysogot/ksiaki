/* add only that much as needed */

SET FOREIGN_KEY_CHECKS = 0;
SET NAMES utf8;

TRUNCATE TABLE `def_games`;
INSERT INTO `def_games` (`id`, `name`, `description`)
VALUES
(1, 'sorcerer', 'game_sorcerer_description');

TRUNCATE TABLE `def_contest_types`;
TRUNCATE TABLE `def_contest_places`;
TRUNCATE TABLE `def_pointed_activities`;
TRUNCATE TABLE `def_sponsors`;
TRUNCATE TABLE `def_badges`;
TRUNCATE TABLE `def_ranks`;

TRUNCATE TABLE `_users`;
/* password: 12345678 */
INSERT INTO `_users` (`id`, `role_id`, `name`, `email`, `password_hash`, `is_active`, `activation_hash`, `created_at`, `last_login_at`) VALUES
	(1, 1, 'user', 	 'demo@demo.com', 	'$2y$10$EwF6/cRU8hVn8b7j.WswyeLmie6oYOI83ljS3WvWW9uu4GOzevOOy', 0, NULL, NULL, NULL),
	(2, 2, 'admin',  'demo2@demo.com', 	'$2y$10$EwF6/cRU8hVn8b7j.WswyeLmie6oYOI83ljS3WvWW9uu4GOzevOOy', 0, NULL, NULL, NULL);

TRUNCATE TABLE `_backgrounds`;
TRUNCATE TABLE `_boxes`;
INSERT INTO `_boxes` (`id`, `name`, `image_url`, `link_url`, `is_active`, `begins_at`, `ends_at`) VALUES (1, 'Box 1', '/uploads/box-1.jpg', 'http://konkursiaki.pl', 1, '2018-02-02 00:00:00', '2018-02-20 00:00:00');
TRUNCATE TABLE `_slides`;
INSERT INTO `_slides` (`id`, `name`, `image_url`, `link_url`, `is_active`, `begins_at`, `ends_at`) VALUES (1, 'Box 1', '/uploads/slide-1.jpg', 'http://konkursiaki.pl', 1, '2018-02-02 00:00:00', '2018-02-20 00:00:00');
TRUNCATE TABLE `_contests`;
INSERT INTO `_contests` (`id`, `game_id`, `contest_type_id`, `name`, `description`, `box_url`, `header_url`, `begins_at`, `ends_at`, `display_ad`)
VALUES
(1, 1, 2, 'Jaskiniowiec', 'Niesamowity konkurs!', '/uploads/box-1.jpg', '/uploads/contest-banner.jpg', '2018-01-31 00:00:00', '2018-02-28 00:00:00', 0);

TRUNCATE TABLE `_user_movies`;
INSERT INTO `_user_movies` (`id`, `user_id`, `name`, `video_url`, `image_url`, `link_url`, `is_active`, `begins_at`, `ends_at`) 
VALUES (1, 1, 'User video 1', '/uploads/user_movie-1.mp4', '/uploads/user_movie-1.jpg', 'http://konkursiaki.pl', 1, '2018-02-02 00:00:00', '2018-02-20 00:00:00');
TRUNCATE TABLE `_video_ads`;
INSERT INTO `_video_ads` (`id`, `name`, `video_url`, `image_url`, `link_url`, `is_active`, `begins_at`, `ends_at`) 
VALUES (1, 'Video ad 1', '/uploads/video_ad-1.mp4', '/uploads/video_ad-1.jpg', 'http://konkursiaki.pl', 1, '2018-02-02 00:00:00', '2018-02-20 00:00:00');

TRUNCATE TABLE `_quizes`;
TRUNCATE TABLE `_quiz_answers`;
TRUNCATE TABLE `_notifications`;
TRUNCATE TABLE `_notification_statuses`;
TRUNCATE TABLE `_heroes`;
TRUNCATE TABLE `_contest_prizes`;
TRUNCATE TABLE `static_sites`;
TRUNCATE TABLE `score_pointed_activities`;
TRUNCATE TABLE `score_quizes`;
TRUNCATE TABLE `score_games`;
TRUNCATE TABLE `def_contest_places`;
TRUNCATE TABLE `score_contests`;
TRUNCATE TABLE `user_badges`;

SET FOREIGN_KEY_CHECKS = 1;

SELECT 1;
