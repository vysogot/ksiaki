$(document).ready(function() {
    oTable = $('#dataTable').DataTable({
        "ajax": { "url": "datatable.php" },
        "columns": [
            { "data": "id" },
            { "data": "title" },
            { "data": "slug" },
            {
                "data": "is_active",
                "className": "center",
                "render":
                function (data) {
                    return '<i class="' + aActive[data] + '"></i>';
                }
            },
            { "data": null }
        ],

        "initComplete": function() { $('.panel-body').show(); },
        "bAutoWidth": false,
        "language": { "url": "/assets/json/dataTables.polish.json" },

        "columnDefs": [ {
            "targets": -1,
            "data": null,
            "orderable": false,
            "className": "links",
            "render": function (data, type, row, meta) {
                return set_button("fShow(this)", meta.row, row, t_show, 'fa-eye', "") +
                    set_button("fEdit(this)", meta.row, row, t_edit, 'fa-edit', "") +
                    set_button("fDelete(this)", meta.row, row, t_delete, 'fa-trash-alt', "");
            }
        }],

        "order": [2, 'desc'],

        "stateSave": true,
        "stateSaveParams": function (oSettings, oData) { localStorage.setItem( window.location.pathname, JSON.stringify(oData) ); },
        "stateLoadParams": function (oSettings) { return JSON.parse( localStorage.getItem(window.location.pathname) ); },
    });
});
