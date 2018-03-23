<?php

require '../init.php';
require '_validation.php';

$params = [
  'form_action' => 'create.php'
];

if ($post) {

  $params = array_merge($params, $_POST);

  validate($params, $errors);

  if (empty($errors)) {

    if (!empty($_FILES['image_file']['name'])) {
      $params['image_url'] = file_upload($_FILES['image_file']);
    }

    $result = execute('call sp_backgrounds_create(
      :p_name,
      :p_image_url,
      :p_link_url,
      :p_background_color,
      :p_details_color,
      :p_is_active,
      :p_begins_at,
      :p_ends_at
    );', array(
      array('p_name', $params['name'], PDO::PARAM_STR),
      array('p_image_url', $params['image_url'], PDO::PARAM_STR),
      array('p_link_url', $params['link_url'], PDO::PARAM_STR),
      array('p_background_color', $params['background_color'], PDO::PARAM_STR),
      array('p_details_color', $params['details_color'], PDO::PARAM_STR),
      array('p_is_active', $params['is_active'], PDO::PARAM_INT),
      array('p_begins_at', date('Y-m-d H:i:s', strtotime($params['begins_at'])), PDO::PARAM_STR),
      array('p_ends_at', date('Y-m-d H:i:s', strtotime($params['ends_at'])), PDO::PARAM_STR)
    ));

    if (!empty($result)) {
      flash('notice', t('create_success'));
      redirect('show.php?id=' . $result->lastInsertId);
    } else {
      flash('warning', t('create_failure'));
    }
  }

  $data = (object) $params;
  $params['errors'] = $errors;

}

function content($params, $data) { ?>

  <div class="wrapper">
    <h2><?= t('new_background') ?></h2>
    <?= link_to(t('backgrounds'), '/admin/backgrounds.php') ?>
    <?php require '_form.php'; ?>
  </div>

<?php }

require '../layout.php';
