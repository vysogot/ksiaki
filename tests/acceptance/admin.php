<?php

function test_admin_menu() {
  when_i_login_as('admin');
  and_i_go_to('/admin/users.php');
  return i_should_see_many(['Użytkownicy', 'Wyloguj', 'Strona główna', 'Boxy', 'Bohaterowie', 'Tła', 'Rankingi']);
}

function test_all_contests() {
  when_i_login_as('admin');
  and_i_go_to('/admin/contests.php');
  return i_should_see('Konkursy');
}

function test_all_heroes() {
  when_i_login_as('admin');
  and_i_go_to('/admin/heroes.php');
  return i_should_see('Bohaterowie');
}

function test_all_rankings() {
  when_i_login_as('admin');
  and_i_go_to('/admin/rankings.php');
  return i_should_see('Tła');
}

function test_all_boxes() {
  when_i_login_as('admin');
  and_i_go_to('/admin/boxes.php');
  return i_should_see('Tła');
}
