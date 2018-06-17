DROP PROCEDURE IF EXISTS sp_contests_ending;

DELIMITER $$
CREATE PROCEDURE `sp_contests_ending`(IN `p_contest_id` INT
	, IN `p_user_id` INT)
	LANGUAGE SQL
	NOT DETERMINISTIC
	CONTAINS SQL
	SQL SECURITY DEFINER
	COMMENT ''
BEGIN
SET @row_number = 0;

DROP TABLE IF EXISTS top100users;

CREATE TEMPORARY TABLE top100users
SELECT (@row_number:=@row_number + 1) AS place
, user_id
, contest_id
, contest_type_id
, points
FROM (
SELECT user_id
, MAX(contest_id) AS contest_id
, MAX(_contests.contest_type_id) AS contest_type_id
, MAX(points_total) AS points
FROM score_games
INNER JOIN _contests ON (score_games.contest_id = _contests.id)
WHERE (contest_id = p_contest_id)
GROUP BY user_id
ORDER BY MAX(points_total) DESC
LIMIT 200
) AS rpt;

DELETE FROM score_contests WHERE (contest_id = p_contest_id);

INSERT INTO score_contests(user_id, contest_id, place, points, given_at)
SELECT top100users.user_id
, top100users.contest_id
, top100users.place
, def_contest_places.points as points
, NOW() as given_at
FROM top100users
INNER JOIN def_contest_places ON (top100users.contest_type_id = def_contest_places.contest_type_id)
AND (top100users.place = def_contest_places.place);

UPDATE _contests
SET is_active = 0
, is_ended = 1
, updated_at = NOW()
, updated_by = p_user_id
WHERE (id = p_contest_id);

CALL sp_contests_find(p_contest_id);


END$$
DELIMITER ;
