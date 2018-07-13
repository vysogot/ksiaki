<?php

    include '../init.php';

    $hero_editions = fetch_all('call sp_hero_editions_all();');
    $hero_file_types = fetch_all('call sp_hero_file_types_all();');

?>

<form id="form" class="form-horizontal" action="#" method="POST" enctype="multipart/form-data">

    <?= csrf_field() ?>

    <input type="hidden" name="id">
    <input type="hidden" name="row_index" value="">

    <div class="col-sm-12">
        <div class="modal-body">

            <div class="col-sm-6">
                <div class='form-group'>
                    <label class="control-label col-sm-4" for="name">
                        <?= t('the_name') ?>
                    </label>
                    <div class="col-sm-8">
                        <div class='input-group'>
                            <input class="form-control" id="name" name="name" type="text" required>
                            <div class='input-group-addon'><i class='glyphicon glyphicon-pencil'></i></div>
                        </div>
                    </div>
                </div>

                <div class='form-group'>
                    <label class="control-label col-sm-4" for="hero_edition_id">
                        <?= t('hero_edition') ?>
                    </label>
                    <div class="col-sm-8">
                        <div class='input-group'>
                            <select class="form-control" id="hero_edition_id" name="hero_edition_id">
                                <?php foreach($hero_editions as $hero_edition) { ?>
                                    <option value="<?= $hero_edition->id ?>"><?= $hero_edition->name ?></option>
                                <?php } ?>
                            </select>
                            <div class='input-group-addon'><i class='glyphicon glyphicon-list'></i></div>
                        </div>
                    </div>
                </div>

                <div class='form-group'>
                    <label class="control-label col-sm-4" for="name">
                        <?= t('hero_file_type') ?>
                    </label>
                    <div class="col-sm-8">
                        <div class='input-group'>
                            <select class="form-control" id="hero_file_type_id" name="hero_file_type_id">
                                <?php foreach($hero_file_types as $file_type) { ?>
                                    <option value="<?= $file_type->id ?>"><?= t($file_type->name) ?></option>
                                <?php } ?>
                            </select>
                            <div class='input-group-addon'><i class='glyphicon glyphicon-list'></i></div>
                        </div>
                    </div>
                </div>

                <div class='form-group'>
                    <label class="control-label col-sm-4" for="file_url">
                        <?= t('file_url') ?>
                    </label>
                    <div class="col-sm-8">
                        <div class='input-group'>
                            <input class="form-control" id="file_url" name="file_url" type="text">
                            <div class='input-group-addon'><i class='glyphicon glyphicon-picture'></i></div>
                        </div>
                        <input id="actual_file" name="actual_file" type="file">
                    </div>
                </div>
            </div>

            <div class="col-sm-6">

                <div class='form-group'>
                    <label class="control-label col-sm-4" for="description">
                        <?= t('description') ?>
                    </label>
                    <div class="col-sm-8">
                        <textarea id="description" name="description"></textarea>
                    </div>
                </div>

                <div class='form-group'>
                    <label class="control-label col-sm-4" for="is_active">
                        <?= t('is_active') ?>
                    </label>
                    <div class="col-sm-8">
                        <div class='input-group'>
                            <input type="hidden" name="is_active" value="0">
                            <input name="is_active" class="form-check-input" type="checkbox" value="1">
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <div class="modal-footer clear">
            <button type="button" class="btn btn-default" data-dismiss="modal">
                <?= t('close') ?>
            </button>
            <button type="submit" class="btn btn-primary">
                <?= t('save') ?>
            </button>
        </div>

    </div>
</form>
