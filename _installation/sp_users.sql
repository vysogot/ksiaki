DELIMITER $$
CREATE PROCEDURE `sp_users_get`(IN `p_name_or_email` VARCHAR(50))
BEGIN
SELECT * FROM _users
WHERE (name = p_name_or_email OR email = p_name_or_email)
LIMIT 1;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_users_set`(
	IN `p_id` INT,
	IN `p_name` VARCHAR(50),
	IN `p_password_hash` VARCHAR(255)
)
BEGIN
IF (p_id = 0) THEN
	INSERT INTO _users(p_name) VALUES('');
END IF;
UPDATE _users
SET name = p_name,
    password_hash = p_password_hash
WHERE (id = CASE WHEN (p_id = 0) THEN  LAST_INSERT_ID() ELSE p_id END);
SELECT ROW_COUNT() AS rowCount, LAST_INSERT_ID() AS lastInsertId;
END$$
DELIMITER ;
