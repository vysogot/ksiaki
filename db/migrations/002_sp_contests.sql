DROP PROCEDURE IF EXISTS sp_contests_new;
DROP PROCEDURE IF EXISTS sp_contests_find;
DROP PROCEDURE IF EXISTS sp_contests_all;
DROP PROCEDURE IF EXISTS sp_contests_create;
DROP PROCEDURE IF EXISTS sp_contests_update;
DROP PROCEDURE IF EXISTS sp_contests_delete;

DELIMITER $$
CREATE PROCEDURE `sp_contests_new`()
BEGIN
SELECT 0 AS id
, 1 AS game_id
, 0 AS contest_type_id
, '' AS name
, '' AS description
, '' AS box_url
, '' AS header_url
, NOW() AS begins_at
, DATE_ADD(NOW(), INTERVAL 14 DAY) AS ends_at
, 1 AS display_ad;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_contests_find`(IN `p_id` INT)
BEGIN
SELECT id
, game_id
, contest_type_id
, name
, description
, box_url
, header_url
, begins_at
, ends_at
, display_ad
FROM _contests
WHERE (id = p_id);
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_contests_all`(IN `p_id` INT
	, IN `p_name` VARCHAR(255)
	, IN `p_offset` INT
	, IN `p_limit` INT
)
BEGIN
SELECT id
, game_id
, contest_type_id
, name
, description
, box_url
, header_url
, begins_at
, ends_at
, display_ad
FROM _contests
WHERE id = CASE WHEN p_id IS NULL THEN id ELSE p_id END
AND name = CASE WHEN p_name IS NULL THEN name ELSE p_name END
LIMIT p_limit
OFFSET p_offset;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_contests_create`(
	IN `p_game_id` INT,
	IN `p_contest_type_id` INT,
	IN `p_name` VARCHAR(255),
	IN `p_description` text,
	IN `p_box_url` VARCHAR(255),
	IN `p_header_url` VARCHAR(255),
	IN `p_begins_at` DATETIME,
	IN `p_ends_at` DATETIME,
	IN `p_display_ad` TINYINT(4)
)
BEGIN
	INSERT INTO _contests(
		game_id
		, contest_type_id
		, name
		, description
		, box_url
		, header_url
		, begins_at
		, ends_at
		, display_ad
	) VALUES(
		p_game_id,
		p_contest_type_id,
		p_name,
		p_description,
		p_box_url,
		p_header_url,
		p_begins_at,
		p_ends_at,
		p_display_ad
	);
SELECT ROW_COUNT() AS rowCount, LAST_INSERT_ID() AS lastInsertId;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_contests_update`(
	IN `p_id` INT,
	IN `p_game_id` INT,
	IN `p_contest_type_id` INT,
	IN `p_name` VARCHAR(255),
	IN `p_description` text,
	IN `p_box_url` VARCHAR(255),
	IN `p_header_url` VARCHAR(255),
	IN `p_begins_at` DATETIME,
	IN `p_ends_at` DATETIME,
	IN `p_display_ad` TINYINT(4)
)
BEGIN
UPDATE _contests
SET game_id = p_game_id
	, contest_type_id = p_contest_type_id
	, name = p_name
	, description = p_description
	, box_url = p_box_url
	, header_url = p_header_url
	, begins_at = p_begins_at
	, ends_at = p_ends_at
  , display_ad = p_display_ad
WHERE (id = p_id);
SELECT ROW_COUNT() AS rowCount, LAST_INSERT_ID() AS lastInsertId;
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

SELECT 1;
