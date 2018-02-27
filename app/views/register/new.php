<div class="wrapper">
    <h1>Sign up</h1>

    <?php if (!empty($this->user->errors)) { ?>
      <ul>
      <?php foreach($this->user->errors as $field => $message) { ?>
        <li><?= e("$field: $message"); ?></li>
      <?php } ?>
      </ul>
    <?php } ?>

    <form method="post" action="/register/create">

        <div>
            <label for="name">Name</label>
            <input id="name" name="name" placeholder="Name" value="<?= $this->user->name ?>" autofocus />
        </div>
        <div>
            <label for="email">Email address</label>
            <input id="email" name="email" placeholder="email address" value="<?= $this->user->email ?>" />
        </div>
        <div>
            <label for="password">Password</label>
            <input type="password" id="password" name="password" placeholder="Password" />
        </div>

        <button type="submit">Sign up</button>

    </form>

</div>
