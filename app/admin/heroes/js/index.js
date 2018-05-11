<script type="text/javascript">
var oHeroesTable;
$(document).ready(function() {
  let aActive = ['<i class="fa fa-times"></i>', '<i class="fa fa-check"></i>'];
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
    "initComplete": function() { $('.wrapper').show(); },
    "bAutoWidth": false,
    "ajax": { "url": "datatable.php" },
    "columnDefs": [
      { "targets": 0, "className": "none" },
      { "targets": 1, "sWidth": "10%", "className": "dt-center", "bSortable": false,
        "render": function ( data, type, row ) {return '<img height=75px src="'+row[1]+'">';}},
      { "targets": 2, "sWidth": "10%", "className": "dt-center" },
      { "targets": 3, "className": "none" },
      { "targets": 4, "sWidth": "15%", "className": "dt-center" },
      { "targets": 5, "sWidth": "20%", "className": "dt-center" },
      { "targets": 6, "sWidth": "20%", "className": "dt-center" },
      { "targets": 7, "sWidth": "5%",  "className": "dt-center", "render": function ( data, type, row ) {return aActive[row[7]];}},

      { "targets": -3, "bSortable": false, "className": "dt-center", "width": "5%",
        "render": function (data, type, row, meta) { return set_button(meta.row, row[2], 'show_hero(this)', 'show.php?id=' + row[0], row, 'Pokaż', 'fas fa-eye', ''); }},
      { "targets": -2, "bSortable": false, "className": "dt-center", "width": "5%",
        "render": function (data, type, row, meta) { return set_button(meta.row, row[2], 'modal_form(this)', 'edit.php?id=' + row[0], row, 'Edycja', 'fas fa-edit',''); }},
      { "targets": -1, "bSortable": false, "className": "dt-center", "width": "5%",
        "render": function (data, type, row, meta) { return set_button(meta.row, row[2], 'delete_hero(this)', 'delete.php?id=' + row[0], row, 'Usuń', 'fas fa-trash-alt',''); }}
    ],
    "order": [2, 'asc']
  }); // end of function dataTable

}); // end ready

function set_button(myIndex, myName, myFunc, myTarget, myRow, myTitle, myIcon, myDisable) {
  let ret = '<a href="#" onclick="' + myFunc + '"' +
    ' data-target="' + myTarget + '"' +
    ' data-id=' + myRow[0] +
    ' data-index=' + myIndex +
    ' data-name=' + myName +
    ' title="' + myTitle + '"' + myDisable + '>' +
    '<i class="' + myIcon + '"></i>'  + '</a>';
  return ret;
 }

function submitForm() {
  $('input[name="is_active"]').val($('#is_active_check').prop('checked') ? '1' : '0');
  let row_index = $('input[name="row_index"]').val();
  let form_data = new FormData(document.getElementById("hero-form"));
  $.ajax({
     url: ((form_data.get('id')==0)?'create.php':'update.php'),
     type: "POST",
     data: form_data,
     processData: false,
     contentType: false,
     cache: false
 }).done(function( data ) {
    $( ".modal .close" ).click();
    if (row_index == 0) {
      oHeroesTable.ajax.reload(null, false);
    } else {
      oHeroesTable.row(row_index).data( data[0] );
    }
 });
  return false;
}

function delete_hero(myObj) {
  let ret = confirm('Czy usunąć bohatera ' + $(myObj).data('name') + '?');
  if (ret == true) {
    $.post("delete.php?id=" + $(myObj).data('id'),
      function(data, status){
          if (data[0].rowCount == 1) oHeroesTable.ajax.reload(null, false);
      });
  }
}

function show_hero(myObj) {
  console.log('show');
}

function modal_form(myObj) {
  $.ajax({
  url: $(myObj).data('target'),
  dataType : 'json',
  method: 'GET',
  error: function(x,e) { console.log(e); console.log(x.responseText); }
  }).success(function(data) {
    let ret = data[0];

    for (var key in ret) {
      $('input[name="' + key + '"]').val(ret[key]);
    }

    $('textarea[name="description"]').val(ret.description);

    $('#is_active_check').prop("checked", ($('input[name="is_active"]').val() == '1'));

    $('input[name="row_index"]').val($(myObj).data('index'));

    $('.modal').show();
  });
}

$('.modal .close').click(function() {
  $('.modal').hide();
});

$('.new_hero').click(function(e) {
  modal_form(this);
});

</script>
