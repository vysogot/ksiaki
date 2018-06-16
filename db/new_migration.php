<?php

date_default_timezone_set('Europe/Warsaw');

$migrations_dir = "db/migrations/";
$file_timestamp = date('YmdHis', time());
$db_timestamp = date('Y-m-d H:i:s', time());

$filename = '';
$procedure_name = '';

if (isset($argv[1])) {
    $procedure_name = $argv[1];
    $filename = $migrations_dir . $file_timestamp . '_' . $procedure_name . '.sql';
} else {
    echo "\nusage example: php db/new_migration.php adding_color_column_to_users\n\n";
    exit();
}


$template = <<<EOF
DELIMITER $$

DROP PROCEDURE IF EXISTS $procedure_name $$

-- Create the stored procedure to perform the migration
CREATE PROCEDURE $procedure_name()

BEGIN

SET @last_migration_at = (SELECT last_migration_at FROM schema_version);
SET @migration_timestamp = TIMESTAMP('$db_timestamp');

IF (@last_migration_at < @migration_timestamp) THEN

    /*** BEGINING OF MIGRATION ***/

    -- Put your SQL here

    /*** END OF MIGRATION ***/

    /***
        Leave the below unchanged, it bumbs the schema version
    ***/

    UPDATE schema_version
    SET last_migration_at = @migration_timestamp;

    SELECT 1;

ELSE

    /* skipping file */
    SELECT 2;

END IF;

END $$

-- Execute the stored procedure
CALL $procedure_name() $$

-- Don't forget to drop the stored procedure when you're done!
DROP PROCEDURE IF EXISTS $procedure_name $$

DELIMITER ;
EOF;


$output_file = fopen($filename, "w");

if (fwrite($output_file, $template) === false) {
  echo "Error writing to file: $filename";
} else {
  fclose($output_file);
}
