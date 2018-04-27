<?php

include 'init.php';

$params = [
  "id" => null,
  "name" => null,
  "link_url" => null,
  "offset" => 0,
  "limit" => 50
];

$params = array_merge($params, $_GET);

$data = execute('call sp_video_ads_all(
  :p_id,
  :p_name,
  :p_link_url,
  :p_offset,
  :p_limit
);', array(
  array('p_id', $params['id'], PDO::PARAM_INT),
  array('p_name', $params['name'], PDO::PARAM_STR),
  array('p_link_url', $params['link_url'], PDO::PARAM_STR),
  array('p_offset', $params['offset'], PDO::PARAM_INT),
  array('p_limit', $params['limit'], PDO::PARAM_INT)
), true);

function content($params, $data) { ?>

<div class="wrapper">
  <h2><?= t('video_ads') ?></h2>
  <p><?= link_to(t('add_new'), '/admin/video_ads/new.php') ?></p>
  <table>
    <?php foreach($data as $video_ad) { ?>
      <tr>
        <td><img height=75 src="<?= e($video_ad->image_url) ?>" /></td>
        <td><?= e($video_ad->name) ?></td>
        <td><?= e($video_ad->image_url) ?></td>
        <td><?= e($video_ad->link_url) ?></td>
        <td><?= e($video_ad->begins_at) ?></td>
        <td><?= e($video_ad->ends_at) ?></td>
        <td><?= e($video_ad->is_active) ?></td>
        <td><?= link_to(t('show'), "/admin/video_ads/show.php?id=$video_ad->id") ?></td>
        <td><?= link_to(t('edit'), "/admin/video_ads/edit.php?id=$video_ad->id") ?></td>
        <td><?= link_to(t('delete'), "/admin/video_ads/delete.php?id=$video_ad->id", ['class' => 'confirmation']) ?></td>
      </tr>
    <?php } ?>
  </table>
</div>

<?php }

include 'layout.php';
