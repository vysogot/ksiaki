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

-- Zrzut struktury procedura ksiaki.sp_deleteContest
DELIMITER //
CREATE PROCEDURE `sp_deleteContest`(IN `p_id` INT)
BEGIN
DELETE FROM _contests
WHERE (id = p_id)
LIMIT 1;
SELECT ROW_COUNT() AS rowCount;
END//
DELIMITER ;


-- Zrzut struktury procedura ksiaki.sp_getContest
DELIMITER //
CREATE PROCEDURE `sp_getContest`(IN `p_id` INT)
BEGIN
IF (p_id = 0) THEN
	SELECT p_id AS id
	, 0 AS game_id
	, 1 AS contest_type_id
	, '' AS name
	, '' AS description
	, '' AS banner_url
	, CURRENT_DATE AS begins_at
	, DATE_ADD(CURRENT_DATE, INTERVAL 1 MONTH) AS ends_at
	, 1 AS display_ad;
END IF;

IF (p_id != 0) THEN
SELECT id
, game_id
, contest_type_id
, name
, description
, banner_url
, begins_at
, ends_at
, display_ad
FROM _contests
WHERE (id = p_id);
END IF;
END//
DELIMITER ;

-- Zrzut struktury procedura ksiaki.sp_allContests
DELIMITER //
CREATE PROCEDURE `sp_allContests`(
	IN `p_offset` INT,
	IN `p_limit` INT
)
BEGIN
SELECT id
, game_id
, contest_type_id
, name
, description
, banner_url
, begins_at
, ends_at
, display_ad
FROM _contests
LIMIT p_limit
OFFSET p_offset;
END//
DELIMITER ;

-- Zrzut struktury procedura ksiaki.sp_updateContest
DELIMITER //
CREATE PROCEDURE `sp_updateContest`(
	IN `p_id` INT,
	IN `p_game_id` INT,
	IN `p_contest_type_id` INT,
	IN `p_name` VARCHAR(50),
	IN `p_description` VARCHAR(50),
	IN `p_banner_url` VARCHAR(50),
	IN `p_begins_at` DATETIME,
	IN `p_ends_at` DATETIME,
	IN `p_display_ad` TINYINT(4)
)
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
    , display_ad = p_display_ad
WHERE (id = CASE WHEN (p_id = 0) THEN  LAST_INSERT_ID() ELSE p_id END);
SELECT ROW_COUNT() AS rowCount, LAST_INSERT_ID() AS lastInsertId;
END
END//
DELIMITER ;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
