SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE old_score_total_by_month;

LOAD DATA LOCAL INFILE 'e:/xampp/htdocs/ksiaki_tmp/export_import/import_files/total_points-tmp-by-month.csv'
INTO TABLE old_score_total_by_month
CHARACTER SET UTF8
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 2 LINES
( user_id
, max_points
, given_at
);

SET @max := (SELECT MAX(id)+ 1 FROM old_score_total_by_month); 
SET @s = CONCAT('ALTER TABLE old_score_total_by_month AUTO_INCREMENT=', @max);
PREPARE stmt FROM @s;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET FOREIGN_KEY_CHECKS = 1;

SELECT 1;