const aStatus = {
    'yetToBegin': 'fa fa-check blue',
    'current': 'fa fa-check green',
    'finished': 'fa fa-check yellow',
    'ended': 'fa fa-check purple',
    'inactive': 'fa fa-times'
};

const aStatusT = {
    'yetToBegin': 'Już wkrótce',
    'current': 'Trwa',
    'finished': 'Zakończony',
    'ended': 'Rozliczony',
    'inactive': 'Nieaktywny'
};

const aGamesT = {
    'sorcerer': 'Czarodziej',
    'pacman': 'Stary Pacman',
    'memory': 'Memory',
    'gems': 'Diamenty',
    'pirate': 'Pirat',
}

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
    let url = '<?= t("contest_slug") ?>';
    url = url.substring(0, url.lastIndexOf('/')+1) + $(myObj).data('slug');
    window.location.assign(url);
}

function fEnd(myObj) {
    let oRow = $(myObj);
    let title = '<?= t("contest_end") ?>';
    let ret = confirm(title + ' ' + oRow.data('name') + '?');

    if (ret == true) {
        $.get("end.php?id=" + oRow.data('id'),
            function(data, status){
                if (status == 'success') {
                  let row_index = oRow.data('index');
                  oTable.row(row_index).data(data['contest']);

                  let title = '<?= t("laureats_list") ?>'

                  let html = '<p>' + title + '</p><table>';
                  data['laureats'].forEach(function (item) {
                      html += '<tr>';
                      html += '<td>' + item['nick'] + '</td>';
                      html += '</tr>';
                  });
                  html += '</table>';

                  vexOpen(html);
                }
            });
    }
}
