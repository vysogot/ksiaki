var oHeroesTable;
$(document).ready(function() {
  let title_show = '<?= t("show") ?>';
  let title_edit = '<?= t("edit") ?>';
  let title_delete = '<?= t("delete") ?>';
  let aActive = ['fa fa-times', 'fa fa-check'];
  oHeroesTable = $('#table-heroes').DataTable({
    "stateSave": true,
    "stateSaveParams": function (oSettings, oData) {
      localStorage.setItem( 'DataTables_heroesTable'+window.location.pathname, JSON.stringify(oData) );
    },
    "stateLoadParams": function (oSettings) {
      return JSON.parse( localStorage.getItem('DataTables_heroesTable'+window.location.pathname) );
    },
    "responsive": true,
    "bPaginate": true,
    "pageLength": 5,
    "lengthMenu": [ 5, 10, 25, 50 ],
    "language": { "url": "/assets/json/dataTables.polish.json" },
    "initComplete": function() { $('#heroes-panel').show(); },
    "bAutoWidth": false,
    "ajax": { "url": "datatable.php" },
    "columnDefs": [
     { "data": "id", "targets": 0, "className": "none" },
     { "data": "image", "targets": 1, "sWidth": "10%", "className": "dt-center", "bSortable": false,
       "render": function ( data ) {return '<img height=75px src="' + data + '">';}},
     { "data": "name", "targets": 2, "sWidth": "10%", "className": "dt-center" },
     { "data": "slug", "targets": 3, "className": "none" },
     { "data": "description", "targets": 4, "sWidth": "15%", "className": "dt-center" },
     { "data": "avatar_url", "targets": 5, "sWidth": "20%", "className": "dt-center" },
     { "data": "header_url", "targets": 6, "sWidth": "20%", "className": "dt-center" },
     { "data": "is_active", "targets": 7, "sWidth": "10%",  "className": "dt-center", "render": function ( data ) {return '<i class="' + aActive[data] + '"></i>';}},

     { "targets": -3, "bSortable": false, "className": "dt-center", "width": "5%",
       "render": function (data, type, row, meta) { return set_button("show_hero(this)", meta.row, row, title_show, 'fa-eye', ""); }},
     { "targets": -2, "bSortable": false, "className": "dt-center", "width": "5%",
       "render": function (data, type, row, meta) { return set_button("edit_hero(this)", meta.row, row, title_edit, "fa-edit",""); }},
     { "targets": -1, "bSortable": false, "className": "dt-center", "width": "5%",
       "render": function (data, type, row, meta) { return set_button("delete_hero(this)", meta.row, row, title_delete, "fa-trash-alt",""); }}
   ],
    "order": [2, 'asc']
  }); // end of function dataTable

}); // end ready

function set_button(myFunc, myIndex, myRow, myTitle, myIcon, myDisable) {
  return '<a href="#" onclick="' + myFunc + '"' +
    ' data-index=' + myIndex +
    ' data-id=' + myRow.id +
    ' data-name=' + myRow.name +
    ' title="' + myTitle + '"' + myDisable +
    '><i class="fas ' + myIcon + '"></i>'  + '</a>';
 }
