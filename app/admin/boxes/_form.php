<?php include '../../partials/errors.php'; ?>

<form id="form" class="form-horizontal" action="#" onsubmit="return submitForm();" method="POST" enctype="multipart/form-data">

  <input type="hidden" name="id">

  <div>
    <label for="name"><?= t('name') ?></label>
    <input id="name" name="name" type="text">
  </div>

  <div>
    <label for="image_url"><?= t('image_url') ?></label>
    <input id="image_url" name="image_url" type="text">
    <input id="image_file" name="image_file" type="file">
  </div>

  <div>
    <label for="link_url"><?= t('link_url') ?></label>
    <input id="link_url" name="link_url" type="text">
  </div>

  <div>
    <label for="begins_at"><?= t('begins_at') ?></label>
    <input id="begins_at" name="begins_at" type="datetime-local">
  </div>

  <div>
    <label for="ends_at"><?= t('ends_at') ?></label>
    <input id="ends_at" name="ends_at" type="datetime-local">
  </div>

  <div>
    <label for="is_active"><?= t('is_active') ?></label>
    <input type="hidden" name="is_active">
    <input id="is_active" type="checkbox" name="is_active">
  </div>

    <div class="modal-footer">
      <button type="button" class="btn btn-default" data-dismiss="modal"><?= t('close') ?></button>
      <button type="submit" class="btn btn-primary"><?= t('save') ?></button>
    </div>

</form>
