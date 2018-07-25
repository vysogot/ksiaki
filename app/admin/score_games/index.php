<?php

include '../init.php';

$data['title'] = 'score_games';
$data['column_names'] = [
    'id',
    'nick',
    'contest_name',
    'begins_at',
    'game_duration',
    'win',
    'level',
    'points_in_level',
    'points_in_game',
    'is_suspected',
    'is_rankable'
];

?>

<?php function content($params, $data) { ?>

  <?php include '../partials/datatable_view.php'; ?>

  <script type="text/javascript">
  <?php include "../partials/formdata.js"; ?>
  <?php include "datatable.js"; ?>
  <?php include "actions.js"; ?>
  </script>

<?php }

if ($xhr) {
  content($params, $data);
} else {
  include '../layout.php';
} ?>
