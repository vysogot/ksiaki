DROP PROCEDURE IF EXISTS sp_sponsors_new;
DROP PROCEDURE IF EXISTS sp_sponsors_find;
DROP PROCEDURE IF EXISTS sp_sponsors_all;
DROP PROCEDURE IF EXISTS sp_sponsors_create;
DROP PROCEDURE IF EXISTS sp_sponsors_update;
DROP PROCEDURE IF EXISTS sp_sponsors_delete;

DELIMITER $$
CREATE PROCEDURE `sp_sponsors_new`()
BEGIN
    SELECT 0 AS id
    , '' AS name
    , '' AS description
    , '' AS image_url
    , '' AS link_url
    , 1 AS is_active;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_sponsors_find`(IN `p_id` INT)
BEGIN
    SELECT _sponsors.*
    FROM _sponsors
    WHERE (_sponsors.id = p_id);
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_sponsors_all`()
BEGIN
    SELECT _sponsors.*
    FROM _sponsors
    WHERE (_sponsors.marked_as_deleted_by = 0);
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_sponsors_create`(
    IN `p_name` VARCHAR(255),
    IN `p_description` VARCHAR(255),
    IN `p_image_url` VARCHAR(255),
    IN `p_link_url` VARCHAR(255),
    IN `p_is_active` INT,
    IN `p_user_id` INT
)
BEGIN
    INSERT INTO _sponsors(
        name
        , description
        , image_url
        , link_url
        , is_active
        , created_at
        , created_by
        ) VALUES(
        p_name
        , p_description
        , p_image_url
        , p_link_url
        , p_is_active
        , NOW()
        , p_user_id
    );

    SELECT ROW_COUNT() AS rowCount, LAST_INSERT_ID() AS lastInsertId;

END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_sponsors_update`(
    IN `p_id` INT,
    IN `p_name` VARCHAR(255),
    IN `p_description` VARCHAR(255),
    IN `p_image_url` VARCHAR(255),
    IN `p_link_url` VARCHAR(255),
    IN `p_is_active` INT,
    IN `p_user_id` INT
)
BEGIN
    UPDATE _sponsors
    SET name = p_name
    , description = p_description
    , image_url = p_image_url
    , link_url = p_link_url
    , is_active = p_is_active
    , updated_by = p_user_id
    , updated_at = NOW()
    WHERE (id = p_id);

    CALL `sp_sponsors_find`(p_id);

END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_sponsors_delete`(
  IN `p_id` INT,
  IN `p_user_id` INT
)
BEGIN
    UPDATE _sponsors
    SET marked_as_deleted_at = NOW()
    , marked_as_deleted_by = p_user_id
    , is_active = 0
    WHERE (id = p_id)
    LIMIT 1;
    SELECT ROW_COUNT() AS rowCount;
END$$
DELIMITER ;
