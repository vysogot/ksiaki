function fDelete(myObj) {
  let title = '<?=t("background_delete")?>';
  let ret = confirm(title + $(myObj).data('name') + '?');
  if (ret == true) {
    $.post("delete.php?id=" + $(myObj).data('id'),
      function(data, status){
          if (data[0].rowCount == 1) oTable.ajax.reload(null, false);
      });
  }
}

function fShow(myObj) {
  let url = '<?=t("background_slug")?>';
  url = url.substring(0, url.lastIndexOf('/')+1) + $(myObj).data('slug');
  window.location.assign(url);
}

function fEdit(myObj) {
  let title = '<?=t("edit_form", ["name" => t("background")])?>';
  $('.modal-title').text(title);
  get_data(myObj);
}

$('#new').click(function(e) {
  let title = '<?=t("new_form", ["name" => t("background")])?>';
  $('.modal-title').text(title);
  get_data(this);
});
