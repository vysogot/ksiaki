<form id="form" class="form-horizontal" action="#" method="POST" enctype="multipart/form-data">

  <input type="hidden" name="id" value="">
  <input type="hidden" name="row_index" value="">
  <input type="hidden" name="is_active">

  <div class="col-sm-12">
    <div class="modal-body">

      <div class='form-group'>
        <label class="control-label col-sm-4" for="name"><?= t('name') ?></label>
        <div class="col-sm-8">
          <div class='input-group'>
            <input class="form-control" id="name" name="name" type="text" required>
            <div class='input-group-addon'><i class='glyphicon glyphicon-pencil'></i></div>
          </div>
        </div>
      </div>

      <div class='form-group'>
        <label class="control-label col-sm-4" for="image_url"><?= t('image_url') ?></label>
        <div class="col-sm-8">
          <div class='input-group'>
            <input class="form-control" id="image_url" name="image_url" type="text" required>
            <div class='input-group-addon'><i class='glyphicon glyphicon-picture'></i></div>
          </div>
          <input id="image_file" name="image_file" type="file">
        </div>
      </div>

      <div class='form-group'>
        <label class="control-label col-sm-4" for="link_url"><?= t('link_url') ?></label>
        <div class="col-sm-8">
          <div class='input-group'>
            <input class="form-control" id="link_url" name="link_url" type="text" required>
            <div class='input-group-addon'><i class='glyphicon glyphicon-link'></i></div>
          </div>
        </div>
      </div>

      <div class='form-group'>
        <label class="control-label col-sm-4" for="background_color"><?= t('background_color') ?></label>
        <div class="col-sm-8">
          <div class='input-group'>
            <input class="form-control" id="background_color" name="background_color" type="text" required>
            <div class='input-group-addon'><i class='glyphicon glyphicon-pencil'></i></div>
          </div>
        </div>
      </div>

      <div class='form-group'>
        <label class="control-label col-sm-4" for="details_color"><?= t('details_color') ?></label>
        <div class="col-sm-8">
          <div class='input-group'>
            <input class="form-control" id="details_color" name="details_color" type="text" required>
            <div class='input-group-addon'><i class='glyphicon glyphicon-pencil'></i></div>
          </div>
        </div>
      </div>

      <div class='form-group'>
        <label class="col-sm-4 control-label date" for="begins_at"><?= t('begins_at') ?></label>
        <div class="col-sm-8">
          <div id="begins_at" name="begins_at" class='input-group date'>
            <input name="begins_at" type="datetime-local" class='form-control'>
            <div class='input-group-addon'><i class='glyphicon glyphicon-calendar'></i></div>
          </div>
        </div>
      </div>

      <div class='form-group'>
        <label class="col-sm-4 control-label date" for="ends_at"><?= t('ends_at') ?></label>
        <div class="col-sm-8">
          <div id="ends_at" class='input-group date'>
            <input name="ends_at" type="datetime-local" class='form-control'>
            <div class='input-group-addon'><i class='glyphicon glyphicon-calendar'></i></div>
          </div>
        </div>
      </div>

      <div class='form-group'>
        <label class="control-label col-sm-4" for="is_active_check"><?= t('is_active') ?></label>
        <input id="is_active_check" class="form-check-input col-sm-1" type="checkbox">
      </div>
    </div>

    <div class="modal-footer">
      <button type="button" class="btn btn-default" data-dismiss="modal"><?= t('close') ?></button>
      <button type="submit" class="btn btn-primary"><?= t('save') ?></button>
    </div>

  </div>
</form>
