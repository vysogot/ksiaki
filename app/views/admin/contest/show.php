<div class="wrapper">
  <h2>Dane konkursu</h2>
  <a href="/admin/contest/index">Konkursy</a>
  <?php foreach($this->contest as $key => $value) { ?>
    <p><b><?= e($key) ?>:</b> <?= e($value) ?></p>
  <?php } ?>
  <a href="/admin/contest/edit/<?= e($this->contest->id) ?>">Edytuj</a> |
  <a href="/admin/contest/destroy/<?= e($this->contest->id) ?>" class="confirmation">Usuń</a>
</div>
