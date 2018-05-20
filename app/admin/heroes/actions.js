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
    let ret = data[0];
    if (row_index == 0) {
      oHeroesTable.ajax.reload(null, false);
    } else {
      oHeroesTable.row(row_index).data( ret );
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

function edit_hero(myObj) {
  let title = '<?= t("edit_form", ["name" => t("hero")]) ?>';
  $('.modal-title').text(title);
  get_data(myObj);
}

$('#new_hero').click(function(e) {
  let title = '<?= t("new_form", ["name" => t("hero")]) ?>';
  $('.modal-title').text(title);
  get_data(this);
});

function get_data(myObj) {
  let id = $(myObj).data('id');
  $.ajax({
  url: ((id==0)?'new.php':'edit.php?id=' + id),
  //url: 'edit.php?id=' + $(myObj).data('id'),
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

    $('#heroModal').modal('show');
  });
}

$('#heroModal').on('hidden.bs.modal', function (e) {
  $("#hero-form")[0].reset();
});
