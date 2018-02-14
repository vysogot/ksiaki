<div class="wrapper">
  <h2>Ustawienia konkursów</h2>
  <p><a href="/adminContest/prepare">Dodaj konkurs</a></p>
  <table>
    <?php foreach($this->contests as $key => $contest) { ?>
      <tr>
        <td><?php echo $contest->name; ?></td>
        <td><a href="/adminContest/show/<?php echo $contest->id ?>">Pokaż</a></td>
        <td><a href="/adminContest/edit/<?php echo $contest->id ?>">Edytuj</a></td>
        <td><a href="/adminContest/destroy/<?php echo $contest->id ?>" class="confirmation">Usuń</a></td>
      </tr>
    <?php } ?>
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
