DELIMITER //

DROP PROCEDURE IF EXISTS sp_drop_index_if_exists //
CREATE PROCEDURE sp_drop_index_if_exists(in theTable varchar(128), in theIndexName varchar(128) )
BEGIN
 IF((SELECT COUNT(*) AS index_exists FROM information_schema.statistics 
 WHERE TABLE_SCHEMA = DATABASE() COLLATE utf8_general_ci
 AND table_name = theTable COLLATE utf8_general_ci
 AND index_name = theIndexName COLLATE utf8_general_ci) > 0) THEN
   SET @s = CONCAT('DROP INDEX ' , theIndexName , ' ON ' , theTable);
   PREPARE stmt FROM @s;
   EXECUTE stmt;
 END IF;
END //

DELIMITER ;