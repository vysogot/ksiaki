SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE old_user_contests;

LOAD DATA LOCAL INFILE 'e:/xampp/htdocs/ksiaki/export_import/import_files/user_contests-tmp.csv'
INTO TABLE old_user_contests
CHARACTER SET UTF8
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 2 LINES
( user_id
, contests_list
, contests_count
);

SET @max := (SELECT MAX(id)+ 1 FROM old_user_contests); 
SET @s = CONCAT('ALTER TABLE old_user_contests AUTO_INCREMENT=', @max);
PREPARE stmt FROM @s;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET FOREIGN_KEY_CHECKS = 1;

SELECT 1;