select cp.uid
  , cp.cid
  , MAX(cpc.result) as max_points 
from contest_participant as cp
inner join contest_pacman as cpc on (cp.pid = cpc.pid) 
where (cp.status = 2)
and (cp.cid in (334, 333, 332, 331, 329))
group by cp.uid, cp.cid;