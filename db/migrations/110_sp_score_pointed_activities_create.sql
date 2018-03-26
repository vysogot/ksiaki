DROP PROCEDURE IF EXISTS sp_score_pointed_activities_create;

DELIMITER $$
CREATE PROCEDURE `sp_score_pointed_activities_create`(IN `p_user_id` INT, IN `p_activity_id` INT)
	LANGUAGE SQL
	NOT DETERMINISTIC
	CONTAINS SQL
	SQL SECURITY DEFINER
	COMMENT ''
BEGIN
INSERT INTO score_pointed_activities(user_id, activity_id, points, given_at)
SELECT p_user_id
, id
, points
, NOW()
FROM def_pointed_activities
WHERE (id = p_activity_id);
SELECT ROW_COUNT() AS rowCount, LAST_INSERT_ID() AS lastInsertId;
END$$
DELIMITER ;

SELECT 1;