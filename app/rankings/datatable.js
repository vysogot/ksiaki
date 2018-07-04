$(document).ready(function() {
    oTable = $('#dataTable').DataTable({
        "ajax": { "url": "/rankings/datatable.php?type=" + type + "&date=" + date,
                  "dataSrc": function ( json ) {
                    $('.panel-heading h2').text(json.title);
                    return json.data;
                  }
        },
        "columns": [
            { "data": "place",
              "className": 'text-right bold' },
            { "data": "nick" },
            { "data": "points", 
              "render": $.fn.dataTable.render.number( ' ', '.', 0 ),
              "className": 'text-right bold' }
        ],

        "initComplete": function() { $('.panel-body').show(); },
        "bAutoWidth": false,
        "language": { "url": "/assets/datatables/polish.json" },

        "stateSave": true,
        "stateSaveParams": function (oSettings, oData) {
            localStorage.setItem( window.location.pathname, JSON.stringify(oData) );
        },
        "stateLoadParams": function (oSettings) {
            return JSON.parse( localStorage.getItem(window.location.pathname) );
        },
    });

});
