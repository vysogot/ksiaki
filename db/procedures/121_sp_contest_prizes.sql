DROP PROCEDURE IF EXISTS sp_contest_prizes_new;
DROP PROCEDURE IF EXISTS sp_contest_prizes_find;
DROP PROCEDURE IF EXISTS sp_contest_prizes_all;
DROP PROCEDURE IF EXISTS sp_contest_prizes_create;
DROP PROCEDURE IF EXISTS sp_contest_prizes_update;
DROP PROCEDURE IF EXISTS sp_contest_prizes_delete;
DROP PROCEDURE IF EXISTS sp_contest_prizes_by_contest_id;

DELIMITER $$
CREATE PROCEDURE `sp_contest_prizes_new`()
BEGIN
    SELECT 0 AS id
    , '' AS contest_id
    , '' AS sponsor_id
    , '' AS name
    , '' AS description
    , '' AS image_url
    , 1 AS is_active;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_contest_prizes_find`(IN `p_id` INT)
BEGIN
    SELECT _contest_prizes.*,
    _contests.name AS contest_name,
    _sponsors.name AS sponsor_name,
    _sponsors.image_url AS sponsor_image_url
    FROM _contest_prizes
    INNER JOIN _contests on _contest_prizes.contest_id = _contests.id
    INNER JOIN _sponsors on _contest_prizes.sponsor_id = _sponsors.id
    WHERE (_contest_prizes.id = p_id);
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_contest_prizes_all`()
BEGIN
    SELECT _contest_prizes.*,
    _contests.name AS contest_name,
    _sponsors.name AS sponsor_name
    FROM _contest_prizes
    INNER JOIN _contests on _contest_prizes.contest_id = _contests.id
    INNER JOIN _sponsors on _contest_prizes.sponsor_id = _sponsors.id
    WHERE (_contest_prizes.marked_as_deleted_by = 0);
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_contest_prizes_by_contest_id`(
    IN `p_contest_id` INT
)
BEGIN
    SELECT _contest_prizes.*,
    _contests.name AS contest_name,
    _sponsors.name AS sponsor_name
    FROM _contest_prizes
    INNER JOIN _contests on _contest_prizes.contest_id = _contests.id
    INNER JOIN _sponsors on _contest_prizes.sponsor_id = _sponsors.id
    WHERE (_contest_prizes.marked_as_deleted_by = 0)
    AND (_contest_prizes.contest_id = p_contest_id);
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_contest_prizes_create`(
    IN `p_contest_id` INT,
    IN `p_sponsor_id` INT,
    IN `p_name` VARCHAR(255),
    IN `p_description` VARCHAR(255),
    IN `p_image_url` VARCHAR(255),
    IN `p_is_active` INT,
    IN `p_user_id` INT
)
BEGIN
    INSERT INTO _contest_prizes(
        contest_id
        , sponsor_id
        , name
        , description
        , image_url
        , is_active
        , created_at
        , created_by
        ) VALUES(
        p_contest_id
        , p_sponsor_id
        , p_name
        , p_description
        , p_image_url
        , p_is_active
        , NOW()
        , p_user_id
    );

    SELECT ROW_COUNT() AS rowCount, LAST_INSERT_ID() AS lastInsertId;

END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_contest_prizes_update`(
    IN `p_id` INT,
    IN `p_contest_id` INT,
    IN `p_sponsor_id` INT,
    IN `p_name` VARCHAR(255),
    IN `p_description` VARCHAR(255),
    IN `p_image_url` VARCHAR(255),
    IN `p_is_active` INT,
    IN `p_user_id` INT
)
BEGIN
    UPDATE _contest_prizes
    SET name = p_name
    , contest_id = p_contest_id
    , sponsor_id = p_sponsor_id
    , description = p_description
    , image_url = p_image_url
    , is_active = p_is_active
    , updated_by = p_user_id
    , updated_at = NOW()
    WHERE (id = p_id);

    CALL `sp_contest_prizes_find`(p_id);

END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_contest_prizes_delete`(
  IN `p_id` INT,
  IN `p_user_id` INT
)
BEGIN
    UPDATE _contest_prizes
    SET is_active = 0
    , marked_as_deleted_at = NOW()
    , marked_as_deleted_by = p_user_id
    WHERE (id = p_id)
    LIMIT 1;
    SELECT ROW_COUNT() AS rowCount;
END$$
DELIMITER ;

SELECT 1;
