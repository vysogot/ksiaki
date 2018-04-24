<?php include '../../partials/errors.php'; ?>

<form id="hero" action="<?= $params['form_action'] ?>" method="post" enctype="multipart/form-data">

  <input type="hidden" name="id" value="<?= $data->id ?>" />

  <div>
    <label for="role_id"><?= t('role') ?></label>
    <select id="role_id" name="role_id">
      <option value="1">Gracz</option>
      <option value="2">Admin</option>
    </select>
  </div>

  <div>
    <label for="name"><?= t('name') ?></label>
    <input id="name" name="name" type="text" value="<?= $data->name ?>">
  </div>

  <div>
    <label for="email"><?= t('email') ?></label>
    <input type="email" id="email" name="email" value="<?= $data->email ?>">
  </div>

  <div>
    <label for="avatar_url"><?= t('avatar_url') ?></label>
    <input id="avatar_url" name="avatar_url" type="text" value="<?= $data->avatar_url ?>">
    <input id="avatar_file" name="avatar_file" type="file">
  </div>

  <div>
    <label for="is_active"><?= t('is_active') ?></label>
    <input type="hidden" name="is_active" value="0">
    <input id="is_active" type="checkbox" name="is_active" value="1" <?php if ($data->is_active == 1) echo "checked" ?> >
  </div>

  <input id="password" type="password" placeholder="<?= t('password') ?>" name="password" />

</form>

<button type="submit" form="hero" value="Wyślij">Wyślij</button>
