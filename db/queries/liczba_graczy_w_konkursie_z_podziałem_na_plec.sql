SELECT contest_id
, MAX(_contests.name) as contest_name
, SUM(case when _accounts.gender = 1 then 1 else 0 end) as "M"
, SUM(case when _accounts.gender = 2 then 1 else 0 end) as "K"
FROM (
SELECT distinct user_id, contest_id FROM
	(
	SELECT user_id
	, contest_id
	, MAX(points_total) AS points
	FROM score_games
	GROUP BY user_id, contest_id
	UNION ALL
	SELECT user_id
	, contest_id
	, max_points AS points
	FROM old_score_games
	) as rpt
) as score
inner join _accounts on (score.user_id = _accounts.user_id)
inner join _contests on (score.contest_id = _contests.id)
group by _contests.id
order by _contests.name