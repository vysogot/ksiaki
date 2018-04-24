<?php

/* recursive file find in directory */
function get_dir_contents($dir, &$results = array()){
    $files = scandir($dir);

    foreach($files as $key => $value){
        $path = realpath($dir.DIRECTORY_SEPARATOR.$value);
        if (is_dir($path) && $value != "." && $value != "..") {
            get_dir_contents($path, $results);
        } elseif (is_file($path)) {
            $results[] = $path;
        }
    }

    return array_values($results);
}

/* get only test functions */
function is_test($name) {
  return substr($name, 0, 5) == 'test_';
}
