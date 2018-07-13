<?php

function test_player_profile() {
  when_i_login_as('admin');
  and_i_go_to('/profile.php?nick=admin');
  return i_should_see('user');
}

function test_player_can_login() {
  when_i_login_as('admin');
  return i_should_see('Logowanie powiodło się');
}

function test_player_can_logout() {
  when_i_login_as('admin');
  and_i_go_to('/wyloguj-sie');
  return i_should_see('Bezpiecznie wylogowano');
}
