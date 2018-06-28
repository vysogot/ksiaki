DROP PROCEDURE IF EXISTS sp_hero_files_new;
DROP PROCEDURE IF EXISTS sp_hero_files_find;
DROP PROCEDURE IF EXISTS sp_hero_files_all;
DROP PROCEDURE IF EXISTS sp_hero_files_create;
DROP PROCEDURE IF EXISTS sp_hero_files_update;
DROP PROCEDURE IF EXISTS sp_hero_files_delete;
DROP PROCEDURE IF EXISTS sp_hero_file_types_all;
DROP PROCEDURE IF EXISTS sp_hero_magazines_by_hero_edition_id;
DROP PROCEDURE IF EXISTS sp_hero_wallpapers_by_hero_edition_id;

DELIMITER $$
CREATE PROCEDURE `sp_hero_files_new`()
BEGIN
    SELECT 0 AS id
    , '' AS hero_edition_id
    , '' AS hero_file_type_id
    , '' AS name
    , '' AS description
    , '' AS file_url
    , 1 AS is_active;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_hero_files_find`(IN `p_id` INT)
BEGIN
    SELECT _hero_files.*
    , _hero_editions.name AS edition_name
    , _heroes.name AS hero_name
    FROM _hero_files
    INNER JOIN _hero_editions on _hero_files.hero_edition_id = _hero_editions.id
    INNER JOIN _heroes on _hero_editions.hero_id = _heroes.id
    WHERE (_hero_files.id = p_id);
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_hero_files_all`()
BEGIN
    SELECT _hero_files.*
    , _hero_editions.name AS edition_name
    , _heroes.name AS hero_name
    FROM _hero_files
    INNER JOIN _hero_editions on _hero_files.hero_edition_id = _hero_editions.id
    INNER JOIN _heroes on _hero_editions.hero_id = _heroes.id
    WHERE (_hero_files.marked_as_deleted_by = 0);
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_hero_magazines_by_hero_edition_id`(
    IN `p_hero_edition_id` INT
)
BEGIN
    SELECT *
    FROM _hero_files
    WHERE (_hero_files.marked_as_deleted_by = 0)
    AND hero_file_type_id = 1
    AND hero_edition_id = p_hero_edition_id;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_hero_wallpapers_by_hero_edition_id`(
    IN `p_hero_edition_id` INT
)
BEGIN
    SELECT *
    FROM _hero_files
    WHERE (_hero_files.marked_as_deleted_by = 0)
    AND hero_file_type_id = 2
    AND hero_edition_id = p_hero_edition_id;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_hero_file_types_all`()
BEGIN
    SELECT *
    FROM def_hero_file_types;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_hero_files_create`(
    IN `p_hero_edition_id` VARCHAR(255),
    IN `p_hero_file_type_id` VARCHAR(255),
    IN `p_name` VARCHAR(255),
    IN `p_description` VARCHAR(255),
    IN `p_file_url` VARCHAR(255),
    IN `p_is_active` INT,
    IN `p_user_id` INT
)
BEGIN
    INSERT INTO _hero_files(
        hero_edition_id
        , hero_file_type_id
        , name
        , description
        , file_url
        , is_active
        , created_at
        , created_by
        ) VALUES(
        p_hero_edition_id
        , p_hero_file_type_id
        , p_name
        , p_description
        , p_file_url
        , p_is_active
        , NOW()
        , p_user_id
    );

    SELECT ROW_COUNT() AS rowCount, LAST_INSERT_ID() AS lastInsertId;

END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_hero_files_update`(
    IN `p_id` INT,
    IN `p_hero_edition_id` VARCHAR(255),
    IN `p_hero_file_type_id` VARCHAR(255),
    IN `p_name` VARCHAR(255),
    IN `p_description` VARCHAR(255),
    IN `p_file_url` VARCHAR(255),
    IN `p_is_active` INT,
    IN `p_user_id` INT
)
BEGIN
    UPDATE _hero_files
    SET name = p_name
    , hero_edition_id = p_hero_edition_id
    , hero_file_type_id = p_hero_file_type_id
    , description = p_description
    , file_url = p_file_url
    , is_active = p_is_active
    , updated_by = p_user_id
    , updated_at = NOW()
    WHERE (id = p_id);

    CALL `sp_hero_files_find`(p_id);

END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_hero_files_delete`(
  IN `p_id` INT,
  IN `p_user_id` INT
)
BEGIN
    UPDATE _hero_files
    SET marked_as_deleted_at = NOW()
    , marked_as_deleted_by = p_user_id
    , is_active = 0
    WHERE (id = p_id)
    LIMIT 1;
    SELECT ROW_COUNT() AS rowCount;
END$$
DELIMITER ;
