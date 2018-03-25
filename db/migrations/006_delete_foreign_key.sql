ALTER TABLE `_contest_prizes` DROP FOREIGN KEY IF EXISTS `FK__contest_prizes_def_sponsors`;
ALTER TABLE `_contest_prizes` DROP FOREIGN KEY IF EXISTS `FK__contest_prizes__contests`;
ALTER TABLE `_contests` DROP FOREIGN KEY IF EXISTS `FK__contests_def_contest_types`;
ALTER TABLE `_contests` DROP FOREIGN KEY IF EXISTS `FK__contests_def_games`;
ALTER TABLE `remembered_logins` DROP FOREIGN KEY IF EXISTS `FK_remembered_logins__users`;
ALTER TABLE `score_contests` DROP FOREIGN KEY IF EXISTS `FK_score_contests__contests`;
ALTER TABLE `score_contests` DROP FOREIGN KEY IF EXISTS `FK_score_contests__users`;
ALTER TABLE `score_games` DROP FOREIGN KEY IF EXISTS `FK_score_games__contests`;
ALTER TABLE `score_games` DROP FOREIGN KEY IF EXISTS `FK_score_games__users`;
ALTER TABLE `score_pointed_activities` DROP FOREIGN KEY IF EXISTS `FK_score_pointed_activities_def_pointed_activities`;
ALTER TABLE `score_pointed_activities` DROP FOREIGN KEY IF EXISTS `FK_score_pointed_activities__users`;
ALTER TABLE `score_quizes` DROP FOREIGN KEY IF EXISTS `FK_score_quizes__users`;
ALTER TABLE `user_badges` DROP FOREIGN KEY IF EXISTS `FK_user_badges_def_badges`;
ALTER TABLE `user_badges` DROP FOREIGN KEY IF EXISTS `FK_user_badges__users`;

SELECT 1;
