var oTable = null;
var suneditor = null;

const t_show = '<?= t("show") ?>';
const t_edit = '<?= t("edit") ?>';
const t_delete = '<?= t("delete") ?>';
const t_ended = '<?= t("contest_end") ?>';
const t_cancel = '<?= t("cancel") ?>';
const aActive = ['fa fa-times', 'fa fa-check'];

function vexConfirm(msg, callback) {
    vex.dialog.open({
        message: msg,
        overlayClosesOnClick: false,
        buttons: [
            $.extend({}, vex.dialog.buttons.YES, {
                text: t_delete,
                className: 'vex-dialog-button-secondary'
            }),
            $.extend({}, vex.dialog.buttons.NO, {
                text: t_cancel,
                className: 'vex-dialog-button-primary'
            })
        ],
        callback: function(value) {
            if (value) {
                callback();
            };
        }
    });
}

function vexOpen(htmlContent) {
    vex.open({
        unsafeContent: htmlContent
    });
}

function displayErrors(errors) {

    let error_list = $(".modal .errorList");

    $(".modal .errorList").empty();

    $.each(errors, function(field, bundle) {

        $("input[name='" + field + "']").addClass('error');

        if (field == 'NOT_A_FIELD') {
            error_list.append($("<li>").text(bundle.message));
        } else {
            error_list.append($("<li>").text(bundle.field_translation + ": " + bundle.message));
        }

    });

    error_list.removeClass('hidden');
}

function submitForm() {

    if (suneditor != null) {
        let content = suneditor.getContent();
        $('textarea[name="content"]').val(content);
        $('textarea[name="statute"]').val(content);
    }

    let row_index = $('input[name="row_index"]').val();
    let form_data = new FormData(document.getElementById("form"));

    $("input[type=submit]").attr('disabled', 'disabled');

    $.ajax({

        url: (form_data.get('id') == 0) ? 'create.php' : 'update.php',
        type: "POST",
        data: form_data,
        processData: false,
        contentType: false,
        cache: false

    }).done(function(response) {

        if ('errors' in response) {

            displayErrors(response.errors);
            $("input[name=token]").val(response['token']);

        } else {

            if (row_index == 0) {
                oTable.ajax.reload(null, false);
            } else {
                oTable.row(row_index).data(response[0]);
            }

            $(".modal .close").click();

        }

    });

    return false;

}

function get_data(myObj) {

    let id = $(myObj).data('id');

    $.ajax({

        url: ((id == 0) ? 'new.php' : 'edit.php?id=' + id),
        dataType: 'json',
        method: 'GET',
        error: function(x, e) {
            console.log(e);
            console.log(x.responseText);
        }

    }).success(function(data) {

        let ret = data[0];

        for (var key in ret) {

            var field = $('[name=' + key + ']');
            var value = ret[key] || '';

            if (key.endsWith('_url') && key != 'link_url') {
                field.prop('readonly', true);
            }

            if (field.is(':checkbox')) {
                field.prop("checked", value == '1');
            } else if (field.is(':radio')) {
                field.val([value]);
            } else if (key.endsWith('_at')) {
                field.val(value.replace(' ', 'T'));
            } else {
                field.val(value);
            }

            $('p#' + key).text(value);

        }

        $('input[name="row_index"]').val($(myObj).data('index'));

        $('#modal').modal('show');

    });
}

function fEdit(myObj) {
    let title = '<?= t("edit_form") ?>';
    let row = $(myObj).data();

    $('.modal-content .form-content').load('_form.php', function() {
        $("#form").on('submit', function() {
            return submitForm();
        });

        $('input[name=row_index]').val(row.index);
        $('.modal-title').text(title);
        get_data(myObj);
    });
}

function fDelete(myObj) {
    let title = '<?= t("are_you_sure") ?>';

    vexConfirm(title, function() {
    $.get("delete.php?id=" + $(myObj).data('id'),
        function(data, status) {
            if (data[0].rowCount == 1) oTable.ajax.reload(null, false);
        });
    });
}


$('#modal').on('hidden.bs.modal', function(e) {
    $("#form")[0].reset();
    $("input").removeClass('error');
    $(".modal .errorList").addClass('hidden');
    $(".modal .errorList").empty();
    if (suneditor != null) {
        suneditor.destroy();
    }
});

$('#modal').on('shown.bs.modal', function(e) {
    if ($('textarea[name="content"]').length) {
        suneditor = SUNEDITOR.create('content');
        suneditor.setContent($('textarea[name="content"]').val());
    }

    if ($('textarea[name="statute"]').length) {
        suneditor = SUNEDITOR.create('statute');
        suneditor.setContent($('textarea[name="statute"]').val());
    }
});

$('#new').click(function(e) {
    let title = '<?= t("new_form") ?>';
    let object = this;

    $('.modal-content .form-content').load('_form.php', function() {
        $("#form").on('submit', function() {
            return submitForm();
        });

        $('.modal-title').text(title);
        get_data(object);
    });
});
