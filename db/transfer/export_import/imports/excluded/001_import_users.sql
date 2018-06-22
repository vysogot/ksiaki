SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE _users;

LOAD DATA LOCAL INFILE 'e:/xampp/htdocs/ksiaki_tmp/export_import/import_files/users-tmp.csv'
INTO TABLE _users
CHARACTER SET UTF8
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(id
, nick
, email
, name
, surname
, avatar_url
, created_at
,@dummy
,@dummy
,@dummy
,@dummy
,@dummy
,@dummy
,@dummy
,@dummy
,@dummy
,@dummy
,last_login_at
,is_active
);

SET @max := (SELECT MAX(id)+ 1 FROM _users); 
SET @s := CONCAT('ALTER TABLE _users AUTO_INCREMENT=', @max);
PREPARE stmt FROM @s;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET FOREIGN_KEY_CHECKS = 1;

SELECT 1;