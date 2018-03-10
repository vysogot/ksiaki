<?php

require '../init.php';
require '_validation.php';

$params = [
  'form_action' => 'create.php',
  'active_link' => 'contests'
];

if ($post) {

  $params = array_merge($params, $_POST);

  validate($params, $errors);

  if (empty($errors)) {

    $result = execute('call sp_contests_create(
      :p_game_id,
      :p_contest_type_id,
      :p_name,
      :p_description,
      :p_banner_url,
      :p_begins_at,
      :p_ends_at,
      :p_display_ad
    );', array(
      array('p_game_id', $params['game_id'], PDO::PARAM_INT),
      array('p_contest_type_id', $params['contest_type_id'], PDO::PARAM_INT),
      array('p_name', $params['name'], PDO::PARAM_STR),
      array('p_description', $params['description'], PDO::PARAM_STR),
      array('p_banner_url', $params['banner_url'], PDO::PARAM_STR),
      array('p_begins_at', date('Y-m-d H:i:s', strtotime($params['begins_at'])), PDO::PARAM_STR),
      array('p_ends_at', date('Y-m-d H:i:s', strtotime($params['ends_at'])), PDO::PARAM_STR),
      array('p_display_ad', $params['display_ad'], PDO::PARAM_BOOL)
    ));

    if (!empty($result)) {
      flash('notice', 'contest_creation_success');
      redirect('show.php?id=' . $result->lastInsertId);
    } else {
      flash('warning', 'contest_creation_failure');
    }
  }

  $data = (object) $params;
  $params['errors'] = $errors;

}

function content($params, $data) { ?>

  <div class="wrapper">
    <h2>Nowy konkursu</h2>
    <a href="/admin/contests.php">Konkursy</a>
    <?php require '_form.php'; ?>
  </div>

<?php }

require '../layout.php';
