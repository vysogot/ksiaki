<?php

include '../init.php';

$games = execute('call sp_games_all();', [], true);

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
                        <?= t('contest_name') ?>
                    </label>
                    <div class="col-sm-8">
                        <div class='input-group'>
                            <input class="form-control" id="name" name="name" type="text" required>
                            <div class='input-group-addon'><i class='glyphicon glyphicon-pencil'></i></div>
                        </div>
                    </div>
                </div>

                <div class='form-group'>
                    <label class="control-label col-sm-4" for="slug">
                        <?= t('slug') ?>
                    </label>
                    <div class="col-sm-8">
                        <div class='input-group'>
                            <input class="form-control" id="slug" name="slug" type="text">
                            <div class='input-group-addon'><i class='glyphicon glyphicon-pencil'></i></div>
                        </div>
                    </div>
                </div>

                <div class='form-group'>
                    <label class="control-label col-sm-4" for="box_url">
                        <?= t('box_url') ?>
                    </label>
                    <div class="col-sm-8">
                        <div class='input-group'>
                            <input class="form-control" id="box_url" name="box_url" type="text">
                            <div class='input-group-addon'><i class='glyphicon glyphicon-picture'></i></div>
                        </div>
                        <input id="box_file" name="box_file" type="file">
                    </div>
                </div>

                <div class='form-group'>
                    <label class="control-label col-sm-4" for="header_url">
                        <?= t('header_url') ?>
                    </label>
                    <div class="col-sm-8">
                        <div class='input-group'>
                            <input class="form-control" id="header_url" name="header_url" type="text">
                            <div class='input-group-addon'><i class='glyphicon glyphicon-picture'></i></div>
                        </div>
                        <input id="header_file" name="header_file" type="file">
                    </div>
                </div>

                <div class='form-group'>
                    <label class="control-label col-sm-4" for="begins_at">
                        <?= t('begins_at') ?>
                    </label>
                    <div class="col-sm-8">
                        <div class='input-group'>
                            <input class="form-control" id="begins_at" name="begins_at" type="datetime-local" step="1" required>
                            <div class='input-group-addon'><i class='glyphicon glyphicon-calendar'></i></div>
                        </div>
                    </div>
                </div>

                <div class='form-group'>
                    <label class="control-label col-sm-4" for="ends_at">
                        <?= t('ends_at') ?>
                    </label>
                    <div class="col-sm-8">
                        <div class='input-group'>
                            <input class="form-control" id="ends_at" name="ends_at" type="datetime-local" step="1" required>
                            <div class='input-group-addon'><i class='glyphicon glyphicon-calendar'></i></div>
                        </div>
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
                    <label class="control-label col-sm-4" for="game_id">
                        <?= t('game') ?>
                    </label>
                    <div class="col-sm-8">
                        <div class='input-group'>
                            <select id="game_id" name="game_id">
                              <?php foreach($games as $game) { ?>
                                  <option value="<?= $game->id ?>"><?= t($game->name) ?></option>
                              <?php } ?>
                            </select>
                        </div>
                    </div>
                </div>

                <div class='form-group'>
                    <label class="control-label col-sm-4" for="contest_type_id">
                        <?= t('contest_type') ?>
                    </label>
                    <div class="col-sm-8">
                        <div class='input-group'>
                            <select id="contest_type_id" name="contest_type_id">
                                <option value="1">Normalny</option>
                                <option value="2">Specjalny</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class='form-group'>
                    <label class="control-label col-sm-4" for="display_ad">
                        <?= t('display_ad') ?>
                    </label>
                    <div class="col-sm-8">
                        <div class='input-group'>
                            <input type="hidden" name="display_ad" value="0">
                            <input name="display_ad" class="form-check-input" type="checkbox" value="1">
                        </div>
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

            <div class="col-sm-12">

                <div class='form-group'>
                    <label class="control-label col-sm-2" for="content">
                        <?= t('statute') ?>
                    </label>
                    <div class="col-sm-10">
                        <textarea id="statute" name="statute" style="width:100%; height: 300px;"></textarea>
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
