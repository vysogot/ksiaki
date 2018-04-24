DROP PROCEDURE IF EXISTS sp_slides_new;
DROP PROCEDURE IF EXISTS sp_slides_find;
DROP PROCEDURE IF EXISTS sp_slides_all;
DROP PROCEDURE IF EXISTS sp_slides_create;
DROP PROCEDURE IF EXISTS sp_slides_update;
DROP PROCEDURE IF EXISTS sp_slides_delete;
DROP PROCEDURE IF EXISTS sp_slides_get;

DELIMITER $$
CREATE PROCEDURE `sp_slides_get`()
BEGIN
SELECT image_url, link_url
FROM _slides
WHERE is_active
AND NOW() BETWEEN begins_at AND ends_at;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_slides_new`()
BEGIN
SELECT 0 AS id
, '' AS name
, '/uploads/slide-1.jpg' AS image_url
, 'https://konkursiaki.pl' AS link_url
, 1 AS is_active
, NOW() AS begins_at
, DATE_ADD(NOW(), INTERVAL 14 DAY) AS ends_at;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_slides_find`(IN `p_id` INT)
BEGIN
SELECT id
, name
, image_url
, link_url
, is_active
, begins_at
, ends_at
FROM _slides
WHERE (id = p_id);
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_slides_all`(IN `p_id` INT
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
, is_active
, begins_at
, ends_at
FROM _slides
WHERE id = CASE WHEN p_id IS NULL THEN id ELSE p_id END
AND name LIKE CASE WHEN p_name IS NULL THEN name ELSE '%name%' END
AND link_url LIKE CASE WHEN p_link_url IS NULL THEN link_url ELSE '%p_link_url%' END
LIMIT p_limit
OFFSET p_offset;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_slides_create`(
  IN `p_name` VARCHAR(255),
	IN `p_image_url` VARCHAR(255),
	IN `p_link_url` VARCHAR(255),
	IN `p_is_active` INT,
	IN `p_begins_at` DATETIME,
	IN `p_ends_at` DATETIME
)
BEGIN
	INSERT INTO _slides(
    name
    , image_url
    , link_url
    , is_active
    , begins_at
    , ends_at
	) VALUES(
		p_name,
		p_image_url,
		p_link_url,
		p_is_active,
		p_begins_at,
		p_ends_at
	);
SELECT ROW_COUNT() AS rowCount, LAST_INSERT_ID() AS lastInsertId;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_slides_update`(
	IN `p_id` INT,
  IN `p_name` VARCHAR(255),
	IN `p_image_url` VARCHAR(255),
	IN `p_link_url` VARCHAR(255),
	IN `p_is_active` INT,
	IN `p_begins_at` DATETIME,
	IN `p_ends_at` DATETIME
)
BEGIN
UPDATE _slides
SET name = p_name
	, image_url = p_image_url
	, link_url = p_link_url
	, is_active = p_is_active
	, begins_at = p_begins_at
	, ends_at = p_ends_at
WHERE (id = p_id);
SELECT ROW_COUNT() AS rowCount, LAST_INSERT_ID() AS lastInsertId;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_slides_delete`(IN `p_id` INT)
BEGIN
DELETE FROM _slides
WHERE (id = p_id)
LIMIT 1;
SELECT ROW_COUNT() AS rowCount;
END$$
DELIMITER ;

SELECT 1;
