<?php

function test_admin_lists_all_user_movies() {
    when_i_login_as('admin');
    and_i_go_to('/admin/user_movies/index.php');
    return i_should_see('Dodaj nowy');
}

function test_admin_shows_user_movie() {
    when_i_login_as('admin');
    and_i_go_to('/admin/user_movies/show.php?id=1');
    return i_should_see_no_error() &&
        i_should_see('/uploads/user_movie-1.jpg');
}

function test_admin_creates_user_movie() {
    when_i_login_as('admin');
    when_i_submit('/admin/user_movies/create.php', [
        'user_id' => 1,
        'name' => 'new_user_movie',
        'video_url' => '/uploads/user_movie-1.mp4',
        'image_url' => '/uploads/user_movie-1.jpg',
        'link_url' => 'http://konkursiaki.pl',
        'is_active' => 1,
        'begins_at' => '2018-02-02',
        'ends_at' => '2018-02-19',
    ]);
    return i_should_see_no_error() &&
        i_should_see('Udało się utworzyć') &&
        i_should_see('2018-02-02');
}

function test_admin_edits_user_movie() {
    when_i_login_as('admin');
    and_i_go_to('/admin/user_movies/edit.php?id=1');
    return i_should_see_no_error() &&
        i_should_see('Edycja: Film użytkownika');
}

function test_admin_updates_user_movie() {
    when_i_login_as('admin');
    when_i_submit('/admin/user_movies/update.php', [
        'id' => 1,
        'user_id' => 1,
        'name' => 'new_user_movie',
        'video_url' => '/uploads/user_movie-1.mp4',
        'image_url' => '/uploads/user_movie-2.jpg',
        'link_url' => 'http://konkursiaki.pl',
        'is_active' => 1,
        'begins_at' => '2018-02-02',
        'ends_at' => '2018-02-19',
    ]);
    return i_should_see_no_error() &&
        i_should_see('Udało się zaktualizować') &&
        i_should_see('/uploads/user_movie-2.jpg');
}

function test_admin_deletes_user_movie() {
    when_i_login_as('admin');
    and_i_go_to('/admin/user_movies/delete.php?id=1');
    return i_should_see_no_error() &&
        i_should_not_see('/admin/user_movies/delete.php?id=1');
} 
