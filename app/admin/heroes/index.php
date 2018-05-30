<?php

include '../init.php';

$data['title'] = 'heroes';
$data['column_names'] = [
    'id',
    'avatar_url',
    'name',
    'slug',
    'is_active',
];

function content($params, $data) { ?>

<?php include '../partials/modal_form.php'; ?>
<?php include '../partials/modal_image.html'; ?>
<?php include '../partials/datatable_view.php'; ?>

    <script type="text/javascript">
    <?php include "../assets/js/definitions.js"; ?>
    <?php include "../assets/js/helpers.js"; ?>
    <?php include "../assets/js/formdata.js"; ?>
    <?php include "datatable.js"; ?>
    <?php include "actions.js"; ?>
    </script>

<?php }

include '../layout.php';
