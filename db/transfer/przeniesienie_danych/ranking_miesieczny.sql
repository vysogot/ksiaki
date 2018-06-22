select u.uid
, MONTH(FROM_UNIXTIME(changed)) as mc
, MAX(users.name) as name
, SUM(u.points) as points
, FROM_UNIXTIME(MAX(changed)) as changed

FROM userpoints_txn u
inner join users on ( u.uid = users.uid)

/*where u.uid = 21127*/
where MONTH(FROM_UNIXTIME(changed)) = 5
group by u.uid, MONTH(FROM_UNIXTIME(changed))

order by MONTH(FROM_UNIXTIME(changed)), SUM(u.points) desc
limit 50;