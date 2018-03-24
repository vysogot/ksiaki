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

    if (!empty($_FILES['avatar_file']['name'])) {
      $params['avatar_file'] = file_upload($_FILES['avatar_file']);
    }

    if (!empty($_FILES['header_file']['name'])) {
      $params['header_file'] = file_upload($_FILES['header_file']);
    }

    $result = execute('call sp_heroes_update(
      :p_id,
      :p_name,
  		:p_description,
  		:p_avatar_url,
      :p_header_url,
  		:p_is_active
    );', array(
      array('p_id', $params['id'], PDO::PARAM_INT),
      array('p_name', $params['name'], PDO::PARAM_STR),
      array('p_description', $params['p_description'], PDO::PARAM_STR),
      array('p_avatar_url', $params['avatar_url'], PDO::PARAM_STR),
      array('p_header_url', $params['header_url'], PDO::PARAM_STR),
      array('p_is_active', $params['is_active'], PDO::PARAM_INT)
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
    <?= link_to(t('heroes'), '/admin/heroes.php') ?>
    <?php require '_form.php'; ?>
  </div>

<?php }

require '../layout.php';
