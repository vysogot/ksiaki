function fDelete(myObj) {
  let title = '<?= t("delete") ?>';
  let ret = confirm(title + ' ' + $(myObj).data('name') + '?');
  if (ret == true) {
    $.post("delete.php?id=" + $(myObj).data('id'),
      function(data, status){
          if (data[0].rowCount == 1) oTable.ajax.reload(null, false);
      });
  }
}

function fShow(myObj) {
  let row_index = $(myObj).data('index');
  let row = oTable.row(row_index).data();

  $('#imagemodal .modal-title').text(row.name);
  $('#imagepreview').attr('src', row.image_url);
  $('#imagemodal').modal('show');
}

function fEdit(myObj) {
  let title = '<?= t("edit_form", ["name" => t("background")]) ?>';
  $('.modal-title').text(title);
  get_data(myObj);
}

$('#new').click(function(e) {
  let title = '<?= t("new_form", ["name" => t("background")]) ?>';
  $('.modal-title').text(title);
  get_data(this);
});
