select u.uid
, u.name
, t.points
, t.max_points 
, FROM_UNIXTIME(t.last_update) as last_update
from userpoints_total as t
inner join users as u on ( t.uid = u.uid)
where (u.status = 1);