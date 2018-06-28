select u.uid
, SUM(u.points) as points
, FROM_UNIXTIME(MAX(changed)) as changed
FROM userpoints_txn u
inner join users on ( u.uid = users.uid)
group by u.uid, MONTH(FROM_UNIXTIME(changed))
