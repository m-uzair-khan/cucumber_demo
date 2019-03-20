Feature: Search for Cucumber in Google

  Scenario: C100 Search for cucumber wiki page
    Given I am on google UK
    And I search for cucumber
    Then I should be able to access the cucumber wiki page

  @some_tag
  Scenario: C200 Search for cucumber 11111111
    Given I am on google UK
    Then I should be able to access the cucumber wiki page
