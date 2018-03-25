DROP PROCEDURE IF EXISTS sp_ranking;

DELIMITER $$
CREATE PROCEDURE `sp_ranking`(IN `p_interval` INT, IN `p_date_start` DATE)
	LANGUAGE SQL
	NOT DETERMINISTIC
	CONTAINS SQL
	SQL SECURITY DEFINER
	COMMENT ''
BEGIN
SET @interval:= p_interval;
SET @date_start = p_date_start;
/*SET @date_start = DATE_ADD(DATE_ADD(MAKEDATE(YEAR(NOW()), 1), INTERVAL MONTH(NOW())-1 MONTH), INTERVAL (1)-1 DAY);*/
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
END$$
DELIMITER ;

SELECT 1;