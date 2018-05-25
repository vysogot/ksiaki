DROP PROCEDURE IF EXISTS sp_backgrounds_new;
DROP PROCEDURE IF EXISTS sp_backgrounds_find;
DROP PROCEDURE IF EXISTS sp_backgrounds_all;
DROP PROCEDURE IF EXISTS sp_backgrounds_create;
DROP PROCEDURE IF EXISTS sp_backgrounds_update;
DROP PROCEDURE IF EXISTS sp_backgrounds_delete;
DROP PROCEDURE IF EXISTS sp_backgrounds_get;

DELIMITER $$
CREATE PROCEDURE `sp_backgrounds_get`()
BEGIN
SELECT image_url, background_color, details_color, link_url
FROM _backgrounds
WHERE is_active
AND NOW() BETWEEN begins_at AND ends_at;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_backgrounds_new`()
BEGIN
SELECT 0 AS id
, '' AS name
, '/uploads/background-1.jpg' AS image_url
, 'https://konkursiaki.pl' AS link_url
, '#ffffff' AS background_color
, '#000000' details_color
, 1 AS is_active
, NOW() AS begins_at
, DATE_ADD(NOW(), INTERVAL 14 DAY) AS ends_at;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_backgrounds_find`(IN `p_id` INT)
BEGIN
SELECT id
, name
, image_url
, link_url
, background_color
, details_color
, is_active
, DATE_FORMAT(begins_at,'%Y-%m-%dT%H:%i') AS begins_at
, DATE_FORMAT(ends_at,'%Y-%m-%dT%H:%i') AS ends_at
FROM _backgrounds
WHERE (id = p_id);
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_backgrounds_all`(IN `p_id` INT
  , IN `p_name` VARCHAR(255)
	, IN `p_link_url` VARCHAR(50)
	, IN `p_offset` INT
	, IN `p_limit` INT
)
BEGIN
SELECT id
, name
, image_url
, link_url
, background_color
, details_color
, is_active
, DATE_FORMAT(begins_at,'%Y-%m-%d %H:%i') AS begins_at
, DATE_FORMAT(ends_at,'%Y-%m-%d %H:%i') AS ends_at
FROM _backgrounds
WHERE (is_to_be_deleted = 0)
AND id = CASE WHEN p_id IS NULL THEN id ELSE p_id END
AND name LIKE CASE WHEN p_name IS NULL THEN name ELSE '%name%' END
AND link_url LIKE CASE WHEN p_link_url IS NULL THEN link_url ELSE '%p_link_url%' END
LIMIT p_limit
OFFSET p_offset;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_backgrounds_create`(
  IN `p_name` VARCHAR(255),
	IN `p_image_url` VARCHAR(255),
	IN `p_link_url` VARCHAR(255),
  IN `p_background_color` VARCHAR(255),
  IN `p_details_color` VARCHAR(255),
	IN `p_is_active` INT,
	IN `p_begins_at` DATETIME,
	IN `p_ends_at` DATETIME,
  IN `user_id` INT
)
BEGIN
	INSERT INTO _backgrounds(
    name
    , image_url
    , link_url
    , background_color
    , details_color
    , is_active
    , begins_at
    , ends_at
    , user_id
	) VALUES(
		p_name,
		p_image_url,
		p_link_url,
    p_background_color,
    p_details_color,
		p_is_active,
		p_begins_at,
		p_ends_at,
    p_user_id
	);
SELECT ROW_COUNT() AS rowCount, LAST_INSERT_ID() AS lastInsertId;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_backgrounds_update`(
	IN `p_id` INT,
  IN `p_name` VARCHAR(255),
	IN `p_image_url` VARCHAR(255),
	IN `p_link_url` VARCHAR(255),
  IN `p_background_color` VARCHAR(255),
  IN `p_details_color` VARCHAR(255),
	IN `p_is_active` INT,
	IN `p_begins_at` DATETIME,
	IN `p_ends_at` DATETIME,
  IN `p_user_id` INT
)
BEGIN
UPDATE _backgrounds
SET name = p_name
	, image_url = p_image_url
	, link_url = p_link_url
  , background_color = p_background_color
	, details_color = p_details_color
	, is_active = p_is_active
	, begins_at = p_begins_at
	, ends_at = p_ends_at
  , user_id = p_user_id
	, updated_at = NOW()
WHERE (id = p_id);
SELECT id
, name
, image_url
, link_url
, background_color
, details_color
, is_active
, DATE_FORMAT(begins_at,'%Y-%m-%dT%H:%i') AS begins_at
, DATE_FORMAT(ends_at,'%Y-%m-%dT%H:%i') AS ends_at
FROM _backgrounds
WHERE (id = p_id);
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_backgrounds_delete`(
  IN `p_id` INT,
  IN `p_user_id` INT
)
BEGIN
    UPDATE _backgrounds
    SET is_to_be_deleted = 1
    , is_active = 0
    , user_id = p_user_id
    , marked_as_deleted_at = NOW()
    WHERE (id = p_id);
SELECT ROW_COUNT() AS rowCount;
END$$
DELIMITER ;

SELECT 1;
