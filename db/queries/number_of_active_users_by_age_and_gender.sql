SELECT rpt.age
, SUM(1) AS count_all
, SUM(CASE WHEN rpt.gender = 1 THEN 1 ELSE 0 END) AS "M"
, SUM(CASE WHEN rpt.gender = 2 THEN 1 ELSE 0 END) AS "K"
FROM (
SELECT a.gender
, YEAR(CURDATE()) - YEAR(birthday) - IF(STR_TO_DATE(CONCAT(YEAR(CURDATE()), '-', MONTH(birthday), '-', DAY(birthday)),'%Y-%c-%e') > CURDATE(), 1, 0) AS age
FROM _accounts AS a
INNER JOIN _users AS u ON a.user_id = u.id
WHERE (u.is_active = 1)
) AS rpt
GROUP BY rpt.age
ORDER BY rpt.age