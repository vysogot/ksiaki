<?php

require 'init.php';

$params = [
  'active_link' => 'downloads'
];

function content($params, $data) { ?>

<div class="wrapper">
<div id="download-page">
  <div class="left-sidebar">
    <div class="quiz">
      <h2>Quiz</h2>
      <h3>Włoskie miasto, słynne z krzywej wieży to:</h3>
      <ul>
        <li>Odpowiedź 1</li>
        <li>Odpowiedź 1</li>
        <li>Odpowiedź 1</li>
      </ul>
      <a href="#">Odpowiadam</a>
    </div>
  </div>

  <div class="main-area">
    <div class="download-section">
      <h2>Filmy</h2>
      <ul class="bare left">
        <li><div><img src="/assets/images/contest-single.jpg"><a href="/filmy/1">Cryptor</a></div></li>
        <li><div><img src="/assets/images/contest-single.jpg"><a href="/filmy/2">The story of Morro</a></div></li>
      </ul>
    </div>
    <div class="download-section">
      <h2>Tapety</h2>
      <ul class="bare left">
        <li><div><img src="/assets/images/contest-single.jpg"><a href="/tapety/1">Fanaberia</a></div></li>
        <li><div><img src="/assets/images/contest-single.jpg"><a href="/tapety/2">Energizer</a></div></li>
      </ul>
    </div>
  </div>

  <div class="right-sidebar">
    <img src="/assets/images/contest-ad.jpg">
  </div>
</div>
</div>


<?php }

require 'layout.php';
