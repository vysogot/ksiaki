<div class="wrapper">

        <h2>Login here</h2>
        <form action="<?php echo $this->url; ?>session/create" method="post">
            <input type="text" name="name_or_email" placeholder="Username or email" required />
            <input type="password" name="password" placeholder="Password" required />
        </label>

        <input type="submit" class="login-submit-button" value="Log in"/>
        </form>

        <a href="<?php echo $this->url ?>register/index">Register</a>

</div>
