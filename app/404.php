<?php

require 'init.php';

$params = [
  'active_link' => 'contests'
];

function content($params, $data) { ?>

<div class="wrapper">
    <h1>404 - Nie znaleziono</h1>
    <div class="box">
        <p>Strona nie istnieje.</p>
    </div>
</div>

<?php }

require 'layout.php';
