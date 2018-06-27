<?php

include 'init.php';

$wallpaper = fetch_one("call sp_hero_files_find(:p_id);", [
	array('p_id', $_GET['id'], PDO::PARAM_INT)
]);

if (empty($wallpaper)) redirect('/404.php');

$ext = file_extension($wallpaper->file_url);
$file_name = $wallpaper->name . '.' . $ext;

header("Content-disposition: attachment; filename=$file_name");
header("Content-type: application/$ext");
readfile("$wallpaper->file_url");