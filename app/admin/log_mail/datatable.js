$(document).ready(function() {
    oTable = $('#dataTable').DataTable({
        "mark": true,
        "processing": true,
        "deferRender": true,
        "searchDelay": 1000,
        "ajax": { "url": "/admin/log_mail/datatable.php" },
        "columns": [
            { "data": "id" },
            { "data": "email" },
            { "data": "subject" },
            { "data": "created_at" },
            { "data": "created_by" },
            { "data": null }
        ],

        "initComplete": function() { $('.panel-body').show(); },
        "bAutoWidth": false,
        "language": { "url": "/assets/lib/datatables/polish.json" },

        "columnDefs": [ {
            "targets": -1,
            "data": null,
            "className": "links",
            "orderable": false,
            "render": function (data, type, row, meta) {
                return set_button("fShow(this)", meta.row, row, t_show, 'fa-eye', "");
            }
        }],

        "stateSave": true,
        "stateSaveParams": function (oSettings, oData) { localStorage.setItem( window.location.pathname, JSON.stringify(oData) ); },
        "stateLoadParams": function (oSettings) { return JSON.parse( localStorage.getItem(window.location.pathname) ); },
    });
});
