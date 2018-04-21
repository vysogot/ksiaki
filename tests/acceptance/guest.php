<?php

function test_homepage() {
    when_i_go_to('/');
    return i_should_see_no_error();
}

function test_contests_page() {
    when_i_go_to('/contests.php');
    return i_should_see_no_error();
}

function test_single_contest_page() {
    when_i_go_to('/contests/show.php?id=1');
    return i_should_see_no_error();
}

function test_contest_preroll() {
    when_i_go_to('/contests/preroll.php?id=1');
    return i_should_see_no_error();
}

function test_contest_play() {
    when_i_go_to('/contests/play.php?id=1');
    return i_should_see_no_error();
}

function test_login_page() {
    when_i_go_to('/login.php');
    return i_should_see_no_error();
}

function test_registration_page() {
    when_i_go_to('/register.php');
    return i_should_see_no_error();
}

function test_monthly_ranking() {
    when_i_go_to('/rankings/monthly.php?month=2018-03-01');
    return i_should_see_no_error();
}

function test_yearly_ranking() {
    when_i_go_to('/rankings/yearly.php?year=2018-03-01');
    return i_should_see_no_error();
}

function test_contest_ranking() {
    when_i_go_to('/rankings/contest.php?id=1');
    return i_should_see_no_error();
}

function test_i_can_register() {
    when_i_submit('/register.php', [
        'name' => 'new_user',
        'email' => 'new_email@test.com',
        'password' => '12345678'
    ]);
    return i_should_see('Rejestracja powiodła się');
}

function test_i_cant_register_with_existing_name() {
    when_i_submit('/register.php', [
        'name' => 'user',
        'email' => 'new_email@test.com',
        'password' => '12345678'
    ]);
    return i_should_not_see('Rejestracja powiodła się') &&
        i_should_see('Jest już zajęte');
}
