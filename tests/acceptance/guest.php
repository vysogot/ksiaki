<?php

function test_guest_sees_homepage() {
    when_i_go_to('/');
    return i_should_see_no_error() &&
        i_should_see_exactly('3', 'class="boxes"');
}

function test_guest_sees_contests_page() {
    when_i_go_to('/contests.php');
    return i_should_see_no_error();
}

function test_guest_sees_single_contest_page() {
    when_i_go_to('/contest.php?id=1');
    return i_should_see_no_error();
}

function test_guest_sees_contest_preroll() {
    when_i_go_to('/contest_preroll.php?id=1');
    return i_should_see_no_error();
}

function test_guest_can_play_contest() {
    when_i_go_to('/contest_play.php?id=1');
    return i_should_see_no_error();
}

function test_guest_sees_user_movie() {
    when_i_go_to('/user_movie.php?id=1');
    return i_should_see_no_error();
}

function test_guest_sees_login_page() {
    when_i_go_to('/login.php');
    return i_should_see_no_error();
}

function test_guest_sees_registration_page() {
    when_i_go_to('/register.php');
    return i_should_see_no_error();
}

function test_guest_sees_monthly_ranking() {
    when_i_go_to('/ranking.php?month=2018-03-01&type=monthly');
    return i_should_see_no_error();
}

function test_guest_sees_yearly_ranking() {
    when_i_go_to('/ranking.php?year=2018-03-01&type=yearly');
    return i_should_see_no_error();
}

function test_guest_sees_contest_ranking() {
    when_i_go_to('/ranking.php?id=1&type=contest');
    return i_should_see_no_error();
}

function test_guest_can_register() {
    when_i_submit('/register.php', [
        'birthday' => '16.01.1998',
        'nick' => 'Newky',
        'email' => 'new_email@test.com',
        'gender' => '1',
        'name' => 'new_user',
        'surname' => 'newsurname',
        'address' => 'Avenue',
        'postcode' => '12-1222',
        'city' => 'New York',
        'contest_agreement' => '1',
        'marketing_agreement' => '1',
        'notifications_agreement' => '1',
        'statute_agreement' => '1',
        'password' => '12345678'
    ]);
    return i_should_see('Rejestracja powiodła się');
}

function test_guest_cant_register_with_existing_nick() {
    when_i_submit('/register.php', [
        'birthday' => '16.01.1998',
        'nick' => 'user',
        'email' => 'new_email@test.com',
        'gender' => '1',
        'name' => 'new_user',
        'surname' => 'newsurname',
        'address' => 'Avenue',
        'postcode' => '12-1222',
        'city' => 'New York',
        'contest_agreement' => '1',
        'marketing_agreement' => '1',
        'notifications_agreement' => '1',
        'statute_agreement' => '1',
        'password' => '12345678'
    ]);
    return i_should_not_see('Rejestracja powiodła się') &&
        i_should_see('Jest już zajęte');
}

function test_guest_unknown_fails_to_login() {
  when_i_submit('/login.php', [
        'name' => 'unknownuser',
        'password' => '12345678'
    ]);
  return i_should_see('Logowanie nie powiodło się');
}
