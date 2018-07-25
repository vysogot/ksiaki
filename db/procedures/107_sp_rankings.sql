DROP PROCEDURE IF EXISTS `sp_rankings_contest`;
DROP PROCEDURE IF EXISTS `sp_rankings_monthly`;
DROP PROCEDURE IF EXISTS `sp_rankings_monthly_find_by_nick`;
DROP PROCEDURE IF EXISTS `sp_rankings_periodic`;
DROP PROCEDURE IF EXISTS `sp_rankings_score_games`;
DROP PROCEDURE IF EXISTS `sp_rankings_yearly`;
DROP PROCEDURE IF EXISTS `sp_rankings_yearly_find_by_nick`;

DELIMITER $$
CREATE PROCEDURE `sp_rankings_contest`(
    IN `p_contest_id` INT,
    IN `p_offset` INT,
    IN `p_limit` INT
)
BEGIN

SELECT place
       , user_id
       , nick
       , points
FROM   (SELECT @rank := @rank + 1 AS place,
               user_id,
               nick,
               points
        FROM   (SELECT  user_id,
                        nick,
                        MAX(points) as points
                                FROM    (SELECT score_games.user_id,
                                _users.nick,
                               Max(score_games.points_total) AS points
                        FROM   score_games
                               INNER JOIN _users
                                       ON _users.id = score_games.user_id
                        WHERE  score_games.contest_id = p_contest_id
                               AND _users.is_active
                               AND score_games.is_rankable
                        GROUP  BY user_id
                        UNION ALL
                                SELECT user_id, nick, max_points AS points
                                FROM old_score_games
                                INNER JOIN _users
                                       ON _users.id = old_score_games.user_id
                                WHERE contest_id = p_contest_id
                        ) as withOld
                GROUP  BY user_id
                ORDER  BY MAX(points) DESC
        ) t3,
        (SELECT @rank := 0) t2
) AS t1

WHERE (place BETWEEN p_offset + 1 AND p_offset + p_limit );

END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_rankings_monthly`(
    IN `p_date` DATE,
    IN `p_offset` INT,
    IN `p_limit` INT
)

BEGIN

DROP TEMPORARY TABLE IF EXISTS tmp_ranking;

CREATE TEMPORARY TABLE tmp_ranking (
    place INT
    , user_id INT
    , nick VARCHAR(50)
    , points INT
);

CALL sp_rankings_periodic('1', p_date, 0, p_offset, p_limit);

SELECT place, nick, points FROM tmp_ranking;

DROP TEMPORARY TABLE tmp_ranking;

END$$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE `sp_rankings_yearly`(
    IN `p_date` DATE,
    IN `p_offset` INT,
    IN `p_limit` INT

)
BEGIN

DROP TEMPORARY TABLE IF EXISTS tmp_ranking;

CREATE TEMPORARY TABLE tmp_ranking (
    place INT
    , user_id INT
    , nick VARCHAR(50)
    , points INT
);

CALL sp_rankings_periodic('12', p_date, 0, p_offset, p_limit);

SELECT place, nick, points FROM tmp_ranking;

DROP TEMPORARY TABLE tmp_ranking;

END$$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE `sp_rankings_periodic`(
    IN `p_interval` INT,
    IN `p_date` DATE,
    IN `p_id` INT,
    IN `p_offset` INT,
    IN `p_limit` INT
)

BEGIN

SET @inter_val   = p_interval;
SET @date_start  = p_date;
SET @offset_rows = p_offset + 1;
SET @limit_rows  = p_limit;

SET @date_start = CASE
    WHEN    (@inter_val = 12)
    THEN    DATE_ADD(
                DATE_ADD(
                    MAKEDATE(YEAR(@date_start) - 1, 1),
                INTERVAL 9 MONTH),
            INTERVAL (1) - 1 DAY)
    ELSE @date_start
END;

SET @date_end = LAST_DAY(DATE_ADD(@date_start, INTERVAL @inter_val - 1 MONTH));
SET @row_number = 0;

INSERT INTO tmp_ranking
SELECT  place
        , user_id
        , nick
        , points
FROM    (SELECT (@rank := @rank + 1) AS place
                , user_id
                , points
        FROM (  SELECT  user_id
                        , SUM(points) AS points
                FROM (
                        SELECT 1 AS point_type
                            , user_id
                            , points
                        FROM score_contests
                        WHERE (CAST(given_at AS DATE) BETWEEN @date_start AND @date_end)

                        UNION ALL

                        SELECT 2 AS point_type
                            , user_id
                            , points
                        FROM score_pointed_activities
                        WHERE (CAST(given_at AS DATE) BETWEEN @date_start AND @date_end)

                        UNION ALL

                        SELECT 3 AS point_type
                            , user_id
                            , CASE WHEN p_interval = 12 THEN max_points ELSE 0 END
                        FROM old_score_total
                        WHERE (1 = (CASE WHEN p_interval = 12 THEN 1 ELSE 0 END))

                        UNION ALL

                        SELECT 4 AS point_type
                            , user_id
                            , CASE WHEN p_interval = 12 THEN 0 ELSE max_points END max_points
                        FROM old_score_total_by_month
                        WHERE (1 = (CASE WHEN p_interval = 12 THEN 0 ELSE 1 END))
                        AND (CAST(given_at AS DATE) BETWEEN @date_start AND @date_end)
                ) AS rzm

                INNER JOIN _users ON _users.id = user_id

        GROUP BY user_id
        ORDER BY SUM(points) DESC

    ) AS t3,

    (SELECT @rank := 0) t2

) AS t1

INNER JOIN _users ON user_id = _users.id
WHERE
    CASE WHEN (p_id = 0)
    THEN (place BETWEEN @offset_rows AND @limit_rows)
    ELSE _users.id = p_id
    END
AND _users.is_active
ORDER BY place ASC;

END$$
DELIMITER ;
