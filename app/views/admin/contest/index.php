<div class="wrapper">
  <h2>Ustawienia konkursów</h2>
  <p><a href="/admin/contest/new">Dodaj konkurs</a></p>
  <table>
    <?php foreach($this->contests as $key => $contest) { ?>
      <tr>
        <td><?= e($contest->name) ?></td>
        <td><a href="/admin/contest/show/<?= $contest->id ?>">Pokaż</a></td>
        <td><a href="/admin/contest/edit/<?= $contest->id ?>">Edytuj</a></td>
        <td>
          <form id="<?= "contest-$contest->id" ?>" action="/admin/contest/destroy" method="post">
            <input type="hidden" name="id" value="<?= $contest->id ?>" />
            <button type="submit" class="confirmation" form="<?= "contest-$contest->id" ?>">Usuń</button>
          </form>
        </td>
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
