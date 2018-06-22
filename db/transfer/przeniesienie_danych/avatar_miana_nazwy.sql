select avatar_new
, sum(1)
from
(
select /*id
, nick
, trim(removeSpacialChar(bez_pl_diakrytycznych(nick))) as slug
, */
avatar_url as avatar_old
, CONCAT('konkursiak','-',LOWER(trim(removeSpacialChar(bez_pl_diakrytycznych(nick)))),'.',SUBSTRING_INDEX(avatar_url,'.',-1)) avatar_new 

from _users
where avatar_url != ''
/*
INTO OUTFILE 'e:/xampp/htdocs/ksiaki_tmp/export_import/import_files/avatars-tmp.txt'
CHARACTER SET UTF8
FIELDS TERMINATED BY ' '
ENCLOSED BY ''
LINES TERMINATED BY '\n';
*/

) as rpt
group by rpt.avatar_new
having sum(1) > 1
