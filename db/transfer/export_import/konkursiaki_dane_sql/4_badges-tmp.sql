select u.uid
, u.bid
from user_badges_user as u
inner join user_badges_badges as b on (u.bid = b.bid)
inner join users as usr on (u.uid = usr.uid)
where (usr.status = 1)
and (u.type = 'user') 
and (b.weight = 2);