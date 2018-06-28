select rpt.uid
, GROUP_CONCAT(rpt.cid ORDER BY rpt.cid SEPARATOR ',') AS list_contest_id
, COUNT(rpt.cid) AS contests_count
from (
select distinct c.uid
, c.cid
from contest_participant as c
inner join users as u on (c.uid = u.uid)
where (u.status = 1)
and (c.finished > 0)
) as rpt
group by rpt.uid
order by rpt.uid;