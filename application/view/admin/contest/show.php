<div class="wrapper">
  <h2>Dane konkursu</h2>
  <?php foreach($this->contest as $key => $value) { ?>
    <p><b><?php echo $key; ?>:</b> <?php echo $value; ?></p>
  <?php } ?>
  <a href="/adminContest/index">Ustawienia konkursów</a>
</div>
