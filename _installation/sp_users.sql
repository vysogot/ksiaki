DELIMITER $$
CREATE PROCEDURE `sp_users_find_one_by_name_or_email` (IN `p_name_or_email` VARCHAR(255))
BEGIN
SELECT * FROM _users
WHERE (name = p_name_or_email OR email = p_name_or_email)
LIMIT 1;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_users_find_one_by_id` (IN `p_id` INT)
BEGIN
SELECT * FROM _users
WHERE (id = p_id)
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
	IN `p_name` VARCHAR(50),
	IN `p_password_hash` VARCHAR(255)
)
BEGIN
UPDATE _users
SET name = p_name,
    password_hash = p_password_hash
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
