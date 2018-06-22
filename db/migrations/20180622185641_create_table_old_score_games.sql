DELIMITER $$

DROP PROCEDURE IF EXISTS adding_table_old_score_games $$

-- Create the stored procedure to perform the migration
CREATE PROCEDURE adding_table_old_score_games()

BEGIN

SET @last_migration_at = (SELECT last_migration_at FROM schema_version);
SET @migration_timestamp = TIMESTAMP('2018-06-22 18:56:41');

IF (@last_migration_at < @migration_timestamp) THEN

    /*** BEGINING OF MIGRATION ***/

    CREATE TABLE `old_score_games` (
    	`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    	`user_id` INT(10) UNSIGNED NULL DEFAULT '0',
    	`contest_id` INT(10) UNSIGNED NULL DEFAULT '0',
    	`max_points` INT(11) NULL DEFAULT '0',
    	`created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    	PRIMARY KEY (`id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Punkty za gry ze starych konkursiakow';

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
CALL adding_table_old_score_games() $$

-- Don't forget to drop the stored procedure when you're done!
DROP PROCEDURE IF EXISTS adding_table_old_score_games $$

DELIMITER ;