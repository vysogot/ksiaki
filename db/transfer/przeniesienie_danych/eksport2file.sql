SELECT uid
, name
, mail
, created 
FROM users 
WHERE (status = 1) 
AND (uid <= 100)
INTO OUTFILE 'rgod-users-tmp.txt'
FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n';
/*FIELDS TERMINATED BY '|' ENCLOSED BY '"' LINES TERMINATED BY '\n';*/
