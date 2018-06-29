select g.id
, user_id
, contest_id
, `level`
, c.name
, u.nick as nick
, MAX(points_total) as points_total

, MIN(TIME_TO_SEC(TIMEDIFF(g.ends_at, g.begins_at))) as seconds

from score_games as g
inner join _users as u on (g.user_id = u.id)
inner join _contests as c on (g.contest_id = c.id)
group by  user_id, contest_id, `level`
order by user_id, contest_id,  `level`, MIN(TIME_TO_SEC(TIMEDIFF(g.ends_at, g.begins_at)))
limit 100;