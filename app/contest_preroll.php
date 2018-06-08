<?php

include 'init.php';

$params = [
    "id" => null
];

$params = array_merge($params, $_GET);

function content($params, $data) { ?>

<div class="wrapper center">
<div id="video_placement">
        <video width="640" height="360" id="content_video" preload="auto" playsinline controls poster="https://vjs.zencdn.net/v/oceans.png" >
                <source src="//vjs.zencdn.net/v/oceans.mp4" type="video/mp4"></source>
        </video>
</div>

  <?php if (getenv('APPLICATION_ENV') != 'production') { ?>
    <h2><?= link_to(t('play'), t('contest_play_slug', ['slug' => $params['slug']])) ?></h2>
  <?php } ?>
</div>

<!-- VAST player -->
 <script src="//cdn.stroerdigital.pl/data/js/engine/sdmplayer/player.js" type="text/javascript"></script>
<script type="text/javascript">
<!-- konfiguracja -->
(new StroerVideo()).setParams({
	id: "content_video" // id elementu <video>
	,adTagUrl: "https://pubads.g.doubleclick.net/gampad/ads?sz=640x480&iu=/16222663/konkursiaki.pl/video/pre-roll&impl=s&gdfp_req=1&env=vp&output=vast&unviewed_position_start=1&url=[referrer_url]&description_url=[description_url]&correlator=[timestamp]" //TU WSTAWIAMY URL TAGU VAST
	//,fluid: true		// czy player ma skalować się płynnie i dopasowywać do filmu; jesli podano width w tagu <video>, to wartość width będzie maksymalną szerokością (max-width) elementu #video_placement
});
</script>

 <script type="text/javascript">
    var stroertag = stroertag || {};
    stroertag.pregame = {
    init: function() {
    },
    onBeforeStart: function() {
    },
    onAfterStart: function() {
    },
    onBeforeEnd: function() {
    },
    onAfterEnd: function() {
        location.href = '<?= t('contest_play_slug', ['slug' => $params['slug']]) ?>';
    }
    }
</script>

<?php }

include 'layout.php';
