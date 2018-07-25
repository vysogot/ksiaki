function set_button(myFunc, myIndex, myRow, myTitle, myIcon, myDisable) {
    return '<a href="#" onclick="' + myFunc + '"' +
        ' data-index="' + myIndex + '"' +
        ' data-id="' + myRow.id + '"' +
        ' data-rankable="' + myRow.is_rankable + '"' +
        ' title="' + myTitle + '"' +
        '><i class="fas ' + myIcon + '"></i>'  + '</a>';
}

function fToggleRankable(myObj) {

    let question = ($(myObj).data('rankable') == 1) ? '<?= t("exclude_from_ranking") ?>' : '<?= t("include_in_ranking") ?>';
    let title = '<?= t("game") ?>' + ' ' + $(myObj).data('id') + ': ' + question;

    vexConfirm(title, function() {
    $.get("toggle_rankable.php?id=" + $(myObj).data('id'),
        function(data, status) {
            if (data[0].rowCount == 1) oTable.ajax.reload(null, false);
        });
    });

}