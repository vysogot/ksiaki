function set_button(myFunc, myIndex, myRow, myTitle, myIcon, myDisable) {
    return '<a href="#" onclick="' + myFunc + '"' +
        ' data-id="' + myRow.id + '"' +
        '><i class="fas ' + myIcon + '"></i>'  + '</a>';
}

function fShow(myObj) {
    let row = $(myObj).data();
    let url = '/admin/log_mail/show.php?id=' + row.id;

    $.get(url, function (response) {
        vex_open(response);
    });

}
