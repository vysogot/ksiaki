DROP PROCEDURE IF EXISTS sp_video_ads_new;
DROP PROCEDURE IF EXISTS sp_video_ads_find;
DROP PROCEDURE IF EXISTS sp_video_ads_all;
DROP PROCEDURE IF EXISTS sp_video_ads_create;
DROP PROCEDURE IF EXISTS sp_video_ads_update;
DROP PROCEDURE IF EXISTS sp_video_ads_delete;
DROP PROCEDURE IF EXISTS sp_video_ads_get;

DELIMITER $$
CREATE PROCEDURE `sp_video_ads_get`()
BEGIN
    SELECT image_url, link_url
    FROM _video_ads
    WHERE is_active
    AND NOW() BETWEEN begins_at AND ends_at;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_video_ads_new`()
BEGIN
    SELECT 0 AS id
    , '' AS name
    , '/uploads/video_ad-1.mp4' AS video_url
    , '/uploads/video_ad-1.jpg' AS image_url
    , 'https://konkursiaki.pl' AS link_url
    , 1 AS is_active
    , NOW() AS begins_at
    , DATE_ADD(NOW(), INTERVAL 14 DAY) AS ends_at;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_video_ads_find`(IN `p_id` INT)
BEGIN
    SELECT id
    , name
    , video_url
    , image_url
    , link_url
    , is_active
    , begins_at
    , ends_at
    FROM _video_ads
    WHERE (id = p_id);
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_video_ads_all`(IN `p_id` INT
    , IN `p_name` VARCHAR(255)
    , IN `p_link_url` VARCHAR(50)
    , IN `p_offset` INT
    , IN `p_limit` INT
)
BEGIN
    SELECT id
    , name
    , video_url
    , image_url
    , link_url
    , is_active
    , begins_at
    , ends_at
    FROM _video_ads
    WHERE id = CASE WHEN p_id IS NULL THEN id ELSE p_id END
    AND name LIKE CASE WHEN p_name IS NULL THEN name ELSE '%name%' END
    AND link_url LIKE CASE WHEN p_link_url IS NULL THEN link_url ELSE '%p_link_url%' END
    LIMIT p_limit
    OFFSET p_offset;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_video_ads_create`(
    IN `p_name` VARCHAR(255),
    IN `p_video_url` VARCHAR(255),
    IN `p_image_url` VARCHAR(255),
    IN `p_link_url` VARCHAR(255),
    IN `p_is_active` INT,
    IN `p_begins_at` DATETIME,
    IN `p_ends_at` DATETIME
)
BEGIN
    INSERT INTO _video_ads(
        name
        , video_url
        , image_url
        , link_url
        , is_active
        , begins_at
        , ends_at
        ) VALUES(
        p_name,
        p_video_url,
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
CREATE PROCEDURE `sp_video_ads_update`(
    IN `p_id` INT,
    IN `p_name` VARCHAR(255),
    IN `p_video_url` VARCHAR(255),
    IN `p_image_url` VARCHAR(255),
    IN `p_link_url` VARCHAR(255),
    IN `p_is_active` INT,
    IN `p_begins_at` DATETIME,
    IN `p_ends_at` DATETIME
)
BEGIN
    UPDATE _video_ads
    SET name = p_name
    , video_url = p_video_url
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
CREATE PROCEDURE `sp_video_ads_delete`(IN `p_id` INT)
BEGIN
    DELETE FROM _video_ads
    WHERE (id = p_id)
    LIMIT 1;
    SELECT ROW_COUNT() AS rowCount;
END$$
DELIMITER ;

SELECT 1;
