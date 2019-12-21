Feature: Visitor can find information about the service
  As a well navigated visitor
  In order to make a decision on using the invoicing service
  I would like to find information about the invoicing service

  Background: 
    Given I am on the index page

  Scenario: Can see navbar and index page text
    Then I should see "EXTREME INVOICING"
    And I should see "Sign up"
    And I should see "Log in"
    And I should see "Info about Invoicing Service"