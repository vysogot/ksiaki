<?php

include '../init.php';

$data['heroes'] = fetch_all('call sp_heroes_all();');

function content($params, $data) { ?>

    <?= csrf_field() ?>

    <p class="center"><?= t('sort_info') ?></p>

    <ul class="sortable">
        <?php foreach($data['heroes'] as $hero) { ?>
            <li id="<?= $hero->id ?>"><?= image($hero->avatar_url) ?></li>
        <?php } ?>
    </ul>

    <div class="center">
        <button id="submit" type="submit" class="btn btn-primary">
            <?= t('save') ?>
        </button>
        <?= link_to(t('cancel'), 'index.php') ?>
    </div>

    <script type="text/javascript">

        <?php include "../partials/formdata.js"; ?>
        <?php include "actions.js"; ?>

        $(function() {
            $(".sortable").sortable();
            $(".sortable").disableSelection();
        });

        $("#submit").on("click", function(e) {

            var heroesPositions = $(".sortable").sortable("toArray");

            $.post("sort.php", {
                heroes_positions: heroesPositions.join(','),
                token: $("input[name=token]").val()
            }).done(function(response) {
                vexOpen('<p>' + positionsUpdated + '</p>')
                $("input[name=token]").val(response['token']);
            });

        });

    </script>

<?php }

if ($xhr) {
  content($params, $data);
} else {
  include '../layout.php';
} ?>