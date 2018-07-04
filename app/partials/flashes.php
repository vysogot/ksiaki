<?php if (isset($_SESSION['flashes'])) { ?>
  <div class="wrapper">
    <?php foreach($_SESSION['flashes'] as $flash) { ?>
      <div class="<?= $flash['type'] ?>"><?= e($flash['message']) ?></div>

      <?php if (in_array($flash['type'], ['important', 'warning'])) { ?>
	      <script>
	      	vex.dialog.open({
	      		message: "<?= e($flash['message']) ?>",
	      		contentClassName: 'flash',
            showCloseButton: false,
	      		overlayClosesOnClick: false,
            buttons: [
                  $.extend({}, vex.dialog.buttons.YES, { text: 'Rozumiem' }),
            ]
		    });
		  </script>
	  <?php } ?>

    <?php } ?>
  </div>
<?php }

unset($_SESSION['flashes']);
