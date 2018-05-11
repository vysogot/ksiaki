<div class="wrapper">
<h2><?= t('edit_form') ?></h2>
<form id="hero-form"  action="#" onsubmit="return submitForm();" method="POST" enctype="multipart/form-data" class="vertical-form">

  <input type="hidden" name="id" value="" />
  <input type="hidden" name="row_index" value="" />

  <div class="div-left">
    <label for="name"><?= t('name') ?></label>
    <input id="name" name="name" type="text">
  </div>

  <div class="div-right">
    <label for="slug"><?= t('slug') ?></label>
    <input id="slug" name="slug" type="text">
  </div>

  <div class="div-left">
    <label for="avatar_url"><?= t('avatar_url') ?></label>
    <input id="avatar_url" name="avatar_url" type="text">
    <input id="avatar_file" name="avatar_file" type="file">
  </div>

  <div class="div-right">
    <label for="header_url"><?= t('header_url') ?></label>
    <input id="header_url" name="header_url" type="text">
    <input id="header_file" name="header_file" type="file">
  </div>

  <div style="float:left; width:400px;padding-top:20px;">
    <label for="description"><?= t('description') ?></label>
    <textarea id="description" name="description"></textarea>
  </div>



  <div class="div-left">
    <label for="is_active_check"><?= t('is_active') ?></label>
    <input id="is_active_check" type="checkbox" name="is_active_check" >
    <input type="hidden" name="is_active">
  </div>

  <div class="div-right">
    <button type="submit" value="Wyślij">Wyślij</button>
  </div>

</form>

</div>
