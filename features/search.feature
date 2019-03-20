Feature: Discover Hingeto

  @uk
  Scenario: C328 Explore Homepage and find what Hingeto is about
    Given I am on Hingeto homepage
    And I can see the incredible slogan
    When I click the Retail Solutions button
    Then I should be able to retail solutions page

  @some_tag
  Scenario: C329 Search for cucumber
    Given I am on Hingeto homepage
    Then I should be able to access the cucumber wiki page
