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
        'name' => 'new_user',
        'email' => 'new_email@test.com',
        'avatar_url' => '/uploads/user-1.jpg',
        'is_active' => 0
    ]);
    and_i_go_to('/admin/users/show.php?id=1');
    return i_should_see_no_error() &&
        i_should_see('new_email@test.com');
}
