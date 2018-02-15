/***********
------------
DANE TESTOWE
------------
***********/

DELETE FROM `_user`;
INSERT INTO `ksiaki`.`users` (`user_id`, `session_id`, `user_name`, `user_password_hash`, `user_email`, `user_active`, `user_deleted`, `user_account_type`,
`user_has_avatar`, `user_remember_me_token`, `user_creation_timestamp`, `user_suspension_timestamp`, `user_last_login_timestamp`,
`user_failed_logins`, `user_last_failed_login`, `user_activation_hash`, `user_password_reset_hash`,
`user_password_reset_timestamp`, `user_provider_type`) VALUES
  (1, NULL, 'demo', '$2y$10$OvprunjvKOOhM1h9bzMPs.vuwGIsOqZbw88rzSyGCTJTcE61g5WXi', 'demo@demo.com', 1, 0, 7, 0, NULL, 1422205178, NULL, 1422209189, 0, NULL, NULL, NULL, NULL, 'DEFAULT'),
  (2, NULL, 'demo2', '$2y$10$OvprunjvKOOhM1h9bzMPs.vuwGIsOqZbw88rzSyGCTJTcE61g5WXi', 'demo2@demo.com', 1, 0, 1, 0, NULL, 1422205178, NULL, 1422209189, 0, NULL, NULL, NULL, NULL, 'DEFAULT');

-- Zrzucanie danych dla tabeli ksiaki._contests: ~6 rows (około)
DELETE FROM `_contests`;
/*!40000 ALTER TABLE `_contests` DISABLE KEYS */;
INSERT INTO `_contests` (`id`, `game_id`, `contest_type_id`, `name`, `description`, `banner_url`, `begins_at`, `ends_at`, `display_ad`) VALUES
	(1, 0, 0, NULL, NULL, NULL, '2018-01-29 00:00:00', '2018-01-29 00:00:00', 0),
	(2, 0, 0, '', '', '', '2018-01-29 00:00:00', '2018-01-29 00:00:00', 0),
	(3, 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
	(4, 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
	(5, 0, 1, 'test', 'Opis konkursu', '', '2018-01-30 00:00:00', '2018-02-28 00:00:00', 0),
	(6, 0, 2, 'Nowy konkurs', 'Ptaszki i pieski', '', '2018-01-31 00:00:00', '2018-02-28 00:00:00', 0);