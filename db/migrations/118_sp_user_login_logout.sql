DROP PROCEDURE IF EXISTS sp_user_login;
DROP PROCEDURE IF EXISTS sp_user_logout;

DELIMITER $$
CREATE PROCEDURE `sp_user_login`(
  IN `p_user_id` INT,
  IN `p_session_id` CHAR(32)
  )
  BEGIN
    INSERT INTO _user_logins(user_id, session_id)
    VALUES(p_user_id, p_session_id);
    CALL sp_pointed_activities_login(p_user_id);
  END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_user_logout`(
  IN `p_user_id` INT,
  IN `p_session_id` CHAR(32)
  )
  BEGIN
    UPDATE _user_logins
    SET logout_at = NOW()
    WHERE (user_id = p_user_id) AND (p_session_id = p_session_id)
    LIMIT 1;
  END$$
DELIMITER ;

SELECT 1;
