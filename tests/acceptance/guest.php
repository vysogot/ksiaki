<?php

function test_guest_sees_homepage() {
    when_i_go_to('/');
    return i_should_see_no_error();
}

function test_guest_sees_contests_page() {
    when_i_go_to('/contests.php');
    return i_should_see_no_error();
}

function test_guest_sees_single_contest_page() {
    // TODO: create_contest(['slug' => 'polska-izba-mleka']);
    when_i_go_to('/konkurs/polska-izba-mleka');
    return i_should_see_no_error();
}

function test_guest_can_play_contest() {
    when_i_go_to('/konkurs/polska-izba-mleka/graj');
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
    when_i_go_to('/rankings/index.php?month=2018-03-01&type=monthly');
    return i_should_see_no_error();
}

function test_guest_sees_yearly_ranking() {
    when_i_go_to('/rankings/index.php?year=2018-03-01&type=yearly');
    return i_should_see_no_error();
}

function test_guest_sees_contest_ranking() {
    when_i_go_to('/rankings/index.php?id=1&type=contest');
    return i_should_see_no_error();
}

function test_guest_sees_profile() {
    when_i_go_to('/profile.php?nick=admin');
    return i_should_see_no_error();
}

function test_guest_minor_can_register() {
    when_i_submit('/rejestracja', [
        'birthday' => '16.01.1998',
        'nick' => 'Newky',
        'email' => 'new_email@test.com',
        'gender' => '1',
        'name' => 'new_user',
        'surname' => 'newsurname',
        'caretaker_name' => 'caretaker_name',
        'caretaker_surname' => 'caretaker_surname',
        'caretaker_email' => 'new_email2@test.com',
        'address' => 'Avenue',
        'postcode' => '12-122',
        'city' => 'New York',
        'contest_agreement' => '1',
        'marketing_agreement' => '1',
        'notifications_agreement' => '1',
        'statute_agreement' => '1',
        'password' => '12345678'
    ]);
    return i_should_see('Rejestracja powiodła się');
}

function test_guest_adult_can_register() {
    when_i_submit('/rejestracja', [
        'birthday' => '16.01.1998',
        'nick' => 'Newky',
        'email' => 'new_email@test.com',
        'gender' => '1',
        'name' => 'new_user',
        'surname' => 'newsurname',
        'caretaker_name' => '',
        'caretaker_surname' => '',
        'caretaker_email' => '',
        'address' => 'Avenue',
        'postcode' => '12-122',
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
    when_i_submit('/rejestracja', [
        'birthday' => '16.01.1998',
        'nick' => 'admin',
        'email' => 'new_email@test.com',
        'gender' => '1',
        'name' => 'new_user',
        'surname' => 'newsurname',
        'caretaker_name' => '',
        'caretaker_surname' => '',
        'caretaker_email' => '',
        'address' => 'Avenue',
        'postcode' => '12-122',
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
  when_i_submit('/logowanie', [
        'login' => 'unknownuser',
        'password' => '12345678'
    ]);
  return i_should_see('Login: Nie znaleziono!');
}
