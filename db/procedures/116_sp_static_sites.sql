DROP PROCEDURE IF EXISTS sp_static_sites_new;
DROP PROCEDURE IF EXISTS sp_static_sites_find;
DROP PROCEDURE IF EXISTS sp_static_sites_all;
DROP PROCEDURE IF EXISTS sp_static_sites_create;
DROP PROCEDURE IF EXISTS sp_static_sites_update;
DROP PROCEDURE IF EXISTS sp_static_sites_delete;
DROP PROCEDURE IF EXISTS sp_static_sites_find_by_slug;

DELIMITER $$
CREATE PROCEDURE `sp_static_sites_new`()
BEGIN
    SELECT 0 AS id
    , '' AS title
    , '/uploads/static_site-1.jpg' AS slug
    , 'https://konkursiaki.pl' AS content
    , 1 AS is_active;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_static_sites_find`(IN `p_id` INT)
BEGIN
    SELECT id
    , title
    , slug
    , content
    , is_active
    FROM _static_sites
    WHERE (id = p_id);
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_static_sites_find_by_slug`(IN `p_slug` VARCHAR(255))
BEGIN
    SELECT id
    , title
    , slug
    , content
    , is_active
    FROM _static_sites
    WHERE (slug = p_slug);
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_static_sites_all`()
BEGIN
    SELECT id
    , title
    , slug
    , is_active
    FROM _static_sites
    WHERE (marked_as_deleted_by = 0);
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_static_sites_create`(
    IN `p_title` VARCHAR(255),
    IN `p_slug` VARCHAR(255),
    IN `p_content` text,
    IN `p_is_active` INT
)
BEGIN
    INSERT INTO _static_sites(
        title
        , slug
        , content
        , is_active
        ) VALUES(
        p_title,
        p_slug,
        p_content,
        p_is_active
    );
    SELECT ROW_COUNT() AS rowCount, LAST_INSERT_ID() AS lastInsertId;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_static_sites_update`(
    IN `p_id` INT,
    IN `p_title` VARCHAR(255),
    IN `p_slug` VARCHAR(255),
    IN `p_content` text,
    IN `p_is_active` INT
)
BEGIN
    UPDATE _static_sites
    SET title = p_title
    , slug = p_slug
    , content = p_content
    , is_active = p_is_active
    WHERE (id = p_id);

    CALL `sp_static_sites_find`(p_id);

END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_static_sites_delete`(
    IN `p_id` INT
    , IN `p_user_id` INT
)
BEGIN

    UPDATE _static_sites
    SET marked_as_deleted_at = NOW()
    , marked_as_deleted_by = p_user_id
    , is_active = 0
    WHERE (id = p_id);

    SELECT ROW_COUNT() AS rowCount;

END$$
DELIMITER ;
