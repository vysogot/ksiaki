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
SELECT ROW_COUNT() AS rowCount, LAST_INSERT_ID() AS lastInsertId;
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
CALL sp_pointed_activities_create(p_user_id,2);
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

SELECT 1;