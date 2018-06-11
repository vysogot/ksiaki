$(document).ready(function() {
    oTable = $('#dataTable').DataTable({
        "ajax": { "url": base_url + "/rankings/datatable.php?type=" + type + "&date=" + date,
                  "dataSrc": function ( json ) {
                    $('.panel-heading h2').text(json.title);
                    return json.data;
                  }
        },
        "columns": [
            { "data": "place" },
            { "data": "nick" },
            { "data": "points" }
        ],

        "initComplete": function() { $('.panel-body').show(); },
        "bAutoWidth": false,
        "language": { "url": "/assets/json/dataTables.polish.json" },

        "stateSave": true,
        "stateSaveParams": function (oSettings, oData) {
            localStorage.setItem( window.location.pathname, JSON.stringify(oData) );
        },
        "stateLoadParams": function (oSettings) {
            return JSON.parse( localStorage.getItem(window.location.pathname) );
        },
    });

});
