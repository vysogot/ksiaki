DROP PROCEDURE IF EXISTS sp_user_profile;

DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_user_profile`(IN `p_id` INT)
BEGIN
CREATE TEMPORARY TABLE IF NOT EXISTS tmp_ranking ( place INT 
, user_id INT
, name VARCHAR(50)
, points INT
);

CALL sp_rankings_periodic('12', '2018-01-01', p_id, 0, 10);


SELECT usr.id
, usr.name
, usr.nick
, usr.email
, IFNULL(usb.list_badge_id,'') AS list_badge_id
, IFNULL(rnky.place,0) AS ranking_year
, IFNULL(rnky.points,0) AS points
, IFNULL(con.list_contest_id,0) AS list_contest_id
, usr.created_at
FROM _users AS usr
LEFT JOIN tmp_ranking rnky ON (usr.id = rnky.user_id)
LEFT JOIN
(
SELECT user_id
, GROUP_CONCAT(distinct badge_id ORDER BY badge_id) AS list_badge_id
FROM _user_badges
GROUP BY user_id
) AS usb ON (usr.id = usb.user_id)
LEFT JOIN
(
SELECT user_id
, GROUP_CONCAT(s.contest_id ORDER BY s.contest_id) AS list_contest_id
FROM score_contests AS s
GROUP BY user_id
) AS con ON (usr.id = con.user_id)
WHERE usr.id = p_id;

DROP TEMPORARY TABLE tmp_ranking;
END//
DELIMITER ;

SELECT 1;
