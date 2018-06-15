<div class="container-fluid">
    <div class="row">
        <div class="col-sm-12">
            <div class="panel panel-default">
                <div class="panel-heading text-center"><h2></h2></div>
                <div class="panel-body">
                    <table id="dataTable" class="table table-striped table-vcenter">
                        <thead>
                            <tr>
                                <?php foreach($data['column_names'] as $column_name) { ?>
                                <th><?= t($column_name) ?></th>
                                <?php } ?>
                            </tr>
                        </thead>
                        <tfoot>
                            <tr>
                                <?php foreach($data['column_names'] as $column_name) { ?>
                                <th><?= t($column_name) ?></th>
                                <?php } ?>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
