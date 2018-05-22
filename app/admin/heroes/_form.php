<form id="hero-form" class="form-horizontal" action="#" onsubmit="return submitForm();" method="POST" enctype="multipart/form-data">

  <input type="hidden" name="id" value="">
  <input type="hidden" name="row_index" value="">
  <input type="hidden" name="is_active">

  <div class="col-sm-12">
    <div class="modal-body">
      <div class='form-group'>
          <label class="control-label col-sm-4" for="name"><?= t('name') ?></label>
          <input class="col-sm-8" id="name" name="name" type="text">
      </div>
      <div class='form-group'>
          <label class="control-label col-sm-4" for="slug"><?= t('slug') ?></label>
          <input class="col-sm-8" id="slug" name="slug" type="text">
      </div>
      <div class='form-group'>
          <label class="control-label col-sm-4" for="description"><?= t('description') ?></label>
          <textarea id="description" class="col-sm-8" name="description" rows="3"></textarea>
      </div>
      <div class='form-group'>
          <label class="control-label col-sm-4" for="avatar_url"><?= t('avatar_url') ?></label>
          <input class="col-sm-8" id="avatar_url" name="avatar_url" type="text">
          <input id="avatar_file" name="avatar_file" type="file" class="form-control-file">
      </div>
      <div class='form-group'>
          <label class="control-label col-sm-4" for="header_url"><?= t('header_url') ?></label>
          <input class="col-sm-8" id="header_url" name="header_url" type="text">
          <input id="header_file" name="header_file" type="file" class="form-control-file">
      </div>
      <div class='form-group'>
          <label class="control-label col-sm-4" for="cover_url"><?= t('cover_url') ?></label>
          <input class="col-sm-8" id="cover_url" name="cover_url" type="text">
          <input id="cover_file" name="cover_file" type="file" class="form-control-file">
      </div>
      <div class='form-group'>
          <label class="control-label col-sm-4" for="video_url"><?= t('video_url') ?></label>
          <input class="col-sm-8" id="video_url" name="video_url" type="text">
          <input id="video_file" name="video_file" type="file" class="form-control-file">
      </div>
      <div class='form-group'>
          <label class="control-label col-sm-4" for="gadget_url"><?= t('gadget_url') ?></label>
          <input class="col-sm-8" id="gadget_url" name="gadget_url" type="text">
          <input id="gadget_file" name="gadget_file" type="file" class="form-control-file">
      </div>
      <div class='form-group'>
          <label class="control-label col-sm-4" for="footer_url"><?= t('footer_url') ?></label>
          <input class="col-sm-8" id="footer_url" name="footer_url" type="text">
          <input id="footer_file" name="footer_file" type="file" class="form-control-file">
      </div>
      <div class='form-group'>
          <label class="control-label col-sm-4" for="license_description"><?= t('license_description') ?></label>
          <textarea id="license_description" class="col-sm-8" name="license_description" rows="3"></textarea>
      </div>
      <div class="form-group">
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
