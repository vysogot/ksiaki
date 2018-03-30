DROP PROCEDURE IF EXISTS `sp_ranking`;
DELIMITER //
CREATE PROCEDURE `sp_ranking`(IN `p_interval` INT, IN `p_date` DATE)
BEGIN
SET @interval:= p_interval;
SET @date_start = p_date;

SET @date_start = CASE WHEN (@interval=12) THEN DATE_ADD(DATE_ADD(MAKEDATE(YEAR(@date_start), 1), INTERVAL 9 MONTH), INTERVAL (1)-1 DAY) ELSE @date_start END;
SET @date_end = LAST_DAY(DATE_ADD(@date_start, INTERVAL @interval-1 MONTH));
SET @row_number = 0;

SELECT (@row_number:=@row_number + 1) AS place
, user_id
, name
, points
FROM (
SELECT user_id
, SUM(points) AS points
FROM score_contests
WHERE (given_at BETWEEN @date_start AND @date_end)
GROUP BY user_id
ORDER BY SUM(points) DESC
LIMIT 50
) AS rpt
INNER JOIN _users ON (user_id = id)
;
END//
DELIMITER ;


-- Zrzut struktury procedura ksiaki.sp_rankings_contest
DROP PROCEDURE IF EXISTS `sp_rankings_contest`;
DELIMITER //
CREATE PROCEDURE `sp_rankings_contest`(IN `p_contest_id` INT, IN `p_offset` INT, IN `p_limit` INT)
BEGIN
CALL sp_rankings_score_games('0', NULL, p_contest_id, '', p_offset, p_limit);
END//
DELIMITER ;


-- Zrzut struktury procedura ksiaki.sp_rankings_contest_find_by_username
DROP PROCEDURE IF EXISTS `sp_rankings_contest_find_by_username`;
DELIMITER //
CREATE PROCEDURE `sp_rankings_contest_find_by_username`(IN `p_contest_id` INT, IN `p_name` VARCHAR(50))
BEGIN
CALL sp_rankings_score_games('1', '', p_contest_id, p_name, 0, 10);
END//
DELIMITER ;


-- Zrzut struktury procedura ksiaki.sp_rankings_monthly
DROP PROCEDURE IF EXISTS `sp_rankings_monthly`;
DELIMITER //
CREATE PROCEDURE `sp_rankings_monthly`(IN `p_date` DATE, IN `p_offset` INT, IN `p_limit` INT)
BEGIN
CALL sp_rankings_score_games('1', p_date, 0, '', p_offset, p_limit);
END//
DELIMITER ;


-- Zrzut struktury procedura ksiaki.sp_rankings_monthly_find_by_username
DROP PROCEDURE IF EXISTS `sp_rankings_monthly_find_by_username`;
DELIMITER //
CREATE PROCEDURE `sp_rankings_monthly_find_by_username`(IN `p_date` DATE, IN `p_name` VARCHAR(50))
BEGIN
CALL sp_rankings_score_games('1', p_date, 0, p_name, 0, 10);
END//
DELIMITER ;


-- Zrzut struktury procedura ksiaki.sp_rankings_score_games
DROP PROCEDURE IF EXISTS `sp_rankings_score_games`;
DELIMITER //
CREATE PROCEDURE `sp_rankings_score_games`(IN `p_interval` INT, IN `p_date_start` DATE, IN `p_contest_id` INT, IN `p_name` VARCHAR(50), IN `p_offset` INT, IN `p_limit` INT)
BEGIN
SET @inter_val:= p_interval;
SET @date_start:= p_date_start;
SET @name:= p_name;
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
WHERE (place BETWEEN @offset_rows AND @limit_rows)
HAVING usr.name = CASE WHEN (@name = '') THEN usr.name ELSE @name END;
END//
DELIMITER ;


-- Zrzut struktury procedura ksiaki.sp_rankings_yearly
DROP PROCEDURE IF EXISTS `sp_rankings_yearly`;
DELIMITER //
CREATE PROCEDURE `sp_rankings_yearly`(IN `p_date` DATE, IN `p_offset` INT, IN `p_limit` INT)
BEGIN
CALL sp_rankings_score_games('12', p_date, 0, '', p_offset, p_limit);
END//
DELIMITER ;


-- Zrzut struktury procedura ksiaki.sp_rankings_yearly_find_by_username
DROP PROCEDURE IF EXISTS `sp_rankings_yearly_find_by_username`;
DELIMITER //
CREATE PROCEDURE `sp_rankings_yearly_find_by_username`(IN `p_date` DATE, IN `p_name` VARCHAR(50))
BEGIN
CALL sp_rankings_score_games('12', p_date, 0, p_name, 0, 10);
END//
DELIMITER ;

SELECT 1;
