<?php namespace Core; ?>
<div class="wrapper">
        <?php if (Session::userIsLoggedIn()) : ?>
        <ul>
          <li<?php if (View::checkForActiveController($filename, "user")) { echo ' class="active"'; } ?>>
              <a href="<?php echo Config::get('URL'); ?>user/index">My Account</a>
              <ul>
                  <li>
                      <a href="<?php echo Config::get('URL'); ?>note/index"<?php if (View::checkForActiveController($filename, "note")) { echo ' class="active"'; } ?>>My Notes</a>
                  </li>
                  <li<?php if (View::checkForActiveController($filename, "user")) { echo ' class="active"'; } ?>>
                      <a href="<?php echo Config::get('URL'); ?>user/changeUserRole">Change account type</a>
                  </li>
                  <li<?php if (View::checkForActiveController($filename, "user")) { echo ' class="active"'; } ?>>
                      <a href="<?php echo Config::get('URL'); ?>user/editAvatar">Edit your avatar</a>
                  </li>
                  <li<?php if (View::checkForActiveController($filename, "user")) { echo ' class="active"'; } ?>>
                      <a href="<?php echo Config::get('URL'); ?>user/editusername">Edit my username</a>
                  </li>
                  <li<?php if (View::checkForActiveController($filename, "user")) { echo ' class="active"'; } ?>>
                      <a href="<?php echo Config::get('URL'); ?>user/edituseremail">Edit my email</a>
                  </li>
                  <li<?php if (View::checkForActiveController($filename, "user")) { echo ' class="active"'; } ?>>
                      <a href="<?php echo Config::get('URL'); ?>user/changePassword">Change Password</a>
                  </li>
                  <li<?php if (View::checkForActiveController($filename, "login")) { echo ' class="active"'; } ?>>
                      <a href="<?php echo Config::get('URL'); ?>login/logout">Logout</a>
                  </li>
              </ul>
            </li>

          </ul>
        <?php endif; ?>
    <h1>DashboardController/index</h1>
    <div class="box">

        <!-- echo out the system feedback (error and success messages) -->
        <?php $this->renderFeedbackMessages(); ?>

        <h3>What happens here ?</h3>
        <p>
            This is an area that's only visible for logged in users. Try to log out, an go to /dashboard/ again. You'll
            be redirected to /index/ as you are not logged in. You can protect a whole section in your app within the
            according controller by placing <i>Auth::handleLogin();</i> into the constructor.
        <p>
    </div>
</div>
