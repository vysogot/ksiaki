<?php include '../../partials/errors.php'; ?>

<form id="user_movie" action="<?= $params['form_action'] ?>" method="post" enctype="multipart/form-data">

  <input type="hidden" name="id" value="<?= $data->id ?>" />

  <div>
    <label for="user_id"><?= t('user_id') ?></label>
    <input id="user_id" name="user_id" type="text" value="<?= $data->user_id ?>">
  </div>

  <div>
    <label for="name"><?= t('name') ?></label>
    <input id="name" name="name" type="text" value="<?= $data->name ?>">
  </div>

  <div>
    <label for="video_url"><?= t('video_url') ?></label>
    <input id="video_url" name="video_url" type="text" value="<?= $data->video_url ?>">
    <input id="video_file" name="video_file" type="file">
  </div>

  <div>
    <label for="image_url"><?= t('image_url') ?></label>
    <input id="image_url" name="image_url" type="text" value="<?= $data->image_url ?>">
    <input id="image_file" name="image_file" type="file">
  </div>

  <div>
    <label for="link_url"><?= t('link_url') ?></label>
    <input id="link_url" name="link_url" type="text" value="<?= $data->link_url ?>">
  </div>

  <div>
    <label for="begins_at"><?= t('begins_at') ?></label>
    <input id="begins_at" name="begins_at" type="datetime-local" value="<?= strftime('%Y-%m-%dT%H:%M:%S',strtotime($data->begins_at)) ?>">
  </div>

  <div>
    <label for="ends_at"><?= t('ends_at') ?></label>
    <input id="ends_at" name="ends_at" type="datetime-local" value="<?= strftime('%Y-%m-%dT%H:%M:%S',strtotime($data->ends_at)) ?>">
  </div>

  <div>
    <label for="is_active"><?= t('is_active') ?></label>
    <input type="hidden" name="is_active" value="0">
    <input id="is_active" type="checkuser_movie" name="is_active" value="1" <?php if ($data->is_active == 1) echo "checked" ?> >
  </div>

</form>

<button type="submit" form="user_movie" value="Wyślij">Wyślij</button>
