function set_button(myFunc, myIndex, myRow, myTitle, myIcon, myDisable) {
    return '<a href="#" onclick="' + myFunc + '"' +
        ' data-index="' + myIndex + '"' +
        ' data-id="' + myRow.id + '"' +
        ' data-name="' + myRow.name + '"' +
        ' data-slug="' + myRow.slug + '"' +
        ' data-image_url="' + myRow.image_url + '"' +
        ' title="' + myTitle + '"' + myDisable +
        '><i class="fas ' + myIcon + '"></i>'  + '</a>';
}

function fDelete(myObj) {
    let title = '<?= t("delete") ?>';
    let ret = confirm(title + ' ' + $(myObj).data('name') + '?');
    if (ret == true) {
        $.get("delete.php?id=" + $(myObj).data('id'),
            function(data, status){
                if (data[0].rowCount == 1) oTable.ajax.reload(null, false);
            });
    }
}

function fShow(myObj) {
    let url = '<?= t("contest_slug") ?>';
    url = url.substring(0, url.lastIndexOf('/')+1) + $(myObj).data('slug');
    window.location.assign(url);
}

function fEnd(myObj) {
    let oRow = $(myObj);
    let title = '<?= t("contest_end") ?>';
    let ret = confirm(title + ' ' + oRow.data('name') + '?');

    if (ret == true) {
        $.post("end.php?id=" + oRow.data('id'),
            function(data, status){
                if (status == 'success') {
                  let row_index = oRow.data('index');
                  oTable.row(row_index).data(data[0]);
                }
            });
    }
}
