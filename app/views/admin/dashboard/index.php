<div class="wrapper">
    <h1>Admin Dashboard</h1>

    <ul>
      <li><a href="/admin/home">Strona główna</a></li>
      <li><a href="/admin/contest">Konkursy</a></li>
      <li><a href="/admin/hero">Bohaterowie</a></li>
      <li><a href="/admin/ranking">Rankingi</a></li>
      <li><a href="/admin/download">Pobrania</a></li>
    </ul>

    <div class="box">

        <div>
            <table class="overview-table">
                <thead>
                <tr>
                    <td>Id</td>
                    <td>Name</td>
                    <td>Email</td>
                </tr>
                </thead>
                <?php foreach ($this->users as $user) { ?>
                    <tr>
                        <td><?= $user->id ?></td>
                        <td><?= $user->name ?></td>
                        <td><?= $user->email ?></td>
                    </tr>
                <?php } ?>
            </table>
        </div>
    </div>
</div>
