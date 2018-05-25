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
  let url = '<?= t("hero_slug") ?>';
  url = url.substring(0, url.lastIndexOf('/')+1) + $(myObj).data('slug');
  window.location.assign(url);
}

function fEdit(myObj) {
  let row_index = $(myObj).data('index');
  let row = oTable.row(row_index).data();
  let title = '<?= t("edit_form", ["name" => t("user")]) ?>';
  title = title.substring(0, title.lastIndexOf('/')+1) + row.name + ' ' + row.surname;
  $('.modal-title').text(title);
  get_data(myObj);
}

$('#new').click(function(e) {
  let title = '<?= t("new_form", ["name" => t("hero")]) ?>';
  $('.modal-title').text(title);
  get_data(this);
});
