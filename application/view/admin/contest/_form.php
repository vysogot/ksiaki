<?php
  $actionUrl = Config::get('URL') . "AdminContest/";

  if ($this->contest->id == 0) {
    $actionUrl .= "create";
  } else {
    $actionUrl .= "update/" . $this->contest->id;
  }
?>

<form action="<?php echo $actionUrl; ?>" method="post" id="createContest">
  <input type="hidden" name="id" value="<?php echo $this->contest->id; ?>" />
  <input name="name" placeholder="Nazwa konkursu" type="text" value="<?php echo $this->contest->name; ?>"><br />
  <textarea name="description" placeholder="this text will show in the textarea"><?php echo $this->contest->description; ?></textarea> <br />
  <input name="banner_url" placeholder="Plik baneru" type="file"><br />
  <input name="begins_at" placeholder="Początek" type="datetime-local" value="<?php echo strftime('%Y-%m-%dT%H:%M:%S',strtotime($this->contest->begins_at)); ?>"><br />
  <input name="ends_at" placeholder="Koniec" type="datetime-local" value="<?php echo strftime('%Y-%m-%dT%H:%M:%S',strtotime($this->contest->ends_at)); ?>"><br />
  <select name="game_id">
    <option value="1">Gra 1</option>
    <option value="2">Gra 2</option>
  </select><br />
  <label>Rodzaj konkursu</label><br/>
  <label>Normalny
    <input type="radio" name="contest_type_id" value="1" <?php if ($this->contest->contest_type_id == 1) echo "checked";?> >
    </label><br>
    <label>Specjalny
    <input type="radio" name="contest_type_id" value="2" <?php if ($this->contest->contest_type_id == 2) echo "checked";?> >
  </label><br>
  <label>Wyświetl reklamę przed</label>
  <input type="hidden" name="display_ad" value="0">
  <input type="checkbox" name="display_ad" value="1" <?php if ($this->contest->display_ad == 1) echo "checked";?> >
</form>
<button type="submit" form="createContest" value="Wyślij">Wyślij</button>
