<?php

include '../init.php';
include '_validation.php';

$params = [
  'form_action' => 'update.php'
];

if ($post) {

  $params = array_merge($params, $_POST);

  validate($params, $errors);

  if (empty($errors)) {

    if (!empty($_FILES['box_file']['name'])) {
      $params['box_file'] = file_upload($_FILES['box_file']);
    }

    if (!empty($_FILES['header_file']['name'])) {
      $params['header_file'] = file_upload($_FILES['header_file']);
    }

    $result = execute('call sp_contests_update(
      :p_id,
      :p_game_id,
      :p_contest_type_id,
      :p_name,
      :p_description,
      :p_box_url,
      :p_header_url,
      :p_begins_at,
      :p_ends_at,
      :p_display_ad,
      :p_is_active
    );', array(
      array('p_id', $params['id'], PDO::PARAM_INT),
      array('p_game_id', $params['game_id'], PDO::PARAM_INT),
      array('p_contest_type_id', $params['contest_type_id'], PDO::PARAM_INT),
      array('p_name', $params['name'], PDO::PARAM_STR),
      array('p_description', $params['description'], PDO::PARAM_STR),
      array('p_box_url', $params['box_url'], PDO::PARAM_STR),
      array('p_header_url', $params['header_url'], PDO::PARAM_STR),
      array('p_begins_at', date('Y-m-d H:i:s', strtotime($params['begins_at'])), PDO::PARAM_STR),
      array('p_ends_at', date('Y-m-d H:i:s', strtotime($params['ends_at'])), PDO::PARAM_STR),
      array('p_display_ad', $params['display_ad'], PDO::PARAM_BOOL),
      array('p_is_active', $params['is_active'], PDO::PARAM_BOOL)
    ));

    if (!empty($result)) {
      flash('notice', t('update_success'));
      redirect("show.php?id=" . $params['id']);
    } else {
      flash('warning', t('update_failure'));
    }
  }

  $data = (object) $params;
  $params['errors'] = $errors;

}

function content($params, $data) { ?>

  <div class="wrapper">
    <h2><?= t('edit_form') ?></h2>
    <?= link_to(t('contests'), '/admin/contests.php') ?>
    <?php include '_form.php'; ?>
  </div>

<?php }

include '../layout.php';
