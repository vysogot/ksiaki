DELIMITER $$

DROP PROCEDURE IF EXISTS create_table_old_score_total_by_month $$

-- Create the stored procedure to perform the migration
CREATE PROCEDURE create_table_old_score_total_by_month()

BEGIN

SET @last_migration_at = (SELECT last_migration_at FROM schema_version);
SET @migration_timestamp = TIMESTAMP('2018-06-26 17:23:13');

IF (@last_migration_at < @migration_timestamp) THEN

    /*** BEGINING OF MIGRATION ***/

    CREATE TABLE `old_score_total_by_month` (
    	`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    	`user_id` INT(10) UNSIGNED NULL DEFAULT '0',
    	`max_points` INT(11) NULL DEFAULT '0',
    	`given_at` DATETIME NULL DEFAULT NULL,
    	`created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    	PRIMARY KEY (`id`),
    	INDEX `idx_user_id` (`user_id`),
    	INDEX `idx_given_at` (`given_at`)
    ) COMMENT='Punkty ze starych konkursiakow' COLLATE='utf8_general_ci' ENGINE=InnoDB;

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
CALL create_table_old_score_total_by_month() $$

-- Don't forget to drop the stored procedure when you're done!
DROP PROCEDURE IF EXISTS create_table_old_score_total_by_month $$

DELIMITER ;