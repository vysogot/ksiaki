<?php

include '../init.php';


function content() { ?>
<div class="modal"><div class="modal-content"><a href="#" class="close">&times;</a>
  <div id="content"><?php include '_form.php'; ?></div>
</div></div>
<div class="wrapper" style="display:none">
  <h2><?= t('heroes') ?></h2>
  <p><?= link_to('<i class="fas fa-user-plus"></i>', '#', ['title'=>t('add_new'), 'data-target' => 'new.php', 'data-index' => '0', 'class' => 'new_hero']) ?></p>
  <table id="table-heroes" class="display">
    <thead>
      <tr>
        <th></th>
        <th><?= t('avatar') ?></th>
        <th><?= t('name') ?></th>
        <th></th>
        <th><?= t('description') ?></th>
        <th><?= t('avatar_url') ?></th>
        <th><?= t('header_url') ?></th>
        <th><?= t('is_active') ?></th>
        <th></th>
        <th></th>
        <th></th>
      </tr>
    </thead>
    <tbody>
    </tbody>
  </table>
</div>
<?php include "js/index.js"; ?>
<?php }

include '../layout.php';
