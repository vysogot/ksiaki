<?php

include 'init.php';

function content($params, $data) { ?>

<div class="wrapper">
  <h2>Strona nie została odnaleziona</h2>
  <p>Zostaliśmy poinformowani o tym, że czegoś szukasz, ale nie możesz znaleźć... Może sprawdź w <?= link_to('konkursach', '/konkursy') ?>?</p>
</div>

<?php }

include 'layout.php';
