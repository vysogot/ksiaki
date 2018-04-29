<?php include '../../partials/errors.php'; ?>

<form id="static_site" action="<?= $params['form_action'] ?>" method="post" enctype="multipart/form-data">

  <input type="hidden" name="id" value="<?= $data->id ?>" />

  <div>
    <label for="title"><?= t('static_site_title') ?></label>
    <input id="title" name="title" type="text" value="<?= $data->title ?>">
  </div>

  <div>
    <label for="slug"><?= t('slug') ?></label>
    <input id="slug" name="slug" type="text" value="<?= $data->slug ?>">
  </div>

  <div>
    <label for="content"><?= t('content') ?></label>
    <textarea id="content" name="content" type="text"><?= $data->content ?>"</textarea>
  </div>

  <div>
    <label for="is_active"><?= t('is_active') ?></label>
    <input type="hidden" name="is_active" value="0">
    <input id="is_active" type="checkstatic_site" name="is_active" value="1" <?php if ($data->is_active == 1) echo "checked" ?> >
  </div>

</form>

<button type="submit" form="static_site" value="Wyślij">Wyślij</button>
