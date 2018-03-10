<div class="wrapper">

  <?php $this->renderPartial('_templates/errors'); ?>

        <h2>Login here</h2>
        <form action="/session/create" method="post">

          <div>
              <label for="name">Name or email</label>
              <input id="name" name="name_or_email" placeholder="Name" value="<?= $this->name_or_email ?>" required autofocus />
          </div>

          <div>
              <label for="password">Password</label>
              <input id="password" type="password" name="password" placeholder="Password" required />
          </div>

          <div>
            <label for="remember_me">Remember me</label>
            <input type="hidden" name="remember_me" value="0" />
            <input id="remember_me" type="checkbox" value="1" name="remember_me" <?php if ($this->remember_me) echo 'checked="checked"'; ?> />
          </div>

          <input type="submit" class="login-submit-button" value="Log in"/>

        </form>

        <a href="/register/new">Register</a>

</div>
