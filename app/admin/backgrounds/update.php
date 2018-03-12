<?php

require '../init.php';
require '_validation.php';

$params = [
  'form_action' => 'update.php'
];

if ($post) {

  $params = array_merge($params, $_POST);

  validate($params, $errors);

  if (empty($errors)) {

    if (!empty($_FILES['image_file']['name'])) {
      $params['image_url'] = file_upload($_FILES['image_file']);
    }

    $result = execute('call sp_backgrounds_update(
      :p_id,
      :p_name,
      :p_image_url,
      :p_link_url,
      :p_is_active,
      :p_begins_at,
      :p_ends_at
    );', array(
      array('p_id', $params['id'], PDO::PARAM_INT),
      array('p_name', $params['name'], PDO::PARAM_STR),
      array('p_image_url', $params['image_url'], PDO::PARAM_STR),
      array('p_link_url', $params['link_url'], PDO::PARAM_STR),
      array('p_is_active', $params['is_active'], PDO::PARAM_INT),
      array('p_begins_at', date('Y-m-d H:i:s', strtotime($params['begins_at'])), PDO::PARAM_STR),
      array('p_ends_at', date('Y-m-d H:i:s', strtotime($params['ends_at'])), PDO::PARAM_STR)
    ));

    if (!empty($result)) {
      flash('notice', t('background_update_success'));
      redirect("show.php?id=" . $params['id']);
    } else {
      flash('warning', t('background_update_failure'));
    }
  }

  $data = (object) $params;
  $params['errors'] = $errors;

}

function content($params, $data) { ?>

  <div class="wrapper">
    <h2><?= t('background_edit') ?></h2>
    <?= link_to(t('backgrounds'), '/admin/backgrounds.php') ?>
    <?php require '_form.php'; ?>
  </div>

<?php }

require '../layout.php';
