<div class="wrapper">

    <?php $this->renderFeedbackMessages(); ?>

        <h2>Login here</h2>
        <form action="<?php echo $this->url; ?>session/create" method="post">
            <input type="text" name="name" placeholder="Username or email" required />
            <input type="password" name="password" placeholder="Password" required />
        </label>

        <?php if (!empty($this->redirect)) { ?>
            <input type="hidden" name="redirect" value="<?php echo $this->encodeHTML($this->redirect); ?>" />
        <?php } ?>

				<input type="hidden" name="csrf_token" value="<?= $this->csrf->makeToken(); ?>" />
        <input type="submit" class="login-submit-button" value="Log in"/>
        </form>

        <a href="<?php echo $this->url ?>register/index">Register</a>

</div>
