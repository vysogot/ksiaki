var oTable = null;
var suneditor = null;

const t_show = '<?= t("show") ?>';
const t_edit = '<?= t("edit") ?>';
const t_delete = '<?= t("delete") ?>';
const t_ended = '<?= t("contest_end") ?>';
const t_cancel = '<?= t("cancel") ?>';
const aActive = ['fa fa-times', 'fa fa-check'];

function vex_confirm(msg, callback) {
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

function submitForm() {

    $('input[name="is_active"]').val($('#is_active_check').prop('checked') ? '1' : '0');
    $('input[name="display_ad"]').val($('#display_ad_check').prop('checked') ? '1' : '0');

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

        console.log(response);


        if ('errors' in response) {

            let error_list = $(".modal .errorList");

            $(".modal .errorList").empty();

            $.each(response.errors, function(field, bundle) {
                $("input[name='" + field + "']").addClass('error');

                if (field == 'NOT_A_FIELD') {
                    error_list.append($("<li>").text(bundle.message));
                } else {
                    error_list.append($("<li>").text(bundle.field_translation + ": " + bundle.message));
                }
            });

            $("input[name=token]").val(response['token']);

            error_list.removeClass('hidden');

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

    console.log('myobj', myObj);
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
            var field = $('input[name="' + key + '"]');
            field.val(ret[key]);

            if (key.endsWith('_url')) {
                field.prop('readonly', true);
            }
        }

        $('textarea[name="content"]').val(ret.content);
        $('textarea[name="statute"]').val(ret.statute);

        if (ret.begins_at != undefined) {
            $('input[name="begins_at"]').val(ret.begins_at.replace(' ', 'T'));
        }

        if (ret.ends_at != undefined) {
            $('input[name="ends_at"]').val(ret.ends_at.replace(' ', 'T'));
        }

        $('#is_active_check').prop("checked", ($('input[name="is_active"]').val() == '1'));
        $('#display_ad_check').prop("checked", ($('input[name="display_ad"]').val() == '1'));
        $('#link_url').prop('readonly', false);

        $("#role_id option").removeAttr('selected');
        $('#role_id ').find('option').filter(function(index) {
            return $(this).val() == ret.role_id;
        }).prop('selected', true);

        $("#game_id option").removeAttr('selected');
        $('#game_id ').find('option').filter(function(index) {
            return $(this).val() == ret.game_id;
        }).prop('selected', true);

        $("#hero_file_type_id option").removeAttr('selected');
        $('#hero_file_type_id ').find('option').filter(function(index) {
            return $(this).val() == ret.hero_file_type_id;
        }).prop('selected', true);

        $("#hero_id option").removeAttr('selected');
        $('#hero_id ').find('option').filter(function(index) {
            return $(this).val() == ret.hero_id;
        }).prop('selected', true);

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
    vex_confirm(title, function() {
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
