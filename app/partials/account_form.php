<?php include 'partials/errors.php'; ?>

<?= csrf_field() ?>

<label for="birthday"><?= t('birthday') ?></label>
<input id="birthday" name="birthday" type="text" value="<?= params('birthday'); ?>" required <?php if (params('form_for') == 'account_settings') echo 'readonly'; ?> />

<div class="hidden" id="caretaker_fields">

    <label for="birthday"><?= t('caretaker_name') ?></label>
    <input id="caretaker_name" type="text" name="caretaker_name" value="<?= params('caretaker_name') ?>" />

    <label for="birthday"><?= t('caretaker_surname') ?></label>
    <input id="caretaker_surname" type="text" name="caretaker_surname" value="<?= params('caretaker_surname') ?>" />

    <label for="birthday"><?= t('caretaker_email') ?></label>
    <input id="caretaker_email" type="email" name="caretaker_email" value="<?= params('caretaker_email') ?>" />

</div>

<div class="center">
    <label class="margin-right-10 required"><?= t('gender') ?></label>
    <input type="radio" name="gender" id="gender_male" value="1" <?php if (params('gender') === '1') echo "checked" ?> required/>
    <label class="radio" for="gender_male"><?= t('male') ?></label>
    <input type="radio" name="gender" id="gender_female" value="0" <?php if (params('gender') === '0') echo "checked" ?>/>
    <label class="radio" for="gender_female"><?= t('female') ?></label>
</div>

<label for="nick"><?= t('nick') ?></label>
<input id="nick" type="text" name="nick" value="<?= params('nick') ?>" required <?php if (params('form_for') == 'account_settings') echo 'readonly'; ?> />

<label for="email"><?= t('email') ?></label>
<input id="email" type="email" name="email" value="<?= params('email') ?>" required <?php if (params('form_for') == 'account_settings') echo 'readonly'; ?> />

<label for="name"><?= t('name') ?></label>
<input id="name" type="text" name="name" value="<?= params('name') ?>" required />

<label for="surname"><?= t('surname') ?></label>
<input id="surname" type="text" name="surname" value="<?= params('surname') ?>" required />

<label for="address"><?= t('address') ?></label>
<input id="address" type="text" name="address" value="<?= params('address') ?>" required />

<label for="postcode"><?= t('postcode') ?></label>
<input id="postcode" type="text" name="postcode" value="<?= params('postcode') ?>" required />

<label for="city"><?= t('city') ?></label>
<input id="city" type="text" name="city" value="<?= params('city') ?>" required />

<?php if ($params['form_for'] == 'register') { ?>
    <label for="password"><?= t('password') ?></label>
    <input id="password" type="password" name="password" required />
<?php } ?>

<div class="agreement">
    <span class="info"><strong class="required"><?= t('contest_agreement') ?></strong></span><br />
    <input type="hidden" name="contest_agreement" value="0">
    <input id="contest_agreement" type="checkbox" name="contest_agreement" value="1" <?php if (params( 'contest_agreement')==1 ) echo "checked" ?> required />
    <label for="contest_agreement"><?= t('contest_agreement_description') ?></label>
</div>

<div class="agreement">
    <span class="info"><strong class="required"><?= t('marketing_agreement') ?></strong></span><br />
    <input type="hidden" name="marketing_agreement" value="0">
    <input id="marketing_agreement" type="checkbox" name="marketing_agreement" value="1" <?php if (params( 'marketing_agreement')==1 ) echo "checked" ?> />
    <label for="marketing_agreement"><?= t('marketing_agreement_description') ?></label>
</div>

<div class="agreement">
    <strong><span class="info"><?= t('notifications_agreement') ?></strong></span><br />
    <input type="hidden" name="notifications_agreement" value="0">
    <input id="notifications_agreement" type="checkbox" name="notifications_agreement" value="1" <?php if (params( 'notifications_agreement')==1 ) echo "checked" ?> />
    <label for="notifications_agreement"><?= t('notifications_agreement_description') ?></label>
</div>

<div class="agreement">
    <span class="info"><strong class="required"><?= t('statute_agreement') ?></strong></span><br />
    <input type="hidden" name="statute_agreement" value="0">
    <input id="statute_agreement" type="checkbox" name="statute_agreement" value="1" <?php if (params( 'statute_agreement')==1 ) echo "checked" ?> required />
    <label for="statute_agreement"><?= t('statute_agreement_description') ?></label>
</div>

<div class="agreement">
    <span class="info"><strong><?= t('cancellation_conditions') ?></strong></span>
    <label class="info last-info"><?= t('registration_info') ?></label>
</div>

<script>
    $(document).on('ready', function() {
        function toggle_caretaker_fields() {
            birthday_string = $('#birthday').val();
            if (/\d{2}\.\d{2}.\d{4}/.test(birthday_string)) {
                var parts = birthday_string.split('.');
                var birthday = new Date(parts[2], parts[1] - 1, parts[0]);
                var today = new Date();
                var back18years = today.setFullYear(today.getFullYear() - 18);
                if (birthday > back18years) {
                    $('#caretaker_fields').removeClass('hidden');
                    $("#caretaker_name").prop('required', true);
                    $("#caretaker_surname").prop('required', true);
                    $("#caretaker_email").prop('required', true);
                } else {
                    $('#caretaker_fields').addClass('hidden');
                    $("#caretaker_name").prop('required', false);
                    $("#caretaker_surname").prop('required', false);
                    $("#caretaker_email").prop('required', false);
                }
            }
        }

        toggle_caretaker_fields();

        $("#birthday").datepicker({
            changeMonth: true,
            changeYear: true,
            maxDate: "0D",
            yearRange: "c-99:n+0"
        });


        $("#birthday").on('change', function() {
            toggle_caretaker_fields();
        });
    });
</script>
