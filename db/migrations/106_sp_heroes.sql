DROP PROCEDURE IF EXISTS sp_heroes_new;
DROP PROCEDURE IF EXISTS sp_heroes_find;
DROP PROCEDURE IF EXISTS sp_heroes_all;
DROP PROCEDURE IF EXISTS sp_heroes_create;
DROP PROCEDURE IF EXISTS sp_heroes_update;
DROP PROCEDURE IF EXISTS sp_heroes_delete;

DELIMITER $$
CREATE PROCEDURE `sp_heroes_new`()
BEGIN
    SELECT 0 AS id
    , '' AS name
    , '' AS slug 
    , '' AS description
    , '/uploads/hero-1-avatar.jpg' AS avatar_url
    , '/uploads/hero-1-header.jpg' AS header_url
    , 1 AS is_active;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_heroes_find`(IN `p_id` INT)
BEGIN
    SELECT id
    , name
    , slug
    , description
    , avatar_url
    , header_url
    , is_active
    FROM _heroes
    WHERE (id = p_id);
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_heroes_find_by_slug`(IN `p_slug` VARCHAR(255))
BEGIN
    SELECT id
    , name
    , slug
    , description
    , avatar_url
    , header_url
    , is_active
    FROM _heroes
    WHERE (slug = p_slug);
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_heroes_all`(IN `p_id` INT
    , IN `p_name` VARCHAR(255)
    , IN `p_offset` INT
    , IN `p_limit` INT
)
BEGIN
    SELECT id
    , name
    , slug
    , description
    , avatar_url
    , header_url
    , is_active
    FROM _heroes
    WHERE id = CASE WHEN p_id IS NULL THEN id ELSE p_id END
    AND name LIKE CASE WHEN p_name IS NULL THEN name ELSE '%name%' END
    LIMIT p_limit
    OFFSET p_offset;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_heroes_create`(
    IN `p_name` VARCHAR(255),
    IN `p_slug` VARCHAR(255),
    IN `p_description` VARCHAR(255),
    IN `p_avatar_url` VARCHAR(255),
    IN `p_header_url` VARCHAR(255),
    IN `p_is_active` INT
)
BEGIN
    INSERT INTO _heroes(name
        , slug
        , description
        , avatar_url
        , header_url
        , is_active
        ) VALUES(
        p_name,
        p_slug,
        p_description,
        p_avatar_url,
        p_header_url,
        p_is_active
    );
    SELECT ROW_COUNT() AS rowCount, LAST_INSERT_ID() AS lastInsertId;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_heroes_update`(
    IN `p_id` INT,
    IN `p_name` VARCHAR(255),
    IN `p_slug` VARCHAR(255),
    IN `p_description` VARCHAR(255),
    IN `p_avatar_url` VARCHAR(255),
    IN `p_header_url` VARCHAR(255),
    IN `p_is_active` INT
)
BEGIN
    UPDATE _heroes
    SET name = p_name
    , slug = p_slug
    , description = p_description
    , avatar_url = p_avatar_url
    , header_url = p_header_url
    , is_active = p_is_active
    WHERE (id = p_id);
    SELECT ROW_COUNT() AS rowCount, LAST_INSERT_ID() AS lastInsertId;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_heroes_delete`(IN `p_id` INT)
BEGIN
    DELETE FROM _heroes
    WHERE (id = p_id)
    LIMIT 1;
    SELECT ROW_COUNT() AS rowCount;
END$$
DELIMITER ;

SELECT 1;
