DROP PROCEDURE IF EXISTS sp_users_badges_fan_create;

DELIMITER $$
CREATE PROCEDURE `sp_users_badges_fan_create`(IN `p_user_id` INT)
	LANGUAGE SQL
	NOT DETERMINISTIC
	CONTAINS SQL
	SQL SECURITY DEFINER
	COMMENT ''
BEGIN
SET @p_year := YEAR(NOW());
SET @p_month := MONTH(NOW());
SET @activity_id = 2;
SET @badge_id = 3;
SET @given_at = NOW();
SET @gap_diff = 2;

DROP TEMPORARY TABLE IF EXISTS loginusers1;
DROP TEMPORARY TABLE IF EXISTS loginusers2;
DROP TEMPORARY TABLE IF EXISTS loginusersgaps;

CREATE TEMPORARY TABLE loginusers1
SELECT DISTINCT user_id
, CAST(given_at AS DATE) AS given_at
FROM score_pointed_activities
WHERE (activity_id = @activity_id)
AND (YEAR(given_at) = @p_year)
AND (MONTH(given_at) = @p_month)
AND (user_id = CASE WHEN (p_user_id = 0) THEN user_id ELSE p_user_id END)
AND (p_user_id NOT IN (SELECT user_id FROM user_badges WHERE (YEAR(given_at) = @p_year) AND (MONTH(given_at) = @p_month) AND (badge_id = @badge_id)));

CREATE TEMPORARY TABLE loginusers2
SELECT *
FROM loginusers1;

CREATE TEMPORARY TABLE loginusersgaps
SELECT user_id
, a AS id
, b AS next_id
, CASE WHEN (DATEDIFF(b, a) = 0) THEN 1 ELSE DATEDIFF(b, a) END AS gap
FROM
 (
SELECT a1.user_id
, a1.given_at AS a
, IFNULL(MIN(a2.given_at), a1.given_at) AS b
FROM loginusers1 AS a1
LEFT JOIN loginusers2 AS a2 ON (a2.user_id = a1.user_id) AND (a2.given_at > a1.given_at)
GROUP BY a1.user_id, a1.given_at
) AS tab;

SET @row_number = 0;
INSERT INTO user_badges(user_id, badge_id, given_at)
SELECT DISTINCT user_id
, @badge_id
, @given_at
FROM (
SELECT @row_number:= CASE WHEN (@user_id = user_id) AND (@gap = gap) THEN @row_number + 1 ELSE 1 END AS num
, @user_id := user_id AS user_id
, id
, next_id
, @gap := gap AS gap
FROM loginusersgaps
) AS rpt
INNER JOIN _users ON (user_id = _users.id)
WHERE (num >= @gap_diff);

SELECT CASE WHEN @row_number >= @gap_diff THEN 1 ELSE 0 END AS result
, ROW_COUNT() AS rowCount;
END$$
DELIMITER ;
