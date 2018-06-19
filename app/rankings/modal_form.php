<!-- Modal -->
<div id="show-ranking" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel" data-backdrop="false">
  <div class="modal-dialog" role="document" style="width:90%;">
    <div class="modal-content" style="width:100%;">
      <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      <div class="row">
        <?php include 'datatable_view.php'; ?>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">
          <?= t('close') ?>
        </button>
      </div>
    </div>
  </div>
</div>
