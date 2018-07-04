$(document).ready(function() {
    oTable = $('#dataTable').DataTable({
        "ajax": { "url": "/admin/contests/datatable.php" },
        "columns": [
            { "data": "id" },
            {
                "data": "box_url",
                "render": function (data) {
                    return '<img height=75px src="' + data + '">';
                },
                "orderable": false
            },
            { "data": "name" },
            { "data": "game_name" },
            { "data": "contest_type_name" },
            { "data": "begins_at" },
            { "data": "ends_at" },
            {
                "data": "is_active",
                "className": "center",
                "render":
                function (data) {
                    return '<i class="' + aActive[data] + '"></i>';
                }
            },
            { "data": "is_ended", "className": "none" },
            { "data": null }
        ],

        "initComplete": function() { $('.panel-body').show(); },
        "bAutoWidth": false,
        "language": { "url": "/assets/lib/datatables/polish.json" },

        "columnDefs": [ {
            "targets": -1,
            "data": null,
            "orderable": false,
            "className": "links",
            "render": function (data, type, row, meta) {
                return set_button("fEnd(this)", meta.row, row,  t_ended, 'fa-calendar-check', ((row.is_ended==0)?'':' disabled="disabled"')) +
                    set_button("fShow(this)", meta.row, row, t_show, 'fa-eye', "") +
                    set_button("fEdit(this)", meta.row, row, t_edit, 'fa-edit', "") +
                    set_button("fDelete(this)", meta.row, row, t_delete, 'fa-trash-alt', "");
            }
        }],

        "order": [1, 'desc'],

        "stateSave": true,
        "stateSaveParams": function (oSettings, oData) {
            localStorage.setItem( window.location.pathname, JSON.stringify(oData) );
        },
        "stateLoadParams": function (oSettings) {
            return JSON.parse( localStorage.getItem(window.location.pathname) );
        },
    });

});
