<?php

$static_sites = execute('call sp_static_sites_all();', [], true);

?>

<section id="static-sites">
  <div class="wrapper">
    <ul class="bare left">
        <?php foreach($static_sites as $static_site) { ?>
            <li><?= link_to($static_site->title, t('static_site_slug', ['slug' => $static_site->slug])) ?></li>
        <?php } ?>
    </ul>
  </div>
</section>
