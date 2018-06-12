<form id="form" class="form-horizontal" action="#" method="POST" enctype="multipart/form-data">

    <?= csrf_field() ?>

    <input type="hidden" name="id">
    <input type="hidden" name="row_index" value="">
    <input type="hidden" name="is_active">

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
                    <label class="control-label col-sm-4" for="video_url">
                        <?= t('video_url') ?>
                    </label>
                    <div class="col-sm-8">
                        <div class='input-group'>
                            <input class="form-control" id="video_url" name="video_url" type="text">
                            <div class='input-group-addon'><i class='glyphicon glyphicon-video'></i></div>
                        </div>
                        <input id="video_file" name="video_file" type="file">
                    </div>
                </div>

                <div class='form-group'>
                    <label class="control-label col-sm-4" for="image_url">
                        <?= t('image_url') ?>
                    </label>
                    <div class="col-sm-8">
                        <div class='input-group'>
                            <input class="form-control" id="image_url" name="image_url" type="text">
                            <div class='input-group-addon'><i class='glyphicon glyphicon-picture'></i></div>
                        </div>
                        <input id="image_file" name="image_file" type="file">
                    </div>
                </div>

                <div class='form-group'>
                    <label class="control-label col-sm-4" for="link_url">
                        <?= t('link_url') ?>
                    </label>
                    <div class="col-sm-8">
                        <div class='input-group'>
                            <input class="form-control" id="link_url" name="link_url" type="text">
                            <div class='input-group-addon'><i class='glyphicon glyphicon-link'></i></div>
                        </div>
                    </div>
                </div>

                <div class='form-group'>
                    <label class="control-label col-sm-4" for="begins_at">
                        <?= t('begins_at') ?>
                    </label>
                    <div class="col-sm-8">
                        <div class='input-group'>
                            <input class="form-control" id="begins_at" name="begins_at" type="datetime-local">
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
                            <input class="form-control" id="ends_at" name="ends_at" type="datetime-local">
                            <div class='input-group-addon'><i class='glyphicon glyphicon-calendar'></i></div>
                        </div>
                    </div>
                </div>

                <div class='form-group'>
                    <label class="control-label col-sm-4" for="is_active">
                        <?= t('is_active') ?>
                    </label>
                    <div class="col-sm-8">
                        <div class='input-group'>
                            <input type="hidden" name="is_active_check">
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
