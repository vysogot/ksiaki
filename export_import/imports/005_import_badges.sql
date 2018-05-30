SET FOREIGN_KEY_CHECKS = 0;

/*TRUNCATE TABLE _user_badges;*/

LOAD DATA LOCAL INFILE 'e:/xampp/htdocs/ksiaki/export_import/import_files/badges-tmp.csv'
REPLACE INTO TABLE _user_badges
CHARACTER SET UTF8
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 2 LINES
( user_id
, badge_id
)
SET given_at = NOW();

SET @max := (SELECT MAX(id)+ 1 FROM _user_badges); 
SET @s = CONCAT('ALTER TABLE _user_badges AUTO_INCREMENT=', @max);
PREPARE stmt FROM @s;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET FOREIGN_KEY_CHECKS = 1;

SELECT 1;