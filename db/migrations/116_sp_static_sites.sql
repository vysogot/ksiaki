DROP PROCEDURE IF EXISTS sp_static_sites_new;
DROP PROCEDURE IF EXISTS sp_static_sites_find;
DROP PROCEDURE IF EXISTS sp_static_sites_all;
DROP PROCEDURE IF EXISTS sp_static_sites_create;
DROP PROCEDURE IF EXISTS sp_static_sites_update;
DROP PROCEDURE IF EXISTS sp_static_sites_delete;

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
CREATE PROCEDURE `sp_static_sites_find_by_slug`(IN `p_slug` INT)
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
CREATE PROCEDURE `sp_static_sites_all`(IN `p_id` INT
    , IN `p_title` VARCHAR(255)
    , IN `p_slug` VARCHAR(255)
    , IN `p_content` VARCHAR(50)
    , IN `p_is_active` INT
    , IN `p_offset` INT
    , IN `p_limit` INT
)
BEGIN
    SELECT id
    , title
    , slug
    , content
    , is_active
    FROM _static_sites
    WHERE id = CASE WHEN p_id IS NULL THEN id ELSE p_id END
    AND title LIKE CASE WHEN p_title IS NULL THEN title ELSE '%title%' END
    AND content LIKE CASE WHEN p_content IS NULL THEN content ELSE '%p_content%' END
    AND is_active LIKE CASE WHEN p_is_active IS NULL THEN is_active ELSE p_is_active END
    LIMIT p_limit
    OFFSET p_offset;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_static_sites_create`(
    IN `p_title` VARCHAR(255),
    IN `p_slug` VARCHAR(255),
    IN `p_content` VARCHAR(255),
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
    IN `p_content` VARCHAR(255),
    IN `p_is_active` INT
)
BEGIN
    UPDATE _static_sites
    SET title = p_title
    , slug = p_slug
    , content = p_content
    , is_active = p_is_active
    WHERE (id = p_id);
    SELECT ROW_COUNT() AS rowCount, LAST_INSERT_ID() AS lastInsertId;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_static_sites_delete`(IN `p_id` INT)
BEGIN
    DELETE FROM _static_sites
    WHERE (id = p_id)
    LIMIT 1;
    SELECT ROW_COUNT() AS rowCount;
END$$
DELIMITER ;

SELECT 1;
