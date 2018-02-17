<div class="wrapper">
  <h2>Dane konkursu</h2>
  <a href="/admin/contest/index">Konkursy</a>
  <?php foreach($this->contest as $key => $value) { ?>
    <p><b><?php echo $key; ?>:</b> <?php echo $value; ?></p>
  <?php } ?>
  <a href="/admin/contest/edit/<?php echo $this->contest->id ?>">Edytuj</a> |
  <a href="/admin/contest/destroy/<?php echo $this->contest->id ?>" class="confirmation">Usuń</a>
</div>
