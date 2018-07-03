DROP PROCEDURE IF EXISTS sp_score_games_create;
DROP PROCEDURE IF EXISTS sp_score_games_all;
DROP PROCEDURE IF EXISTS sp_score_games_all_count;
DROP PROCEDURE IF EXISTS sp_score_games_all_client_side;
DROP PROCEDURE IF EXISTS sp_score_games_find_max_by_contest_and_user_id;

DELIMITER $$
CREATE PROCEDURE `sp_score_games_find_max_by_contest_and_user_id`(
    IN `p_contest_id` INT
    , IN `p_user_id` INT
)
BEGIN
    SELECT IFNULL(MAX(rpt.points),0) AS points
    FROM (
      SELECT user_id
      , contest_id
      , MAX(points_total) AS points
      FROM score_games
      WHERE (contest_id = p_contest_id) AND (user_id = p_user_id)
      GROUP BY user_id, contest_id
      UNION ALL
      SELECT user_id, contest_id, max_points AS points
      FROM old_score_games WHERE (contest_id = p_contest_id) AND (user_id = p_user_id)
    ) AS rpt;
END$$
DELIMITER ;

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

DELIMITER $$
CREATE PROCEDURE `sp_score_games_all_client_side` ()
BEGIN

    SELECT score_games.id AS id
    , _users.nick AS nick
    , _contests.name AS contest_name
    , level
    , score_games.begins_at AS begins_at
    , score_games.ends_at AS ends_at
    , win
    , points
    , points_total
    , checknumber_client
    , checknumber_server
    , IFNULL(checknumber_client != checknumber_server, 0) AS is_suspected
     FROM score_games
     LEFT JOIN _users ON score_games.user_id = _users.id
     LEFT JOIN _contests ON score_games.contest_id = _contests.id
     ORDER BY is_suspected DESC, score_games.id DESC;

END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_score_games_all` (
    IN `p_offset` INT
    , IN `p_limit` INT
    , IN `p_search` VARCHAR(50)
    , in `p_ordercolumn` VARCHAR(50)
    , in `p_orderdir` VARCHAR(50)
)
BEGIN
	 SET @search =
	 	CASE WHEN LOCATE('%', p_search) = 0 THEN CONCAT('%', UPPER(p_search), '%')
		ELSE UPPER(p_search) END;

    SELECT score_games.id AS id
    , _users.nick AS nick
    , _contests.name AS contest_name
    , level
    , score_games.begins_at
    , SEC_TO_TIME(TIME_TO_SEC(TIMEDIFF(score_games.ends_at, score_games.begins_at))) AS game_duration
    , win
    , points
    , points_total
    , IFNULL(checknumber_client != checknumber_server, 0) AS is_suspected
   FROM score_games
     INNER JOIN _users ON score_games.user_id = _users.id
     INNER JOIN _contests ON score_games.contest_id = _contests.id
    WHERE ( (UPPER(nick) LIKE @search)
     OR (UPPER(_contests.name) LIKE @search)
     OR (score_games.points_total LIKE @search)
    )

	 ORDER BY

   CASE WHEN p_ordercolumn = 'id' AND p_orderdir = 'desc' THEN score_games.id END DESC,
   CASE WHEN p_ordercolumn = 'id' THEN score_games.id END,

   CASE	WHEN p_ordercolumn = 'nick' AND p_orderdir = 'desc' THEN UPPER(nick) END DESC,
   CASE	WHEN p_ordercolumn = 'nick' THEN UPPER(nick) END,

   CASE	WHEN p_ordercolumn = 'contest_name' AND p_orderdir = 'desc' THEN UPPER(_contests.name) END DESC,
   CASE	WHEN p_ordercolumn = 'contest_name' THEN UPPER(_contests.name) END,

   CASE WHEN p_ordercolumn = '' THEN score_games.id END DESC

   LIMIT p_limit
   OFFSET p_offset;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_score_games_all_count`(IN `p_search` VARCHAR(50))
BEGIN
	SET @search =
	 	CASE WHEN LOCATE('%', p_search) = 0 THEN CONCAT('%', UPPER(p_search), '%')
		ELSE UPPER(p_search) END;

	SET @recordsTotal = (SELECT SUM(1) FROM score_games);

	SELECT @recordsTotal AS recordsTotal
	, SUM(1) AS recordsFiltered
	FROM score_games
    INNER JOIN _users ON score_games.user_id = _users.id
    INNER JOIN _contests ON score_games.contest_id = _contests.id
    WHERE ( (UPPER(_users.nick) LIKE @search)
      OR (UPPER(_contests.name) LIKE @search)
      OR (score_games.points_total LIKE @search)
    );
END$$
DELIMITER ;
