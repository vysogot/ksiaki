$(document).ready(function() {
    oTable = $('#dataTable').DataTable({
        "mark": true,
        "processing": true,
        "serverSide": true,
        "deferRender": true,
        "searchDelay": 1000,
        "ajax": { "url": "/admin/users/datatable.php" },
        "columns": [
            { "data": "id" },
            { "data": "nick" },
            { "data": "name" },
            { "data": "surname" },
            { "data": "email" },
            { "data": "last_login_at" },
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
        "language": { "url": "/assets/lib/datatables/polish.json" },

        "columnDefs": [ {
            "targets": -1,
            "data": null,
            "orderable": false,
            "className": "links",
            "render": function (data, type, row, meta) {
                return set_button("fEdit(this)", meta.row, row, t_edit, 'fa-edit', "") +
                    set_button("fDelete(this)", meta.row, row, t_delete, 'fa-trash-alt', "");
            }
        }],

        //"order": [1, 'desc'],

        "stateSave": true,
        "stateSaveParams": function (oSettings, oData) { localStorage.setItem( window.location.pathname, JSON.stringify(oData) ); },
        "stateLoadParams": function (oSettings) { return JSON.parse( localStorage.getItem(window.location.pathname) ); },
    });
});
