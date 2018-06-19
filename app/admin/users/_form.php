<?php include '../init.php'; ?>

<form id="form" class="form-horizontal" action="#" method="POST" enctype="multipart/form-data">

    <?= csrf_field() ?>

    <input type="hidden" name="id" value="">
    <input type="hidden" name="is_active">
    <input type="hidden" name="row_index">

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
                    <label class="control-label col-sm-4" for="nick">
                        <?= t('nick') ?>
                    </label>
                    <div class="col-sm-8">
                        <div class='input-group'>
                            <input class="form-control" id="nick" name="nick" type="text">
                            <div class='input-group-addon'><i class='glyphicon glyphicon-pencil'></i></div>
                        </div>
                    </div>
                </div>

                <div class='form-group'>
                    <label class="control-label col-sm-4" for="name">
                        <?= t('role') ?>
                    </label>
                    <div class="col-sm-8">
                        <div class='input-group'>
                            <select class="form-control" id="role_id" name="role_id">
                                <option value="2">Gracz</option>
                                <option value="1">Admin</option>
                            </select>
                            <div class='input-group-addon'><i class='glyphicon glyphicon-list'></i></div>
                        </div>
                    </div>
                </div>

                <div class='form-group'>
                    <label class="control-label col-sm-4" for="name">
                        <?= t('email') ?>
                    </label>
                    <div class="col-sm-8">
                        <div class='input-group'>
                            <input class="form-control" type="email" id="email" name="email">
                            <div class='input-group-addon'><i class='glyphicon glyphicon-pencil'></i></div>
                        </div>
                    </div>
                </div>

                <div class='form-group'>
                    <label class="control-label col-sm-4" for="name">
                        <?= t('password') ?>
                    </label>
                    <div class="col-sm-8">
                        <div class='input-group'>
                            <input class="form-control" id="password" type="password" placeholder="<?= t('password') ?>" name="password" />
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

                <div class="form-group">
                    <label class="control-label col-sm-4" for="is_active_check">
                        <?= t('is_active') ?>
                    </label>
                    <div class="col-sm-8">
                        <div class='input-group'>
                            <input id="is_active_check" class="form-check-input" type="checkbox">
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
