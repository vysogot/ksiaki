<?php require '../../partials/errors.php'; ?>

<form id="contest" action="<?= $params['form_action'] ?>" method="post">
  <input type="hidden" name="id" value="<?= $data->id ?>" />
  <input name="name" placeholder="Nazwa konkursu" type="text" value="<?= $data->name ?>"><br />
  <textarea name="description" placeholder="this text will show in the textarea"><?= $data->description ?></textarea> <br />
  <input name="banner_url" placeholder="Plik baneru" type="file"><br />
  <input name="begins_at" placeholder="Początek" type="datetime-local" value="<?= strftime('%Y-%m-%dT%H:%M:%S',strtotime($data->begins_at)) ?>"><br />
  <input name="ends_at" placeholder="Koniec" type="datetime-local" value="<?= strftime('%Y-%m-%dT%H:%M:%S',strtotime($data->ends_at)) ?>"><br />
  <select name="game_id">
    <option value="1">Gra 1</option>
    <option value="2">Gra 2</option>
  </select><br />
  <label>Rodzaj konkursu</label><br/>
  <input type="hidden" name="contest_type_id" value="0">
  <label>Normalny
    <input type="radio" name="contest_type_id" value="1" <?php if ($data->contest_type_id == 1) echo "checked" ?> >
    </label><br>
    <label>Specjalny
    <input type="radio" name="contest_type_id" value="2" <?php if ($data->contest_type_id == 2) echo "checked" ?> >
  </label><br>
  <label>Wyświetl reklamę przed</label>
  <input type="hidden" name="display_ad" value="0">
  <input type="checkbox" name="display_ad" value="1" <?php if ($data->display_ad == 1) echo "checked" ?> >
</form>
<button type="submit" form="contest" value="Wyślij">Wyślij</button>
