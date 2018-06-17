DROP PROCEDURE IF EXISTS sp_score_games_create;

DELIMITER $$
CREATE PROCEDURE `sp_score_games_create`(
	IN `p_user_id` INT,
	IN `p_contest_id` INT,
	IN `p_level` INT,
	IN `p_begins_at` DATETIME,
	IN `p_ends_at` DATETIME,
    IN `p_win` INT,
	IN `p_points` INT,
	IN `p_points_total` INT,
    IN `p_checknumber_client` VARCHAR(255),
    IN `p_checknumber_server` VARCHAR(255)
)
BEGIN
	INSERT INTO score_games(
		user_id,
		contest_id,
		level,
		begins_at,
		ends_at,
        win,
		points,
		points_total,
        checknumber_client,
        checknumber_server
	) VALUES(
		p_user_id,
		p_contest_id,
		p_level,
		p_begins_at,
		p_ends_at,
        p_win,
		p_points,
		p_points_total,
        p_checknumber_client,
        p_checknumber_server
	);
SELECT ROW_COUNT() AS rowCount, LAST_INSERT_ID() AS lastInsertId;
END$$
DELIMITER ;
