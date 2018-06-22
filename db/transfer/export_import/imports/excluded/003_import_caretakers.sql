SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE _caretakers;

LOAD DATA LOCAL INFILE 'e:/xampp/htdocs/ksiaki_tmp/export_import/import_files/users-tmp.csv'
INTO TABLE _caretakers
CHARACTER SET UTF8
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(user_id
, @dummy
, @dummy
, @dummy
, @dummy
, @dummy
, created_at
, @dummy
, @dummy
, @dummy
, @dummy
, @dummy
, @dummy

, name
, surname
, email
, @dummy
, @dummy
, is_active
);

DELETE FROM _caretakers
WHERE (name = '') AND (surname = '') AND (email = '');

SET @max := (SELECT MAX(id)+ 1 FROM _caretakers); 
SET @s = CONCAT('ALTER TABLE _caretakers AUTO_INCREMENT=', @max);
PREPARE stmt FROM @s;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET FOREIGN_KEY_CHECKS = 1;

SELECT 1;