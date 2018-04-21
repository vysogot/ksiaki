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
