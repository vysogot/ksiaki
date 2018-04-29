<?php

include '../init.php';
include '_validation.php';

$params = [
  'form_action' => 'create.php'
];

if ($post) {

  $params = array_merge($params, $_POST);

  validate($params, $errors);

  if (empty($errors)) {

    $result = execute('call sp_static_sites_create(
      :p_title,
      :p_slug,
      :p_content,
      :p_is_active
    );', array(
      array('p_title', $params['title'], PDO::PARAM_STR),
      array('p_slug', $params['slug'], PDO::PARAM_STR),
      array('p_content', $params['content'], PDO::PARAM_STR),
      array('p_is_active', $params['is_active'], PDO::PARAM_INT),
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
    <h1><?= t('new_static_site') ?></h1>
    <?= link_to(t('static_sites'), 'index.php') ?>
    <?php include '_form.php'; ?>
  </div>

<?php }

include '../layout.php';
