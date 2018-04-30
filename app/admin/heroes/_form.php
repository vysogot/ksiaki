<?php include '../../partials/errors.php'; ?>

<form id="hero" action="<?= $params['form_action'] ?>" method="post" enctype="multipart/form-data">

  <input type="hidden" name="id" value="<?= $data->id ?>" />

  <div>
    <label for="name"><?= t('name') ?></label>
    <input id="name" name="name" type="text" value="<?= $data->name ?>">
  </div>

  <div>
    <label for="slug"><?= t('slug') ?></label>
    <input id="slug" name="slug" type="text" value="<?= $data->slug ?>">
  </div>

  <div>
    <label for="description"><?= t('description') ?></label>
    <textarea id="description" name="description"><?= $data->description ?></textarea>
  </div>

  <div>
    <label for="avatar_url"><?= t('avatar_url') ?></label>
    <input id="avatar_url" name="avatar_url" type="text" value="<?= $data->avatar_url ?>">
    <input id="avatar_file" name="avatar_file" type="file">
  </div>

  <div>
    <label for="header_url"><?= t('header_url') ?></label>
    <input id="header_url" name="header_url" type="text" value="<?= $data->header_url ?>">
    <input id="header_file" name="header_file" type="file">
  </div>

  <div>
    <label for="is_active"><?= t('is_active') ?></label>
    <input type="hidden" name="is_active" value="0">
    <input id="is_active" type="checkbox" name="is_active" value="1" <?php if ($data->is_active == 1) echo "checked" ?> >
  </div>

</form>

<button type="submit" form="hero" value="Wyślij">Wyślij</button>
