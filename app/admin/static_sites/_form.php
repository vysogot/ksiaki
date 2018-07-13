<?php include '../init.php'; ?>

<form id="form" class="form-horizontal" action="#" method="POST" enctype="multipart/form-data">

    <?= csrf_field() ?>

    <input type="hidden" name="id" value="">
    <input type="hidden" name="row_index" value="">

    <div class="col-sm-12">
        <div class="modal-body">

            <div class="col-sm-6">
                <div class='form-group'>
                    <label class="control-label col-sm-4" for="title">
                        <?= t('title') ?>
                    </label>
                    <div class="col-sm-8">
                        <div class='input-group'>
                            <input class="form-control" id="title" name="title" type="text">
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

                <div class="form-group">
                    <label class="control-label col-sm-4" for="is_active">
                        <?= t('is_active') ?>
                    </label>
                    <input type="hidden" name="is_active" value="0">
                    <input name="is_active" class="form-check-input" type="checkbox" value="1">
                </div>

            </div>

            <div class="col-sm-12">

                <div class='form-group'>
                    <label class="control-label col-sm-2" for="content">
                        <?= t('content') ?>
                    </label>
                    <div class="col-sm-10">
                        <textarea id="content" name="content" style="width:100%; height: 300px;"></textarea>
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

