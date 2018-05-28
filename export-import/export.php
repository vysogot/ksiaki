<?php

$host = '127.0.0.1';
$dbname = 'konkursiaki_ranking';
$user = 'root';
$pass = 'r1798G!2#';
$port = '3306';


$path = realpath(__DIR__ . "/exports");
$files = scandir($path);

foreach ($files as $file) {
    if (!fnmatch('*.sql', $file)) continue;

    $realpath = $path . '/' . $file;
    $query = file_get_contents($realpath);

    if (exec("mysql -h $host -P $port -u $user --password=$pass $dbname < $realpath"))
         echo "$file => Success\n";
    else
         echo "$file => Fail\n";
}
