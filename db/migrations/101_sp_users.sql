DROP PROCEDURE IF EXISTS sp_users_new;
DROP PROCEDURE IF EXISTS sp_users_find;
DROP PROCEDURE IF EXISTS sp_users_find_by_name_or_email;
DROP PROCEDURE IF EXISTS sp_users_find_all;
DROP PROCEDURE IF EXISTS sp_users_create;
DROP PROCEDURE IF EXISTS sp_users_update;
DROP PROCEDURE IF EXISTS sp_users_delete;

DELIMITER $$
CREATE PROCEDURE `sp_users_new`()
BEGIN
SELECT 0 AS id
, 2 AS role_id
, '' AS name
, '' AS email
, '' AS avatar_url
, 1 AS is_active
, '' AS password_hash
, '' AS activation_hash
, NOW() AS last_login_at
, NOW() AS created_at
, NOW() AS updated_at;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_users_find` (IN `p_id` INT)
BEGIN
SELECT * FROM _users
WHERE (id = p_id)
LIMIT 1;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_users_find_by_name_or_email` (IN `p_login` VARCHAR(255))
BEGIN
SELECT * FROM _users
WHERE (name = p_login OR email = p_login)
LIMIT 1;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_users_find_all` (IN `p_offset` INT, IN `p_limit` INT)
BEGIN
SELECT * FROM _users
LIMIT p_limit
OFFSET p_offset;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_users_create`(
        IN `p_role_id` INT,
	IN `p_name` VARCHAR(255),
        IN `p_email` VARCHAR(255),
        IN `p_avatar_url` VARCHAR(255), 
        IN `p_is_active` VARCHAR(255), 
        IN `p_password_hash` VARCHAR(255)
)
BEGIN
INSERT INTO _users(role_id, name, email, avatar_url, is_active, password_hash) 
VALUES(p_role_id, p_name, p_email, p_avatar_url, p_is_active, p_password_hash);
SELECT ROW_COUNT() AS rowCount, LAST_INSERT_ID() AS lastInsertId;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_users_register`(
	IN `p_name` VARCHAR(255),
        IN `p_email` VARCHAR(255),
	IN `p_password_hash` VARCHAR(255)
)
BEGIN
INSERT INTO _users(name, email, password_hash) VALUES(p_name, p_email, p_password_hash);
SELECT ROW_COUNT() AS rowCount, LAST_INSERT_ID() AS lastInsertId;
END$$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE `sp_users_update`(
	IN `p_id` INT,
	IN `p_name` VARCHAR(255),
        IN `p_email` VARCHAR(255),
        IN `p_avatar_url` VARCHAR(255), 
        IN `p_is_active` VARCHAR(255)
)
BEGIN
UPDATE _users 
SET name = p_name,
    email = p_email,
    avatar_url = p_avatar_url,
    is_active = p_is_active 
WHERE (id = p_id);
SELECT ROW_COUNT() AS rowCount, LAST_INSERT_ID() AS lastInsertId;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_users_delete`(IN `p_id` INT)
BEGIN
DELETE FROM _users
WHERE (id = p_id)
LIMIT 1;
SELECT ROW_COUNT() AS rowCount;
END$$
DELIMITER ;

SELECT 1;
