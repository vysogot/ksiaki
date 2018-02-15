-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Wersja serwera:               5.5.32-log - MySQL Community Server (GPL)
-- Serwer OS:                    Win32
-- HeidiSQL Wersja:              9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Zrzut struktury tabela ksiaki._contests
CREATE TABLE IF NOT EXISTS `_contests` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `game_id` int(11) unsigned NOT NULL DEFAULT '0',
  `contest_type_id` int(11) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `banner_url` varchar(255) DEFAULT NULL,
  `begins_at` datetime DEFAULT NULL,
  `ends_at` datetime DEFAULT NULL,
  `display_ad` tinyint(1) DEFAULT '0'
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Konkursy';

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
/*!40000 ALTER TABLE `_contests` ENABLE KEYS */;



-- Zrzut struktury procedura ksiaki.sp_updateContest
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_updateContest`(IN `p_id` INT, IN `p_game_id` INT, IN `p_contest_type_id` INT, IN `p_name` VARCHAR(50), IN `p_description` VARCHAR(50), IN `p_banner_url` VARCHAR(50), IN `p_begins_at` DATETIME, IN `p_ends_at` DATETIME)
BEGIN
IF (p_id = 0) THEN
	INSERT INTO _contests(game_id) VALUES(0);
END IF;
UPDATE _contests
SET game_id = p_game_id
	, contest_type_id = p_contest_type_id
	, name = p_name
	, description = p_description
	, banner_url = p_banner_url
	, begins_at = p_begins_at
	, ends_at = p_ends_at
WHERE (id = CASE WHEN (p_id = 0) THEN  LAST_INSERT_ID() ELSE p_id END);
SELECT ROW_COUNT() AS rowCount;
END//
DELIMITER ;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
