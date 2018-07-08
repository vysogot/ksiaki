DROP PROCEDURE IF EXISTS sp_contests_new;
DROP PROCEDURE IF EXISTS sp_contests_find;
DROP PROCEDURE IF EXISTS sp_contests_all;
DROP PROCEDURE IF EXISTS sp_contests_all_but_one;
DROP PROCEDURE IF EXISTS sp_contests_create;
DROP PROCEDURE IF EXISTS sp_contests_update;
DROP PROCEDURE IF EXISTS sp_contests_delete;
DROP PROCEDURE IF EXISTS sp_contests_find_by_slug;
DROP PROCEDURE IF EXISTS sp_contests_all_for_display;

DELIMITER $$
CREATE PROCEDURE `sp_contests_new`()
BEGIN
SELECT 0 AS id
, 1 AS game_id
, 0 AS contest_type_id
, '' AS name
, '' AS slug
, '' AS description
, '' AS statute
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
, game_id
, def_games.name AS game_name
, def_contest_types.name AS contest_type_name
, _contests.description
, statute
, slug
, box_url
, header_url
, begins_at
, ends_at
, display_ad
, is_active
, is_ended
, CASE WHEN (NOW() NOT BETWEEN begins_at AND ends_at) THEN 0 ELSE 1 END AS 'playable'
, CASE WHEN (NOW() < begins_at) THEN 1 ELSE 0 END AS 'yet_to_begin'
, CASE
	WHEN is_ended THEN 'ended'
	WHEN NOT is_active THEN 'inactive'
	WHEN (NOW() < begins_at) THEN 'yetToBegin' 
	WHEN (NOW() > ends_at) THEN 'finished'
	WHEN NOW() BETWEEN begins_at AND ends_at THEN 'current' 
	ELSE '' END 
	AS 'status'
FROM _contests
LEFT JOIN def_games ON game_id = def_games.id
LEFT JOIN def_contest_types ON contest_type_id = def_contest_types.id
WHERE (_contests.id = p_id);
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_contests_find_by_slug`(IN `p_slug` VARCHAR(255))
BEGIN
SELECT _contests.id
, _contests.name
, game_id
, def_games.name AS game_name
, def_contest_types.name AS contest_type_name
, _contests.description
, MAX(_sponsors.link_url) AS sponsor_link_url
, statute
, slug
, box_url
, header_url
, begins_at
, ends_at
, display_ad
, _contests.is_active
, is_ended
, CASE WHEN (NOW() NOT BETWEEN begins_at AND ends_at) OR (NOT _contests.is_active) THEN 0 ELSE 1 END AS 'playable'
, CASE WHEN (NOW() < begins_at) THEN 1 ELSE 0 END AS 'yet_to_begin'
, CASE
	WHEN is_ended THEN 'ended'
	WHEN NOT _contests.is_active THEN 'inactive'
	WHEN (NOW() < begins_at) THEN 'yetToBegin' 
	WHEN (NOW() > ends_at) THEN 'finished'
	WHEN NOW() BETWEEN begins_at AND ends_at THEN 'current' 
	ELSE '' END 
	AS 'status'
FROM _contests
LEFT JOIN def_games ON game_id = def_games.id
LEFT JOIN def_contest_types ON contest_type_id = def_contest_types.id
LEFT JOIN _contest_prizes ON _contests.id = _contest_prizes.contest_id
LEFT JOIN _sponsors ON _contest_prizes.sponsor_id = _sponsors.id
WHERE (_contests.slug = p_slug);
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_contests_all`()
BEGIN
SELECT _contests.id
, _contests.name
, game_id
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
, CASE WHEN (NOW() NOT BETWEEN begins_at AND ends_at) THEN 0 ELSE 1 END AS 'playable'
, CASE WHEN (NOW() < begins_at) THEN 1 ELSE 0 END AS 'yet_to_begin'
, CASE
	WHEN is_ended THEN 'ended'
	WHEN NOT is_active THEN 'inactive'
	WHEN (NOW() < begins_at) THEN 'yetToBegin' 
	WHEN (NOW() > ends_at) THEN 'finished'
	WHEN NOW() BETWEEN begins_at AND ends_at THEN 'current' 
	ELSE '' END 
	AS 'status'
FROM _contests
LEFT JOIN def_games ON game_id = def_games.id
LEFT JOIN def_contest_types ON contest_type_id = def_contest_types.id
WHERE (marked_as_deleted_by = 0)
ORDER BY playable DESC, yet_to_begin DESC;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_contests_all_for_display`()
BEGIN
SELECT id
, name
, slug
, box_url
, CASE WHEN (NOW() NOT BETWEEN begins_at AND ends_at) THEN 0 ELSE 1 END AS 'playable'
, CASE WHEN (NOW() < begins_at) THEN 1 ELSE 0 END AS 'yet_to_begin'
, CASE
	WHEN is_ended THEN 'ended'
	WHEN NOT is_active THEN 'inactive'
	WHEN (NOW() < begins_at) THEN 'yetToBegin' 
	WHEN (NOW() > ends_at) THEN 'finished'
	WHEN NOW() BETWEEN begins_at AND ends_at THEN 'current' 
	ELSE '' END 
	AS 'status'
FROM _contests
WHERE (marked_as_deleted_by = 0)
AND is_active
ORDER BY playable DESC, yet_to_begin DESC;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_contests_all_but_one`(
    IN p_id INT
)
BEGIN
SELECT id
, name
, slug
, box_url
, CASE WHEN (NOW() NOT BETWEEN begins_at AND ends_at) THEN 0 ELSE 1 END AS 'playable'
, CASE WHEN (NOW() < begins_at) THEN 1 ELSE 0 END AS 'yet_to_begin'
, CASE
	WHEN is_ended THEN 'ended'
	WHEN NOT is_active THEN 'inactive'
	WHEN (NOW() < begins_at) THEN 'yetToBegin' 
	WHEN (NOW() > ends_at) THEN 'finished'
	WHEN NOW() BETWEEN begins_at AND ends_at THEN 'current' 
	ELSE '' END 
	AS 'status'
FROM _contests
WHERE (marked_as_deleted_by = 0)
AND is_active
AND (id != p_id)
ORDER BY playable DESC, yet_to_begin DESC;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_contests_create`(
	IN `p_game_id` INT,
	IN `p_contest_type_id` INT,
	IN `p_name` VARCHAR(255),
    IN `p_slug` VARCHAR(255),
	IN `p_description` text,
    IN `p_statute` text,
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
        , statute
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
        p_statute,
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
    IN `p_statute` text,
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
    , statute = p_statute
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
    , is_active = 0
    WHERE (id = p_id);

    SELECT ROW_COUNT() AS rowCount;

END$$
DELIMITER ;
