DROP PROCEDURE IF EXISTS sp_user_login;
DROP PROCEDURE IF EXISTS sp_user_logout;

DELIMITER $$
CREATE PROCEDURE `sp_user_login`(
  IN `p_user_id` INT,
  IN `p_session_id` CHAR(32)
  )
  BEGIN
  
  SET @current = NOW();
  INSERT INTO _user_logins(user_id, session_id, login_at)
  VALUES(p_user_id, p_session_id, @current);
  
  SET @row_insert = (SELECT ROW_COUNT() AS rowCount);
  
  UPDATE _users
  SET last_login_at = @current
  WHERE (id = p_user_id);
  
  CALL sp_pointed_activities_login(p_user_id);
  
  SELECT @row_insert AS rowCount;
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
    WHERE (user_id = p_user_id) AND (session_id = p_session_id)
    LIMIT 1;
    SELECT ROW_COUNT() AS rowCount;
  END$$
DELIMITER ;
