<?php

include '../init.php';

$data['title'] = 'slides';
$data['column_names'] = [
    'id',
    'image_url',
    'name',
    'link_url',
    'begins_at',
    'ends_at',
    'is_active'
];

?>

<?php include '../partials/modal_form.php'; ?>
<?php include '../partials/modal_image.php'; ?>
<?php include '../partials/datatable_view.php'; ?>

<script type="text/javascript">
<?php include "../partials/formdata.js"; ?>
<?php include "datatable.js"; ?>
<?php include "actions.js"; ?>
</script>
