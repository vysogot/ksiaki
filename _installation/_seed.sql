/***********
------------
DANE TESTOWE
------------
***********/

TRUNCATE TABLE `_users`;
INSERT INTO `_users`
  (`id`, `role_id`, `session_id`, `name`, `email`, `password_hash`, `active`, `activation_hash`, `created_at`, `last_login_timestamp`)
VALUES
  (NULL, '1', NULL, 'demo', 'demo@demo.com', '$2y$10$EwF6/cRU8hVn8b7j.WswyeLmie6oYOI83ljS3WvWW9uu4GOzevOOy', '0', NULL, NULL, NULL),
  (NULL, '1', NULL, 'demo2', 'demo2@demo.com', '$2y$10$EwF6/cRU8hVn8b7j.WswyeLmie6oYOI83ljS3WvWW9uu4GOzevOOy', '0', NULL, NULL, NULL);

TRUNCATE TABLE `_contests`;
/*!40000 ALTER TABLE `_contests` DISABLE KEYS */;
INSERT INTO `_contests` (`id`, `game_id`, `contest_type_id`, `name`, `description`, `banner_url`, `begins_at`, `ends_at`, `display_ad`) VALUES
	(1, 0, 0, NULL, NULL, NULL, '2018-01-29 00:00:00', '2018-01-29 00:00:00', 0),
	(2, 0, 0, '', '', '', '2018-01-29 00:00:00', '2018-01-29 00:00:00', 0),
	(3, 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
	(4, 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
	(5, 0, 1, 'test', 'Opis konkursu', '', '2018-01-30 00:00:00', '2018-02-28 00:00:00', 0),
	(6, 0, 2, 'Nowy konkurs', 'Ptaszki i pieski', '', '2018-01-31 00:00:00', '2018-02-28 00:00:00', 0);
