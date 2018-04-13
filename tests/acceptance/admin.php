<?php

function test_all_backgrounds() {
  when_i_login_as('admin');
  and_i_go_to('/admin/backgrounds.php');
  return i_should_see('Tła');
}
