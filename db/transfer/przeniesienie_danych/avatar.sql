select u.uid
, u.name
, u.picture
, f.filename
, f.uri
, f.filemime
from users as u
inner join file_managed as f on (u.picture = f.fid)
where u.uid = 21127;

select u.uid
, u.name
, u.mail
, FROM_UNIXTIME(created) AS created
, f.filename
from users as u
inner join file_managed as f on (u.picture = f.fid)
where (u.status = 1)
limit 50;