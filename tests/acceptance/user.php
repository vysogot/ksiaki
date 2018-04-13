<?php

function test_my_profile() {
  when_i_login_as('user');
  and_i_go_to('/users.php?id=1');
  return i_should_see('Nick: user');
}

function test_i_can_login() {
  when_i_login_as('user');
  return i_should_see('Logowanie powiodło się');
}

function test_i_can_logout() {
  when_i_login_as('user');
  when_i_go_to('/logout.php');
  return i_should_see('Bezpiecznie wylogowano');
}
