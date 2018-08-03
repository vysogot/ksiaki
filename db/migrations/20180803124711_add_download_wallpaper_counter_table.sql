DELIMITER $$

DROP PROCEDURE IF EXISTS add_download_wallpaper_counter_table $$

-- Create the stored procedure to perform the migration
CREATE PROCEDURE add_download_wallpaper_counter_table()

BEGIN

SET @last_migration_at = (SELECT last_migration_at FROM schema_version);
SET @migration_timestamp = TIMESTAMP('2018-08-03 12:47:11');

IF (@last_migration_at < @migration_timestamp) THEN

    /*** BEGINING OF MIGRATION ***/

    /* Licznik pobrań tapety */
    CREATE TABLE `download_wallpaper_counter` (
    	`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    	`wallpaper_id` INT(10) UNSIGNED NULL DEFAULT '0',
    	`counter` INT(10) UNSIGNED NULL DEFAULT '0',
    	`last_download_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    	PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Licznik pobrań tapety';

    /*** END OF MIGRATION ***/

    /***
        Leave the below unchanged, it bumbs the schema version
    ***/

    UPDATE schema_version
    SET last_migration_at = @migration_timestamp;

ELSE

    /* skipping file */
    SELECT 2;

END IF;

END $$

-- Execute the stored procedure
CALL add_download_wallpaper_counter_table() $$

-- Don't forget to drop the stored procedure when you're done!
DROP PROCEDURE IF EXISTS add_download_wallpaper_counter_table $$

DELIMITER ;