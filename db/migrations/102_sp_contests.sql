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
, '' AS slug
, '' AS description
, '' AS box_url
, '' AS header_url
, NOW() AS begins_at
, DATE_ADD(NOW(), INTERVAL 14 DAY) AS ends_at
, 1 AS display_ad
, 1 AS is_active;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_contests_find`(IN `p_id` INT)
BEGIN
SELECT _contests.id
, _contests.name
, def_games.name AS game_name
, def_contest_types.name AS contest_type_name
, _contests.description
, slug
, box_url
, header_url
, begins_at
, ends_at
, display_ad
, is_active
, is_ended
FROM _contests
LEFT JOIN def_games ON game_id = def_games.id
LEFT JOIN def_contest_types ON contest_type_id = def_contest_types.id
WHERE (_contests.id = p_id);
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_contests_find_by_slug`(IN `p_slug` VARCHAR(255))
BEGIN
SELECT _contests.*
FROM _contests
WHERE (slug = p_slug)
LIMIT 1;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_contests_all`()
BEGIN
SELECT _contests.id
, _contests.name
, def_games.name AS game_name
, def_contest_types.name AS contest_type_name
, _contests.description
, slug
, box_url
, header_url
, begins_at
, ends_at
, display_ad
, is_active
, is_ended
FROM _contests
LEFT JOIN def_games ON game_id = def_games.id
LEFT JOIN def_contest_types ON contest_type_id = def_contest_types.id
WHERE (marked_as_deleted_by = 0);
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_contests_create`(
	IN `p_game_id` INT,
	IN `p_contest_type_id` INT,
	IN `p_name` VARCHAR(255),
    IN `p_slug` VARCHAR(255),
	IN `p_description` text,
	IN `p_box_url` VARCHAR(255),
	IN `p_header_url` VARCHAR(255),
	IN `p_begins_at` DATETIME,
	IN `p_ends_at` DATETIME,
	IN `p_display_ad` TINYINT(1),
	IN `p_is_active` TINYINT(1)
)
BEGIN
	INSERT INTO _contests(
		game_id
		, contest_type_id
		, name
        , slug
		, description
		, box_url
		, header_url
		, begins_at
		, ends_at
		, display_ad
		, is_active
	) VALUES(
		p_game_id,
		p_contest_type_id,
		p_name,
        p_slug,
		p_description,
		p_box_url,
		p_header_url,
		p_begins_at,
		p_ends_at,
		p_display_ad,
		p_is_active
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
    IN `p_slug` VARCHAR(255),
	IN `p_description` text,
	IN `p_box_url` VARCHAR(255),
	IN `p_header_url` VARCHAR(255),
	IN `p_begins_at` DATETIME,
	IN `p_ends_at` DATETIME,
	IN `p_display_ad` TINYINT(1),
	IN `p_is_active` TINYINT(1)
)
BEGIN
UPDATE _contests
SET game_id = p_game_id
	, contest_type_id = p_contest_type_id
	, name = p_name
    , slug = p_slug
	, description = p_description
	, box_url = p_box_url
	, header_url = p_header_url
	, begins_at = p_begins_at
	, ends_at = p_ends_at
  , display_ad = p_display_ad
	, is_active = p_is_active
WHERE (id = p_id);

CALL `sp_contests_find`(p_id);

END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_contests_delete`(
    IN `p_id` INT
    , IN `p_user_id` INT
)
BEGIN

    UPDATE _contests
    SET marked_as_deleted_at = NOW()
    , marked_as_deleted_by = p_user_id
    WHERE (id = p_id);

    SELECT ROW_COUNT() AS rowCount;

END$$
DELIMITER ;

SELECT 1;
