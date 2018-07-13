<?php

    include '../init.php';

    $contests = execute('call sp_contests_all();', [], true);
    $sponsors = execute('call sp_sponsors_all();', [], true);

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
                    <label class="control-label col-sm-4" for="name">
                        <?= t('contest') ?>
                    </label>
                    <div class="col-sm-8">
                        <div class='input-group'>
                            <select class="form-control" id="contest_id" name="contest_id">
                                <?php foreach($contests as $contest) { ?>
                                    <option value="<?= $contest->id ?>"><?= $contest->name ?></option>
                                <?php } ?>
                            </select>
                            <div class='input-group-addon'><i class='glyphicon glyphicon-list'></i></div>
                        </div>
                    </div>
                </div>

                <div class='form-group'>
                    <label class="control-label col-sm-4" for="name">
                        <?= t('sponsor') ?>
                    </label>
                    <div class="col-sm-8">
                        <div class='input-group'>
                            <select class="form-control" id="sponsor_id" name="sponsor_id">
                                <?php foreach($sponsors as $sponsor) { ?>
                                    <option value="<?= $sponsor->id ?>"><?= $sponsor->name ?></option>
                                <?php } ?>
                            </select>
                            <div class='input-group-addon'><i class='glyphicon glyphicon-list'></i></div>
                        </div>
                    </div>
                </div>

                <div class='form-group'>
                    <label class="control-label col-sm-4" for="video_url">
                        <?= t('image_url') ?>
                    </label>
                    <div class="col-sm-8">
                        <div class='input-group'>
                            <input class="form-control" id="image_url" name="image_url" type="text">
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
