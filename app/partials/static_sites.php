<?php

$static_sites = execute('call sp_static_sites_all(
    :p_id,
    :p_title,
    :p_slug,
    :p_content,
    :p_is_active,
    :p_offset,
    :p_limit
);', array(
    array('p_id', NULL, PDO::PARAM_INT),
    array('p_title', NULL, PDO::PARAM_STR),
    array('p_slug', NULL, PDO::PARAM_STR),
    array('p_content', NULL, PDO::PARAM_STR),
    array('p_is_active', 1, PDO::PARAM_INT),
    array('p_offset', 0, PDO::PARAM_INT),
    array('p_limit', 6, PDO::PARAM_INT),
), true);

?>

<section id="static-sites">
  <div class="wrapper">
    <ul class="bare left">
        <?php foreach($static_sites as $static_site) { ?>
            <li><?= link_to($static_site->title, '/info/' . $static_site->slug, ['target' => '_blank']) ?></li>
        <?php } ?>
    </ul>
  </div>
</section>
