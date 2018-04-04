<?php


class ListingCest
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

    public function backToHomepageWorks(AcceptanceTester $I)
    {
        $I->click('Strona główna');
        $I->amOnPage('/');
    }




}
