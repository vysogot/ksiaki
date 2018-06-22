select rpt.uid
, MAX(rpt.name) as name
, GROUP_CONCAT(distinct rpt.cid ORDER BY rpt.cid SEPARATOR ',') AS list_contest_id
, SUM(rpt.lp) as contest_count
from
(
select cp.uid
, u.name
, c.cid
, 1 AS lp

from contest_participant as cp
inner join contest as c on (cp.cid = c.cid)
inner join users as u on (cp.uid = u.uid)

/*where FROM_UNIXTIME(c.start) >= '2017-10-01' */
where (u.status = 1)
and (cp.finished > 0)
and UPPER(u.name) = 'EWELINA RATAJCZAK'
/*and (cp.uid = 21127)*/
GROUP BY  cp.uid
, c.cid
) as rpt
group by rpt.uid;