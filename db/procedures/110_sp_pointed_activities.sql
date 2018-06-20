-- Zrzut struktury procedura sp_pointed_activities_create
DROP PROCEDURE IF EXISTS `sp_pointed_activities_create`;
DELIMITER //
CREATE PROCEDURE `sp_pointed_activities_create`(IN `p_user_id` INT, IN `p_activity_id` INT)
BEGIN
INSERT INTO score_pointed_activities(user_id, activity_id, points, given_at)
SELECT p_user_id
, id
, points
, NOW()
FROM def_pointed_activities
WHERE (id = p_activity_id);
END//
DELIMITER ;

-- Zrzut struktury procedura sp_pointed_activities_contest_participation
DROP PROCEDURE IF EXISTS `sp_pointed_activities_contest_participation`;
DELIMITER //
CREATE PROCEDURE `sp_pointed_activities_contest_participation`(IN `p_user_id` INT)
BEGIN
CALL sp_pointed_activities_create(p_user_id,4);
END//
DELIMITER ;


-- Zrzut struktury procedura sp_pointed_activities_invitation_login
DROP PROCEDURE IF EXISTS `sp_pointed_activities_invitation_login`;
DELIMITER //
CREATE PROCEDURE `sp_pointed_activities_invitation_login`(IN `p_user_id` INT)
BEGIN
CALL sp_pointed_activities_create(p_user_id,3);
END//
DELIMITER ;


-- Zrzut struktury procedura sp_pointed_activities_login
DROP PROCEDURE IF EXISTS `sp_pointed_activities_login`;
DELIMITER //
CREATE PROCEDURE `sp_pointed_activities_login`(IN `p_user_id` INT)
BEGIN
  SET @date_now = DATE(NOW());
  SET @login_count = (
  	SELECT COUNT(*) AS login_count
  	FROM score_pointed_activities
  	WHERE (user_id = p_user_id) AND (DATE(given_at) = @date_now)
  );

  IF (@login_count = 0) THEN
  	CALL sp_pointed_activities_create(p_user_id,2);
  END IF;
END//
DELIMITER ;


-- Zrzut struktury procedura sp_pointed_activities_personal_best_score_update
DROP PROCEDURE IF EXISTS `sp_pointed_activities_personal_best_score_update`;
DELIMITER //
CREATE PROCEDURE `sp_pointed_activities_personal_best_score_update`(IN `p_user_id` INT)
BEGIN
CALL sp_pointed_activities_create(p_user_id,5);
END//
DELIMITER ;


-- Zrzut struktury procedura sp_pointed_activities_registration
DROP PROCEDURE IF EXISTS `sp_pointed_activities_registration`;
DELIMITER //
CREATE PROCEDURE `sp_pointed_activities_registration`(IN `p_user_id` INT)
BEGIN
CALL sp_pointed_activities_create(p_user_id,1);
END//
DELIMITER ;

-- Zrzut struktury procedura sp_score_games_add_activities

DROP PROCEDURE IF EXISTS `sp_score_games_add_activities`;
DELIMITER //
CREATE PROCEDURE `sp_score_games_add_activities`(IN `p_user_id` INT, IN `p_contest_id` INT, IN `p_points_total` INT)
	LANGUAGE SQL
	NOT DETERMINISTIC
	CONTAINS SQL
	SQL SECURITY DEFINER
	COMMENT ''
BEGIN
SET @last_insert_participation = 0;
SET @last_insert_best_score = 0;

SET @user_exists = (
	SELECT CASE WHEN COUNT(*) = 0 THEN 0 ELSE user_id END AS user_id
	FROM score_games
	WHERE (user_id = p_user_id) AND (contest_id = p_contest_id)
	);

SET @current_points = (
	SELECT IFNULL(MAX(points_total),0)
	FROM score_games
	WHERE (user_id = p_user_id) AND (contest_id = p_contest_id)
	);

IF (@user_exists = 0) THEN
	CALL sp_pointed_activities_contest_participation(p_user_id);
	SET @last_insert_participation = (
        SELECT LAST_INSERT_ID()
    );
END IF;

IF (@current_points > 0) AND (p_points_total > @current_points) THEN
	CALL sp_pointed_activities_personal_best_score_update(p_user_id);
	SET @last_insert_best_score = (
        SELECT LAST_INSERT_ID()
    );

END IF;

SELECT SUM(points) AS points FROM score_pointed_activities WHERE id IN (@last_insert_participation, @last_insert_best_score );
END//
DELIMITER ;
