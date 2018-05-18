<?php

function test_admin_lists_all_video_ads() {
    when_i_login_as('admin');
    and_i_go_to('/admin/video_ads/index.php');
    return i_should_see('Dodaj nowy');
}

function test_admin_shows_video_ad() {
    when_i_login_as('admin');
    and_i_go_to('/admin/video_ads/show.php?id=1');
    return i_should_see_no_error() &&
        i_should_see('/uploads/movie-1.mov');
}

function test_admin_creates_video_ad() {
    when_i_login_as('admin');
    when_i_submit('/admin/video_ads/create.php', [
        'name' => 'new_video_ad',
        'video_url' => '/uploads/video_ad-1.mp4',
        'image_url' => '/uploads/video_ad-1.jpg',
        'link_url' => 'http://konkursiaki.pl',
        'is_active' => 1,
        'begins_at' => '2018-02-02',
        'ends_at' => '2018-02-19',
    ]);
    return i_should_see_no_error() &&
        i_should_see('Udało się utworzyć') &&
        i_should_see('2018-02-02');
}

function test_admin_edits_video_ad() {
    when_i_login_as('admin');
    and_i_go_to('/admin/video_ads/edit.php?id=1');
    return i_should_see_no_error() &&
        i_should_see('Edycja: Reklama video');
}

function test_admin_updates_video_ad() {
    when_i_login_as('admin');
    when_i_submit('/admin/video_ads/update.php', [
        'id' => 1,
        'name' => 'new_video_ad',
        'video_url' => '/uploads/video_ad-1.mp4',
        'image_url' => '/uploads/video_ad-2.jpg',
        'link_url' => 'http://konkursiaki.pl',
        'is_active' => 1,
        'begins_at' => '2018-02-02',
        'ends_at' => '2018-02-19',
    ]);
    return i_should_see_no_error() &&
        i_should_see('Udało się zaktualizować') &&
        i_should_see('/uploads/video_ad-2.jpg');
}

function test_admin_deletes_video_ad() {
    when_i_login_as('admin');
    and_i_go_to('/admin/video_ads/delete.php?id=1');
    return i_should_see_no_error() &&
        i_should_not_see('/admin/video_ads/delete.php?id=1');
} 
