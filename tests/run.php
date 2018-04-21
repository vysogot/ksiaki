<?php

/* time */
$time_start = microtime(true);
$memory_use = memory_get_usage();

require 'support/env.php';
require 'support/dsl.php';
require 'support/io.php';
require 'support/helpers.php';

/* all acceptance test files */
$dirpath = realpath(__DIR__ . "/acceptance");
$test_files = get_dir_contents($dirpath);
foreach ($test_files as $filepath) {
  if (fnmatch('*.php', $filepath)) {
    require $filepath;
  }
}

/* delete any output files */
$dirpath = realpath(__DIR__ . "/output");
$output_files = get_dir_contents($dirpath);
foreach ($output_files as $filepath) {
  if (!fnmatch('*.gitignore', $filepath)) {
    unlink($filepath);
  }
}

$tests = array_filter(get_defined_functions()['user'], 'is_test');

/* filter tests by first argument */
if (isset($argv[1])) {
    $tests = array_filter($tests, function($test) use ($argv) { 
        return preg_match("/$argv[1]/", $test); 
    });
}

/* run */
foreach ($tests as $test) {

  /* seed db */
  prepare();

  /* call test: display a dot when passed, F otherwise */
  if (call_user_func($test)) {
    echo ".";
  } else {
    echo "F";
    $failed_tests[] = $test;
    failed_test_output($test);
  }

  /* remove tmp output and cookie */
  teardown();
}

$execution_time = (microtime(true) - $time_start);

/* report */
echo "\n";
echo "Tests: " . count($tests);
if (empty($failed_tests)) {
  echo ", all good.\n";
} else {
  echo "\nFailed: " . count($failed_tests) . "\nTests that failed:\n";
  foreach($failed_tests as $test) { echo "- $test\n"; }
}
echo "Execution time: " . number_format($execution_time, 3) . "s\n";
echo "Memory peak usage: " . number_format((memory_get_peak_usage() - $memory_use)/1024, 3) . "Kb\n";
