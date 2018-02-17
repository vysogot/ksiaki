DELIMITER $$
CREATE PROCEDURE `sp_contests_all`(IN `p_offset` INT, IN `p_limit` INT)
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
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_contests_delete`(IN `p_id` INT)
BEGIN
DELETE FROM _contests
WHERE (id = p_id)
LIMIT 1;
SELECT ROW_COUNT() AS rowCount;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_contests_get`(IN `p_id` INT)
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
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_contests_update`(IN `p_id` INT, IN `p_game_id` INT, IN `p_contest_type_id` INT, IN `p_name` VARCHAR(50), IN `p_description` VARCHAR(50), IN `p_banner_url` VARCHAR(50), IN `p_begins_at` DATETIME, IN `p_ends_at` DATETIME, IN `p_display_ad` TINYINT(4))
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
END$$
DELIMITER ;
