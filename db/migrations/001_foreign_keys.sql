ALTER TABLE `_contest_prizes` ADD CONSTRAINT `FK__contest_prizes_def_sponsors` FOREIGN KEY (`prize_sponsor_id`) REFERENCES `def_sponsors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `_contest_prizes` ADD CONSTRAINT `FK__contest_prizes__contests` FOREIGN KEY (`contest_id`) REFERENCES `_contests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `_contests` ADD CONSTRAINT `FK__contests_def_games` FOREIGN KEY (`game_id`) REFERENCES `def_games` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `_contests` ADD CONSTRAINT `FK__contests_def_contest_types` FOREIGN KEY (`contest_type_id`) REFERENCES `def_contest_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `remembered_logins` ADD CONSTRAINT `FK_remembered_logins__users` FOREIGN KEY (`user_id`) REFERENCES `_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `score_contests` ADD CONSTRAINT `FK_score_contests__users` FOREIGN KEY (`user_id`) REFERENCES `_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `score_contests` ADD CONSTRAINT `FK_score_contests__contests` FOREIGN KEY (`contest_id`) REFERENCES `_contests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `score_games` ADD CONSTRAINT `FK_score_games__users` FOREIGN KEY (`user_id`) REFERENCES `_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `score_games` ADD CONSTRAINT `FK_score_games__contests` FOREIGN KEY (`contest_id`) REFERENCES `_contests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `score_pointed_activities` ADD CONSTRAINT `FK_score_pointed_activities__users` FOREIGN KEY (`user_id`) REFERENCES `_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `score_pointed_activities` ADD CONSTRAINT `FK_score_pointed_activities_def_pointed_activities` FOREIGN KEY (`activity_id`) REFERENCES `def_pointed_activities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `score_quizes` ADD CONSTRAINT `FK_score_quizes__users` FOREIGN KEY (`user_id`) REFERENCES `_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `user_badges` ADD CONSTRAINT `FK_user_badges__users` FOREIGN KEY (`user_id`) REFERENCES `_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `user_badges` ADD CONSTRAINT `FK_user_badges_def_badges` FOREIGN KEY (`badge_id`) REFERENCES `def_badges` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

SELECT 1;
