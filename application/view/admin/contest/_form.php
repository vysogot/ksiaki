<form action="create" method="post" id="createContest">
  <input name="contest_name" placeholder="Nazwa konkursu" type="text"><br />
  <textarea name="contest_description">
    Opis konkursu
  </textarea> <br />
  <input name="contest_banner_url" placeholder="Plik baneru" type="file"><br />
  <input name="contest_begins_at" placeholder="Początek" type="datetime-local"><br />
  <input name="contest_ends_at" placeholder="Koniec" type="datetime-local"><br />
  <select name="Gry">
    <option value="1">Gra 1</option>
    <option value="2">Gra 2</option>
  </select><br />
  <label>Rodzaj konkursu</label><br/>
  <label>Normalny
    <input type="radio" name="contest_contest_type_id" value="1">
    </label><br>
    <label>Specjalny
    <input type="radio" name="contest_contest_type_id" value="2">
  </label><br>
  <label>Wyświetl reklamę przed</label>
  <input type="checkbox" name="display_ad" value="true" checked>
</form>
<button type="submit" form="createContest" value="Wyślij">Wyślij</button>
