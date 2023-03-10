<div class="container-fluid">
    <div class="row">
        <div class="col-sm-12">
            <div class="panel panel-default">
                <div class="panel-heading text-center"><h2><?= t($data['title']) ?></h2></div>
                <div class="panel-body" style="display:none">
                    <?php if (!in_array($data['title'], ['users', 'score_games', 'mail_templates'])) { ?>
                        <p><?= link_to('<i class="fas fa-plus-circle"></i>', '#', ['title'=>t('add_new'), 'data-target' => 'new.php', 'data-index' => '0', 'id' => 'new', 'data-id' => '0']) ?></p>
                    <?php } ?>

                    <?php if (in_array($data['title'], ['heroes'])) { ?>
                        <p><?= link_to(t('sort'), 'sort_form.php') ?></p>
                    <?php } ?>
                    <table id="dataTable" class="table table-striped table-vcenter">
                        <thead>
                            <tr>
                                <?php foreach($data['column_names'] as $column_name) { ?>
                                <th><?= t($column_name) ?></th>
                                <?php } ?>
                                <th></th>
                            </tr>
                        </thead>
                        <tfoot>
                            <tr>
                                <?php foreach($data['column_names'] as $column_name) { ?>
                                <th><?= t($column_name) ?></th>
                                <?php } ?>
                                <th></th>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
