<?php include '../init.php'; ?>

<form id="form" class="form-horizontal" action="#" method="POST" enctype="multipart/form-data">

    <?= csrf_field() ?>

    <input type="hidden" name="id" value="">
    <input type="hidden" name="row_index" value="">

    <div class="col-sm-12">
        <div class="modal-body">

            <div class="col-sm-6">
                <div class='form-group'>
                    <label class="control-label col-sm-4" for="name">
                        <?= t('name') ?>
                    </label>
                    <div class="col-sm-8">
                        <div class='input-group'>
                            <input class="form-control" id="name" name="name" type="text">
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
                    <label class="control-label col-sm-4" for="avatar_url">
                        <?= t('avatar_url') ?>
                    </label>
                    <div class="col-sm-8">
                        <div class='input-group'>
                            <input class="form-control" id="avatar_url" name="avatar_url" type="text">
                            <div class='input-group-addon'><i class='glyphicon glyphicon-picture'></i></div>
                        </div>
                        <input id="avatar_file" name="avatar_file" type="file" class="form-control-file">
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
                        <input id="header_file" name="header_file" type="file" class="form-control-file">
                    </div>
                </div>

                <div class='form-group'>
                    <label class="control-label col-sm-4" for="footer_url">
                        <?= t('footer_url') ?>
                    </label>
                    <div class="col-sm-8">
                        <div class='input-group'>
                            <input class="form-control" id="footer_url" name="footer_url" type="text">
                            <div class='input-group-addon'><i class='glyphicon glyphicon-file'></i></div>
                        </div>
                        <input id="footer_file" name="footer_file" type="file" class="form-control-file">
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
                    <label class="control-label col-sm-4" for="license_description">
                        <?= t('license_description') ?>
                    </label>
                    <div class="col-sm-8">
                        <textarea id="license_description" name="license_description"></textarea>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-4" for="is_active">
                        <?= t('is_active') ?>
                    </label>
                    <input type="hidden" name="is_active" value="0">
                    <input name="is_active" class="form-check-input" type="checkbox" value="1">
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
