<?php

include '../init.php';

$data['title'] = 'contests';
$data['column_names'] = [
    'id',
    'box_url',
    'name',
    'game_name',
    'contest_type_name',
    'begins_at',
    'ends_at',
    'is_active'
];

?>

<?php include '../partials/modal_form.php'; ?>
<?php include '../partials/datatable_view.php'; ?>

<script type="text/javascript">
<?php include "../partials/formdata.js"; ?>
<?php include "datatable.js"; ?>
<?php include "actions.js"; ?>
</script>
