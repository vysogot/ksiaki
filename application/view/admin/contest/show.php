<div class="wrapper">
  <h2>Dane konkursu</h2>
  <a href="/adminContest/index">Konkursy</a>
  <?php foreach($this->contest as $key => $value) { ?>
    <p><b><?php echo $key; ?>:</b> <?php echo $value; ?></p>
  <?php } ?>
  <a href="/adminContest/edit/<?php echo $this->contest->id ?>">Edytuj</a> |
  <a href="/adminContest/destroy/<?php echo $this->contest->id ?>" class="confirmation">Usuń</a>
</div>
