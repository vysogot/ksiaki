<?php

function test_homepage_works() {
  when_i_go_to('/');
  return i_should_see('class="active">Strona główna</a>');
}

function test_contests_page_works() {
  when_i_go_to('/contests.php');
  return i_should_see('class="active">Konkursy</a>');
}

function test_downloads_page_works() {
  when_i_go_to('/downloads.php');
  return i_should_see('class="active">Pobrania</a>');
}

function test_login_page_works() {
  when_i_go_to('/login.php');
  return i_should_see('<h2>Logowanie</h2>');
}

function test_registration_page_works() {
  when_i_go_to('/register.php');
  return i_should_see('<h2>Zarejestruj się</h2>');
}

function test_i_can_login() {
  when_i_submit('/login.php', [
    'login' => 'user',
    'password' => '12345678'
  ]);
  return i_should_see('Logowanie powiodło się');
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
    i_should_see('Nazwa jest już zajęta');
}
