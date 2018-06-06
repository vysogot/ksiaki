var oTable = null;

const t_show = '<?= t("show") ?>';
const t_edit = '<?= t("edit") ?>';
const t_delete = '<?= t("delete") ?>';
const aActive = ['fa fa-times', 'fa fa-check'];

function submitForm() {

    $('input[name="is_active"]').val($('#is_active_check').prop('checked') ? '1' : '0');

    let row_index = $('input[name="row_index"]').val();
    let form_data = new FormData(document.getElementById("form"));

    $.ajax({

        url: (form_data.get('id') == 0) ? 'create.php' : 'update.php',
        type: "POST",
        data: form_data,
        processData: false,
        contentType: false,
        cache: false

    }).done(function(data) {

        let ret = data[0];

        if (ret.errors) {
          console.log(ret.errors);  
        } else {
          $(".modal .close").click();
        }

        if (row_index == 0) {
            oTable.ajax.reload(null, false);
        } else {
            oTable.row(row_index).data( ret );
        }
    });

    return false;
}

function get_data(myObj) {

    let id = $(myObj).data('id');

    $.ajax({

        url: ((id==0) ? 'new.php' : 'edit.php?id=' + id),
        dataType : 'json',
        method: 'GET',
        error: function(x,e) { console.log(e); console.log(x.responseText); }

    }).success(function(data) {

        let ret = data[0];

        for (var key in ret) {
            $('input[name="' + key + '"]').val(ret[key]);
        }

        $('textarea[name="description"]').val(ret.description);
        $('#is_active_check').prop("checked", ($('input[name="is_active"]').val() == '1'));
        $('input[name="row_index"]').val($(myObj).data('index'));
        $('#modal').modal('show');

    });
}

$('#modal').on('hidden.bs.modal', function (e) {
    $("#form")[0].reset();
});
