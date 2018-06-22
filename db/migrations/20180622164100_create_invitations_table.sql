DELIMITER $$

DROP PROCEDURE IF EXISTS create_invitations_table $$

-- Create the stored procedure to perform the migration
CREATE PROCEDURE create_invitations_table()

BEGIN

SET @last_migration_at = (SELECT last_migration_at FROM schema_version);
SET @migration_timestamp = TIMESTAMP('2018-06-22 16:41:00');

IF (@last_migration_at < @migration_timestamp) THEN

    /*** BEGINING OF MIGRATION ***/

    CREATE TABLE `_invitations` (
      `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
      `user_id` int(10) unsigned NOT NULL,
      `email_to` varchar(255) NOT NULL,
      `created_at` timestamp NULL DEFAULT current_timestamp(),
      `last_clicked_at` int(10) DEFAULT 0,
      `new_user_id` int(10) unsigned DEFAULT NULL,
      `updated_at` DATETIME NULL DEFAULT NULL,
      `invitation_hash` varchar(255),
      PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Zaproszenia użytkowników';

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
CALL create_invitations_table() $$

-- Don't forget to drop the stored procedure when you're done!
DROP PROCEDURE IF EXISTS create_invitations_table $$

DELIMITER ;
