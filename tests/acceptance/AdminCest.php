<?php


class AdminCest
{
    public function _before(AcceptanceTester $I)
    {
      $I->haveHttpHeader('Accept-Language', 'pl-PL');

      $I->amOnPage('/');
      $I->click('Zaloguj się');
      $I->submitForm('form', [
          'login' => 'admin',
          'password' => '12345678'
      ]);
      $I->click('Admin');
    }

    public function _after(AcceptanceTester $I)
    {
    }

    public function linksGetDisplayed(AcceptanceTester $I)
    {
        $I->seeLink('Strona główna');
        $I->seeLink('Użytkownicy');
        $I->seeLink('Konkursy');
        $I->seeLink('Bohaterowie');
        $I->seeLink('Tła');
        $I->seeLink('Rankingi');
        $I->seeLink('Pobrania');
        $I->seeLink('Wyloguj');
    }


}
