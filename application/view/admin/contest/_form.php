<form action="<?php echo Config::get('URL'); ?>AdminContest/update" method="post" id="createContest">
  <input type="hidden" name="contest_id" value="<?php echo $this->contest->id; ?>" />
  <input name="contest_name" placeholder="Nazwa konkursu" type="text" value="<?php echo $this->contest->name; ?>"><br />
  <textarea name="contest_description" placeholder="this text will show in the textarea"><?php echo $this->contest->description; ?></textarea> <br />
  <input name="contest_banner_url" placeholder="Plik baneru" type="file"><br />
  <input name="contest_begins_at" placeholder="Początek" type="datetime-local" value="<?php echo strftime('%Y-%m-%dT%H:%M:%S',strtotime($this->contest->begins_at)); ?>"><br />
  <input name="contest_ends_at" placeholder="Koniec" type="datetime-local" value="<?php echo strftime('%Y-%m-%dT%H:%M:%S',strtotime($this->contest->ends_at)); ?>"><br />
  <select name="Gry">
    <option value="1">Gra 1</option>
    <option value="2">Gra 2</option>
  </select><br />
  <label>Rodzaj konkursu</label><br/>
  <label>Normalny
    <input type="radio" name="contest_contest_type_id" value="1" <?php if ($this->contest->contest_type_id == 1) echo "checked";?> >
    </label><br>
    <label>Specjalny
    <input type="radio" name="contest_contest_type_id" value="2" <?php if ($this->contest->contest_type_id == 2) echo "checked";?> >
  </label><br>
  <label>Wyświetl reklamę przed</label>
  <input type="checkbox" name="display_ad" value="true" <?php if ($this->contest->display_ad == 1) echo "checked";?> >
</form>
<button type="submit" form="createContest" value="Wyślij">Wyślij</button>
