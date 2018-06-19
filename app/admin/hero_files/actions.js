function set_button(myFunc, myIndex, myRow, myTitle, myIcon, myDisable) {
    return '<a href="#" onclick="' + myFunc + '"' +
        ' data-index="' + myIndex + '"' +
        ' data-id="' + myRow.id + '"' +
        ' data-name="' + myRow.name + '"' +
        ' data-file_url="' + myRow.file_url + '"' +
        ' title="' + myTitle + '"' + myDisable +
        '><i class="fas ' + myIcon + '"></i>'  + '</a>';
}

function fShow(myObj) {
    let row = $(myObj).data();

    $('#imagemodal .modal-title').text(row.name);
    $('#imagepreview').attr('src', row.file_url);
    $('#imagemodal').modal('show');
}
