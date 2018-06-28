DROP PROCEDURE IF EXISTS sp_hero_editions_new;
DROP PROCEDURE IF EXISTS sp_hero_editions_find;
DROP PROCEDURE IF EXISTS sp_hero_editions_all;
DROP PROCEDURE IF EXISTS sp_hero_editions_create;
DROP PROCEDURE IF EXISTS sp_hero_editions_update;
DROP PROCEDURE IF EXISTS sp_hero_editions_delete;
DROP PROCEDURE IF EXISTS sp_hero_editions_find_by_hero_id;

DELIMITER $$
CREATE PROCEDURE `sp_hero_editions_new`()
BEGIN
    SELECT 0 AS id
    , '' AS hero_id
    , '' AS name
    , '' AS description
    , '' AS cover_url
    , '' AS video_url
    , '' AS video_cover_url
    , '' AS gadget_url
    , 1 AS is_active;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_hero_editions_find`(IN `p_id` INT)
BEGIN
    SELECT _hero_editions.*, _heroes.name AS hero_name
    FROM _hero_editions
    INNER JOIN _heroes on _hero_editions.hero_id = _heroes.id
    WHERE (_hero_editions.id = p_id);
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_hero_editions_find_by_hero_id`(IN `p_hero_id` INT)
BEGIN
    SELECT id, name, description, cover_url, video_url, video_cover_url, gadget_url
    FROM _hero_editions
    WHERE (hero_id = p_hero_id)
    AND is_active;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_hero_editions_all`()
BEGIN
    SELECT _hero_editions.*, _heroes.name AS hero_name
    FROM _hero_editions
    INNER JOIN _heroes on _hero_editions.hero_id = _heroes.id
    WHERE (_hero_editions.marked_as_deleted_by = 0);
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_hero_editions_create`(
    IN `p_hero_id` VARCHAR(255),
    IN `p_name` VARCHAR(255),
    IN `p_description` text,
    IN `p_cover_url` VARCHAR(255),
    IN `p_video_url` VARCHAR(255),
    IN `p_video_cover_url` VARCHAR(255),
    IN `p_gadget_url` VARCHAR(255),
    IN `p_is_active` INT,
    IN `p_user_id` INT
)
BEGIN
    INSERT INTO _hero_editions(
        hero_id
        , name
        , description
        , cover_url
        , video_url
        , video_cover_url
        , gadget_url
        , is_active
        , created_at
        , created_by
        ) VALUES(
        p_hero_id
        , p_name
        , p_description
        , p_cover_url
        , p_video_url
        , p_video_cover_url
        , p_gadget_url
        , p_is_active
        , NOW()
        , p_user_id
    );

    SELECT ROW_COUNT() AS rowCount, LAST_INSERT_ID() AS lastInsertId;

END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_hero_editions_update`(
    IN `p_id` INT,
    IN `p_hero_id` VARCHAR(255),
    IN `p_name` VARCHAR(255),
    IN `p_description` text,
    IN `p_cover_url` VARCHAR(255),
    IN `p_video_url` VARCHAR(255),
    IN `p_video_cover_url` VARCHAR(255),
    IN `p_gadget_url` VARCHAR(255),
    IN `p_is_active` INT,
    IN `p_user_id` INT
)
BEGIN
    UPDATE _hero_editions
    SET name = p_name
    , hero_id = p_hero_id
    , description = p_description
    , cover_url = p_cover_url
    , video_url = p_video_url
    , video_cover_url = p_video_cover_url
    , gadget_url = p_gadget_url
    , is_active = p_is_active
    , updated_by = p_user_id
    , updated_at = NOW()
    WHERE (id = p_id);

    CALL `sp_hero_editions_find`(p_id);

END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_hero_editions_delete`(
  IN `p_id` INT,
  IN `p_user_id` INT
)
BEGIN
    UPDATE _hero_editions
    SET marked_as_deleted_at = NOW()
    , marked_as_deleted_by = p_user_id
    , is_active = 0
    WHERE (id = p_id)
    LIMIT 1;
    SELECT ROW_COUNT() AS rowCount;
END$$
DELIMITER ;
