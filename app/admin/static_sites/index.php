<?php

include '../init.php';

$data['title'] = 'static_sites';
$data['column_names'] = [
    'id',
    'title',
    'slug',
    'is_active',
];

?>

<?php function content($params, $data) { ?>

  <?php include '../partials/modal_form.php'; ?>
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
