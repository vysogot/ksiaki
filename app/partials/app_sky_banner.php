<?= link_to(image('/assets/images/konkursiak-miesiaca-08v2.png', ['style' => 'width: 100%;']), '/assets/images/konkursiak-nagroda-08.png', ['class' => 'modal-image']) ?>

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
