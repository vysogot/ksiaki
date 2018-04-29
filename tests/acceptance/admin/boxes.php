<?php

function test_admin_lists_all_boxes() {
    when_i_login_as('admin');
    and_i_go_to('/admin/boxes/index.php');
    return i_should_see('Dodaj nowy');
}

function test_admin_shows_box() {
    when_i_login_as('admin');
    and_i_go_to('/admin/boxes/show.php?id=1');
    return i_should_see_no_error() &&
        i_should_see('/uploads/box-1.jpg');
}

function test_admin_creates_box() {
    when_i_login_as('admin');
    when_i_submit('/admin/boxes/create.php', [
        'name' => 'new_box',
        'image_url' => '/uploads/box-1.jpg',
        'link_url' => 'http://konkursiaki.pl',
        'is_active' => 1,
        'begins_at' => '2018-02-02',
        'ends_at' => '2018-02-19',
    ]);
    return i_should_see_no_error() &&
        i_should_see('Udało się utworzyć') &&
        i_should_see('2018-02-02');
}

function test_admin_edits_box() {
    when_i_login_as('admin');
    and_i_go_to('/admin/boxes/edit.php?id=1');
    return i_should_see_no_error() &&
        i_should_see('Edycja: Box');
}

function test_admin_updates_box() {
    when_i_login_as('admin');
    when_i_submit('/admin/boxes/update.php', [
        'id' => 1,
        'name' => 'new_box',
        'image_url' => '/uploads/box-2.jpg',
        'link_url' => 'http://konkursiaki.pl',
        'is_active' => 1,
        'begins_at' => '2018-02-02',
        'ends_at' => '2018-02-19',
    ]);
    return i_should_see_no_error() &&
        i_should_see('Udało się zaktualizować') &&
        i_should_see('/uploads/box-2.jpg');
}

function test_admin_deletes_box() {
    when_i_login_as('admin');
    and_i_go_to('/admin/boxes/delete.php?id=1');
    return i_should_see_no_error() &&
        i_should_not_see('/admin/boxes/delete.php?id=1');
} 
