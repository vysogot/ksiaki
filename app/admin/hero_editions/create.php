<?php

include '../init.php';
include '_validation.php';

if ($post) {

  $params = array_merge($params, $_POST);
  validate($params);

  $result = [];

  if (empty($params['errors'])) {

      $hero = execute('call sp_heroes_find(:p_id);', array(
          array('p_id', $params['hero_id'], PDO::PARAM_INT)
      ));

      $slug = $hero->slug;

      if (!empty($_FILES['gadget_file']['name'])) {
          $params['gadget_url'] = file_upload($_FILES['gadget_file'], ['subdir' => 'heroes', 'filename' => "$slug-gadget", 'thumbnail' => true]);
      }

      if (!empty($_FILES['cover_file']['name'])) {
          $params['cover_url'] = file_upload($_FILES['cover_file'], ['subdir' => 'heroes', 'filename' => "$slug-cover", 'thumbnail' => true]);
      }

      if (!empty($_FILES['video_file']['name'])) {
          $params['video_url'] = file_upload($_FILES['video_file'], ['subdir' => 'heroes', 'filename' => "$slug-video"]);
      }

      if (!empty($_FILES['video_cover_file']['name'])) {
          $params['video_cover_url'] = file_upload($_FILES['video_cover_file'], ['subdir' => 'heroes', 'filename' => "$slug-video-cover"]);
      }

      $result = execute('call sp_hero_editions_create(
          :p_hero_id,
          :p_name,
          :p_description,
          :p_cover_url,
          :p_video_url,
          :p_video_cover_url,
          :p_gadget_url,
          :p_is_active,
          :p_user_id
      );', array(
          array('p_hero_id', $params['hero_id'], PDO::PARAM_STR),
          array('p_name', $params['name'], PDO::PARAM_STR),
          array('p_description', $params['description'], PDO::PARAM_STR),
          array('p_cover_url', $params['cover_url'], PDO::PARAM_STR),
          array('p_video_url', $params['video_url'], PDO::PARAM_STR),
          array('p_video_cover_url', $params['video_cover_url'], PDO::PARAM_STR),
          array('p_gadget_url', $params['gadget_url'], PDO::PARAM_STR),
          array('p_is_active',$params['is_active'], PDO::PARAM_STR),
          array('p_user_id', $_SESSION['user_id'], PDO::PARAM_STR)
      ));

  } else {

      $result = ['rowCount' => -1, 'lastInsertId' => 0,
          'errors' => $params['errors'],
          'token' => get_csrf_token()
      ];

  }

  send_json($result);

}
