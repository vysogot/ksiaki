<?php

require 'init.php';

$params = [
  'active_link' => 'login'
];

$data = execute('call sp_users_find(:p_id);', array(
  array('p_id', $_SESSION['user_id'], PDO::PARAM_INT)
));

function content($params, $data) { ?>

<div class="wrapper">
    <ul>
        <li>
            <a href="/logout.php">Logout</a>
        </li>
    </ul>

    <h2>Your profile</h2>

    <p>Your username: <?= $data->name ?></p>
    <p>Your email: <?= $data->email ?></p>
    <p>Your role is: <?= $data->role_id ?></p>
</div>

<?php }

require 'layout.php';
