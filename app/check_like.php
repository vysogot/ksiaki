<?php

include 'init.php';

header('Content-type: application/json');

if (is_logged_in()) {
    $data = execute('call sp_user_movies_likes_check(
        :p_user_id,
        :p_user_movie_id
    );', array(
        array('p_user_id', $_SESSION['user_id'], PDO::PARAM_INT),
        array('p_user_movie_id', $_GET['user_movie_id'], PDO::PARAM_INT),
    ), true, true);

    print json_encode(array('data' => $data[0]));
} else {
    print json_encode(array('data' => 0));
}
