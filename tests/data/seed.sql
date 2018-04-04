/* add only that much as needed */

SET FOREIGN_KEY_CHECKS = 0;
SET NAMES utf8;

TRUNCATE TABLE `def_games`;
TRUNCATE TABLE `def_contest_types`;
TRUNCATE TABLE `def_contest_places`;
TRUNCATE TABLE `def_pointed_activities`;
TRUNCATE TABLE `def_sponsors`;
TRUNCATE TABLE `def_badges`;
TRUNCATE TABLE `def_ranks`;

TRUNCATE TABLE `_users`;
/* password: 12345678 */
INSERT INTO `_users` (`id`, `role_id`, `session_id`, `name`, `email`, `password_hash`, `active`, `activation_hash`, `created_at`, `last_login_at`) VALUES
	(1, 1, NULL, 'user', 	 'demo@demo.com', 	'$2y$10$EwF6/cRU8hVn8b7j.WswyeLmie6oYOI83ljS3WvWW9uu4GOzevOOy', 0, NULL, NULL, NULL),
	(2, 2, NULL, 'admin',  'demo2@demo.com', 	'$2y$10$EwF6/cRU8hVn8b7j.WswyeLmie6oYOI83ljS3WvWW9uu4GOzevOOy', 0, NULL, NULL, NULL);

TRUNCATE TABLE `_backgrounds`;
TRUNCATE TABLE `_contests`;
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
