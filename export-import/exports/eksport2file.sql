SELECT uid
, name
, mail
, FROM_UNIXTIME(created) 
FROM users 
WHERE (status = 1) 
AND (uid > 60000)
INTO OUTFILE 'e:/xampp/htdocs/ksiaki/export-import/importfiles/rgod-users-tmp.txt'
CHARACTER SET UTF8
FIELDS TERMINATED BY '|'
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

SELECT 1;
