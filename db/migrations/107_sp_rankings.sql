DROP PROCEDURE IF EXISTS `sp_rankings_contest`;
DROP PROCEDURE IF EXISTS `sp_rankings_contest_find_by_userid`;
DROP PROCEDURE IF EXISTS `sp_rankings_monthly`;
DROP PROCEDURE IF EXISTS `sp_rankings_monthly_find_by_userid`;
DROP PROCEDURE IF EXISTS `sp_rankings_periodic`;
DROP PROCEDURE IF EXISTS `sp_rankings_score_games`;
DROP PROCEDURE IF EXISTS `sp_rankings_yearly`;
DROP PROCEDURE IF EXISTS `sp_rankings_yearly_find_by_userid`;

DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_rankings_contest`(IN `p_contest_id` INT, IN `p_offset` INT, IN `p_limit` INT)
BEGIN
CALL sp_rankings_score_games('0', NULL, p_contest_id, 0, p_offset, p_limit);
END//
DELIMITER ;



DELIMITER //
CREATE PROCEDURE `sp_rankings_contest_find_by_userid`(IN `p_contest_id` INT, IN `p_id` INT)
BEGIN
CALL sp_rankings_score_games('1', '', p_contest_id, p_id, 0, 10);
END//
DELIMITER ;



DELIMITER //
CREATE PROCEDURE `sp_rankings_monthly`(IN `p_date` DATE, IN `p_offset` INT, IN `p_limit` INT)
BEGIN
CREATE TEMPORARY TABLE IF NOT EXISTS tmp_ranking ( place INT 
, user_id INT
, name VARCHAR(50)
, points INT
);

CALL sp_rankings_periodic('1', p_date, 0, p_offset, p_limit);

SELECT place, user_id, name, points FROM tmp_ranking;

DROP TEMPORARY TABLE tmp_ranking;
END//
DELIMITER ;



DELIMITER //
CREATE PROCEDURE `sp_rankings_monthly_find_by_userid`(IN `p_date` DATE, IN `p_id` INT)
BEGIN
CREATE TEMPORARY TABLE IF NOT EXISTS tmp_ranking ( place INT 
, user_id INT
, name VARCHAR(50)
, points INT
);

CALL sp_rankings_periodic('1', p_date, p_id, 0, 10);

SELECT place, user_id, name, points FROM tmp_ranking;

DROP TEMPORARY TABLE tmp_ranking;
END//
DELIMITER ;



DELIMITER //
CREATE PROCEDURE `sp_rankings_periodic`(IN `p_interval` INT, IN `p_date` DATE, IN `p_id` INT, IN `p_offset` INT, IN `p_limit` INT)
BEGIN
SET @inter_val:= p_interval;
SET @date_start = p_date;
SET @offset_rows:= p_offset + 1;
SET @limit_rows:= CASE WHEN (@name = '') THEN (p_limit + p_offset) ELSE 2000000 END;
SET @date_start = CASE WHEN (@inter_val=12) THEN DATE_ADD(DATE_ADD(MAKEDATE(YEAR(@date_start)-1, 1), INTERVAL 9 MONTH), INTERVAL (1)-1 DAY) ELSE @date_start END;
SET @date_end = LAST_DAY(DATE_ADD(@date_start, INTERVAL @inter_val-1 MONTH));
SET @row_number = 0;

INSERT INTO tmp_ranking
SELECT rnk.place
, rnk.user_id
, usr.name
, rnk.points
FROM (
SELECT (@row_number:=@row_number + 1) AS place
, user_id
, points
FROM (
SELECT user_id
, SUM(points) AS points
	FROM (
		SELECT 1 AS point_type, user_id, points FROM score_contests WHERE (CAST(given_at AS DATE) BETWEEN @date_start AND @date_end)
		UNION ALL
		SELECT 2 AS point_type, user_id, points FROM score_pointed_activities WHERE (CAST(given_at AS DATE) BETWEEN @date_start AND @date_end)
	) AS rzm
GROUP BY user_id
ORDER BY SUM(points) DESC
) AS rpt
) AS rnk
INNER JOIN _users AS usr ON (user_id = usr.id)
WHERE (place BETWEEN @offset_rows AND @limit_rows)
HAVING rnk.user_id = CASE WHEN (p_id = 0) THEN rnk.user_id ELSE p_id END
ORDER BY place ASC;
END//
DELIMITER ;



DELIMITER //
CREATE PROCEDURE `sp_rankings_score_games`(IN `p_interval` INT, IN `p_date_start` DATE, IN `p_contest_id` INT, IN `p_id` INT, IN `p_offset` INT, IN `p_limit` INT)
BEGIN
SET @inter_val:= p_interval;
SET @date_start:= p_date_start;
SET @contest_id:= p_contest_id;
SET @offset_rows:= p_offset + 1;
SET @limit_rows:= CASE WHEN (@name = '') THEN (p_limit + p_offset) ELSE 2000000 END;


SET @date_start =
	CASE
		WHEN (@inter_val=12) AND (@contest_id = 0) THEN DATE_ADD(DATE_ADD(MAKEDATE(YEAR(@date_start)-1, 1), INTERVAL 9 MONTH), INTERVAL (1)-1 DAY)
		WHEN (@contest_id != 0) THEN '2000-01-01'
		ELSE @date_start
	END;
SET @date_end =
	CASE
	WHEN (@contest_id != 0) THEN '2100-12-01'
	ELSE LAST_DAY(DATE_ADD(@date_start, INTERVAL @inter_val-1 MONTH))
	END;
SET @row_number = 0;

SELECT rnk.place
, rnk.user_id
, usr.name
, rnk.points
FROM _users AS usr
LEFT JOIN (
  SELECT (@row_number:=@row_number + 1) AS place
  , user_id
  , points
  FROM (
    SELECT user_id
    , SUM(points) AS points
    FROM (
      SELECT user_id
       	, contest_id
       	, MAX(points_total) AS points
      FROM score_games
      WHERE (ends_at BETWEEN @date_start AND @date_end)
		AND (contest_id = CASE WHEN (@contest_id = 0) THEN contest_id ELSE @contest_id END)
      GROUP BY user_id, contest_id
    ) AS rpt
    GROUP BY user_id
    ORDER BY SUM(points) DESC
  ) AS res
) AS rnk ON (rnk.user_id = usr.id)
WHERE (rnk.place BETWEEN @offset_rows AND @limit_rows)

HAVING rnk.user_id = CASE WHEN (p_id = 0) THEN rnk.user_id ELSE p_id END
ORDER BY place ASC;
END//
DELIMITER ;



DELIMITER //
CREATE PROCEDURE `sp_rankings_yearly`(IN `p_date` DATE, IN `p_offset` INT, IN `p_limit` INT)
BEGIN
CREATE TEMPORARY TABLE IF NOT EXISTS tmp_ranking ( place INT 
, user_id INT
, name VARCHAR(50)
, points INT
);

CALL sp_rankings_periodic('12', p_date, 0, 0, 10);

SELECT place, user_id, name, points FROM tmp_ranking;

DROP TEMPORARY TABLE tmp_ranking;

END//
DELIMITER ;



DELIMITER //
CREATE PROCEDURE `sp_rankings_yearly_find_by_userid`(IN `p_date` DATE, IN `p_id` VARCHAR(50))
BEGIN
CREATE TEMPORARY TABLE IF NOT EXISTS tmp_ranking ( place INT 
, user_id INT
, name VARCHAR(50)
, points INT
);

CALL sp_rankings_periodic('12', p_date, p_id, 0, 10);

SELECT place, user_id, name, points FROM tmp_ranking;

DROP TEMPORARY TABLE tmp_ranking;

END//
DELIMITER ;

SELECT 1;