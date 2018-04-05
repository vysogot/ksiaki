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

    if (!empty($_FILES['avatar_file']['name'])) {
      $params['avatar_url'] = file_upload($_FILES['avatar_file']);
    }

    if (!empty($_FILES['header_file']['name'])) {
      $params['header_url'] = file_upload($_FILES['header_file']);
    }

    $result = execute('call sp_heroes_create(
      :p_name,
  		:p_description,
  		:p_avatar_url,
      :p_header_url,
  		:p_is_active
    );', array(
      array('p_name', $params['name'], PDO::PARAM_STR),
      array('p_description', $params['description'], PDO::PARAM_STR),
      array('p_avatar_url', $params['avatar_url'], PDO::PARAM_STR),
      array('p_header_url', $params['header_url'], PDO::PARAM_STR),
      array('p_is_active', $params['is_active'], PDO::PARAM_INT)
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
    <h2><?= t('new_hero') ?></h2>
    <?= link_to(t('heroes'), '/admin/heroes.php') ?>
    <?php require '_form.php'; ?>
  </div>

<?php }

require '../layout.php';
