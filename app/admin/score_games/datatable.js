$(document).ready(function() {
    oTable = $('#dataTable').DataTable({
        "mark": true,
        "processing": true,
        "serverSide": true,
        "deferRender": true,
        "searchDelay": 1000,
        "ajax": { "url": "/admin/score_games/datatable.php" },
        "columns": [
            { "data": "id" },
            { "data": "nick" },
            { "data": "contest_name" },
            {   "data": "begins_at",
                "className": "center" 
            },
            { 
                "data": "game_duration",
                "className": "center" 
            },
            {
                "data": "win",
                "className": "center",
                "render":
                function (data) {
                    return '<i class="' + aActive[data] + '"></i>';
                }
            },
            { 
                "data": "level",
                "className": "center"
            },
            { 
                "data": "points", 
                "render": $.fn.dataTable.render.number( ' ', '.', 0 ),
                "className": 'text-right'
            },
            { 
                "data": "points_total", 
                "render": $.fn.dataTable.render.number( ' ', '.', 0 ),
                "className": 'text-right'
            },
            { 
                "data": "is_suspected",
                "className": "center" 
            },
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
