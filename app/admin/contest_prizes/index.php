<?php

include '../init.php';

$data['title'] = 'contest_prizes';
$data['column_names'] = [
    'id',
    'image_url',
    'name',
    'contest_name',
    'sponsor_name',
    'is_active'
];

?>

<?php function content($params, $data) { ?>

  <?php include '../partials/modal_form.php'; ?>
  <?php include '../partials/modal_image.php'; ?>
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
