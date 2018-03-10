<?php

require '../init.php';

$params = [
  'active_link' => 'contests'
];

function content($params, $data) { ?>

<div class="wrapper center">
  <section id="preroll">
    <video controls>
      <source src="https://pubads.g.doubleclick.net/gampad/ads?sz=640x480&iu=/16222663/konkursiaki.pl/video/pre-roll&impl=s&gdfp_req=1&env=vp&output=vast&unviewed_position_start=1&url=http://ksiaki.rall.pl/contest/preroll&desc_url=http://ksiaki.rall.pl/contest/preroll&correlator=1516366760" />
    </video>
  </section>
  <h2 class="center"><a href="/contests/play.php">Graj</a></h2>
</div>

<?php }

require '../layout.php';
