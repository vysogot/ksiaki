<!--<?= link_to(image('/assets/images/konkursiak-miesiaca-08v2.png', ['style' => 'width: 100%;']), '/assets/images/konkursiak-nagroda-09.png', ['class' => 'modal-image']) ?>-->

<?= link_to(image('/assets/images/icarly-2.png', ['style' => 'width: 100%;']), 'http://www.nick.com.pl/seriale/342-icarly', ['target' => '_blank']) ?>

<?php

    $links = [
        [
            'image_src' => '/assets/images/sky_banner_lego_city.jpg',
            'href' => t('hero_slug', ['slug' => 'lego-city'])
        ],
        [
            'image_src' => '/assets/images/sky_banner_lego_jurassic_world.jpg',
            'href' => t('hero_slug', ['slug' => 'lego-jurassic-world'])
        ]
    ]

?>

<div id="sky-banner">
    <?php foreach($links as $link) { ?>
        <div>
            <?= link_to(image($link['image_src']), $link['href']) ?>
        </div>
    <?php } ?>
</div>
