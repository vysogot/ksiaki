select u.uid
, u.bid
, u.type	
, b.name
, b.image
, b.weight
from user_badges_user as u
inner join user_badges_badges as b on (u.bid = b.bid)
where (u.type = 'user')
and u.uid = 21127;

select u.uid
, u.bid
from user_badges_user as u
inner join user_badges_badges as b on (u.bid = b.bid)
inner join users as usr on (u.uid = usr.uid)
where (usr.status = 1)
and (FROM_UNIXTIME(usr.login) >= '2018-05-01')
and (u.type = 'user') 
and (b.weight = 2)
order by u.uid;
/*and u.uid = 21127;*/


