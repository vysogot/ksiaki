SELECT id as uid
, name
, email as mail
, UNIX_TIMESTAMP(created_at) as created
FROM _users 
WHERE (is_active = 1) 
AND (id > 60000)
INTO OUTFILE '/var/www/ksiaki/export_import/import_files/users_export.txt'
CHARACTER SET UTF8
FIELDS TERMINATED BY '|'
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

SELECT 1;
