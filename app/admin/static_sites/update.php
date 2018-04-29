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

    $result = execute('call sp_static_sites_update(
      :p_id,
      :p_title,
      :p_slug,
      :p_content,
      :p_is_active
    );', array(
      array('p_id', $params['id'], PDO::PARAM_INT),
      array('p_title', $params['title'], PDO::PARAM_STR),
      array('p_slug', $params['slug'], PDO::PARAM_STR),
      array('p_content', $params['content'], PDO::PARAM_STR),
      array('p_is_active', $params['is_active'], PDO::PARAM_INT),
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
    <?= link_to(t('static_sites'), 'index.php') ?>
    <?php include '_form.php'; ?>
  </div>

<?php }

include '../layout.php';
