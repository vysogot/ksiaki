DELIMITER $$
CREATE PROCEDURE `sp_users_get`(IN `p_name_or_email` VARCHAR(50))
BEGIN
SELECT * FROM _users
WHERE (name = p_name_or_email OR email = p_name_or_email)
LIMIT 1;
END$$
DELIMITER ;
