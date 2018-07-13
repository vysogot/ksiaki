<?php if (isset($params['errors'])) { ?>
  <ul>
  <?php foreach($params['errors'] as $field => $bundle) { ?>
      <?php if ($field != 'NOT_A_FIELD' && isset($bundle['field_translation'])) { ?>
          <li><?= $bundle['field_translation'] . ": " .  $bundle['message'] ?></li>
      <?php } else { ?>
          <li><?= $bundle['message'] ?></li>
      <?php } ?>
      <script>
      	$(document).ready(function() { 
	      	$("input[name='<?= $field ?>']").addClass('error') 
	    });
  	  </script>
  <?php } ?>
  </ul>
<?php } ?>
