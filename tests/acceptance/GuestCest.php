<?php


class GuestCest
{
    public function _before(AcceptanceTester $I)
    {
      $I->haveHttpHeader('Accept-Language', 'pl-PL');
    }

    public function _after(AcceptanceTester $I)
    {
    }

    public function linksGetDisplayed(AcceptanceTester $I)
    {
        $I->amOnPage('/');
        $I->seeLink('Strona główna');
        $I->seeLink('Konkursy');
        $I->seeLink('Pobrania');
        $I->seeLink('Zaloguj się');
    }

    public function contestWorks(AcceptanceTester $I)
    {
        $I->amOnPage('/');
        $I->click('Konkursy');
        $I->click('Jaskiniowiec');
        $I->click('Graj!');
        $I->seeElement('video');
        $I->click('Graj!');
        $I->seeInCurrentUrl('/contests/play');
        $I->seeElement('iframe');
        $I->click('Powrót do strony konkursu');
        $I->seeInCurrentUrl('/contests/show');
    }

    public function downloadsWork(AcceptanceTester $I)
    {
        $I->amOnPage('/');
        $I->click('Pobrania');
        $I->see('Filmy');
        $I->see('Tapety');
        $I->seeNumberOfElements('.box', 8);
        $I->seeInCurrentUrl('/downloads');
    }

    public function heroWorks(AcceptanceTester $I)
    {
        $I->amOnPage('/');
        $I->click('a[href="/heroes/show.php?id=1"]');
        $I->see('Opis Scoobiego Doo');
    }

    public function loginWorks(AcceptanceTester $I)
    {
        $I->amOnPage('/');
        $I->click('Zaloguj się');
        $I->submitForm('form', [
            'login' => 'user',
            'password' => '12345678'
        ]);
        $I->see('Logowanie powiodło się!');
        $I->seeLink('Wyloguj');
        $I->seeLink('Twoje konto');
    }

    public function registrationWorks(AcceptanceTester $I)
    {
        $I->amOnPage('/');
        $I->click('Zaloguj się');
        $I->click('Zarejestruj się');
        $I->submitForm('form', [
            'name' => 'test_user',
            'email' => 'test_user@test.com',
            'password' => '12345678'
        ]);
        $I->see('Rejestracja powiodła się!');
    }
}
