<?php

date_default_timezone_set('Europe/Warsaw');

$migrations_dir = "db/migrations/";
$file_timestamp = date('YmdHis', time());
$db_timestamp = date('Y-m-d H:i:s', time());

if (isset($argv[1])) {
    $filename = $migrations_dir . $file_timestamp . '_' . $argv[1] . '.sql';
} else {
    echo "\nusage example: php db/new_migration.php adding_color_column_to_users\n\n";
    exit();
}


$template = <<<EOF
DELIMITER $$

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

$$
DELIMITER ;
EOF;


$output_file = fopen($filename, "w");

if (fwrite($output_file, $template) === false) {
  echo "Error writing to file: $filename";
} else {
  fclose($output_file);
}
