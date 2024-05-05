Feature: My feature

@user1 @web
Scenario: My scenario 2
  Given I navigate to this web "https://www.facebook.com"
  When I click view with selector "#email"
  Then I enter text "yo@localhost.com"