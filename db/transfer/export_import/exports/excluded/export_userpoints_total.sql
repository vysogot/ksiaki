SELECT t.uid
, points
, max_points
, FROM_UNIXTIME(last_update) 
FROM userpoints_total AS t
INNER JOIN users AS u ON (t.uid = u.uid)
WHERE (u.status = 1) 
INTO OUTFILE 'e:/xampp/htdocs/ksiaki/export_import/import_files/userpoints_total-tmp.txt'
CHARACTER SET UTF8
FIELDS TERMINATED BY '|'
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

SELECT 1;
