$(document).ready(function() {
  const TableName = 'DataTables_heroesTable';
  oTable = $('#dataTable').DataTable({
    "stateSave": true,
    "stateSaveParams": function (oSettings, oData) {
      localStorage.setItem( TableName+window.location.pathname, JSON.stringify(oData) );
    },
    "stateLoadParams": function (oSettings) {
      return JSON.parse( localStorage.getItem(TableName+window.location.pathname) );
    },
    "responsive": true,
    "bPaginate": true,
    "pageLength": 5,
    "lengthMenu": [ 5, 10, 25, 50 ],
    "language": { "url": "/assets/json/dataTables.polish.json" },
    "initComplete": function() { $('.panel-body').show(); },
    "bAutoWidth": false,
    "ajax": { "url": "datatable.php" },
    "columnDefs": [
     { "data": "id", "targets": 0, "className": "none" },
     //{ "data": "image", "targets": 1, "sWidth": "10%", "className": "dt-center", "bSortable": false,
     //   "render": function ( data ) {return '<img height=75px src="' + data + '" title="' + data.substr(data.lastIndexOf('/')+1) + '">';}},
     { "data": "name", "targets": 1, "sWidth": "10%", "className": "dt-left" },
     { "data": "surname", "targets": 2, "className": "dt-left" },
     { "data": "email", "targets": 3, "sWidth": "15%", "className": "dt-left" },
     { "data": "nick", "targets": 4, "className": "dt-left" },
     { "data": "last_login_at", "targets": 5, "className": "dt-center" },
     { "data": "is_active", "targets": 6, "sWidth": "10%",  "className": "dt-center", "render": function ( data ) {return '<i class="' + aActive[data] + '"></i>';}},

     { "targets": -3, "bSortable": false, "className": "dt-center", "width": "5%",
       "render": function (data, type, row, meta) { return set_button("fShow(this)", meta.row, row, t_show, 'fa-eye', ""); }},
     { "targets": -2, "bSortable": false, "className": "dt-center", "width": "5%",
       "render": function (data, type, row, meta) { return set_button("fEdit(this)", meta.row, row, t_edit, "fa-edit",""); }},
     { "targets": -1, "bSortable": false, "className": "dt-center", "width": "5%",
       "render": function (data, type, row, meta) { return set_button("fDelete(this)", meta.row, row, t_delete, "fa-trash-alt",""); }}
   ],
    "order": [2, 'asc']
  }); // end of function dataTable

}); // end ready
