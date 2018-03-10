<?php

require '../init.php';

$params = [
  'active_link' => 'contests'
];

function content($params, $data) { ?>

<div id="contests-page">
  <div class="wrapper-full">
    <div class="contest-banner">
      <img src="/assets/images/contest-banner.jpg">
    </div>
  </div>

  <div class="wrapper">
    <h2 class="center"><a href="/contests/preroll.php">Graj</a></h2>
    <div class="left-sidebar">
      <div class="month-rank">
        <h2>Ranking miesięczny</h2>
        <ol>
          <li>Kawazmlekiem</li>
          <li>Szija26</li>
          <li>ilovelego</li>
          <li>smerfetka</li>
          <li>Ewelina Ratajczak</li>
          <li>basiaJ</li>
          <li>ajanga</li>
          <li>mario75</li>
          <li>lottainaczejkar...</li>
          <li>lusia44</li>
        </ol>
      </div>

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
      <h2>Graj i wygrywaj</h2>
      <h3>Już teraz czekają na Ciebie fantastyczne nagrody oraz tytuł Supergracza. Masz nieograniczoną liczbę podejść,
        każda próba zwiększa Twoje szanse na wygraną. Nie czekaj! Graj!</h3>

        <ul class="bare left contests">
          <li><div><img src="/assets/images/contest-single.jpg"><a href="/contests/show.php">Fanaberia, do 3 stycznia</a></div></li>
          <li><div><img src="/assets/images/contest-single.jpg"><a href="/contests/show.php">Energia, do 5 stycznia</a></div></li>
        </ul>
    </div>

    <div class="right-sidebar">
      <img src="/assets/images/contest-ad.jpg">
    </div>

  </div>
</div>

<?php }

require '../layout.php';
