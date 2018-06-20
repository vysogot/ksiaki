$(document).ready(function() {
    oTable = $('#dataTable').DataTable({
        "mark": true,
        "processing": true,
        /*"serverSide": true, */
        "deferRender": true,
        "searchDelay": 1000,
        "ajax": { "url": "/admin/score_games/datatable.php" },
        "columns": [
            { "data": "id" },
            { "data": "nick" },
            { "data": "contest_name" },
            { "data": "level" },
            { "data": "begins_at" },
            { "data": "ends_at" },
            {
                "data": "win",
                "className": "center",
                "render":
                function (data) {
                    return '<i class="' + aActive[data] + '"></i>';
                }
            },
            { "data": "points" },
            { "data": "points_total" },
            { "data": "checknumber_client" },
            { "data": "checknumber_server" },
            { "data": "is_suspected" },
            { "data": null }
        ],

        "initComplete": function() { $('.panel-body').show(); },
        "bAutoWidth": false,
        "language": { "url": "/assets/json/dataTables.polish.json" },

        "columnDefs": [ {
            "targets": -1,
            "data": null,
            "className": "links",
            "orderable": false,
            "render": function (data, type, row, meta) {
                return '';
            }
        }],

        "createdRow": function(row, data, dataIndex) {
            if (data.is_suspected == '1') {
                $(row).addClass('data-table-row-warning');
            }
        },

        "stateSave": true,
        "stateSaveParams": function (oSettings, oData) { localStorage.setItem( window.location.pathname, JSON.stringify(oData) ); },
        "stateLoadParams": function (oSettings) { return JSON.parse( localStorage.getItem(window.location.pathname) ); },
    });
});
