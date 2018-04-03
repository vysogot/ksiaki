<?php


class UserCest
{
    public function _before(AcceptanceTester $I)
    {
      $I->haveHttpHeader('Accept-Language', 'pl-PL');

      $I->amOnPage('/');
      $I->click('Zaloguj się');
      $I->submitForm('form', [
          'login' => 'user',
          'password' => '12345678'
      ]);
      $I->see('Logowanie powiodło się!');
    }

    public function _after(AcceptanceTester $I)
    {
    }

    public function linksGetDisplayed(AcceptanceTester $I)
    {
        $I->seeLink('Wyloguj');
        $I->seeLink('Twoje konto');
    }

    public function logoutWorks(AcceptanceTester $I)
    {
        $I->click('Wyloguj');
        $I->see('Bezpiecznie wylogowano');
        $I->seeInCurrentUrl('/logout');
    }

    public function profileWorks(AcceptanceTester $I)
    {
        $I->click('Twoje konto');
        $I->see('Twój nick');
        $I->see('Twój email');
    }
}
