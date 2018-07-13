DROP PROCEDURE IF EXISTS sp_backgrounds_new;
DROP PROCEDURE IF EXISTS sp_backgrounds_find;
DROP PROCEDURE IF EXISTS sp_backgrounds_all;
DROP PROCEDURE IF EXISTS sp_backgrounds_create;
DROP PROCEDURE IF EXISTS sp_backgrounds_update;
DROP PROCEDURE IF EXISTS sp_backgrounds_delete;
DROP PROCEDURE IF EXISTS sp_backgrounds_get;

DELIMITER $$
CREATE PROCEDURE `sp_backgrounds_get`(
    IN p_placement VARCHAR(255)
)
BEGIN
SELECT image_url, background_color, details_color, link_url, RAND()
FROM _backgrounds
WHERE is_active
AND NOW() BETWEEN begins_at AND ends_at
AND UPPER(p_placement) LIKE CONCAT('%', UPPER(placement))
ORDER BY RAND()
LIMIT 1;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_backgrounds_new`()
BEGIN
SELECT 0 AS id
, '' AS name
, '' AS image_url
, '' AS link_url
, '#ffffff' AS background_color
, '#000000' details_color
, 1 AS is_active
, NOW() AS begins_at
, '/' AS placement
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
, placement
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
CREATE PROCEDURE `sp_backgrounds_all`()
BEGIN
SELECT id
, name
, image_url
, link_url
, placement
, is_active
, DATE_FORMAT(begins_at,'%Y-%m-%d %H:%i') AS begins_at
, DATE_FORMAT(ends_at,'%Y-%m-%d %H:%i') AS ends_at
FROM _backgrounds
WHERE (marked_as_deleted_by = 0);
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_backgrounds_create`(
    IN `p_name` VARCHAR(255),
	IN `p_image_url` VARCHAR(255),
	IN `p_link_url` VARCHAR(255),
    IN `p_placement` VARCHAR(255),
    IN `p_background_color` VARCHAR(255),
    IN `p_details_color` VARCHAR(255),
	IN `p_is_active` INT,
	IN `p_begins_at` DATETIME,
	IN `p_ends_at` DATETIME,
    IN `p_user_id` INT
)
BEGIN
	INSERT INTO _backgrounds(
        name
        , image_url
        , link_url
        , placement
        , background_color
        , details_color
        , is_active
        , begins_at
        , ends_at
        , created_by
        , created_at
	) VALUES(
		p_name,
		p_image_url,
		p_link_url,
        p_placement,
        p_background_color,
        p_details_color,
		p_is_active,
		p_begins_at,
		p_ends_at,
        p_user_id,
        NOW()
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
    IN `p_placement` VARCHAR(255),
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
    , placement = p_placement
    , background_color = p_background_color
	, details_color = p_details_color
	, is_active = p_is_active
	, begins_at = p_begins_at
	, ends_at = p_ends_at
    , updated_by = p_user_id
	, updated_at = NOW()
WHERE (id = p_id);

CALL `sp_backgrounds_find`(p_id);

END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_backgrounds_delete`(
  IN `p_id` INT,
  IN `p_user_id` INT
)
BEGIN
    UPDATE _backgrounds
    SET marked_as_deleted_by = p_user_id
    , marked_as_deleted_at = NOW()
    , is_active = 0
    WHERE (id = p_id);
SELECT ROW_COUNT() AS rowCount;
END$$
DELIMITER ;
