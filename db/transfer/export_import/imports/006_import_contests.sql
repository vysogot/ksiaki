SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE old_contests;

LOAD DATA LOCAL INFILE 'e:/xampp/htdocs/ksiaki_tmp/export_import/import_files/contests-tmp.csv'
INTO TABLE old_contests
CHARACTER SET UTF8
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 2 LINES
( cid
, type
, title
, start
, expire
, game_mode
, top_score
);

SET @max := (SELECT MAX(id)+ 1 FROM old_contests); 
SET @s = CONCAT('ALTER TABLE old_contests AUTO_INCREMENT=', @max);
PREPARE stmt FROM @s;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET FOREIGN_KEY_CHECKS = 1;

SELECT 1;