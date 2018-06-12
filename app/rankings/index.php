<?php

include '../init.php';

$params = [
    'type' => '',
    'date' => date('Y-m-d'),
];


$data['column_names'] = [
    'place',
    'nick',
    'points',
];

$params = array_merge($params, $_GET);

content($params, $data);

?>

<?php function content($params, $data) { ?>

  <?php include 'modal_form.php'; ?>

  <script src="//cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js"></script>
  <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

  <script type="text/javascript">

  var oTable = null;
  var type = <?= '"' . e($params['type']) . '"' ?>;
  var date = <?= '"' . e($params['date']) . '"' ?>;

  <?php include "datatable.js"; ?>

  $('#show-ranking').on('hidden.bs.modal', function (e) {
      $('#show-ranking').remove();
  });
  </script>

<?php }
