<?php

function test_admin_lists_all_slides() {
    when_i_login_as('admin');
    and_i_go_to('/admin/slides/index.php');
    return i_should_see('Dodaj nowy');
}

function test_admin_shows_slide() {
    when_i_login_as('admin');
    and_i_go_to('/admin/slides/show.php?id=1');
    return i_should_see_no_error() &&
        i_should_see('/uploads/slide-1.jpg');
}

function test_admin_creates_slide() {
    when_i_login_as('admin');
    when_i_submit('/admin/slides/create.php', [
        'name' => 'new_slide',
        'image_url' => '/uploads/slide-1.jpg',
        'link_url' => 'http://konkursiaki.pl',
        'is_active' => 1,
        'begins_at' => '2018-02-02',
        'ends_at' => '2018-02-19',
    ]);
    return i_should_see_no_error() &&
        i_should_see('Udało się utworzyć') &&
        i_should_see('2018-02-02');
}

function test_admin_edits_slide() {
    when_i_login_as('admin');
    and_i_go_to('/admin/slides/edit.php?id=1');
    return i_should_see_no_error() &&
        i_should_see('Edycja: Slajd');
}

function test_admin_updates_slide() {
    when_i_login_as('admin');
    when_i_submit('/admin/slides/update.php', [
        'id' => 1,
        'name' => 'new_slide',
        'image_url' => '/uploads/slide-2.jpg',
        'link_url' => 'http://konkursiaki.pl',
        'is_active' => 1,
        'begins_at' => '2018-02-02',
        'ends_at' => '2018-02-19',
    ]);
    return i_should_see_no_error() &&
        i_should_see('Udało się zaktualizować') &&
        i_should_see('/uploads/slide-2.jpg');
}

function test_admin_deletes_slide() {
    when_i_login_as('admin');
    and_i_go_to('/admin/slides/delete.php?id=1');
    return i_should_see_no_error() &&
        i_should_not_see('/admin/slides/delete.php?id=1');
} 
