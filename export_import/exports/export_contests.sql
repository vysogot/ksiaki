select cid
, type
, TRIM(title) AS title
, FROM_UNIXTIME(start) AS start
, FROM_UNIXTIME(expire) AS expire
, game_mode
, TRIM(REPLACE(top_score, 'Najlepszy wynik: ', '')) AS top_score
from contest
where FROM_UNIXTIME(start) >= '2017-10-01' 
INTO OUTFILE 'e:/xampp/htdocs/ksiaki/export-import/importfiles/contests-tmp.txt'
CHARACTER SET UTF8
FIELDS TERMINATED BY '|'
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

SELECT 1;
