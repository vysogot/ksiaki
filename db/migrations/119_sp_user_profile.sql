DROP PROCEDURE IF EXISTS sp_user_profile;

DELIMITER //
CREATE PROCEDURE `sp_user_profile`(IN `p_nick` VARCHAR(50))
BEGIN
SET @id = (SELECT CASE WHEN SUM(1) = 1 THEN id ELSE 0 END AS id FROM _users WHERE (nick = p_nick));
IF (@id != 0) THEN

	DROP TEMPORARY TABLE IF EXISTS tmp_ranking;
	
	CREATE TEMPORARY TABLE IF NOT EXISTS tmp_ranking ( place INT 
	, user_id INT
	, nick VARCHAR(50)
	, name VARCHAR(50)
	, points INT
	);
	
	CALL sp_rankings_periodic('12', NOW(), @id, 0, 10);
	
	SET @ranks_id = (SELECT MAX(id) FROM def_ranks WHERE (SELECT points FROM tmp_ranking) >= points_threshold);
	
	SELECT usr.id
	, usr.nick
	, usr.name
	, usr.email
	, IFNULL(usb.list_badge_id,'') AS list_badge_id
	, IFNULL(usb.badge_image_url,'') AS badge_image_url
	, IFNULL(usb.badge_title,'') AS badge_title
	, IFNULL(rnky.place,0) AS ranking_year
	, IFNULL(rnky.points,0) AS points
	, IFNULL(con.list_contest_id,0) AS list_contest_id
	, IFNULL(con.list_contest_name,'') AS list_contest_name
	, IFNULL(rang.image_url,'')  AS range_image_url
	, IFNULL(rang.title,'')  AS range_title
	, usr.created_at
	FROM _users AS usr
	LEFT JOIN tmp_ranking rnky ON (usr.id = rnky.user_id)
	LEFT JOIN
	(
	SELECT user_id
	, GROUP_CONCAT(distinct badge_id ORDER BY badge_id) AS list_badge_id
	, GROUP_CONCAT(distinct image_url ORDER BY badge_id) AS badge_image_url
	, GROUP_CONCAT(distinct title ORDER BY badge_id) AS badge_title
	FROM _user_badges
	INNER JOIN def_badges ON (badge_id = def_badges.id)
	GROUP BY user_id
	) AS usb ON (usr.id = usb.user_id)
	LEFT JOIN
	(
	SELECT user_id
	, GROUP_CONCAT(s.contest_id ORDER BY s.contest_id) AS list_contest_id
	, GROUP_CONCAT(c.name ORDER BY c.id) AS list_contest_name
	FROM score_contests AS s
	INNER JOIN _contests AS c ON (s.contest_id = c.id)
	GROUP BY user_id
	) AS con ON (usr.id = con.user_id)
	LEFT JOIN 
	(
	SELECT image_url, title FROM def_ranks WHERE (id = @ranks_id)  
	) AS rang ON (1=1)
	
	WHERE usr.id = @id;
	
	DROP TEMPORARY TABLE tmp_ranking;

END IF;
END//
DELIMITER ;

SELECT 1;
