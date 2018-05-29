SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE _users;

LOAD DATA LOCAL INFILE 'e:/xampp/htdocs/ksiaki/export_import/import_files/users-tmp.csv'
INTO TABLE _users
CHARACTER SET UTF8
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 2 LINES
(id, nick, email, created_at);

SET @max := (SELECT MAX(id)+ 1 FROM _users); 
SET @s = CONCAT('ALTER TABLE _users AUTO_INCREMENT=', @max);
PREPARE stmt FROM @s;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET FOREIGN_KEY_CHECKS = 1;

SELECT 1;