<?php

function test_admin_lists_all_users() {
    when_i_login_as('admin');
    and_i_go_to('/admin/users.php');
    return i_should_see('Użytkownicy');
}

function test_admin_shows_user() {
    when_i_login_as('admin');
    and_i_go_to('/admin/users/show.php?id=1');
    return i_should_see_no_error() &&
        i_should_see('demo@demo.com');
}

function test_admin_creates_user() {
    when_i_login_as('admin');
    when_i_submit('/admin/users/create.php', [
        'role_id' => 2,
        'name' => 'new_user',
        'email' => 'new_email@test.com',
        'avatar_url' => '/uploads/user-1.jpg',
        'is_active' => 1,
        'password' => '12345678'
    ]);
    return i_should_see_no_error() &&
        i_should_see('Udało się utworzyć') &&
        i_should_see('new_email@test.com');
}

function test_admin_edits_user() {
    when_i_login_as('admin');
    and_i_go_to('/admin/users/edit.php?id=1');
    return i_should_see_no_error() &&
        i_should_see('Edycja: user');
}

function test_admin_updates_user() {
    when_i_login_as('admin');
    when_i_submit('/admin/users/update.php', [
        'id' => '1',
        'role_id' => '1',
        'name' => 'new_user',
        'email' => 'new_email@test.com',
        'avatar_url' => '/uploads/user-1.jpg',
        'is_active' => 0,
        'password' => ''
    ]);
    and_i_go_to('/admin/users/show.php?id=1');
    return i_should_see_no_error() &&
        i_should_see('new_email@test.com');
}

function test_admin_deletes_user() {
    when_i_login_as('admin');
    and_i_go_to('/admin/users/delete.php?id=1');
    return i_should_see_no_error() &&
        i_should_not_see('/admin/users/delete.php?id=1');
} 
