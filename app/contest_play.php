<?php

include 'init.php';

$params = [
    "slug" => null
];

$params = array_merge($params, $_GET);

$data['contest'] = execute('call sp_contests_find_by_slug(:p_slug);', array(
  array('p_slug', $params['slug'], PDO::PARAM_INT)
));

if (empty($data['contest'])) {
    redirect('/404.php');
}

function content($params, $data) { ?>

<script type="text/javascript">
var contestId = <?= $data['contest']->id ?>;
</script>

<div class="wrapper center">
  <h2><?= link_to(t('back_to_contest'), t('contest_slug', ['slug' => $data['contest']->slug])) ?></h2>
  <div id="stroer_pregame_video"></div>
  <iframe onload="this.contentWindow.focus()" style="border: 0; width: 100%; height: 80vh;" src="/games/<?= $data['contest']->game_name ?>/index.php"></iframe>
</div>

<script type="text/javascript">
   var stroertag = stroertag || {};
   stroertag.pregame = {
       init: function() {},
       onBeforeStart: function() {},
       onAfterStart: function() {},
       onBeforeEnd: function() {},
       onAfterEnd: function() {}
   }
</script>

<?php }

include 'layout.php';
