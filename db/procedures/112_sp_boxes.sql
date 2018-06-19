DROP PROCEDURE IF EXISTS sp_boxes_new;
DROP PROCEDURE IF EXISTS sp_boxes_find;
DROP PROCEDURE IF EXISTS sp_boxes_all;
DROP PROCEDURE IF EXISTS sp_boxes_create;
DROP PROCEDURE IF EXISTS sp_boxes_update;
DROP PROCEDURE IF EXISTS sp_boxes_delete;
DROP PROCEDURE IF EXISTS sp_boxes_get;

DELIMITER $$
CREATE PROCEDURE `sp_boxes_get`()
BEGIN
    SELECT image_url, link_url
    FROM _boxes
    WHERE is_active
    AND NOW() BETWEEN begins_at AND ends_at;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_boxes_new`()
BEGIN
    SELECT 0 AS id
    , '' AS name
    , '/uploads/box-1.jpg' AS image_url
    , 'https://konkursiaki.pl' AS link_url
    , 1 AS is_active
    , NOW() AS begins_at
    , DATE_ADD(NOW(), INTERVAL 14 DAY) AS ends_at;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_boxes_find`(IN `p_id` INT)
BEGIN
    SELECT id
    , name
    , image_url
    , link_url
    , is_active
    , begins_at
    , ends_at
    FROM _boxes
    WHERE (id = p_id);
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_boxes_all`()
BEGIN
    SELECT id
    , name
    , image_url
    , link_url
    , is_active
    , begins_at
    , ends_at
    FROM _boxes
    WHERE (marked_as_deleted_by = 0);
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_boxes_create`(
    IN `p_name` VARCHAR(255),
    IN `p_image_url` VARCHAR(255),
    IN `p_link_url` VARCHAR(255),
    IN `p_is_active` INT,
    IN `p_begins_at` DATETIME,
    IN `p_ends_at` DATETIME
)
BEGIN
    INSERT INTO _boxes(
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
CREATE PROCEDURE `sp_boxes_update`(
    IN `p_id` INT,
    IN `p_name` VARCHAR(255),
    IN `p_image_url` VARCHAR(255),
    IN `p_link_url` VARCHAR(255),
    IN `p_is_active` INT,
    IN `p_begins_at` DATETIME,
    IN `p_ends_at` DATETIME
)
BEGIN
    UPDATE _boxes
    SET name = p_name
    , image_url = p_image_url
    , link_url = p_link_url
    , is_active = p_is_active
    , begins_at = p_begins_at
    , ends_at = p_ends_at
    WHERE (id = p_id);

    CALL `sp_boxes_find`(p_id);

END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_boxes_delete`(
    IN `p_id` INT
    , IN `p_user_id` INT
)
BEGIN

    UPDATE _boxes
    SET marked_as_deleted_at = NOW()
    , marked_as_deleted_by = p_user_id
    , is_active = 0
    WHERE (id = p_id);

    SELECT ROW_COUNT() AS rowCount;

END$$
DELIMITER ;
