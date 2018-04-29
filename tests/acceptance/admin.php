<?php

function test_admin_sees_menu() {
    when_i_login_as('admin');
    and_i_go_to('/admin/index.php');
    return i_should_see_many([
        'Użytkownicy', 
        'Wyloguj', 
        'Strona główna', 
        'Boxy', 
        'Bohaterowie', 
        'Tła', 
        'Slajdy',
        'Filmy użytkowników',
        'Reklamy video'
    ]);
}
