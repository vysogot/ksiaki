DROP PROCEDURE IF EXISTS sp_user_profile;

DELIMITER $$
CREATE PROCEDURE `sp_user_profile`(
    IN `p_nick` VARCHAR(50)
)

BEGIN

SET @id =   (
                SELECT id
                FROM _users
                WHERE nick = p_nick
            );

IF (@id IS NOT NULL) THEN

    SET @dat = NOW();

    DROP TEMPORARY TABLE IF EXISTS tmp_ranking;

    CREATE TEMPORARY TABLE tmp_ranking (
        place INT
        , user_id INT
        , nick VARCHAR(50)
        , points INT
    );

    CALL sp_rankings_periodic('12', @dat, @id, 0, 10);

    SET @ranks_id = (
        SELECT  MAX(id) FROM def_ranks
        WHERE   (SELECT points FROM tmp_ranking) >= points_threshold);

    SELECT _users.id
        , _users.nick
        , _users.avatar_url
        , _users.email
        , _accounts.address
        , IFNULL(sub_badges.badge_ids, '') AS badge_ids
        , IFNULL(sub_badges.badge_image_urls, '') AS badge_image_urls
        , IFNULL(sub_badges.badge_titles, '') AS badge_titles
        , IFNULL(tmp_ranking.place, 0) AS ranking_year
        , IFNULL(tmp_ranking.points, 0) AS points
        , IFNULL(sub_contests.contest_ids, 0) AS contest_ids
        , IFNULL(sub_contests.contest_names, '') AS contest_names
        , IFNULL(sub_ranks.image_url, '')  AS rank_image_url
        , IFNULL(sub_ranks.title, '')  AS rank_title
        , _users.created_at
    FROM _users
    LEFT JOIN tmp_ranking   ON (_users.id = tmp_ranking.user_id)
    LEFT JOIN _accounts     ON (_users.id = _accounts.user_id)
    LEFT JOIN

        (
        SELECT  user_id
                , GROUP_CONCAT(distinct badge_id ORDER BY badge_id SEPARATOR ', ') AS badge_ids
                , GROUP_CONCAT(distinct image_url ORDER BY badge_id SEPARATOR ', ') AS badge_image_urls
                , GROUP_CONCAT(distinct title ORDER BY badge_id SEPARATOR ', ') AS badge_titles
        FROM _user_badges
        INNER JOIN def_badges ON (badge_id = def_badges.id)
        GROUP BY user_id
        ) AS sub_badges ON (_users.id = sub_badges.user_id)

    LEFT JOIN

        (
        SELECT  user_id

                , GROUP_CONCAT(score_contests.contest_id
                    ORDER BY score_contests.contest_id
                SEPARATOR ', ') AS contest_ids

                , GROUP_CONCAT(_contests.name
                    ORDER BY _contests.id
                SEPARATOR ', ') AS contest_names

        FROM score_contests
        INNER JOIN _contests ON (score_contests.contest_id = _contests.id)
        GROUP BY user_id
        ) AS sub_contests ON (_users.id = sub_contests.user_id)

    LEFT JOIN

        (
        SELECT image_url, title
        FROM def_ranks
        WHERE (id = @ranks_id)
        ) AS sub_ranks ON (1=1)

    WHERE _users.id = @id;

    DROP TEMPORARY TABLE tmp_ranking;

END IF;
END$$
DELIMITER ;
