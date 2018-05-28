DROP PROCEDURE IF EXISTS sp_users_badges_all;

DELIMITER $$
CREATE PROCEDURE `sp_users_badges_all`()
	LANGUAGE SQL
	NOT DETERMINISTIC
	CONTAINS SQL
	SQL SECURITY DEFINER
	COMMENT ''
BEGIN
SELECT usr.id
, usr.name
, IFNULL(rpt.badge_id,'') AS list_badge_id
, IFNULL(rpt.badge_count,'') AS list_badge_count
, IFNULL(rpt.badge_last_given_at,'') AS list_badge_last_given_at
, IFNULL(rpt.badge_title,'') AS list_badge_title
, IFNULL(rpt.badge_image_url,'') AS list_badge_image_url
FROM _users AS usr
LEFT JOIN
(
SELECT usb.user_id
, GROUP_CONCAT(usb.badge_id
ORDER BY usb.badge_id) AS badge_id
, GROUP_CONCAT(usb.badge_count
ORDER BY usb.badge_id) AS badge_count
, GROUP_CONCAT(usb.last_given_at
ORDER BY usb.badge_id) AS badge_last_given_at
, GROUP_CONCAT(def_badges.title
ORDER BY usb.badge_id) AS badge_title
, GROUP_CONCAT(def_badges.image_url
ORDER BY usb.badge_id) AS badge_image_url
FROM (
SELECT user_id
, badge_id
, SUM(1) AS badge_count
, CAST(MAX(given_at) AS DATE) AS last_given_at
FROM _user_badges
GROUP BY user_id, badge_id
) AS usb
LEFT JOIN def_badges ON (usb.badge_id = def_badges.id)
GROUP BY usb.user_id
) AS rpt ON (usr.id = rpt.user_id);
END$$
DELIMITER ;

SELECT 1;
