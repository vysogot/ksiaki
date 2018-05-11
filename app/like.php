<?php

include 'init.php';

if (is_logged_in()) {
    $data = execute('call sp_user_movies_likes_create(
        :p_user_id,
        :p_user_movie_id
    );', array(
        array('p_user_id', $_SESSION['user_id'], PDO::PARAM_INT),
        array('p_user_movie_id', $_GET['user_movie_id'], PDO::PARAM_INT),
    ), true, true);

    header('Content-type: application/json');
    print json_encode(array('data' => $data));
} else {
    redirect('/login.php');
}
