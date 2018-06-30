<?php

include '../init.php';

$data['title'] = 'log_mail';
$data['column_names'] = [
    'id',
    'email',
    'subject',
    'created_at',
    'created_by'
];

?>

<?php function content($params, $data) { ?>

  <?php include '../partials/datatable_view.php'; ?>

  <script type='text/javascript'>
  <?php include '../partials/formdata.js'; ?>
  <?php include 'datatable.js'; ?>
  <?php include "actions.js"; ?>
  </script>

<?php }

if ($xhr) {
  content($params, $data);
} else {
  include '../layout.php';
} ?>
