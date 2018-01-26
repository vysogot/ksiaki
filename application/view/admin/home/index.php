<div class="wrapper">
  <h2>Ustawienia strony głównej i tapet</h2>
  <h3>Ustawienia boxów</h3>
  <form action="updateBoxes" method="post" id="updateBoxes">
    <label>Pojedynczy box 2x2</label><br/>
    <input name="home_box[0]" placeholder="Box 2x2" type="file"><br />
    <label>Górny box 2x1</label><br/>
    <input name="home_box[1]" placeholder="Box 2x1" type="file"><br />
    <label>Dolny box 2x1</label><br/>
    <input name="home_box[2]" placeholder="Box 2x1" type="file"><br />
    <label>Lewy górny box 1x1</label><br/>
    <input name="home_box[3]" placeholder="Box 1x1" type="file"><br />
    <label>Prawy górny box 1x1</label><br/>
    <input name="home_box[4]" placeholder="Box 1x1" type="file"><br />
    <label>Lewy dolny box 1x1</label><br/>
    <input name="home_box[5]" placeholder="Box 1x1" type="file"><br />
    <label>Prawy dolny box 1x1</label><br/>
    <input name="home_box[6]" placeholder="Box 1x1" type="file"><br />
  </form>
  <button type="submit" form="updateBoxes" value="Wyślij">Wyślij</button>

  <h3>Ustawienia tapet</h3>
  <form action="updateBackgrounds" method="post" id="updateBackgrounds">
    <label>Tapeta SG</label><br/>
    <input name="home_background[0][url]" placeholder="Tapeta SG" type="file"><br />
    <input name="home_background[0][link_url]" placeholder="Link url" type="text"><br />
    <label>Tapeta rotacyjna SG</label><br/>
    <input name="home_background[1][url]" placeholder="Tapeta rotacyjna SG" type="file"><br />
    <input name="home_background[1][link_url]" placeholder="Link url" type="text"><br />
  </form>
  <button type="submit" form="updateBackgrounds" value="Wyślij">Wyślij</button>
</div>
