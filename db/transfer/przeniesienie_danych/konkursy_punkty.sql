select cp.uid
, cp.cid 
, MAX(c.title) AS title
, MAX(ctype) AS type
, FROM_UNIXTIME(max(cp.changed)) as ostatni
, MAX(cpc.result) as result
, FROM_UNIXTIME(c.start) as contest_start
, FROM_UNIXTIME(c.expire) as contest_expire
, FROM_UNIXTIME(cp.start) as user_joined
, FROM_UNIXTIME(cp.changed) as user_changed 
from contest_participant as cp
inner join contest as c on (cp.cid = c.cid)
inner join contest_pacman as cpc on (cp.pid = cpc.pid)
where FROM_UNIXTIME(c.expire) <= NOW()
and (cp.uid = 9214 ) 

group by cp.uid, cp.cid
order by FROM_UNIXTIME(max(cp.changed)) DESC
limit 10;

puzzle
pacman
bubbles
memo
mahjong
stones
arkanoid

select rpt.uid
, rpt.cid
, MAX(rpt.result) as max_points
from
(
select cp.uid
  , cp.cid
  , cpc.result 
from contest_participant as cp
inner join contest_puzzle as cpc on (cp.pid = cpc.pid)
where (cp.status = 2)
union all
select cp.uid
  , cp.cid
  , cpc.result 
from contest_participant as cp
inner join contest_pacman as cpc on (cp.pid = cpc.pid) 
where (cp.status = 2)
union all
select cp.uid
  , cp.cid 
  , cpc.result
from contest_participant as cp
inner join contest_bubbles as cpc on (cp.pid = cpc.pid)
where (cp.status = 2)
union all
select cp.uid
  , cp.cid 
  , MIN(cpc.time)
from contest_participant as cp
inner join contest_memo as cpc on (cp.pid = cpc.pid)
where (cp.status = 2)
group by cp.uid, cp.cid
union all
select cp.uid
  , cp.cid 
  , cpc.result
from contest_participant as cp
inner join contest_mahjong as cpc on (cp.pid = cpc.pid)
where (cp.status = 2)
union all
select cp.uid
  , cp.cid
  , cpc.result 
from contest_participant as cp
inner join contest_stones as cpc on (cp.pid = cpc.pid)
where (cp.status = 2)
union all
select cp.uid
  , cp.cid 
  , cpc.result
from contest_participant as cp
inner join contest_arkanoid as cpc on (cp.pid = cpc.pid)
where (cp.status = 2)
) as rpt
group by rpt.uid
, rpt.cid;
