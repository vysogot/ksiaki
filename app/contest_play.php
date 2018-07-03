<?php

include 'init.php';

$params = array_merge($params, $_GET);

$data['contest'] = execute('call sp_contests_find_by_slug(:p_slug);', array(
  array('p_slug', $params['slug'], PDO::PARAM_INT)
));

if (empty($data['contest']) || !$data['contest']->is_active) {
    flash('warning', t('contest_ended_play_other'));
    redirect('/');
}

function content($params, $data) { ?>

<script type="text/javascript">
var contestId = <?= $data['contest']->id ?>;
</script>

<?php if ($data['contest']->game_name == 'pacman') { ?>
    <style>.game-iframe { height: 700px; }</style>
<?php } ?>

<div class="wrapper center">
  <h2><?= link_to(t('back_to_contest'), t('contest_slug', ['slug' => $data['contest']->slug])) ?></h2>
    <?php if ($data['contest']->display_ad) { ?>
      <script>
        var stroertag = stroertag || {};
        stroertag.pregame = {
          init: function() {},
          onBeforeStart: function() {
            document.getElementsByClassName('game')[0].style.display = 'none';
          },
          onAfterStart: function() {},
          onBeforeEnd: function() {},
          onAfterEnd: function() {
            document.getElementsByClassName('game')[0].style.display = 'block';
          }
        }
      </script>
    <?php } ?>
    
    <div class="game">
    <iframe onload="this.contentWindow.focus()" class="game-iframe" src="/games/<?= $data['contest']->game_name ?>/index.php"></iframe>
    </div>
    <div id="stroer_pregame_video" data-stroer-width="600"></div>

<?php }

include 'layout.php';
