DROP PROCEDURE IF EXISTS sp_heroes_new;
DROP PROCEDURE IF EXISTS sp_heroes_find;
DROP PROCEDURE IF EXISTS sp_heroes_all;
DROP PROCEDURE IF EXISTS sp_heroes_create;
DROP PROCEDURE IF EXISTS sp_heroes_update;
DROP PROCEDURE IF EXISTS sp_heroes_delete;
DROP PROCEDURE IF EXISTS sp_heroes_find_by_slug;

DELIMITER $$
CREATE PROCEDURE `sp_heroes_new`()
BEGIN
    SELECT 0 AS id
    , '' AS name
    , '' AS slug
    , '' AS description
    , '' AS avatar_url
    , '' AS header_url
    , 1 AS is_active;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_heroes_find`(IN `p_id` INT)
BEGIN
    SELECT *
    FROM _heroes
    WHERE (id = p_id);
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_heroes_find_by_slug`(IN `p_slug` VARCHAR(255))
BEGIN
    SELECT _heroes.* FROM _heroes
    WHERE (slug = p_slug);
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_heroes_all`()
BEGIN
    SELECT id
    , avatar_url as image
    , name
    , description
    , slug
    , avatar_url
    , header_url
    , is_active
    FROM _heroes
    WHERE (marked_as_deleted_by = 0);
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_heroes_create`(
    IN `p_name` VARCHAR(255),
    IN `p_slug` VARCHAR(255),
    IN `p_description` text,
    IN `p_avatar_url` VARCHAR(255),
    IN `p_header_url` VARCHAR(255),
    IN `p_cover_url` VARCHAR(255),
    IN `p_video_url` VARCHAR(255),
    IN `p_video_cover_url` VARCHAR(255),
    IN `p_gadget_url` VARCHAR(255),
    IN `p_footer_url` VARCHAR(255),
    IN `p_license_description` text,
    IN `p_is_active` INT,
    IN `p_user_id` INT
)
BEGIN
    INSERT INTO _heroes(
        name
        , slug
        , description
        , avatar_url
        , header_url
        , cover_url
        , video_url
        , video_cover_url
        , gadget_url
        , footer_url
        , license_description
        , is_active
        , created_by
        ) VALUES(
        p_name
        , p_slug
        , p_description
        , p_avatar_url
        , p_header_url
        , p_cover_url
        , p_video_url
        , p_video_cover_url
        , p_gadget_url
        , p_footer_url
        , p_license_description
        , p_is_active
        , p_user_id
    );

    SELECT ROW_COUNT() AS rowCount, LAST_INSERT_ID() AS lastInsertId;

END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_heroes_update`(
    IN `p_id` INT,
    IN `p_name` VARCHAR(255),
    IN `p_slug` VARCHAR(255),
    IN `p_description` text,
    IN `p_avatar_url` VARCHAR(255),
    IN `p_header_url` VARCHAR(255),
    IN `p_cover_url` VARCHAR(255),
    IN `p_video_url` VARCHAR(255),
    IN `p_video_cover_url` VARCHAR(255),
    IN `p_gadget_url` VARCHAR(255),
    IN `p_footer_url` VARCHAR(255),
    IN `p_license_description` text,
    IN `p_is_active` INT,
    IN `p_user_id` INT
)
BEGIN
    UPDATE _heroes
    SET name = p_name
    , slug = p_slug
    , description = p_description
    , avatar_url = p_avatar_url
    , header_url = p_header_url
    , cover_url = p_cover_url
    , video_url = p_video_url
    , video_cover_url = p_video_cover_url
    , gadget_url = p_gadget_url
    , footer_url = p_footer_url
    , license_description = p_license_description
    , is_active = p_is_active
    , updated_by = p_user_id
    , updated_at = NOW()
    WHERE (id = p_id);

    CALL `sp_heroes_find`(p_id);

END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_heroes_delete`(
  IN `p_id` INT,
  IN `p_user_id` INT
)
BEGIN
    UPDATE _heroes
    SET is_active = 0
    , marked_as_deleted_at = NOW()
    , marked_as_deleted_by = p_user_id
    WHERE (id = p_id)
    LIMIT 1;
    SELECT ROW_COUNT() AS rowCount;
END$$
DELIMITER ;

SELECT 1;
