<?php

function test_homepage() {
  return should_give_no_error('/');
}

function test_contests_page() {
  return should_give_no_error('/contests.php');
}

function test_single_contest_page() {
  return should_give_no_error('/contests/show.php?id=1');
}

function test_contest_preroll() {
  return should_give_no_error('/contests/preroll.php?id=1');
}

function test_contest_play() {
  return should_give_no_error('/contests/play.php?id=1');
}

function test_login_page() {
  return should_give_no_error('/login.php');
}

function test_registration_page() {
  return should_give_no_error('/register.php');
}

function test_monthly_ranking() {
  return should_give_no_error('/rankings/monthly.php?month=2018-03-01');
}

function test_yearly_ranking() {
  return should_give_no_error('/rankings/yearly.php?year=2018-03-01');
}

function test_contest_ranking() {
  return should_give_no_error('/rankings/contest.php?id=1');
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
