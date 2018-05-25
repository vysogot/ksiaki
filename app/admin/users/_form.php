<form id="form" class="form-horizontal" action="#" onsubmit="return submitForm();" method="POST" enctype="multipart/form-data">

  <input type="hidden" name="id" value="">
  <input type="hidden" name="is_active">

  <div class="col-sm-12">
    <div class="modal-body">

  <div>
    <label for="role_id"><?= t('role') ?></label>
    <select id="role_id" name="role_id">
      <option value="1">Gracz</option>
      <option value="2">Admin</option>
    </select>
  </div>

  <div>
    <label for="name"><?= t('name') ?></label>
    <input id="name" name="name" type="text">
  </div>

  <div>
    <label for="email"><?= t('email') ?></label>
    <input type="email" id="email" name="email">
  </div>

  <div>
    <label for="avatar_url"><?= t('avatar_url') ?></label>
    <input id="avatar_url" name="avatar_url" type="text">
    <input id="avatar_file" name="avatar_file" type="file">
  </div>

  <div>
    <label for="is_active_check"><?= t('is_active') ?></label>
    <input id="is_active_check" type="checkbox" name="is_active_check" >
  </div>

  <input id="password" type="password" placeholder="<?= t('password') ?>" name="password" />

</div>
<div style="clear:both;"></div>

<div class="modal-footer">
  <button type="button" class="btn btn-default" data-dismiss="modal"><?= t('close') ?></button>
  <button type="submit" class="btn btn-primary"><?= t('save') ?></button>
</div>
</div>

</form>
