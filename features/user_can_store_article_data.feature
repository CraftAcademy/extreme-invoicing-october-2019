Feature: User can store article data
  As a user
  In order to avoid repetitive input
  I would like to store and retrieve data about my products or services

  Background:
    Given the following users exist
      | email          | password |
      | user@user.com  | password |
      | user2@user.com | password |

    And the following article exist
      | name     | unit | unit_price | taxrate | user          |
      | Mackerel | kg   | 138        | 25      | user@user.com |


  Scenario: User can add a new article to his articles database
    Given I am logged in as "user@user.com"
    And I am on the index page
    When I click on "Add new article"
    And I fill in "Name" with "Consulting hours"
    And I fill in "Unit" with "h"
    And I fill in "Unit price" with "600"
    And I fill in "Taxrate" with "25"
    And I click on "Add article"
    Then I should see "Article was succesfully created."
    And I should see "Consulting hours"

  Scenario: Add new article form is not filled out correctly
    Given I am logged in as "user@user.com"
    And I am on the index page
    When I click on "Add new article"
    And I fill in "Name" with "Cod"
    And I click on "Add article"
    Then I should see "Please fill in the form correctly."

  Scenario: User can only see articles created by itself
    Given I am logged in as "user@user.com"
    And I am on the index page
    Then I should see "Mackerel"

  Scenario: User can not see articles created by another user
    Given I am logged in as "user2@user.com"
    And I am on the index page
    Then I should not see "Mackerel"
