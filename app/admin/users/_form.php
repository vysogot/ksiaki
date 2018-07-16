<?php

include '../init.php';

$roles = fetch_all('call sp_roles_all();');

?>

<form id="form" class="form-horizontal" action="#" method="POST" enctype="multipart/form-data">

    <?= csrf_field() ?>

    <input type="hidden" name="id" value="">
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
                            <input class="form-control" name="name" type="text">
                            <div class='input-group-addon'><i class='glyphicon glyphicon-pencil'></i></div>
                        </div>
                    </div>
                </div>

                <div class='form-group'>
                    <label class="control-label col-sm-4" for="surname">
                        <?= t('surname') ?>
                    </label>
                    <div class="col-sm-8">
                        <div class='input-group'>
                            <input class="form-control" name="surname" type="text">
                            <div class='input-group-addon'><i class='glyphicon glyphicon-pencil'></i></div>
                        </div>
                    </div>
                </div>

                <div class='form-group'>
                    <label class="control-label col-sm-4" for="gender">
                        <?= t('gender') ?>
                    </label>
                    <div class="col-sm-4">
                        <label class="radio-inline"><?= t('male') ?></label>
                        <input type="radio" name="gender" value="1" />
                    </div>
                    <div class="col-sm-4">
                        <label class="radio-inline"><?= t('female') ?></label>
                        <input type="radio" name="gender" value="0" />
                    </div>
                </div>

                <div class='form-group'>
                    <label class="control-label col-sm-4" for="address">
                        <?= t('address') ?>
                    </label>
                    <div class="col-sm-8">
                        <div class='input-group'>
                            <input class="form-control" name="address" type="text">
                            <div class='input-group-addon'><i class='glyphicon glyphicon-pencil'></i></div>
                        </div>
                    </div>
                </div>

                <div class='form-group'>
                    <label class="control-label col-sm-4" for="postcode">
                        <?= t('postcode') ?>
                    </label>
                    <div class="col-sm-8">
                        <div class='input-group'>
                            <input class="form-control" name="postcode" type="text">
                            <div class='input-group-addon'><i class='glyphicon glyphicon-pencil'></i></div>
                        </div>
                    </div>
                </div>

                <div class='form-group'>
                    <label class="control-label col-sm-4" for="city">
                        <?= t('city') ?>
                    </label>
                    <div class="col-sm-8">
                        <div class='input-group'>
                            <input class="form-control" name="city" type="text">
                            <div class='input-group-addon'><i class='glyphicon glyphicon-pencil'></i></div>
                        </div>
                    </div>
                </div>

                <div class='form-group'>
                    <label class="control-label col-sm-4" for="birthday">
                        <?= t('birthday') ?>
                    </label>
                    <div class="col-sm-8">
                        <div class='input-group'>
                            <input class="form-control" name="birthday" type="date" step="1">
                            <div class='input-group-addon'><i class='glyphicon glyphicon-calendar'></i></div>
                        </div>
                    </div>
                </div>

                <div class='form-group'>
                    <label class="control-label col-sm-4" for="nick">
                        <?= t('nick') ?>
                    </label>
                    <div class="col-sm-8">
                        <div class='input-group'>
                            <input class="form-control" name="nick" type="text">
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
                            <select class="form-control" name="role_id">
                                <?php foreach($roles as $role) { ?>
                                    <option value="<?= $role->id ?>"><?= $role->name ?></option>
                                <?php } ?>
                            </select>
                            <div class='input-group-addon'><i class='glyphicon glyphicon-list'></i></div>
                        </div>
                    </div>
                </div>

                <div class='form-group'>
                    <label class="control-label col-sm-4" for="email">
                        <?= t('email') ?>
                    </label>
                    <div class="col-sm-8">
                        <div class='input-group'>
                            <input class="form-control" type="email" name="email">
                            <div class='input-group-addon'><i class='glyphicon glyphicon-pencil'></i></div>
                        </div>
                    </div>
                </div>

                <div class='form-group'>
                    <label class="control-label col-sm-4" for="password">
                        <?= t('password') ?>
                    </label>
                    <div class="col-sm-8">
                        <div class='input-group'>
                            <input class="form-control" name="password" type="password" />
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
                            <input class="form-control" name="avatar_url" type="text">
                            <div class='input-group-addon'><i class='glyphicon glyphicon-picture'></i></div>
                        </div>
                        <input name="avatar_file" type="file" class="form-control-file">
                    </div>
                </div>

                <div class="form-group">
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

            <div class="col-sm-6">

                <div class='form-group'>
                    <label class="control-label col-sm-4" for="caretaker_name">
                        <?= t('admin_caretaker_name') ?>
                    </label>
                    <div class="col-sm-8">
                        <div class='input-group'>
                            <input class="form-control" name="caretaker_name" type="text">
                            <div class='input-group-addon'><i class='glyphicon glyphicon-pencil'></i></div>
                        </div>
                    </div>
                </div>

                <div class='form-group'>
                    <label class="control-label col-sm-4" for="caretaker_surname">
                        <?= t('admin_caretaker_surname') ?>
                    </label>
                    <div class="col-sm-8">
                        <div class='input-group'>
                            <input class="form-control" name="caretaker_surname" type="text">
                            <div class='input-group-addon'><i class='glyphicon glyphicon-pencil'></i></div>
                        </div>
                    </div>
                </div>

                <div class='form-group'>
                    <label class="control-label col-sm-4" for="caretaker_email">
                        <?= t('admin_caretaker_email') ?>
                    </label>
                    <div class="col-sm-8">
                        <div class='input-group'>
                            <input class="form-control" name="caretaker_email" type="text">
                            <div class='input-group-addon'><i class='glyphicon glyphicon-pencil'></i></div>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-4" for="caretaker_is_active">
                        <?= t('is_active') ?>
                    </label>
                    <div class="col-sm-8">
                        <div class='input-group'>
                            <input type="hidden" name="caretaker_is_active" value="0">
                            <input name="caretaker_is_active" class="form-check-input" type="checkbox" value="1">
                        </div>
                    </div>
                </div>

                <div class="panel panel-default">

                    <div class="panel-heading text-center">
                        <h4><?= t('admin_agreement') ?></h4>
                    </div>

                    <div class="panel-body">

                        <div class="form-group">
                            <label class="control-label col-sm-8 align-left" for="contest_agreement">
                                <?= t('admin_contest_agreement') ?>
                            </label>
                            <div class="col-sm-4">
                                <input type="hidden" name="contest_agreement" value="0">
                                <input name="contest_agreement" type="checkbox" name="contest_agreement" value="1"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label text-left col-sm-8 align-left" for="marketing_agreement">
                                <?= t('admin_marketing_agreement') ?>
                            </label>
                            <div class="col-sm-4">
                                <input type="hidden" name="marketing_agreement" value="0">
                                <input name="marketing_agreement" type="checkbox" name="marketing_agreement" value="1"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-sm-8 align-left" for="notifications_agreement">
                                <?= t('admin_notifications_agreement') ?>
                            </label>
                            <div class="col-sm-4">
                                <input type="hidden" name="notifications_agreement" value="0">
                                <input name="notifications_agreement" type="checkbox" name="notifications_agreement" value="1"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-sm-8 align-left" for="statute_agreement">
                                <?= t('admin_statute_agreement') ?>
                            </label>
                            <div class="col-sm-4">
                                <input type="hidden" name="statute_agreement" value="0">
                                <input name="statute_agreement" type="checkbox" name="statute_agreement" value="1"/>
                            </div>
                        </div>

                    </div>

                </div>

                <div class="form-group">
                    <label class="control-label col-sm-4">
                        <?= t('updated_at') ?>
                    </label>
                    <div class="col-sm-8">
                        <p id="updated_at"></p>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-4">
                        <?= t('updated_by') ?>
                    </label>
                    <div class="col-sm-8">
                        <p id="updated_by"></p>
                    </div>
                </div>
            </div>

            <div class="modal-footer clear">
                <button type="button" class="btn btn-default" data-dismiss="modal">
                    <?= t('close') ?>
                </button>

                <?php if (is_admin()) { ?>
                    <button type="submit" class="btn btn-primary">
                        <?= t('save') ?>
                    </button>
                <?php } ?>
            </div>

        </div>
    </div>

</form>
