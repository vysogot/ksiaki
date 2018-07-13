<?php

    include '../init.php';

    $heroes = execute('call sp_heroes_all();', [], true);

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
                        <?= t('hero') ?>
                    </label>
                    <div class="col-sm-8">
                        <div class='input-group'>
                            <select class="form-control" id="hero_id" name="hero_id">
                                <?php foreach($heroes as $hero) { ?>
                                    <option value="<?= $hero->id ?>"><?= $hero->name ?></option>
                                <?php } ?>
                            </select>
                            <div class='input-group-addon'><i class='glyphicon glyphicon-list'></i></div>
                        </div>
                    </div>
                </div>

                <div class='form-group'>
                    <label class="control-label col-sm-4" for="cover_url">
                        <?= t('cover_url') ?>
                    </label>
                    <div class="col-sm-8">
                        <div class='input-group'>
                            <input class="form-control" id="cover_url" name="cover_url" type="text">
                            <div class='input-group-addon'><i class='glyphicon glyphicon-picture'></i></div>
                        </div>
                        <input id="cover_file" name="cover_file" type="file" class="form-control-file">
                    </div>
                </div>

                <div class='form-group'>
                    <label class="control-label col-sm-4" for="video_url">
                        <?= t('video_url') ?>
                    </label>
                    <div class="col-sm-8">
                        <div class='input-group'>
                            <input class="form-control" id="video_url" name="video_url" type="text">
                            <div class='input-group-addon'><i class='glyphicon glyphicon-facetime-video'></i></div>
                        </div>
                        <input id="video_file" name="video_file" type="file" class="form-control-file">
                    </div>
                </div>

                <div class='form-group'>
                    <label class="control-label col-sm-4" for="video_cover_url">
                        <?= t('video_cover_url') ?>
                    </label>
                    <div class="col-sm-8">
                        <div class='input-group'>
                            <input class="form-control" id="video_cover_url" name="video_cover_url" type="text">
                            <div class='input-group-addon'><i class='glyphicon glyphicon-facetime-video'></i></div>
                        </div>
                        <input id="video_cover_file" name="video_cover_file" type="file" class="form-control-file">
                    </div>
                </div>

                <div class='form-group'>
                    <label class="control-label col-sm-4" for="gadget_url">
                        <?= t('gadget_url') ?>
                    </label>
                    <div class="col-sm-8">
                        <div class='input-group'>
                            <input class="form-control" id="gadget_url" name="gadget_url" type="text">
                            <div class='input-group-addon'><i class='glyphicon glyphicon-file'></i></div>
                        </div>
                        <input id="gadget_file" name="gadget_file" type="file" class="form-control-file">
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
