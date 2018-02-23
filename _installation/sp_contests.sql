DELIMITER $$
CREATE PROCEDURE `sp_contests_find`(IN `p_id` INT)
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
WHERE (id = p_id);
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_contests_all`(IN `p_id` INT
	, IN `p_name` VARCHAR(50)
	, IN `p_offset` INT
	, IN `p_limit` INT
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
WHERE id = CASE WHEN p_id IS NULL THEN id ELSE p_id END
AND name = CASE WHEN p_name IS NULL THEN name ELSE p_name END
LIMIT p_limit
OFFSET p_offset;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_contests_create`(
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
	INSERT INTO _contests(
		game_id
		, contest_type_id
		, name
		, description
		, banner_url
		, begins_at
		, ends_at
		, display_ad
	) VALUES(
		p_game_id,
		p_contest_type_id,
		p_name,
		p_description,
		p_banner_url,
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
	IN `p_name` VARCHAR(50),
	IN `p_description` VARCHAR(50),
	IN `p_banner_url` VARCHAR(50),
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
	, banner_url = p_banner_url
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
