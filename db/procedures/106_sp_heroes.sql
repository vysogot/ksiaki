DROP PROCEDURE IF EXISTS sp_heroes_new;
DROP PROCEDURE IF EXISTS sp_heroes_find;
DROP PROCEDURE IF EXISTS sp_heroes_all;
DROP PROCEDURE IF EXISTS sp_heroes_create;
DROP PROCEDURE IF EXISTS sp_heroes_update;
DROP PROCEDURE IF EXISTS sp_heroes_delete;
DROP PROCEDURE IF EXISTS sp_heroes_find_by_slug;
DROP PROCEDURE IF EXISTS sp_heroes_update_positions;

DELIMITER $$
CREATE PROCEDURE `sp_heroes_new`()
BEGIN
    SELECT 0 AS id
    , '' AS name
    , '' AS slug
    , '' AS description
    , '' AS avatar_url
    , '' AS header_url
    , '' AS footer_url
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
    , position
    , is_active
    FROM _heroes
    WHERE (marked_as_deleted_by = 0)
    ORDER BY position;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_heroes_create`(
    IN `p_name` VARCHAR(255),
    IN `p_slug` VARCHAR(255),
    IN `p_description` text,
    IN `p_avatar_url` VARCHAR(255),
    IN `p_header_url` VARCHAR(255),
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
CREATE PROCEDURE `sp_heroes_update_positions`(
    IN `p_heroes_positions` VARCHAR(255)
)
BEGIN

    SET @positions = REPLACE(p_heroes_positions, ',', '),(');
    SET @positions = CONCAT('(', @positions, ')');

    DROP TEMPORARY TABLE IF EXISTS tmpPositions;

    CREATE TEMPORARY TABLE tmpPositions(
        `position` int(10) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
        `hero_id` int(10) unsigned NOT NULL
    );

    SET @insertString = CONCAT('INSERT INTO tmpPositions (`hero_id`) VALUES ', @positions);

    PREPARE insertStatement FROM @insertString;
    EXECUTE insertStatement;
    DEALLOCATE PREPARE insertStatement;

    UPDATE _heroes
    INNER JOIN tmpPositions ON hero_id = _heroes.id
    SET _heroes.position = tmpPositions.position;

    SELECT ROW_COUNT() AS rowCount;

END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_heroes_delete`(
  IN `p_id` INT,
  IN `p_user_id` INT
)
BEGIN
    UPDATE _heroes
    SET marked_as_deleted_at = NOW()
    , marked_as_deleted_by = p_user_id
    , is_active = 0
    WHERE (id = p_id)
    LIMIT 1;
    SELECT ROW_COUNT() AS rowCount;
END$$
DELIMITER ;
