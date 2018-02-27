<div class="wrapper">
    <h1>Sign up</h1>

    <?php $this->renderPartial('_templates/errors', ['errors' => $this->user->errors]); ?>

    <form method="post" action="/register/create">

        <div>
            <label for="name">Name</label>
            <input id="name" name="name" placeholder="Name" value="<?= $this->user->name ?>" required autofocus />
        </div>
        <div>
            <label for="email">Email address</label>
            <input id="email" type="email" name="email" placeholder="email address" value="<?= $this->user->email ?>" required />
        </div>
        <div>
            <label for="password">Password</label>
            <input id="password" type="password" name="password" placeholder="Password" />
        </div>

        <button type="submit">Sign up</button>

    </form>

</div>
