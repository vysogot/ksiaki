<?php include '../../partials/errors.php'; ?>

<form id="contest" action="<?= $params['form_action'] ?>" method="post">

  <input type="hidden" name="id" value="<?= $data->id ?>" />

  <div>
    <label for="name"><?= t('contest_name') ?></label>
    <input id="name" name="name" type="text" value="<?= $data->name ?>">
  </div>

  <div>
    <label for="description"><?= t('description') ?></label>
    <textarea id="description" name="description"><?= $data->description ?></textarea>
  </div>

  <div>
    <label for="box_url"><?= t('box_url') ?></label>
    <input id="box_url" name="box_url" type="text" value="<?= $data->box_url ?>">
    <input id="box_file" name="box_file" type="file">
  </div>

  <div>
    <label for="header_url"><?= t('header_url') ?></label>
    <input id="header_url" name="header_url" type="text" value="<?= $data->header_url ?>">
    <input id="header_file" name="header_file" type="file">
  </div>

  <div>
    <label for="begins_at"><?= t('begins_at') ?></label>
    <input id="begins_at" name="begins_at" type="datetime-local" value="<?= form_date($data->begins_at) ?>">
  </div>

  <div>
    <label for="ends_at"><?= t('ends_at') ?></label>
    <input id="ends_at" name="ends_at" type="datetime-local" value="<?= form_date($data->ends_at) ?>">
  </div>

  <div>
    <label for="game_id"><?= t('game') ?></label>
    <select id="game_id" name="game_id">
      <option value="1">Gra 1</option>
      <option value="2">Gra 2</option>
    </select>
  </div>

  <div>
    <label><?= t('contest_type') ?></label>
    <input type="hidden" name="contest_type_id" value="0">
    <label><?= t('normal') ?></label>
    <input type="radio" name="contest_type_id" value="1" <?php if ($data->contest_type_id == 1) echo "checked" ?> >
    <label><?= t('special') ?></label>
    <input type="radio" name="contest_type_id" value="2" <?php if ($data->contest_type_id == 2) echo "checked" ?> >
  </div>

  <div>
    <label for="display_ad"><?= t('display_ad') ?></label>
    <input type="hidden" name="display_ad" value="0">
    <input id="display_ad" type="checkbox" name="display_ad" value="1" <?php if ($data->display_ad == 1) echo "checked" ?> >
  </div>

  <div>
    <label for="is_active"><?= t('is_active') ?></label>
    <input type="hidden" name="is_active" value="0">
    <input id="is_active" type="checkbox" name="is_active" value="1" <?php if ($data->is_active == 1) echo "checked" ?> >
  </div>

</form>

<button type="submit" form="contest" value="Wyślij">Wyślij</button>
