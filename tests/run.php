<?php

/* setup environment */
putenv('APPLICATION_ENV=testing');
require __DIR__ . '/../app/lib/config.php';

/* support functions */
require 'support/db.php';
require 'support/dsl.php';
require 'support/io.php';

/* all acceptance test files */
$dirpath = realpath(__DIR__ . "/acceptance");
foreach (scandir($dirpath) as $filename) {
  $path = $dirpath . '/' . $filename;
  if (is_file($path)) {
    require $path;
  }
}

/* delete any output files */
$dirpath = realpath(__DIR__ . "/output");
foreach (scandir($dirpath) as $filename) {
  $path = $dirpath . '/' . $filename;
  if (is_file($path) && $filename != '.gitignore') {
    unlink($path);
  }
}

/* cleanup variables */
unset($dirpath);
unset($path);
unset($filename);

/* get only test functions */
function is_test($name) {
  return substr($name, 0, 5) == 'test_';
}

$tests = array_filter(get_defined_functions()['user'], 'is_test');

/* filter tests by first argument */
if (isset($argv[1])) {
  $tests = array_filter($tests, function($test) use ($argv) { return preg_match("/$argv[1]/", $test); });
}

/* time and run */
$time_start = microtime(true);
$failed_count = 0;

foreach ($tests as $test) {

  /* seed db */
  seed();

  /* call test: display a dot when passed, F otherwise */
  if (call_user_func($test)) {
    echo ".";
  } else {
    $failed_count += 1;
    echo "\nF: $test\n";
    failed_test_output($test);
  }

  /* remove tmp output */
  teardown();
}

$execution_time = (microtime(true) - $time_start);

/* report */
echo "\n";
echo "Tests: " . count($tests);
echo $failed_count == 0 ? ", all good.\n" : "\nFailed: $failed_count\n";
echo "Execution time: " . number_format($execution_time, 3) . "s\n";
