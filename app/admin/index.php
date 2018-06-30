<?php

include 'init.php';

function content($params, $data) { ?>

    <ul>
        <li>
            <?= link_to(t('users'), '/admin/users/', ['class' => 'remote']) ?>
        </li>
        <li>
            <?= link_to(t('contests'), '/admin/contests/', ['class' => 'remote']) ?>
        </li>
        <li>
            <?= link_to(t('heroes'), '/admin/heroes/', ['class' => 'remote']) ?>
        </li>
        <li>
            <?= link_to(t('backgrounds'), '/admin/backgrounds/', ['class' => 'remote']) ?>
        </li>
        <li>
            <?= link_to(t('boxes'), '/admin/boxes/', ['class' => 'remote']) ?>
        </li>
        <li>
            <?= link_to(t('slides'), '/admin/slides/', ['class' => 'remote']) ?>
        </li>
        <li>
            <?= link_to(t('video_ads'), '/admin/video_ads/', ['class' => 'remote']) ?>
        </li>
        <li>
            <?= link_to(t('hero_editions'), '/admin/hero_editions/', ['class' => 'remote']) ?>
        </li>
        <li>
            <?= link_to(t('hero_files'), '/admin/hero_files/', ['class' => 'remote']) ?>
        </li>
        <li>
            <?= link_to(t('contest_prizes'), '/admin/contest_prizes/', ['class' => 'remote']) ?>
        </li>
        <li>
            <?= link_to(t('sponsors'), '/admin/sponsors/', ['class' => 'remote']) ?>
        </li>
        <li>
            <?= link_to(t('static_sites'), '/admin/static_sites/', ['class' => 'remote']) ?>
        </li>
        <li>
            <?= link_to(t('mail_templates'), '/admin/mail_templates/', ['class' => 'remote']) ?>
        </li>
        <li>
            <?= link_to(t('log_mail'), '/admin/log_mail/', ['class' => 'remote']) ?>
        </li>
        <li>
            <?= link_to(t('score_games'), '/admin/score_games/', ['class' => 'remote']) ?>
        </li>
        <li>
            <?= link_to(t('back_to_home_page'), '/') ?>
        </li>
        <!-- <li><?= link_to(t('user_movies'), '/admin/user_movies/', ['class' => 'remote']) ?></li> -->
    </ul>

<?php }

include 'layout.php';

?>
