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

    if (!empty($_FILES['avatar_file']['name'])) {
      $params['avatar_url'] = file_upload($_FILES['avatar_file']);
    }

    if (!empty($_FILES['header_file']['name'])) {
      $params['header_url'] = file_upload($_FILES['header_file']);
    }

    $result = execute('call sp_heroes_update(
      :p_id,
      :p_name,
      :p_slug,
  		:p_description,
  		:p_avatar_url,
      :p_header_url,
  		:p_is_active
    );', array(
      array('p_id', $params['id'], PDO::PARAM_INT),
      array('p_name', $params['name'], PDO::PARAM_STR),
      array('p_slug', $params['slug'], PDO::PARAM_STR),
      array('p_description', $params['description'], PDO::PARAM_STR),
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
    <?= link_to(t('heroes'), 'index.php') ?>
    <?php include '_form.php'; ?>
  </div>

<?php }

include '../layout.php';
