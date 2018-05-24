<?php

include '../init.php';

function content() { ?>
  <!-- Modal -->
  <div id="modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel" data-backdrop="false">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h2 class="modal-title" id="gridSystemModalLabel"></h2>
        </div>
        <div class="row"><?php include '_form.php'; ?></div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->

  <div class="container-fluid">
    <div class="row">
      <div class="col-sm-12">
        <div class="panel panel-default">
          <div class="panel-heading text-center"><h2><?= t('backgrounds') ?></h2></div>
            <div class="panel-body" style="display:none">
              <p><?= link_to('<i class="fas fa-plus-circle"></i>', '#', ['title'=>t('add_new'), 'data-target' => 'new.php', 'data-index' => '0', 'id' => 'new', 'data-id' => '0']) ?></p>
              <table id="dataTable" class="table table-striped table-vcenter">
                <thead>
                  <tr>
                    <th></th> <!-- id -->
                    <th><?= t('background') ?></th>
                    <th><?= t('background_name') ?></th>
                    <th><?= t('link_url') ?></th>
                    <th><?= t('background_color') ?></th>
                    <th><?= t('details_color') ?></th>
                    <th><?= t('begins_at') ?></th>
                    <th><?= t('ends_at') ?></th>
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
        </div>
      </div>
    </div>
  </div>
  <script type="text/javascript">
  <?php include "../assets/js/definitions.js"; ?>
  <?php include "../assets/js/helpers.js"; ?>
  <?php include "../assets/js/formdata.js"; ?>
  <?php include "datatable.js"; ?>
  <?php include "actions.js"; ?>
  </script>
  <?php }

  include '../layout.php';
