SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE old_score_total;

LOAD DATA LOCAL INFILE 'e:/xampp/htdocs/ksiaki_tmp/export_import/import_files/total_points-tmp.csv'
INTO TABLE old_score_total
CHARACTER SET UTF8
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 2 LINES
( user_id
, @dummy
, points
, max_points
, given_at
);

SET @max := (SELECT MAX(id)+ 1 FROM old_score_total); 
SET @s = CONCAT('ALTER TABLE old_score_total AUTO_INCREMENT=', @max);
PREPARE stmt FROM @s;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET FOREIGN_KEY_CHECKS = 1;

SELECT 1;