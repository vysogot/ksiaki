<?php

include '../init.php';

$data['title'] = 'score_games';
$data['column_names'] = [
    'id',
    'nick',
    'contest_name',
    'level',
    'begins_at',
    'ends_at',
    'win',
    'points',
    'points_total',
    'checknumber_client',
    'checknumber_server',
    'is_suspected'
];

?>

<?php function content($params, $data) { ?>

  <?php include '../partials/datatable_view.php'; ?>

  <script type="text/javascript">
  <?php include "../partials/formdata.js"; ?>
  <?php include "datatable.js"; ?>
  </script>

<?php }

if ($xhr) {
  content($params, $data);
} else {
  include '../layout.php';
} ?>
