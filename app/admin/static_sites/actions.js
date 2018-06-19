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

function fShow(myObj) {
    let url = '<?= t("static_site_slug") ?>';
    url = url.substring(0, url.lastIndexOf('/')+1) + $(myObj).data('slug');
    window.location.assign(url);
}
