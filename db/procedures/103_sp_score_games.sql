DROP PROCEDURE IF EXISTS sp_score_games_create;
DROP PROCEDURE IF EXISTS sp_score_games_all;
DROP PROCEDURE IF EXISTS sp_score_games_all_count;

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

    SELECT score_games.id as id
    , _users.nick as nick
    , _contests.name as contest_name
    , level
    , score_games.begins_at as begins_at
    , score_games.ends_at as ends_at
    , win
    , points
    , points_total
    , checknumber_client
    , checknumber_server
	 FROM score_games
     LEFT JOIN _users ON score_games.user_id = _users.id
     LEFT JOIN _contests ON score_games.contest_id = _contests.id;
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

    SELECT score_games.id as id
    , _users.nick as nick
    , _contests.name as contest_name
    , level
    , score_games.begins_at as begins_at
    , score_games.ends_at as ends_at
    , win
    , points
    , points_total
    , checknumber_client
    , checknumber_server
	 FROM score_games
     LEFT JOIN _users ON score_games.user_id = _users.id
     LEFT JOIN _contests ON score_games.contest_id = _contests.id
   AND (
         (score_games.id = p_search)
		 OR (UPPER(nick) LIKE @search)
		 OR (UPPER(_contests.name) LIKE @search)
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
    LEFT JOIN _users ON score_games.user_id = _users.id
    LEFT JOIN _contests ON score_games.contest_id = _contests.id
    AND (
        (score_games.id = p_search)
		OR (UPPER(_users.nick) LIKE @search)
        OR (UPPER(_contests.name) LIKE @search)
    );
END$$
DELIMITER ;
