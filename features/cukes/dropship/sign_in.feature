@dropship
Feature: Sign In

  Scenario: C2 A user should not be able to sign in with incorrect login info
    Given I am on dropship landing page
    When I click on Sign in link I should see the sign in form
    And I fill in the invalid email password combination and hit Sign In
    Then I should see the error message
