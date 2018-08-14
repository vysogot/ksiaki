<?php

include 'init.php';

$params = array_merge($params, $_GET);

$data['contest'] = execute('call sp_contests_find_by_slug(:p_slug);', array(
  array('p_slug', $params['slug'], PDO::PARAM_INT)
));

if (empty($data['contest']) || (!$data['contest']->is_active && !can_access_admin())) {
  redirect('/404.php');
}

if (!$data['contest']->playable && !can_access_admin()) {
    flash('warning', t('contest_ended_play_other'));
    redirect('/');
}

$data['assets_url'] = $GLOBALS['config']['cdn'] . '/contest_games/' . $data['contest']->game_name . '/' . $data['contest']->id . '/';

function content($params, $data) { ?>

<script type="text/javascript">
var nick = '<?= $_SESSION['nick']??'' ?>';
var contestId = <?= $data['contest']->id ?>;
var assetsUrl = '<?= $data['assets_url'] ?>';
var sponsorUrl = '<?= $data['contest']->sponsor_link_url ?>';

if (nick === '') {
    vex.dialog.open({
        unsafeMessage: '<?= t('play_not_logged') ?>',
        overlayClosesOnClick: false,
        buttons: [
            $.extend({}, vex.dialog.buttons.YES, { text: '<?= t('i_understand') ?>' }),
        ]
    });
}
</script>

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
    <iframe onload="this.contentWindow.focus()" class="game-iframe <?= $data['contest']->game_name ?>" src="/games/<?= $data['contest']->game_name ?>/index.php"></iframe>
    <script>
      var iframe = document.getElementsByClassName('game-iframe')[0];
          iframe.contentWindow.postMessage('{"method":"setVolume", "value":0}','*');

    </script>
    </div>
    <div id="stroer_pregame_video" data-stroer-width="600"></div>

<?php }

include 'layout.php';
