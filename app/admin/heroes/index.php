<?php

include '../init.php';


function content() { ?>
<div class="modal"><div class="modal-content"><a href="#" class="close">&times;</a><div id="content"></div></div></div>
<div class="wrapper" style="display:none">
  <h2><?= t('heroes') ?></h2>
  <p><?= link_to('<i class="fas fa-user-plus"></i>', '#', ['title'=>t('add_new'), 'data-target' => 'new.php', 'class' => 'new_hero']) ?></p>
  <table id="table-heroes" class="display">
    <thead>
      <tr>
        <th></th>
        <th>image</th>
        <th>name</th>
        <th></th>
        <th>description</th>
        <th>avatar_url</th>
        <th>header_url</th>
        <th>is_active</th>
        <th></th>
        <th></th>
        <th></th>

      </tr>
    </thead>
    <tbody>
    </tbody>
  </table>
</div>
<script type="text/javascript">
var oHeroesTable;
$(document).ready(function() {
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
    "language": { "url": "/assets/json/dataTables.polish.lang" },
    "initComplete": function() { $('.wrapper').show(); },
    "bAutoWidth": false,
    ajax: {
        url: 'datatable.php'
    },
    "columnDefs": [
      { "targets": 0, "className": "none" },
      { "targets": 1, "sWidth": "10%", "className": "dt-center", "bSortable": false,
        "render": function ( data, type, row ) {return '<img height=75px src="'+row[1]+'">';}},
      { "targets": 2, "sWidth": "10%", "className": "dt-center" },
      { "targets": 3, "className": "none" },
      { "targets": 4, "sWidth": "15%", "className": "dt-center" },
      { "targets": 5, "sWidth": "20%", "className": "dt-center" },
      { "targets": 6, "sWidth": "20%", "className": "dt-center" },
      { "targets": 7, "sWidth": "5%",  "className": "dt-center" },

      { "targets": -3, "bSortable": false, "className": "dt-center", "width": "5%",
        "render": function (data, type, row) { return set_button('show_hero(this)', 'show.php?id=' + row[0], row, 'Pokaż', 'fas fa-eye', ''); }},
      { "targets": -2, "bSortable": false, "className": "dt-center", "width": "5%",
        "render": function (data, type, row) { return set_button('modal_form(this)', 'edit.php?id=' + row[0], row, 'Edycja', 'fas fa-edit',''); }},
      { "targets": -1, "bSortable": false, "className": "dt-center", "width": "5%",
        "render": function (data, type, row) { return set_button('delete_hero(this)', 'delete.php?id=' + row[0], row, 'Usuń', 'fas fa-trash-alt',''); }}
    ],
    "order": [2, 'asc']
  }); // end of function dataTable

}); // end ready

function set_button(myFunc, myTarget, myRow, myTitle, myIcon, myDisable) {
  var ret = '<a href="#" onclick="' + myFunc + '"' +
    ' data-target="' + myTarget + '"' +
    ' data-id=' + myRow[0] +
    ' title="' + myTitle + '"' + myDisable + '>' +
    '<i class="' + myIcon + '"></i>'  + '</a>';
  return ret;
 }

function submitForm() {
  $('input[name="is_active"]').val($('#is_active_check').prop('checked') ? '1' : '0');
  let form_data = new FormData(document.getElementById("hero-form"));
  //console.log(...form_data);
  $.ajax({
     url: ((form_data.get('id')==0)?'create.php':'update.php'),
     type: "POST",
     data: form_data,
     processData: false,
     contentType: false,
     cache: false
 }).done(function( data ) {
    $( ".modal .close" ).click();
    oHeroesTable.ajax.reload();
    console.log(data[0]);
 });
  return false;
}

function delete_hero(myObj) {
  console.log('delete');
}

function show_hero(myObj) {
  console.log('show');
}

function modal_form(myObj) {
  $('#content').load('_form.php');
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
<?php }

include '../layout.php';
