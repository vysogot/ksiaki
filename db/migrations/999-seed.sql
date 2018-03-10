SET FOREIGN_KEY_CHECKS = 0;

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
/*!40000 ALTER TABLE `remembered_logins` DISABLE KEYS */;
INSERT INTO `_users` (`id`, `role_id`, `session_id`, `name`, `email`, `password_hash`, `active`, `activation_hash`, `created_at`, `last_login_at`)
VALUES
(1, 1, NULL, 'user', 'demo@demo.com', '$2y$10$EwF6/cRU8hVn8b7j.WswyeLmie6oYOI83ljS3WvWW9uu4GOzevOOy', '0', NULL, NULL, NULL),
(2, 2, NULL, 'admin', 'demo2@demo.com', '$2y$10$EwF6/cRU8hVn8b7j.WswyeLmie6oYOI83ljS3WvWW9uu4GOzevOOy', '0', NULL, NULL, NULL);

TRUNCATE TABLE `_contests`;
/*!40000 ALTER TABLE `_contests` DISABLE KEYS */;
INSERT INTO `_contests` (`id`, `game_id`, `contest_type_id`, `name`, `description`, `header_url`, `begins_at`, `ends_at`, `display_ad`)
VALUES
(1, 1, 2, 'Jaskiniowiec', 'Niesamowity konkurs', 'contests/1-header.jpg', '2018-01-31 00:00:00', '2018-02-28 00:00:00', 0),
(2, 2, 1, 'Ptaszki i pieski', 'Nowe nagrody!', 'contests/1-header.jpg', '2018-01-31 00:00:00', '2018-02-28 00:00:00', 0);

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
INSERT INTO `_heroes` (`id`, `name`, `is_active`, `avatar_url`, `header_url`, `left_box_url`, `middle_box_url`, `video_url`, `created_at`, `updated_at`)
VALUES
(1, 'Scooby Doo', TRUE, 'heroes/1-avatar.jpg', 'heroes/1-header.jpg', 'heroes/1-left-box.jpg', 'heroes/1-middle-box.jpg', 'heroes/1-video.mp4', '2018-01-31 00:00:00', '2018-01-31 00:00:00'),
(2, 'LEGO Ninjago', TRUE, 'heroes/2-avatar.jpg', 'heroes/2-header.jpg', 'heroes/2-left-box.jpg', 'heroes/2-middle-box.jpg', 'heroes/2-video.mp4', '2018-01-31 00:00:00', '2018-01-31 00:00:00');

TRUNCATE TABLE `_contest_prizes`;
INSERT INTO `_contest_prizes` (`id`, `contest_id`, `prize_sponsor_id`, `name`, `image_url`)
VALUES
(1, 1, 1, 'Pudełko klocków LEGO', 'contest-prizes/1-1.jpg'),
(2, 1, 1, 'Pudełko klocków LEGO', 'contest-prizes/1-2.jpg'),
(3, 2, 1, 'Pudełko klocków LEGO', 'contest-prizes/2-3.jpg'),
(4, 2, 1, 'Pudełko klocków LEGO', 'contest-prizes/2-4.jpg');

TRUNCATE TABLE `static_sites`;
INSERT INTO `static_sites` (`id`, `title`, `slug`, `content`, `created_at`, `updated_at`)
VALUES
(1, 'O nas', 'o-nas', 'Tutaj długi tekst o tym kim jesteśmy...', '2018-01-31 00:00:00', '2018-02-21 00:00:00'),
(2, 'Dla rodziców', 'dla-rodzicow', 'Informacje dla rodziców...', '2018-01-11 00:00:00', '2018-02-11 00:00:00');

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

TRUNCATE TABLE `game_scores`;
INSERT INTO `game_scores` (`id`, `user_id`, `contest_id`, `level`, `begins_at`, `ends_at`, `points`, `points_total`)
VALUES
(1, 1, 1, 1, '2018-01-30 00:00:00', '2018-01-30 00:10:00', 500, 500),
(2, 1, 1, 2, '2018-01-30 00:11:00', '2018-01-30 00:15:00', 600, 1100),
(3, 2, 1, 1, '2018-01-30 00:05:00', '2018-01-30 00:14:00', 550, 550),
(4, 2, 1, 2, '2018-01-30 00:16:00', '2018-01-30 00:25:00', 1600, 2150);

TRUNCATE TABLE `game_scores`;
INSERT INTO `score_contests` (`id`, `user_id`, `contest_id`, `place`, `points`, `given_at`)
VALUES
(1, 1, 1, 2, 99, '2018-02-28 00:00:00'),
(2, 2, 1, 1, 100, '2018-02-28 00:00:00');

SET FOREIGN_KEY_CHECKS = 1;

SELECT 1;
