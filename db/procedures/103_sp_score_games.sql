DROP PROCEDURE IF EXISTS sp_score_games_create;
DROP PROCEDURE IF EXISTS sp_score_games_all;
DROP PROCEDURE IF EXISTS sp_score_games_all_count;
DROP PROCEDURE IF EXISTS sp_score_games_all_client_side;
DROP PROCEDURE IF EXISTS sp_score_games_find_max_by_contest_and_user_id;
DROP PROCEDURE IF EXISTS sp_score_games_toggle_rankable;

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
    , score_games.level
    , score_games.begins_at
    , SEC_TO_TIME(TIME_TO_SEC(TIMEDIFF(score_games.ends_at, score_games.begins_at))) AS game_duration
    , score_games.win
    , CASE WHEN (score_games.points < 0) THEN 0 ELSE score_games.points END AS points
    , points_total
    , CASE WHEN (LENGTH(score_games.checknumber_client) = 6) THEN 0 ELSE IFNULL(score_games.checknumber_client != score_games.checknumber_server, 0) END AS is_suspected
    , is_rankable
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

   CASE WHEN p_ordercolumn = 'nick' AND p_orderdir = 'desc' THEN UPPER(nick) END DESC,
   CASE WHEN p_ordercolumn = 'nick' THEN UPPER(nick) END,

   CASE WHEN p_ordercolumn = 'contest_name' AND p_orderdir = 'desc' THEN UPPER(_contests.name) END DESC,
   CASE WHEN p_ordercolumn = 'contest_name' THEN UPPER(_contests.name) END,

   CASE WHEN p_ordercolumn = 'level' AND p_orderdir = 'desc' THEN score_games.level END DESC,
   CASE WHEN p_ordercolumn = 'level' THEN score_games.level END,

  CASE  WHEN p_ordercolumn = 'begins_at' AND p_orderdir = 'desc' THEN score_games.begins_at END DESC,
   CASE WHEN p_ordercolumn = 'begins_at' THEN score_games.begins_at END,

   CASE WHEN p_ordercolumn = 'game_duration' AND p_orderdir = 'desc' THEN TIME_TO_SEC(TIMEDIFF(score_games.ends_at, score_games.begins_at)) END DESC,
   CASE WHEN p_ordercolumn = 'game_duration' THEN TIME_TO_SEC(TIMEDIFF(score_games.ends_at, score_games.begins_at)) END,

   CASE WHEN p_ordercolumn = 'points' AND p_orderdir = 'desc' THEN score_games.points END DESC,
   CASE WHEN p_ordercolumn = 'points' THEN score_games.points END,

   CASE WHEN p_ordercolumn = 'points_total' AND p_orderdir = 'desc' THEN score_games.points_total END DESC,
   CASE WHEN p_ordercolumn = 'points_total' THEN score_games.points_total END,

   CASE WHEN p_ordercolumn = 'is_suspected' AND p_orderdir = 'desc' THEN is_suspected END DESC,
   CASE WHEN p_ordercolumn = 'is_suspected' THEN is_suspected END,

   CASE WHEN p_ordercolumn = 'is_rankable' AND p_orderdir = 'desc' THEN is_rankable END DESC,
   CASE WHEN p_ordercolumn = 'is_rankable' THEN is_rankable END,

   CASE WHEN p_ordercolumn = '' THEN is_suspected END DESC, score_games.id DESC

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

DELIMITER $$
CREATE PROCEDURE `sp_score_games_toggle_rankable`(
    IN `p_id` INT
)
BEGIN

    UPDATE score_games
    SET is_rankable = NOT is_rankable
    WHERE (id = p_id);

    SELECT ROW_COUNT() AS rowCount;

END$$
DELIMITER ;
