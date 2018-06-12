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
    let ret = confirm(title + $(myObj).data('name') + '?');

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
    let title = '<?= t("edit_form", ["name" => t("hero")]) ?>';

    $('.modal-content .form-content').load('_form.php', function() {
        $("#form").on('submit', function () {
            return submitForm();
        });

        $('.modal-title').text(title);
        get_data(myObj);
    });
}

$('#new').click(function(e) {
    let title = '<?= t("new_form", ["name" => t("hero")]) ?>';
    $('.modal-title').text(title);
    get_data(this);
});
