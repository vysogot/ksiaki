ALTER TABLE _users ADD INDEX (avatar_url);

CREATE TEMPORARY TABLE IF NOT EXISTS tmp_avatar ( old_avatar VARCHAR(100), new_avatar VARCHAR(100));


LOAD DATA LOCAL INFILE 'e:/xampp/htdocs/ksiaki_tmp/export_import/import_files/avatars-tmp.txt'
INTO TABLE tmp_avatar
CHARACTER SET UTF8
FIELDS TERMINATED BY ' '
LINES TERMINATED BY '\n'
(old_avatar, new_avatar);



UPDATE _users
INNER JOIN tmp_avatar ON (avatar_url = old_avatar) 
SET avatar_url = CONCAT('/uploads/users/avatars/', new_avatar)
WHERE avatar_url != '';


DROP TEMPORARY TABLE tmp_avatar;