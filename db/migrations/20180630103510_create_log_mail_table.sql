DELIMITER $$

DROP PROCEDURE IF EXISTS create_log_mail_table $$

-- Create the stored procedure to perform the migration
CREATE PROCEDURE create_log_mail_table()

BEGIN

SET @last_migration_at = (SELECT last_migration_at FROM schema_version);
SET @migration_timestamp = TIMESTAMP('2018-06-30 10:35:10');

IF (@last_migration_at < @migration_timestamp) THEN

    /*** BEGINING OF MIGRATION ***/

    CREATE TABLE `log_mail` (
        `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
        `email` varchar(255) NOT NULL,
        `subject` varchar(255) NOT NULL,
        `body` text NOT NULL,
        `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
        `created_by` INT(10) UNSIGNED NULL,
        PRIMARY KEY (`id`)
    ) COMMENT='Logowanie wysylki' COLLATE='utf8_general_ci' ENGINE=InnoDB;

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
CALL create_log_mail_table() $$

-- Don't forget to drop the stored procedure when you're done!
DROP PROCEDURE IF EXISTS create_log_mail_table $$

DELIMITER ;