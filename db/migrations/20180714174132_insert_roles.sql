DELIMITER $$

DROP PROCEDURE IF EXISTS insert_roles $$

-- Create the stored procedure to perform the migration
CREATE PROCEDURE insert_roles()

BEGIN

SET @last_migration_at = (SELECT last_migration_at FROM schema_version);
SET @migration_timestamp = TIMESTAMP('2018-07-14 17:41:32');

IF (@last_migration_at < @migration_timestamp) THEN

    /*** BEGINING OF MIGRATION ***/

    INSERT INTO `def_roles` (`id`, `name`) VALUES (1, 'Admin'), (2, 'Gracz'), (3, 'Edytor');

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
CALL insert_roles() $$

-- Don't forget to drop the stored procedure when you're done!
DROP PROCEDURE IF EXISTS insert_roles $$

DELIMITER ;