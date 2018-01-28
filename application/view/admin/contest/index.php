<div class="wrapper">
  <h2>Ustawienia konkursów</h2>
  <p><a href="/adminContest/prepare">Dodaj konkurs</a></p>
  <table>
    <tr>
      <td>Konkurs 1 <a href="/adminContest/edit">Edytuj</a> | <a href="/adminContest/destroy">Usuń</a></td>
    </tr>
    <tr>
      <td>Konkurs 2 Edytuj | Usuń</td>
    </tr>
    <tr>
      <td>Konkurs 3 Edytuj | Usuń</td>
    </tr>
  </table>
  <h3>Ustawienia tapet</h3>
  <form action="updateBackgrounds" method="post" id="updateBackgrounds">
    <label>Tapeta Konkursy</label><br/>
    <input name="contests_background[0][url]" placeholder="Tapeta Konkursy" type="file"><br />
    <input name="contests_background[0][link_url]" placeholder="Link url" type="text"><br />
    <label>Tapeta rotacyjna Konkursy</label><br/>
    <input name="contests_background[1][url]" placeholder="Tapeta rotacyjna Konkursy" type="file"><br />
    <input name="contests_background[1][link_url]" placeholder="Link url" type="text"><br />
  </form>
  <button type="submit" form="updateBackgrounds" value="Wyślij">Wyślij</button>
</div>
